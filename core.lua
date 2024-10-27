
VocalCooldowns = LibStub("AceAddon-3.0"):NewAddon("VocalCooldowns")

-- ADDON CONFIGS

-- describes the db layout and default values
local ADDON_DEFAULTS = {
    profile = {
        min_cooldown_length = 10,
        update_period_seconds = 0.5,
        voice_selection = 2,
        notification_template = "${name} ready soon",
        headsup_seconds = 2,
        blacklist = {}
    }
}

local ACE_OPTIONS = {}


-- ADDON STATE

-- Placeholder table for TTS voice options
local voiceOptions = {}

-- keeps track of active cooldowns
-- cooldowns are added dynamically as they are discovered
local tracked_cooldowns = {}

-- keep track of recently casted spells
-- these are promoted to be tracked cooldowns when cooldown info is available for them
local recent_casts = {}

-- UTILITY FUNCTIONS


-- Function to populate voice options
local function PopulateVoiceOptions()
    local voices = C_VoiceChat.GetTtsVoices()
    for _, voiceInfo in ipairs(voices) do
        voiceOptions[voiceInfo.voiceID] = voiceInfo.name
    end
end


local function TableHasValue(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- forward text to the native text-to-speech functionality
local function Speech(text)
    C_VoiceChat.SpeakText(VocalCooldowns.db.profile.selected_voice, text, Enum.VoiceTtsDestination.QueuedLocalPlayback, 0, 100)
end

-- replace a placeholder with the value of an element in the context table with the placeholder name if available
local function interpolateString(input, context)
    return input:gsub("($%b{})", function (placeholder) return context[placeholder:sub(3,-2)] or placeholder end)
end

-- print a lua table (for debugging)
local function tprint (tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent+1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))      
        else
            print(formatting .. v)
        end
    end
end

local function logWithSpell(functionName, message, spellID)
    local spellName = C_Spell.GetSpellName(spellID)
    print(functionName .. ": " .. message .. " | spellID=" .. spellID .. " (" .. spellName .. ")")
end

-- ADDON logic

-- record that a spell with cooldown was casted
local function TrackRecentCast(spellID)

    local spellInfo = C_Spell.GetSpellInfo(spellID)

    -- skip tracking excluded spell ids
    if spellInfo and (TableHasValue(VocalCooldowns.db.profile.blacklist,spellInfo.spellID) or TableHasValue(VocalCooldowns.db.profile.blacklist,spellInfo.name)) then

        --@debug@
        -- logWithSpell("TrackRecentCast -> ignore excluded spell", "", spellID)
        -- print(tprint(VocalCooldowns.db.profile.blacklist, 2))
        --@end-debug@

        return
    end


    local cooldown = C_Spell.GetSpellCooldown(spellID)

    --@debug@
    -- logWithSpell("TrackRecentCast", "", spellID)
    -- print(tprint(cooldown, 2))
    --@end-debug@

    -- non-zero start time indicates the spell is on cooldown
    if cooldown and (cooldown.startTime > 0 or cooldown.isEnabled) then
        recent_casts[spellID] = true
    end
end

-- If a spell cooldown is not tracked yet, fetch its name and prepare the data structure in tracked_cooldowns
local function InitializeSpell(spellID)
    if tracked_cooldowns[spellID] then
        return
    end

    name = C_Spell.GetSpellName(spellID)
    tracked_cooldowns[spellID] = {
        name = name,
        expiration = 0,
    }
end

