local CDVA_Retail, addon = ...

local class = select(2, UnitClass("player")) -- Get the player's class


local spellCooldowns = {}


-- Define spells based on the player's class
if class == "HUNTER" then
    spellCooldowns = {



        -- HUNTER SPELLS --



        [14310] = {
            name = "Freezing Trap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IceTraps.mp3",
            onCooldown = false,
        },
        [13809] = {                                                          -- 'Ice Traps Ready'
            name = "Frost Trap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\",
            onCooldown = false,
        },
        [5384] = {
            name = "Feign Death",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FeignDeath.mp3",
            onCooldown = false,
        },
        [781] = {
            name = "Disengage",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Disengage.mp3",
            onCooldown = false,
        },
        [3045] = {
            name = "Rapid Fire",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RapidFire.mp3",
            onCooldown = false,
        },
        [5116] = {
            name = "Concussive Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ConcussiveShot.mp3",
            onCooldown = false,
        },
        [14316] = {
            name = "Explosive Trap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FireTraps.mp3",
            onCooldown = false,
        },                                                                  -- 'Fire Traps Ready'
        [14302] = {
            name = "Immolation Trap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\",
            onCooldown = false,
        },
        [53209] = {
            name = "Chimera Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ChimeraShot.mp3",
            onCooldown = false,
        },
        [34490] = {
            name = "Silencing Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SilencingShot.mp3",
            onCooldown = false,
        },
        [19263] = {
            name = "Deterrence",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Deterrence.mp3",
            onCooldown = false,
        },
        [34026] = {
            name = "Kill Command",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\KillCommand.mp3",
            onCooldown = false,
        },
        [34477] = {
            name = "Misdirection",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Misdirection.mp3",
            onCooldown = false,
        },
        [53271] = {
            name = "Master's Call",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MastersCall.mp3",
            onCooldown = false,
        },
        [60192] = {
            name = "Freezing Arrow",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FreezingArrow.mp3",
            onCooldown = false,
        },
        [147362] = {
            name = "Counter Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CounterShot.mp3",
            onCooldown = false,
        },
        [109304] = {
            name = "Exhilaration",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Exhilaration.mp3",
            onCooldown = false,
        },
        [392956] = {
            name = "Fortitude of the Bear",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FortitudeoftheBear.mp3",
            onCooldown = false,
        },
        [213691] = {
            name = "Scatter Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ScatterShot.mp3",
            onCooldown = false,
        },
        [264735] = {
            name = "Survival of the Fittest",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SurvivaloftheFittest.mp3",
            onCooldown = false,
        },
        [400456] = {
            name = "Salvo",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Salvo.mp3",
            onCooldown = false,
        },
        [288613] = {
            name = "Trueshot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Trueshot.mp3",
            onCooldown = false,
        },
        [131894] = {
            name = "A Murder of Crows",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AMurderofCrows.mp3",
            onCooldown = false,
        },
        [19574] = {
            name = "Bestial Wrath",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BestialWrath.mp3",
            onCooldown = false,
        },
        [321530] = {
            name = "Bloodshed",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bloodshed.mp3",
            onCooldown = false,
        },
        [359844] = {
            name = "Call of the Wild",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CalloftheWild.mp3",
            onCooldown = false,
        },
        [392060] = {
            name = "Wailing Arrow",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\WailingArrow.mp3",
            onCooldown = false,
        },
        [360952] = {
            name = "Coordinated Assault",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CoordinatedAssault.mp3",
            onCooldown = false,
        },
        [269751] = {
            name = "Flanking Strike",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FlankingStrike.mp3",
            onCooldown = false,
        },
        [203415] = {
            name = "Fury of the Eagle",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FuryoftheEagle.mp3",
            onCooldown = false,
        },
        [190925] = {
            name = "Harpoon",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Harpoon.mp3",
            onCooldown = false,
        },
        [360966] = {
            name = "Spearhead",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Spearhead.mp3",
            onCooldown = false,
        },
      
        
    }





