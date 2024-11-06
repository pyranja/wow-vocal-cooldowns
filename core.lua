
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

-- ADDON logic

-- record that a spell with cooldown was casted
local function TrackRecentCast(spellID)

    local spellInfo = C_Spell.GetSpellInfo(spellID)

    -- skip tracking excluded spell ids
    if spellInfo and TableHasValue(VocalCooldowns.db.profile.blacklist,spellInfo.name) then
        return
    end

    local cooldown = C_Spell.GetSpellCooldown(spellID)

    -- non-zero start time indicates the spell is on cooldown
    if cooldown and (cooldown.startTime > 0 or cooldown.isEnabled) then
        recent_casts[spellID] = true
    end
end

-- If a spell cooldown is not tracked yet, fetch its name and prepare the data structure in tracked_cooldowns
local function trackSpellCooldown(spellID, cooldown)
    if tracked_cooldowns[spellID] then
        tracked_cooldowns[spellID].expiration = cooldown.startTime + cooldown.duration
        return
    end

    local name = C_Spell.GetSpellName(spellID)
    tracked_cooldowns[spellID] = {
        name = name,
        expiration = cooldown.startTime + cooldown.duration,
        notified = false,
    }
end

-- Check cooldown of a recent cast and track it if applicable
-- Yields true if the recent cast is now tracked as cooldown OR the cast should not be tracked anymore
-- Yields false if there is no clear result and the recent cast must still be tracked
local function CheckRecentCastForPromotion(spellID)
    local cooldown = C_Spell.GetSpellCooldown(spellID)

    -- the spell is on cooldown and long enough to track it -> turn it into a tracked cooldown
    if cooldown.startTime > 0 and cooldown.duration >= VocalCooldowns.db.profile.min_cooldown_length then
        trackSpellCooldown(spellID, cooldown)
    end
end

-- find recent casts that have a valid cooldown now
local function ScanRecentCasts()
    local expiredCasts = {}
    for spellID, _ in pairs(recent_casts) do
        CheckRecentCastForPromotion(spellID)
        table.insert(expiredCasts, spellID)
    end
    for _, spellID in ipairs(expiredCasts) do
        recent_casts[spellID] = nil
    end
end

-- check if any cooldown is ready and report it
local function FindExpiredCooldowns()
    local expired = {}
    for id, cooldown in pairs(tracked_cooldowns) do
        if not cooldown.notified and cooldown.expiration > 0 and (cooldown.expiration - VocalCooldowns.db.profile.headsup_seconds) < GetTime() then
            cooldown.notified = true
            table.insert(expired, id)
            Speech(interpolateString(VocalCooldowns.db.profile.notification_template, cooldown))
        end
    end
    for _, id in ipairs(expired) do
        tracked_cooldowns[id] = nil
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
local lastScanForRecentCasts = GetTime()

local function HandleCooldownUpdate()
    if(GetTime()-lastScanForRecentCasts < VocalCooldowns.db.profile.update_period_seconds) then return end
    lastScanForRecentCasts = GetTime()
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
            name = item,
            func = function()
                table.remove(VocalCooldowns.db.profile.blacklist, index)
                UpdateStringListOptions(options)  -- Refresh the options to reflect the removal
            end,
            width = "half",
        }
    end
    LibStub("AceConfigRegistry-3.0"):NotifyChange("VocalCooldowns")
end

local function PrintTableContents()
    print("Tracked Cooldowns:")
    for id, cooldown in pairs(tracked_cooldowns) do
        print("Spell ID:", id)
        for key, value in pairs(cooldown) do
            print("  " .. key .. ":", value)
        end
    end

    print("Recent Casts:")
    for id, _ in pairs(recent_casts) do
        print("Spell ID:", id)
    end
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
        ["debug_print_tables"] = {
            type = "execute",
            name = "Print Tracked Tables",
            desc = "Print the current contents of recent_casts and tracked_cooldowns.",
            func = function()
                PrintTableContents()
            end,
            width = "full",
        }
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
    ScanRecentCasts()
    FindExpiredCooldowns()
end

local addonFrame = CreateFrame("Frame")
addonFrame:SetScript("OnUpdate", AddonLoop)