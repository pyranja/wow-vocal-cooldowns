
-- ADDON CONFIGS

-- track cooldowns only if longer than this value
local MIN_COOLDOWN_LENGTH = 10
-- approximate time between update checks
local COOLDOWN_UPDATE_PERIOD_SECONDS = 0.5
-- spell ids to ignore for cooldown tracking
local EXCLUDED_SPELL_IDS = {
    -- [401150] = true,  -- Avatar
    -- [1160] = true     -- Demoralizing Shout
}

-- ADDON STATE

-- keeps track of active cooldowns
-- cooldowns are added dynamically as they are discovered
local tracked_cooldowns = {}

-- keep track of recently casted spells
-- these are promoted to be tracked cooldowns when cooldown info is available for them
local recent_casts = {}

-- UTILITY FUNCTIONS

-- forward text to the native text-to-speech functionality
local function Speech(text)
    C_VoiceChat.SpeakText(2, text, Enum.VoiceTtsDestination.QueuedLocalPlayback, 0, 100)
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

    -- skip tracking excluded spell ids
    if EXCLUDED_SPELL_IDS[spellID] then

        --@debug@
        -- logWithSpell("TrackRecentCast -> ignore excluded spell", "", spellID)
        -- print(tprint(EXCLUDED_SPELL_IDS, 2))
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
    if cooldown.startTime > 0 and cooldown.duration >= MIN_COOLDOWN_LENGTH then
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
        if cooldown.expiration > 0 and cooldown.expiration < GetTime() then
            Speech(cooldown.name .. " ready")
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

-- ADDON FRAME - initialize and run cooldown update loop

local function InitializeAddon()
    Speech("Vocal Cooldowns enabled")
end

-- handler for OnUpdate - main cooldown check loop of the addon
local elapsed = 0

local function AddonLoop(self, time_since_last_update)
    elapsed = elapsed + time_since_last_update

    if elapsed < COOLDOWN_UPDATE_PERIOD_SECONDS then
        return
    end

    -- reset timer
    elapsed = 0

    FindExpiredCooldowns()
end

local addonFrame = CreateFrame("Frame")
addonFrame:RegisterEvent("PLAYER_LOGIN")
addonFrame:SetScript("OnEvent", InitializeAddon)
addonFrame:SetScript("OnUpdate", AddonLoop)