-- Check cooldown of a recent cast and track it if applicable
-- Yields true if the recent cast is now tracked as cooldown OR the cast should not be tracked anymore
-- Yields false if there is no clear result and the recent cast must still be tracked
local function CheckRecentCast(spellID)
    local cooldown = C_Spell.GetSpellCooldown(spellID)

    --@debug@
    -- logWithSpell("CheckRecentCast", "", spellID)
    -- print(tprint(cooldown, 2))
    --@end-debug@

    -- spell has no cooldown (this should not happen) -> do not track it anymore
    if (not cooldown) then
        --@debug@
        -- logWithSpell("CheckRecentCast", "!! Recent cast without cooldown data", spellID)
        --@end-debug@
        return True
    end

    -- the spell is on cooldown and long enough to track it -> turn it into a tracked cooldown
    if cooldown.startTime > 0 and cooldown.duration >= VocalCooldowns.db.profile.min_cooldown_length then
        InitializeSpell(spellID)
        tracked_cooldowns[spellID].expiration = cooldown.startTime + cooldown.duration
        --@debug@
        -- logWithSpell("CheckRecentCast", "tracking new cooldown with duration " .. cooldown.duration, spellID)
        --@end-debug@
        return True
    end

    -- the spell is on cooldown but duration is below threshold -> re-check next time
    if cooldown.startTime > 0 then
        --@debug@
        -- logWithSpell("CheckRecentCast", "unclear result -> re-check", spellID)
        --@end-debug@
        return False
    end

    -- spell is not on cooldown anymore -> forget it
    --@debug@
    -- logWithSpell("CheckRecentCast", "spell is not on cooldown anymore -> forget it", spellID)
    --@end-debug@
    return True
end

-- find recent casts that have a valid cooldown now
local function ScanRecentCasts()
    --@debug@
    -- print("ScenRecentCasts " .. GetTime())
    -- print(tprint(recent_casts, 2))
    --@end-debug@
    for spellID, _ in pairs(recent_casts) do
        local cooldown = C_Spell.GetSpellCooldown(spellID)
        if CheckRecentCast(spellID) then
            recent_casts[spellID] = nil
        end
    end
end

-- check if any cooldown is ready and report it
local function FindExpiredCooldowns()
    --@debug@
    -- print("FindExpiredCooldowns " .. GetTime())
    -- print(tprint(tracked_cooldowns, 2))
    --@end-debug@
    for id, cooldown in pairs(tracked_cooldowns) do
        if cooldown.expiration > 0 and (cooldown.expiration - VocalCooldowns.db.profile.headsup_seconds) < GetTime() then
            Speech(interpolateString(VocalCooldowns.db.profile.notification_template, cooldown))
            tracked_cooldowns[id] = nil
        end
    end
end

-- ADDON event handling

-- Register for the UNIT_SPELLCAST_SUCCEEDED event to detect spell casting
local function HandleSpellCast(_, _, unit, _, spellID)
    -- ignore casts of other units
    if (unit == "player") then
        TrackRecentCast(spellID)
    end
end
local spellCastFrame = CreateFrame("Frame")
spellCastFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
spellCastFrame:SetScript("OnEvent", HandleSpellCast)

-- Register for the SPELL_UPDATE_COOLDOWN event to detect cooldown changes
-- this event has no payload, so trigger a check on all recent casts & tracked cooldowns
local function HandleCooldownUpdate()
    ScanRecentCasts()
end
local cooldownUpdateFrame = CreateFrame("Frame")
cooldownUpdateFrame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
cooldownUpdateFrame:SetScript("OnEvent", HandleCooldownUpdate)


local function UpdateStringListOptions(options)
    if not VocalCooldowns.db then
        return
    end
    local listOptions = options.args.blacklist.args
    wipe(listOptions)  -- Clear previous entries
    for index, item in ipairs(VocalCooldowns.db.profile.blacklist) do
        listOptions["remove_" .. index] = {
            type = "execute",
            name = "Remove ".. item,
            func = function()
                table.remove(VocalCooldowns.db.profile.blacklist, index)
                UpdateStringListOptions(options)  -- Refresh the options to reflect the removal
            end,
            width = "half",
        }
    end
    LibStub("AceConfigRegistry-3.0"):NotifyChange("VocalCooldowns")
end

-- Initialize ACE addon & options