elseif class == "MAGE" then
    spellCooldowns = {



        -- MAGE SPELLS --



        [12051] = {
            name = "Evocation",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Evocation.mp3",
            onCooldown = false,
        },
        [12472] = {
            name = "Icy Veins",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IcyVeins.mp3",
            onCooldown = false,
        },
        [45438] = {
            name = "Ice Block",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IceBlock.mp3",
            onCooldown = false,
        },
        [31687] = {
            name = "Summon Water Elemental",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\WaterEle.mp3",
            onCooldown = false,
        },
        [6131] = {
            name = "Frost Nova",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FrostNova.mp3",
            onCooldown = false,
        },
        [13031] = {
            name = "Ice Barrier",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IceBarrier.mp3",
            onCooldown = false,
        },
        [1953] = {
            name = "Blink",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Blink.mp3",
            onCooldown = false,
        },
        [10160] = {
            name = "Cone of Cold",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ConeOfCold.mp3",
            onCooldown = false,
        },
        [10197] = {
            name = "Fire Blast",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FireBlast.mp3",
            onCooldown = false,
        },
        [11958] = {
            name = "Cold Snap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ColdSnap.mp3",
            onCooldown = false,
        },
        [543] = {
            name = "Fire Ward",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FireWard.mp3",
            onCooldown = false,
        },
        [6143] = {
            name = "Frost Ward",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FrostWard.mp3",
            onCooldown = false,
        },
        [2139] = {
            name = "Counterspell",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Counterspell.mp3",
            onCooldown = false,
        },
        [66] = {
            name = "Invisibility",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Invisibility.mp3",
            onCooldown = false,
        },
        [55342] = {
            name = "Mirror Image",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MirrorImage.mp3",
            onCooldown = false,
        },
        [55342] = {
            name = "Mirror Image",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MirrorImage.mp3",
            onCooldown = false,
        },
        [342245] = {
            name = "Alter Time",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AlterTime.mp3",
            onCooldown = false,
        },
        [157981] = {
            name = "Blast Wave",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BlastWave.mp3",
            onCooldown = false,
        },
        [31661] = {
            name = "Dragon's Breath",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DragonsBreath.mp3",
            onCooldown = false,
        },
        [113724] = {
            name = "Ring of Frost",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RingofFrost.mp3",
            onCooldown = false,
        },
        [382440] = {
            name = "Shifting Power",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShiftingPower.mp3",
            onCooldown = false,
        },
        [212653] = {
            name = "Shimmer",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Shimmer.mp3",
            onCooldown = false,
        },
        [80353] = {
            name = "Time Warp",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\TimeWarp.mp3",
            onCooldown = false,
        },
        [190319] = {
            name = "Combustion",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Combustion.mp3",
            onCooldown = false,
        },
        [257541] = {
            name = "Phoenix Flames",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PhoenixFlames.mp3",
            onCooldown = false,
        },
        [153626] = {
            name = "Arcane Orb",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ArcaneOrb.mp3",
            onCooldown = false,
        },
        [365350] = {
            name = "Arcane Surge",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ArcaneSurge.mp3",
            onCooldown = false,
        },
        [205025] = {
            name = "Presence of Mind",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PresenceofMind.mp3",
            onCooldown = false,
        },
        [235450] = {
            name = "Prismatic Barrier",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PrismaticBarrier.mp3",
            onCooldown = false,
        },
        [153626] = {
            name = "Radiant Spark",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RadiantSpark.mp3",
            onCooldown = false,
        },
        [157980] = {
            name = "Supernova",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Supernova.mp3",
            onCooldown = false,
        },
        [321507] = {
            name = "Touch of the Magi",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\TouchoftheMagi.mp3",
            onCooldown = false,
        },
        [153595] = {
            name = "Comet Storm",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CometStorm.mp3",
            onCooldown = false,
        },
        [44614] = {
            name = "Flurry",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Flurry.mp3",
            onCooldown = false,
        },
        [84714] = {
            name = "Frozen Orb",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Frozen Orb.mp3",
            onCooldown = false,
        },
        [205021] = {
            name = "Ray of Frost",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RayofFrost.mp3",
            onCooldown = false,
        },

        

    }
elseif class == "PRIEST" then
    spellCooldowns = {


        -- PRIEST SPELLS --


        [10060] = {
            name = "Power Infusion",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PowerInfusion.mp3",
            onCooldown = false,
        },
        [135936] = {
            name = "Pain Suppression",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PainSuppression.mp3",
            onCooldown = false,
        },
        [34433] = {
            name = "Shadowfiend",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Shadowfiend.mp3",
            onCooldown = false,
        },
        [64901] = {
            name = "Hymn of Hope",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HymnOfHope.mp3",
            onCooldown = false,
        },
        [64844] = {
            name = "Divine Hymn",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineHymn.mp3",  
            onCooldown = false,
        },
        [586] = {
            name = "Fade",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Fade.mp3",  
            onCooldown = false,
        },
        [8122] = {
            name = "Psychic Scream",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Fear.mp3",  
            onCooldown = false,
        },
        [6346] = {
            name = "Fear Ward",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FearWard.mp3",  
            onCooldown = false,
        },
        [19236] = {
            name = "Desperate Prayer",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DesperatePrayer.mp3",  
            onCooldown = false,
        },
        [391109] = {
            name = "Dark Ascension",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DarkAscension.mp3",  
            onCooldown = false,
        },
        [47585] = {
            name = "Dispersion",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Dispersion.mp3",  
            onCooldown = false,
        },
        [15487] = {
            name = "Silence",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Silence.mp3",  
            onCooldown = false,
        },
        [246287] = {
            name = "Evangelism",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Evangelism.mp3",  
            onCooldown = false,
        },
        [373178] = {
            name = "Light's Wrath",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\LightsWrath.mp3",  
            onCooldown = false,
        },
        [271466] = {
            name = "Luminous Barrier",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\LuminousBarrier.mp3",  
            onCooldown = false,
        },
        [62618] = {
            name = "Power Word: Barrier",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Barrier.mp3",  
            onCooldown = false,
    
        },
        [47536] = {
            name = "Rapture",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Rapture.mp3",  
            onCooldown = false,
        },
        [200183] = {
            name = "Apotheosis",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Apotheosis.mp3",  
            onCooldown = false,
        },
        [47788] = {
            name = "Guardian Spirit",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\GuardianSpirit.mp3",  
            onCooldown = false,
        },
        [64901] = {
            name = "Symbol of Hope",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SymbolofHope.mp3",  
            onCooldown = false,
        },

        

        
    }