ACE_OPTIONS = {
    name = "Vocal Cooldowns",
    type = "group",
    args = {
        ["min_cooldown_length"] = {
            order = 10,
            name = "Minimal Cooldown Length (seconds)",
            desc = "Ignore any cooldowns that are shorter.",
            width = "double",
            type = "range",
            min = 0,
            max = 9999,
            step = 1,
            softMax = 300,
            set = function(info, val) VocalCooldowns.db.profile.min_cooldown_length = val end,
            get = function(info) return VocalCooldowns.db.profile.min_cooldown_length end
        },
        ["update_period_seconds"] = {
            order = 20,
            name = "Update Period (seconds)",
            desc = "Pause for this long before checking cooldown expiration again.",
            width = "double",
            type = "range",
            min = 0.1,
            max = 5,
            step = 0.1,
            set = function(info, val) VocalCooldowns.db.profile.update_period_seconds = val end,
            get = function(info) return VocalCooldowns.db.profile.update_period_seconds end
        },
        ["headsup_seconds"] = {
            order = 20,
            name = "Headsup (seconds)",
            desc = "Notify this many seconds before the cooldown is available.",
            width = "double",
            type = "range",
            min = 0.1,
            max = 5,
            step = 0.1,
            set = function(info, val) VocalCooldowns.db.profile.headsup_seconds = val end,
            get = function(info) return VocalCooldowns.db.profile.headsup_seconds end
        },
        ["voice_selection"]  = {
            type = "select",
            name = "Select TTS Voice",
            desc = "Choose a voice for TTS.",
            values = voiceOptions,
            get = function(info) return VocalCooldowns.db.profile.selected_voice end,
            set = function(info, value)
                VocalCooldowns.db.profile.selected_voice = value
                Speech("Selected new voice "..voiceOptions[value])
            end,
        },
        ["notification_template"] = {
            type = "input",
            name = "Notification Template",
            desc = "Enter the template for TTS notifications.",
            get = function(info) return VocalCooldowns.db.profile.notification_template or "" end,
            set = function(info, value)
                VocalCooldowns.db.profile.notification_template = value
            end,
            multiline = false,  -- Set to true if you want a larger text box for longer messages
            width = "full",     -- Expands the input box to the full width of the config dialog
        },
        ["add_blacklist_item"] = {
            type = "input",
            name = "Add Item",
            desc = "Enter a string to add to the list.",
            get = function(info) return "" end,  -- Always return an empty string so the field resets after input
            set = function(info, value)
                table.insert(VocalCooldowns.db.profile.blacklist, value)
                tprint(VocalCooldowns.db.profile.blacklist,2)
                UpdateStringListOptions(ACE_OPTIONS)
            end,
            width = "full",
        },
        ["blacklist"] = {
            type = "group",
            name = "Blacklist",
            inline = true,
            args = {}
        },
    }
}


function VocalCooldowns:OnInitialize()
    PopulateVoiceOptions()

    -- load the saved variables into an ace database
    self.db = LibStub("AceDB-3.0"):New("VocalCooldownsDB", ADDON_DEFAULTS)
    -- create addon options
    LibStub("AceConfig-3.0"):RegisterOptionsTable("VocalCooldowns", ACE_OPTIONS, nil)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("VocalCooldowns", "Vocal Cooldowns")
    -- register separate tab in addon options for profile management
    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("VocalCooldowns_Profiles", profiles)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("VocalCooldowns_Profiles", "Profiles", "Vocal Cooldowns")
    UpdateStringListOptions(ACE_OPTIONS)

    Speech("Vocal Cooldowns enabled")
end

-- ADDON FRAME - initialize and run cooldown update loop

-- handler for OnUpdate - main cooldown check loop of the addon
local elapsed = 0

local function AddonLoop(self, time_since_last_update)
    elapsed = elapsed + time_since_last_update

    if elapsed < VocalCooldowns.db.profile.update_period_seconds then
        return
    end

    -- reset timer
    elapsed = 0

    FindExpiredCooldowns()
end

local addonFrame = CreateFrame("Frame")
addonFrame:SetScript("OnUpdate", AddonLoop)