elseif class == "PALADIN" then
    spellCooldowns = {


        -- PALADIN SPELLS --


        [31821] = {
            name = "Aura Mastery",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AuraMastery.mp3",
            onCooldown = false,
        },
        [1022] = {
            name = "Hand of Protection",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HoP.mp3",
            onCooldown = false,
        },
        [1044] = {
            name = "Hand of Freedom",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HoF.mp3",
            onCooldown = false,
        },
        [64205] = {
            name = "Divine Sacrifice",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineSacrifice.mp3",
            onCooldown = false,
        },
        [54428] = {
            name = "Divine Plea",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivinePlea.mp3",
            onCooldown = false,
        },
        [642] = {
            name = "Divine Shield",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineShield.mp3",
            onCooldown = false,
        },
        [20216] = {
            name = "Divine Favor",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineFavor.mp3",
            onCooldown = false,
        },
        [31842] = {
            name = "Divine Illumination",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineIllumination.mp3",
            onCooldown = false,
        },
        [10310] = {
            name = "Lay on Hands",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\LoH.mp3",
            onCooldown = false,
        },
        [1038] = {
            name = "Hand of Salvation",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HoS.mp3",
            onCooldown = false,
        },
        [135963] = {
            name = "Hammer of Justice",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HoJ.mp3",
            onCooldown = false,
        },
        [19752] = {
            name = "Divine Intervention",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineIntervention.mp3",
            onCooldown = false,
        },
        [498] = {
            name = "Divine Protection",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineProtection.mp3",
            onCooldown = false,
        },

        [6940] = {
            name = "Hand of Sacrifice",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HandofSacrifice.mp3",
            onCooldown = false,
        },

        [31884] = {
            name = "Avenging Wrath",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AvengingWrath.mp3",
            onCooldown = false,
        },
        [115750] = {
            name = "Blinding Light",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BlindingLight.mp3",
            onCooldown = false,
        },
        [190784] = {
            name = "Divine Steed",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineSteed.mp3",
            onCooldown = false,
        },
        [391054] = {
            name = "Intercession",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Intercession.mp3",
            onCooldown = false,
        },
        [96231] = {
            name = "Rebuke",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Rebuke.mp3",
            onCooldown = false,
        },
        [31850] = {
            name = "Ardent Defender",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ArdentDefender.mp3",
            onCooldown = false,
        },
        [378974] = {
            name = "Bastion of Light",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BastionofLight.mp3",
            onCooldown = false,
        },
        [204018] = {
            name = "Blessing of Spellwarding",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BlessingofSpellwarding.mp3",
            onCooldown = false,
        },
        [387174] = {
            name = "Eye of Tyr",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\EyeofTyr.mp3",
            onCooldown = false,
        },
        [86659] = {
            name = "Guarding of Ancient Kings",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AncientKings.mp3",
            onCooldown = false,
        },
        [327193] = {
            name = "Moment of Glory",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MomentofGlory.mp3",
            onCooldown = false,
        },
        [389539] = {
            name = "Sentinel",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Sentinel.mp3",
            onCooldown = false,
        },
        [231895] = {
            name = "Crusade",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Crusade.mp3",
            onCooldown = false,
        },
        [198034] = {
            name = "Divine Hammer",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DivineHammer.mp3",
            onCooldown = false,
        },
        [343527] = {
            name = "Execution Sentence",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ExecutionSentence.mp3",
            onCooldown = false,
        },
        [343721] = {
            name = "Final Reckoning",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FinalReckoning.mp3",
            onCooldown = false,
        },
        [255937] = {
            name = "Wake of Ashes",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\WakeofAshes.mp3",
            onCooldown = false,
        },


        
    }
elseif class == "ROGUE" then
    spellCooldowns = {


        -- ROGUE SPELLS --


        [5277] = {
            name = "Evasion",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Evasion.mp3",
            onCooldown = false,
        },
        [2983] = {
            name = "Sprint",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Sprint.mp3",
            onCooldown = false,
        },
        [1766] = {
            name = "Kick",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Kick.mp3",
            onCooldown = false,
        },
        [1966] = {
            name = "Feint",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Feint.mp3",
            onCooldown = false,
        },
        [51722] = {
            name = "Dismantle",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Dismantle.mp3",
            onCooldown = false,
        },
        [1856] = {
            name = "Vanish",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Vanish.mp3",
            onCooldown = false,
        },
        [408] = {
            name = "Kidney Shot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\KidneyShot.mp3",
            onCooldown = false,
        },
        [2094] = {
            name = "Blind",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Blind.mp3",
            onCooldown = false,
        },
        [31224] = {
            name = "Cloak of Shadows",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CoS.mp3",
            onCooldown = false,
        },
        [1776] = {
            name = "Gouge",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Gouge.mp3",
            onCooldown = false,
        },
        
    }
elseif class == "DRUID" then
    spellCooldowns = {


        -- DRUID SPELLS --


        [16689] = {
            name = "Nature's Grasp",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\NaturesGrasp.mp3",
            onCooldown = false,
        },
        [5229] = {
            name = "Enrage",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Enrage.mp3",
            onCooldown = false,
        },
        [5221] = {
            name = "Bash",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bash.mp3",
            onCooldown = false,
        },
        [20484] = {
            name = "Rebirth",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Rebirth.mp3",
            onCooldown = false,
        },
        [16979] = {
            name = "Feral Charge - Bear",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FC.mp3",
            onCooldown = false,
        },
        [49376] = {
            name = "Feral Charge - Cat",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FC.mp3",
            onCooldown = false,
        },
        [5217] = {
            name = "Tiger's Fury",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\TigersFury.mp3",
            onCooldown = false,
        },
        [1850] = {
            name = "Dash",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Dash.mp3",
            onCooldown = false,
        },
        [5209] = {
            name = "Challenging Roar",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ChallengingRoar.mp3",
            onCooldown = false,
        },
        [22842] = {
            name = "Frenzied Regeneration",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FR.mp3",
            onCooldown = false,
        },
        [29166] = {
            name = "Innervate",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Innervate.mp3",
            onCooldown = false,
        },
        [22812] = {
            name = "Barkskin",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Barkskin.mp3",
            onCooldown = false,
        },
        
    }
elseif class == "SHAMAN" then
    spellCooldowns = {


        -- SHAMAN SPELLS --


        [8042] = {
            name = "Earth Shock",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\EarthShock.mp3",
            onCooldown = false,
        },
        [8050] = {
            name = "Flame Shock",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FlameShock.mp3",
            onCooldown = false,
        },
        [57994] = {
            name = "Wind Shear",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\WindShear.mp3",
            onCooldown = false,
        },
        [8056] = {
            name = "Frost Shock",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FrostShock.mp3",
            onCooldown = false,
        },
        [2062] = {
            name = "Earth Elemental Totem",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\EET.mp3",
            onCooldown = false,
        },
        [2894] = {
            name = "Fire Elemental Totem",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FET.mp3",
            onCooldown = false,
        },
        [32182] = {
            name = "Heroism",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Heroism.mp3",
            onCooldown = false,
        },
        [2825] = {
            name = "Bloodlust",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bloodlust.mp3",
            onCooldown = false,
        },
        [51505] = {
            name = "Lava Burst",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\LavaBurst.mp3",
            onCooldown = false,
        },
        [51514] = {
            name = "Hex",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Hex.mp3",
            onCooldown = false,
        },
        [108281] = {
            name = "Ancestral Guidance",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AncestralGuidance.mp3",
            onCooldown = false,
        },
       
        [108271] = {
            name = "Astral Shift",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AstralShift.mp3",
            onCooldown = false,
        },
       
        [2825] = {
            name = "Bloodlust",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bloodlust.mp3",
            onCooldown = false,
        },
       
        [192058] = {
            name = "Capacitor Totem",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CapacitorTotem.mp3",
            onCooldown = false,
        },
       
        [57994] = {
            name = "Windshear",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Windshear.mp3",
            onCooldown = false,
        },
       
        [384352] = {
            name = "Doom Winds",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DoomWinds.mp3",
            onCooldown = false,
        },
       
        [51533] = {
            name = "Feral Spirit",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\FeralSpirit.mp3",
            onCooldown = false,
        },
       
        [114050] = {
            name = "Ascendance",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Ascendance.mp3",
            onCooldown = false,
        },
       
        [210714] = {
            name = "Icefury",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Icefury.mp3",
            onCooldown = false,
        },
       
        [191634] = {
            name = "Stormkeeper",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Stormkeeper.mp3",
            onCooldown = false,
        },
       
        [108280] = {
            name = "Healing Tide Totem",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HealingTide.mp3",
            onCooldown = false,
        },
       
        [16191] = {
            name = "Mana Tide Totem",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ManaTide.mp3",
            onCooldown = false,
        },
       
        [197995] = {
            name = "Wellspring",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Wellspring.mp3",
            onCooldown = false,
        },
       
       
       
    }
elseif class == "WARRIOR" then
    spellCooldowns = {


        -- WARRIOR SPELLS --


        [100] = {
            name = "Charge",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Charge.mp3",
            onCooldown = false,
        },
        [6343] = {
            name = "Thunder Clap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ThunderClap.mp3",
            onCooldown = false,
        },
        [2687] = {
            name = "Bloodrage",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bloodrage.mp3",
            onCooldown = false,
        },
        [355] = {
            name = "Taunt",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Taunt.mp3",
            onCooldown = false,
        },
        [72] = {
            name = "Shield Bash",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShieldBash.mp3",
            onCooldown = false,
        },
        [694] = {
            name = "Mocking Blow",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MockingBlow.mp3",
            onCooldown = false,
        },
        [2565] = {
            name = "Shield Block",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShieldBlock.mp3",
            onCooldown = false,
        },
        [676] = {
            name = "Disarm",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Disarm.mp3",
            onCooldown = false,
        },
        [20230] = {
            name = "Retaliation",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Retaliation.mp3",
            onCooldown = false,
        },
        [5246] = {
            name = "Intimidating Shout",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IntimidatingShout.mp3",
            onCooldown = false,
        },
        [1161] = {
            name = "Challenging Shout",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ChallengingShout.mp3",
            onCooldown = false,
        },
        [871] = {
            name = "Shield Wall",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShieldWall.mp3",
            onCooldown = false,
        },
        [20252] = {
            name = "Intercept",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Intercept.mp3",
            onCooldown = false,
        },
        [18499] = {
            name = "Berserker Rage",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BerserkerRage.mp3",
            onCooldown = false,
        },
        [6552] = {
            name = "Pummel",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Pummel.mp3",
            onCooldown = false,
        },
        [23920] = {
            name = "Spell Reflection",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SpellReflection.mp3",
            onCooldown = false,
        },
        [3411] = {
            name = "Intervene",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Intervene.mp3",
            onCooldown = false,
        },
        [64382] = {
            name = "Shattering Throw",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShatteringThrow.mp3",
            onCooldown = false,
        },
        [55694] = {
            name = "Enraged Regeneration",
            mp3 = "Interface\\AddOns\\CDVCDVA_Retail\\Sounds\\EnragedRegeneration.mp3",
            onCooldown = false,
        },
        [57755] = {
            name = "Heroic Throw",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HeroicThrow.mp3",
            onCooldown = false,
        },
        [107574] = {
            name = "Avatar",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Avatar.mp3",
            onCooldown = false,
        },
        [1719] = {
            name = "Recklessness",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Recklessness.mp3",
            onCooldown = false,
        },
        [152277] = {
            name = "Ravager",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Ravager.mp3",
            onCooldown = false,
        },
        [384318] = {
            name = "Thunderous Roar",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ThunderousRoar.mp3",
            onCooldown = false,
        },
       
    }
elseif class == "WARLOCK" then
    spellCooldowns = {


        -- WARLOCK SPELLS --


        [6229] = {
            name = "Shadow Ward",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ShadowWard.mp3",
            onCooldown = false,
        },
        [5484] = {
            name = "Howl of Terror",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\HowlofTerror.mp3",
            onCooldown = false,
        },
        [6789] = {
            name = "Death Coil",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DeathCoil.mp3",
            onCooldown = false,
        },
        [1122] = {
            name = "Inferno",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Inferno.mp3",
            onCooldown = false,
        },
        [603] = {
            name = "Curse of Doom",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CurseofDoom.mp3",
            onCooldown = false,
        },
        [54785] = {
            name = "Demon Charge",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DemonCharge.mp3",
            onCooldown = false,
        },
        [50589] = {
            name = "Immolation Aura",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\ImmolationAura.mp3",
            onCooldown = false,
        },
        [29858] = {
            name = "Soulshatter",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Soulshatter.mp3",
            onCooldown = false,
        },
        [29893] = {
            name = "Ritual of Souls",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RitualofSouls.mp3",
            onCooldown = false,
        },
        [47897] = {
            name = "Shadowflame",
            mp3 = "Interface\\AddOns\\CDCDCDVA_RetailVA_RetailVA\\Sounds\\Shadowflame.mp3",
            onCooldown = false,
        },
        [48020] = {
            name = "Demonic Circle: Teleport",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DCT.mp3",
            onCooldown = false,
        },
        [6789] = {
            name = "Mortal Coil",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\MortalCoil.mp3",
            onCooldown = false,
        },
        [30283] = {
            name = "Shadowfury",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Shadowfury.mp3",
            onCooldown = false,
        },
        [104773] = {
            name = "Unedning Resolve",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\UnedningResolve.mp3",
            onCooldown = false,
        },
        [205179] = {
            name = "Phantom Singularity",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PhantomSingularity.mp3",
            onCooldown = false,
        },
        [386997] = {
            name = "Soul Rot",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SoulRot.mp3",
            onCooldown = false,
        },
        [386951] = {
            name = "Soul Swap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SoulSwap.mp3",
            onCooldown = false,
        },
        [205180] = {
            name = "Summon Darkglare",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\SummonDarkglare.mp3",
            onCooldown = false,
        },
        [267211   ] = {
            name = "Bilescourge Bombers",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bombers.mp3",
            onCooldown = false,
        },
        [111898] = {
            name = "Grimoire: Felguard",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Felguard.mp3",
            onCooldown = false,
        },
        [386833] = {
            name = "DGuillotine",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Guillotine.mp3",
            onCooldown = false,
        },
        [264130] = {
            name = "Power Siphon",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\PowerSiphon.mp3",
            onCooldown = false,
        },
        
       
    }
elseif class == "DEATH KNIGHT" then
    spellCooldowns = {


        -- DK SPELLS --


        [49576] = {
            name = "Death Grip",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DeathGrip.mp3",
            onCooldown = false,
        },
        [46584] = {
            name = "Raise Dead",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RaiseDead.mp3",
            onCooldown = false,
        },
        [47476] = {
            name = "Strangulate",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Strangulate.mp3",
            onCooldown = false,
        },
        [43265] = {
            name = "Death and Decay",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DeathAndDecay.mp3",
            onCooldown = false,
        },
        [48792] = {
            name = "Icebound Fortitude",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\IceboundFortitude.mp3",
            onCooldown = false,
        },
        [45529] = {
            name = "Blood Tap",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\BloodTap.mp3",
            onCooldown = false,
        },
        [48743] = {
            name = "Death Pact",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DeathPact.mp3",
            onCooldown = false,
        },
        [48707] = {
            name = "Anti-Magic Shell",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AMS.mp3",
            onCooldown = false,
        },
        [61999] = {
            name = "Raise Ally",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\RaiseAlly.mp3",
            onCooldown = false,
        },
        [42650] = {
            name = "Army of the Dead",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\AOTD.mp3",
            onCooldown = false,
        },
        [48265] = {
            name = "Death's Advance",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DeathsAdvance.mp3",
            onCooldown = false,
        },
        [49039] = {
            name = "Lichbone",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Lichbone.mp3",
            onCooldown = false,
        },
        [63560] = {
            name = "Dark Transformation",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\DarkTransformation.mp3",
            onCooldown = false,
        },
        [194844] = {
            name = "Bonestorm",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Bonestorm.mp3",
            onCooldown = false,
        },
        [219809] = {
            name = "Tombstone",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Tombstone.mp3",
            onCooldown = false,
        },
        [55233] = {
            name = "Vampiric Blood",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\VampiricBlood.mp3",
            onCooldown = false,
        },
        [152279] = {
            name = "Breath of Sindragosa",
            mp3 = "Interface\\AddOns\\CDVA_Retail\\Sounds\\Sindragosa.mp3",
            onCooldown = false,
        },
        
       
    }



end


local isMP3Playing = false


-- Initialize the global timer variable
local smallestCooldown = math.huge



-- Function to check individual spell cooldowns and play sound
local function CheckSpellCooldown(spellID)
    local info = spellCooldowns[spellID]
    local start, duration, enabled = GetSpellCooldown(info.name)





    -- Check if start and duration are not nil and ignore cooldowns shorter than 2 seconds
    if start and duration and start > 0 and duration > 0 and duration >= 2 then
        -- Spell is on cooldown
        info.onCooldown = true
    --elseif info.onCooldown and not isMP3Playing then

        exptime = start + duration
    elseif exptime and exptime < GetTime() and info.onCooldown and not isMP3Playing then


        -- Spell is off cooldown, play the MP3 and set the flag to prevent multiple plays
        PlaySoundFile(info.mp3)
        info.onCooldown = false
        isMP3Playing = true

        -- Set a timer to reset the isMP3Playing flag after a delay (e.g., 1 second)
        C_Timer.After(1, function()
            isMP3Playing = false
        end)
    end
end







-- Play login announcement sound
local function PlayLoginSound()
    local mp3File = "Interface\\AddOns\\CDVA_Retail\\Sounds\\CDVAannouncement.mp3"  -- Replace with the path to your login announcement MP3 file
    PlaySoundFile(mp3File)
end










-- Event handler for spell casting
local function OnSpellCast(_, _, _, _, _, _, _, _, _, spellID)
    if spellCooldowns[spellID] and spellCooldowns[spellID].enabled then
        CheckSpellCooldown(spellID)
        -- Check and play sound when the smallest cooldown spell comes off cooldown
        if smallestCooldown ~= math.huge then
            local currentTime = GetTime()
            if smallestCooldown <= currentTime then
                PlaySmallestCooldownSound()
                smallestCooldown = math.huge -- Reset the smallest cooldown
            end
        end
    end
end



-- Register for the COMBAT_LOG_EVENT_UNFILTERED event to detect spell casting
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
eventFrame:SetScript("OnEvent", OnSpellCast)

-- Function to check all spell cooldowns
local function CheckAllSpellCooldowns()
    for spellID, info in pairs(spellCooldowns) do
        CheckSpellCooldown(spellID)
    end
end

-- Event handler for player's location change
local function OnPlayerLocationChanged()
    CheckAllSpellCooldowns()
end

-- Register for the PLAYER_ENTERING_WORLD and PLAYER_LEAVING_WORLD events to detect location changes
local locationFrame = CreateFrame("Frame")
locationFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
locationFrame:RegisterEvent("PLAYER_LEAVING_WORLD")
locationFrame:SetScript("OnEvent", OnPlayerLocationChanged)


-- Register for the UNIT_SPELLCAST_SUCCEEDED event to detect spell casting
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
eventFrame:SetScript("OnEvent", OnSpellCast)

-- Call CheckAllSpellCooldowns when the addon is loaded
CheckAllSpellCooldowns()





local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    for spellID, info in pairs(spellCooldowns) do
        local spellName = GetSpellInfo(spellID)
        if spellName then
            local spellName, _, _, _, _, _, _, _, _, _, _ = GetSpellInfo(spellID)
            spellCooldowns[spellID].name = spellName
        end
    end

    -- Play the login announcement sound when the player logs in
    PlayLoginSound()

    -- Delay for 5 seconds
    C_Timer.After(5, function()
        -- Get the player's class
        local class = select(2, UnitClass("player"))

        -- Print messages in chat with color codes
        local whiteColor = "|cffffffff"
        local greenColor = "|cff00ff00"
        local redColor = "|cffff0000"
        local mintColor = '|cff00ffcc'
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "CDVA (Cooldown Vocal Announcement): " .. whiteColor .. "Enabled")
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "Class Detected: " .. whiteColor .. class)
        DEFAULT_CHAT_FRAME:AddMessage(redColor .. "Discord.gg/JkfQvBWbQJ")
    end)


    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

    eventFrame:SetScript("OnEvent", function(_, _, _, event, _, sourceName, _, _, _, destName, _, _, _, _, spellID)
        if event == "SPELL_CAST_SUCCESS" and sourceName == UnitName("player") then
            if spellCooldowns[spellID] and spellCooldowns[spellID].enabled then
                CheckSpellCooldown(spellID)
            end
        end
    end)

    local timer = C_Timer.NewTicker(1, CheckAllSpellCooldowns)
end)