local CDVA_Retail, addon = ...

local class = select(2, UnitClass("player")) -- Get the player's class


local spellCooldowns = {}


-- Define spells based on the player's class
if class == "EVOKER" then
    spellCooldowns = {
        [357208] = {
            name = "Fire Breath",
            onCooldown = false,
        },
        [382266] = {
            name = "Fire Breath",
            onCooldown = false,
        },
        [372048] = {
            name = "Oppressing Roar",
            onCooldown = false,
        },
        [358267] = {
            name = "Hover",
            onCooldown = false,
        },
        [443328] = {
            name = "Engulf",
            onCooldown = false,
        },
        [357210] = {
            name = "Deep Breath",
            onCooldown = false,
        },
        [355913] = {
            name = "Emerald Blossom",
            onCooldown = false,
        },
        [358385] = {
            name = "Landslide",
            onCooldown = false,
        },
        [363916] = {
            name = "Obsidian Scales",
            onCooldown = false,
        },
        [365585] = {
            name = "Expunge",
            onCooldown = false,
        },
        [360995] = {
            name = "Verdant Embrace",
            onCooldown = false,
        },
        [359073] = {
            name = "Eternity Surge",
            onCooldown = false,
        },
        [351338] = {
            name = "Quell",
            onCooldown = false,
        },
        [374251] = {
            name = "Cauterizing Flame",
            onCooldown = false,
        },
        [375087] = {
            name = "Dragonrage",
            onCooldown = false,
        },
        [370553] = {
            name = "Tip the Scales",
            onCooldown = false,
        },
        [368847] = {
            name = "Firestorm",
            onCooldown = false,
        },
        [360806] = {
            name = "Sleep Walk",
            onCooldown = false,
        },
        [370452] = {
            name = "Shattering Star",
            onCooldown = false,
        },
        [374348] = {
            name = "Renewing Blaze",
            onCooldown = false,
        },
        [368432] = {
            name = "Unravel",
            onCooldown = false,
        },
        [370665] = {
            name = "Rescue",
            onCooldown = false,
        },
        [374968] = {
            name = "Time Spiral",
            onCooldown = false,
        },
        [374227] = {
            name = "Zephyr",
            onCooldown = false,
        },
        [382614] = {
            name = "Dream Breath",
            onCooldown = false,
        },
        [366155] = {
            name = "Reversion",
            onCooldown = false,
        },
        [363534] = {
            name = "Rewind",
            onCooldown = false,
        },
        [382731] = {
            name = "Spiritbloom",
            onCooldown = false,
        },
        [357170] = {
            name = "Time Dilation",
            onCooldown = false,
        },
        [370960] = {
            name = "Emerald Communion",
            onCooldown = false,
        },
        [373861] = {
            name = "Temporal Anomaly",
            onCooldown = false,
        },
        [359816] = {
            name = "Dream Flight",
            onCooldown = false,
        },
        [370537] = {
            name = "Stasis",
            onCooldown = false,
        },
        [357214] = {
            name = "Wing Buffet",
            onCooldown = false,
        },
        [368970] = {
            name = "Tail Swipe",
            onCooldown = false,
        },
    }
    
elseif class == "HUNTER" then
    spellCooldowns = {
        [13809] = {                                                          -- 'Ice Traps Ready'
            name = "Frost Trap",
            onCooldown = false,
        },
        [5384] = {
            name = "Feign Death",
            onCooldown = false,
        },
        [781] = {
            name = "Disengage",
            onCooldown = false,
        },
        [3045] = {
            name = "Rapid Fire",
            onCooldown = false,
        },
        [5116] = {
            name = "Concussive Shot",
            onCooldown = false,
        },
        [14316] = {
            name = "Explosive Trap",
            onCooldown = false,
        },                                                                  -- 'Fire Traps Ready'
        [14302] = {
            name = "Immolation Trap",
            onCooldown = false,
        },
        [53209] = {
            name = "Chimera Shot",
            onCooldown = false,
        },
        [34490] = {
            name = "Silencing Shot",
            onCooldown = false,
        },
        [19263] = {
            name = "Deterrence",
            onCooldown = false,
        },
        [34026] = {
            name = "Kill Command",
            onCooldown = false,
        },
        [34477] = {
            name = "Misdirection",
            onCooldown = false,
        },
        [53271] = {
            name = "Master's Call",
            onCooldown = false,
        },
        [60192] = {
            name = "Freezing Arrow",
            onCooldown = false,
        },
        [147362] = {
            name = "Counter Shot",
            onCooldown = false,
        },
        [109304] = {
            name = "Exhilaration",
            onCooldown = false,
        },
        [392956] = {
            name = "Fortitude of the Bear",
            onCooldown = false,
        },
        [213691] = {
            name = "Scatter Shot",
            onCooldown = false,
        },
        [264735] = {
            name = "Survival of the Fittest",
            onCooldown = false,
        },
        [400456] = {
            name = "Salvo",
            onCooldown = false,
        },
        [288613] = {
            name = "Trueshot",
            onCooldown = false,
        },
        [131894] = {
            name = "A Murder of Crows",
            onCooldown = false,
        },
        [19574] = {
            name = "Bestial Wrath",
            onCooldown = false,
        },
        [321530] = {
            name = "Bloodshed",
            onCooldown = false,
        },
        [359844] = {
            name = "Call of the Wild",
            onCooldown = false,
        },
        [392060] = {
            name = "Wailing Arrow",
            onCooldown = false,
        },
        [360952] = {
            name = "Coordinated Assault",
            onCooldown = false,
        },
        [269751] = {
            name = "Flanking Strike",
            onCooldown = false,
        },
        [203415] = {
            name = "Fury of the Eagle",
            onCooldown = false,
        },
        [190925] = {
            name = "Harpoon",
            onCooldown = false,
        },
        [360966] = {
            name = "Spearhead",
            onCooldown = false,
        },
      
        
    }





elseif class == "MAGE" then
    spellCooldowns = {



        -- MAGE SPELLS --



        [12051] = {
            name = "Evocation",
            onCooldown = false,
        },
        [12472] = {
            name = "Icy Veins",
            onCooldown = false,
        },
        [45438] = {
            name = "Ice Block",
            onCooldown = false,
        },
        [31687] = {
            name = "Summon Water Elemental",
            onCooldown = false,
        },
        [6131] = {
            name = "Frost Nova",
            onCooldown = false,
        },
        [13031] = {
            name = "Ice Barrier",
            onCooldown = false,
        },
        [1953] = {
            name = "Blink",
            onCooldown = false,
        },
        [10160] = {
            name = "Cone of Cold",
            onCooldown = false,
        },
        [10197] = {
            name = "Fire Blast",
            onCooldown = false,
        },
        [11958] = {
            name = "Cold Snap",
            onCooldown = false,
        },
        [543] = {
            name = "Fire Ward",
            onCooldown = false,
        },
        [6143] = {
            name = "Frost Ward",
            onCooldown = false,
        },
        [2139] = {
            name = "Counterspell",
            onCooldown = false,
        },
        [66] = {
            name = "Invisibility",
            onCooldown = false,
        },
        [55342] = {
            name = "Mirror Image",
            onCooldown = false,
        },
        [55342] = {
            name = "Mirror Image",
            onCooldown = false,
        },
        [342245] = {
            name = "Alter Time",
            onCooldown = false,
        },
        [157981] = {
            name = "Blast Wave",
            onCooldown = false,
        },
        [31661] = {
            name = "Dragon's Breath",
            onCooldown = false,
        },
        [113724] = {
            name = "Ring of Frost",
            onCooldown = false,
        },
        [382440] = {
            name = "Shifting Power",
            onCooldown = false,
        },
        [212653] = {
            name = "Shimmer",
            onCooldown = false,
        },
        [80353] = {
            name = "Time Warp",
            onCooldown = false,
        },
        [190319] = {
            name = "Combustion",
            onCooldown = false,
        },
        [257541] = {
            name = "Phoenix Flames",
            onCooldown = false,
        },
        [153626] = {
            name = "Arcane Orb",
            onCooldown = false,
        },
        [365350] = {
            name = "Arcane Surge",
            onCooldown = false,
        },
        [205025] = {
            name = "Presence of Mind",
            onCooldown = false,
        },
        [235450] = {
            name = "Prismatic Barrier",
            onCooldown = false,
        },
        [153626] = {
            name = "Radiant Spark",
            onCooldown = false,
        },
        [157980] = {
            name = "Supernova",
            onCooldown = false,
        },
        [321507] = {
            name = "Touch of the Magi",
            onCooldown = false,
        },
        [153595] = {
            name = "Comet Storm",
            onCooldown = false,
        },
        [44614] = {
            name = "Flurry",
            onCooldown = false,
        },
        [84714] = {
            name = "Frozen Orb",
            onCooldown = false,
        },
        [205021] = {
            name = "Ray of Frost",
            onCooldown = false,
        },

        

    }
elseif class == "PRIEST" then
    spellCooldowns = {


        -- PRIEST SPELLS --


        [10060] = {
            name = "Power Infusion",
            onCooldown = false,
        },
        [135936] = {
            name = "Pain Suppression",
            onCooldown = false,
        },
        [34433] = {
            name = "Shadowfiend",
            onCooldown = false,
        },
        [64901] = {
            name = "Hymn of Hope",
            onCooldown = false,
        },
        [64844] = {
            name = "Divine Hymn",
            onCooldown = false,
        },
        [586] = {
            name = "Fade",
            onCooldown = false,
        },
        [8122] = {
            name = "Psychic Scream",
            onCooldown = false,
        },
        [6346] = {
            name = "Fear Ward",
            onCooldown = false,
        },
        [19236] = {
            name = "Desperate Prayer",
            onCooldown = false,
        },
        [391109] = {
            name = "Dark Ascension",
            onCooldown = false,
        },
        [47585] = {
            name = "Dispersion",
            onCooldown = false,
        },
        [15487] = {
            name = "Silence",
            onCooldown = false,
        },
        [246287] = {
            name = "Evangelism",
            onCooldown = false,
        },
        [373178] = {
            name = "Light's Wrath",
            onCooldown = false,
        },
        [271466] = {
            name = "Luminous Barrier",
            onCooldown = false,
        },
        [62618] = {
            name = "Power Word: Barrier",
            onCooldown = false,
    
        },
        [47536] = {
            name = "Rapture",
            onCooldown = false,
        },
        [200183] = {
            name = "Apotheosis",
            onCooldown = false,
        },
        [47788] = {
            name = "Guardian Spirit",
            onCooldown = false,
        },
        [64901] = {
            name = "Symbol of Hope",
            onCooldown = false,
        },

        

        
    }
elseif class == "PALADIN" then
    spellCooldowns = {


        -- PALADIN SPELLS --


        [31821] = {
            name = "Aura Mastery",
            onCooldown = false,
        },
        [1022] = {
            name = "Hand of Protection",
            onCooldown = false,
        },
        [1044] = {
            name = "Hand of Freedom",
            onCooldown = false,
        },
        [64205] = {
            name = "Divine Sacrifice",
            onCooldown = false,
        },
        [54428] = {
            name = "Divine Plea",
            onCooldown = false,
        },
        [642] = {
            name = "Divine Shield",
            onCooldown = false,
        },
        [20216] = {
            name = "Divine Favor",
            onCooldown = false,
        },
        [31842] = {
            name = "Divine Illumination",
            onCooldown = false,
        },
        [10310] = {
            name = "Lay on Hands",
            onCooldown = false,
        },
        [1038] = {
            name = "Hand of Salvation",
            onCooldown = false,
        },
        [135963] = {
            name = "Hammer of Justice",
            onCooldown = false,
        },
        [19752] = {
            name = "Divine Intervention",
            onCooldown = false,
        },
        [498] = {
            name = "Divine Protection",
            onCooldown = false,
        },

        [6940] = {
            name = "Hand of Sacrifice",
            onCooldown = false,
        },

        [31884] = {
            name = "Avenging Wrath",
            onCooldown = false,
        },
        [115750] = {
            name = "Blinding Light",
            onCooldown = false,
        },
        [190784] = {
            name = "Divine Steed",
            onCooldown = false,
        },
        [391054] = {
            name = "Intercession",
            onCooldown = false,
        },
        [96231] = {
            name = "Rebuke",
            onCooldown = false,
        },
        [31850] = {
            name = "Ardent Defender",
            onCooldown = false,
        },
        [378974] = {
            name = "Bastion of Light",
            onCooldown = false,
        },
        [204018] = {
            name = "Blessing of Spellwarding",
            onCooldown = false,
        },
        [387174] = {
            name = "Eye of Tyr",
            onCooldown = false,
        },
        [86659] = {
            name = "Guarding of Ancient Kings",
            onCooldown = false,
        },
        [327193] = {
            name = "Moment of Glory",
            onCooldown = false,
        },
        [389539] = {
            name = "Sentinel",
            onCooldown = false,
        },
        [231895] = {
            name = "Crusade",
            onCooldown = false,
        },
        [198034] = {
            name = "Divine Hammer",
            onCooldown = false,
        },
        [343527] = {
            name = "Execution Sentence",
            onCooldown = false,
        },
        [343721] = {
            name = "Final Reckoning",
            onCooldown = false,
        },
        [255937] = {
            name = "Wake of Ashes",
            onCooldown = false,
        },


        
    }
elseif class == "ROGUE" then
    spellCooldowns = {


        -- ROGUE SPELLS --


        [5277] = {
            name = "Evasion",
            onCooldown = false,
        },
        [2983] = {
            name = "Sprint",
            onCooldown = false,
        },
        [1766] = {
            name = "Kick",
            onCooldown = false,
        },
        [1966] = {
            name = "Feint",
            onCooldown = false,
        },
        [51722] = {
            name = "Dismantle",
            onCooldown = false,
        },
        [1856] = {
            name = "Vanish",
            onCooldown = false,
        },
        [408] = {
            name = "Kidney Shot",
            onCooldown = false,
        },
        [2094] = {
            name = "Blind",
            onCooldown = false,
        },
        [31224] = {
            name = "Cloak of Shadows",
            onCooldown = false,
        },
        [1776] = {
            name = "Gouge",
            onCooldown = false,
        },
        
    }
elseif class == "DRUID" then
    spellCooldowns = {


        -- DRUID SPELLS --


        [16689] = {
            name = "Nature's Grasp",
            onCooldown = false,
        },
        [5229] = {
            name = "Enrage",
            onCooldown = false,
        },
        [5221] = {
            name = "Bash",
            onCooldown = false,
        },
        [20484] = {
            name = "Rebirth",
            onCooldown = false,
        },
        [16979] = {
            name = "Feral Charge - Bear",
            onCooldown = false,
        },
        [49376] = {
            name = "Feral Charge - Cat",
            onCooldown = false,
        },
        [5217] = {
            name = "Tiger's Fury",
            onCooldown = false,
        },
        [1850] = {
            name = "Dash",
            onCooldown = false,
        },
        [5209] = {
            name = "Challenging Roar",
            onCooldown = false,
        },
        [22842] = {
            name = "Frenzied Regeneration",
            onCooldown = false,
        },
        [29166] = {
            name = "Innervate",
            onCooldown = false,
        },
        [22812] = {
            name = "Barkskin",
            onCooldown = false,
        },
        
    }
elseif class == "SHAMAN" then
    spellCooldowns = {


        -- SHAMAN SPELLS --


        [8042] = {
            name = "Earth Shock",
            onCooldown = false,
        },
        [8050] = {
            name = "Flame Shock",
            onCooldown = false,
        },
        [57994] = {
            name = "Wind Shear",
            onCooldown = false,
        },
        [8056] = {
            name = "Frost Shock",
            onCooldown = false,
        },
        [2062] = {
            name = "Earth Elemental Totem",
            onCooldown = false,
        },
        [2894] = {
            name = "Fire Elemental Totem",
            onCooldown = false,
        },
        [32182] = {
            name = "Heroism",
            onCooldown = false,
        },
        [2825] = {
            name = "Bloodlust",
            onCooldown = false,
        },
        [51505] = {
            name = "Lava Burst",
            onCooldown = false,
        },
        [51514] = {
            name = "Hex",
            onCooldown = false,
        },
        [108281] = {
            name = "Ancestral Guidance",
            onCooldown = false,
        },
       
        [108271] = {
            name = "Astral Shift",
            onCooldown = false,
        },
       
        [2825] = {
            name = "Bloodlust",
            onCooldown = false,
        },
       
        [192058] = {
            name = "Capacitor Totem",
            onCooldown = false,
        },
       
        [57994] = {
            name = "Windshear",
            onCooldown = false,
        },
       
        [384352] = {
            name = "Doom Winds",
            onCooldown = false,
        },
       
        [51533] = {
            name = "Feral Spirit",
            onCooldown = false,
        },
       
        [114050] = {
            name = "Ascendance",
            onCooldown = false,
        },
       
        [210714] = {
            name = "Icefury",
            onCooldown = false,
        },
       
        [191634] = {
            name = "Stormkeeper",
            onCooldown = false,
        },
       
        [108280] = {
            name = "Healing Tide Totem",
            onCooldown = false,
        },
       
        [16191] = {
            name = "Mana Tide Totem",
            onCooldown = false,
        },
       
        [197995] = {
            name = "Wellspring",
            onCooldown = false,
        },
       
       
       
    }
elseif class == "WARRIOR" then
    spellCooldowns = {


        -- WARRIOR SPELLS --


        [100] = {
            name = "Charge",
            onCooldown = false,
        },
        [6343] = {
            name = "Thunder Clap",
            onCooldown = false,
        },
        [2687] = {
            name = "Bloodrage",
            onCooldown = false,
        },
        [355] = {
            name = "Taunt",
            onCooldown = false,
        },
        [72] = {
            name = "Shield Bash",
            onCooldown = false,
        },
        [694] = {
            name = "Mocking Blow",
            onCooldown = false,
        },
        [2565] = {
            name = "Shield Block",
            onCooldown = false,
        },
        [676] = {
            name = "Disarm",
            onCooldown = false,
        },
        [20230] = {
            name = "Retaliation",
            onCooldown = false,
        },
        [5246] = {
            name = "Intimidating Shout",
            onCooldown = false,
        },
        [1161] = {
            name = "Challenging Shout",
            onCooldown = false,
        },
        [871] = {
            name = "Shield Wall",
            onCooldown = false,
        },
        [20252] = {
            name = "Intercept",
            onCooldown = false,
        },
        [18499] = {
            name = "Berserker Rage",
            onCooldown = false,
        },
        [6552] = {
            name = "Pummel",
            onCooldown = false,
        },
        [23920] = {
            name = "Spell Reflection",
            onCooldown = false,
        },
        [3411] = {
            name = "Intervene",
            onCooldown = false,
        },
        [64382] = {
            name = "Shattering Throw",
            onCooldown = false,
        },
        [55694] = {
            name = "Enraged Regeneration",
            onCooldown = false,
        },
        [57755] = {
            name = "Heroic Throw",
            onCooldown = false,
        },
        [107574] = {
            name = "Avatar",
            onCooldown = false,
        },
        [1719] = {
            name = "Recklessness",
            onCooldown = false,
        },
        [152277] = {
            name = "Ravager",
            onCooldown = false,
        },
        [384318] = {
            name = "Thunderous Roar",
            onCooldown = false,
        },
       
    }
elseif class == "WARLOCK" then
    spellCooldowns = {


        -- WARLOCK SPELLS --


        [6229] = {
            name = "Shadow Ward",
            onCooldown = false,
        },
        [5484] = {
            name = "Howl of Terror",
            onCooldown = false,
        },
        [6789] = {
            name = "Death Coil",
            onCooldown = false,
        },
        [1122] = {
            name = "Inferno",
            onCooldown = false,
        },
        [603] = {
            name = "Curse of Doom",
            onCooldown = false,
        },
        [54785] = {
            name = "Demon Charge",
            onCooldown = false,
        },
        [50589] = {
            name = "Immolation Aura",
            onCooldown = false,
        },
        [29858] = {
            name = "Soulshatter",
            onCooldown = false,
        },
        [29893] = {
            name = "Ritual of Souls",
            onCooldown = false,
        },
        [47897] = {
            name = "Shadowflame",
            onCooldown = false,
        },
        [48020] = {
            name = "Demonic Circle: Teleport",
            onCooldown = false,
        },
        [6789] = {
            name = "Mortal Coil",
            onCooldown = false,
        },
        [30283] = {
            name = "Shadowfury",
            onCooldown = false,
        },
        [104773] = {
            name = "Unedning Resolve",
            onCooldown = false,
        },
        [205179] = {
            name = "Phantom Singularity",
            onCooldown = false,
        },
        [386997] = {
            name = "Soul Rot",
            onCooldown = false,
        },
        [386951] = {
            name = "Soul Swap",
            onCooldown = false,
        },
        [205180] = {
            name = "Summon Darkglare",
            onCooldown = false,
        },
        [267211   ] = {
            name = "Bilescourge Bombers",
            onCooldown = false,
        },
        [111898] = {
            name = "Grimoire: Felguard",
            onCooldown = false,
        },
        [386833] = {
            name = "DGuillotine",
            onCooldown = false,
        },
        [264130] = {
            name = "Power Siphon",
            onCooldown = false,
        },
        
       
    }
elseif class == "DEATH KNIGHT" then
    spellCooldowns = {


        -- DK SPELLS --


        [49576] = {
            name = "Death Grip",
            onCooldown = false,
        },
        [46584] = {
            name = "Raise Dead",
            onCooldown = false,
        },
        [47476] = {
            name = "Strangulate",
            onCooldown = false,
        },
        [43265] = {
            name = "Death and Decay",
            onCooldown = false,
        },
        [48792] = {
            name = "Icebound Fortitude",
            onCooldown = false,
        },
        [45529] = {
            name = "Blood Tap",
            onCooldown = false,
        },
        [48743] = {
            name = "Death Pact",
            onCooldown = false,
        },
        [48707] = {
            name = "Anti-Magic Shell",
            onCooldown = false,
        },
        [61999] = {
            name = "Raise Ally",
            onCooldown = false,
        },
        [42650] = {
            name = "Army of the Dead",
            onCooldown = false,
        },
        [48265] = {
            name = "Death's Advance",
            onCooldown = false,
        },
        [49039] = {
            name = "Lichbone",
            onCooldown = false,
        },
        [63560] = {
            name = "Dark Transformation",
            onCooldown = false,
        },
        [194844] = {
            name = "Bonestorm",
            onCooldown = false,
        },
        [219809] = {
            name = "Tombstone",
            onCooldown = false,
        },
        [55233] = {
            name = "Vampiric Blood",
            onCooldown = false,
        },
        [152279] = {
            name = "Breath of Sindragosa",
            onCooldown = false,
        },
        
       
    }



end


local function Speech(text)
    C_VoiceChat.SpeakText(2, text, Enum.VoiceTtsDestination.QueuedLocalPlayback, 0, 100)
end

-- Function to check individual spell cooldowns and play sound
local function CheckSpellCooldown(spellID)
    local info = spellCooldowns[spellID]

    if info then
        local spellCooldownInfo = C_Spell.GetSpellCooldown(spellID)

        if spellCooldownInfo and spellCooldownInfo.startTime > 0 and spellCooldownInfo.duration >= 2 then
            -- Spell is on cooldown
            info.onCooldown = true
            info.exptime = spellCooldownInfo.startTime + spellCooldownInfo.duration
        elseif info.exptime and info.exptime < GetTime() and info.onCooldown then
            Speech(info.name .. " ready")
            info.onCooldown = false
        end
    end
end

-- Function to check all spell cooldowns
local function CheckAllSpellCooldowns()
    for spellID, _ in pairs(spellCooldowns) do
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

-- Event handler for spell casting
local function OnSpellCast(_, _, _, _, _, _, _, _, _, spellID)
    if spellCooldowns[spellID] then
        CheckSpellCooldown(spellID)
    end
end

-- Register for the COMBAT_LOG_EVENT_UNFILTERED event to detect spell casting
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
eventFrame:SetScript("OnEvent", OnSpellCast)

-- Register for the UNIT_SPELLCAST_SUCCEEDED event to detect spell casting
eventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
eventFrame:SetScript("OnEvent", OnSpellCast)

-- Call CheckAllSpellCooldowns when the addon is loaded
CheckAllSpellCooldowns()

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    for spellID, info in pairs(spellCooldowns) do
        local spellInfo = C_Spell.GetSpellInfo(spellID)
        if spellInfo then
            -- Update the name in the spellCooldowns table with the spell's localized name
            spellCooldowns[spellID].name = spellInfo.name
        else
            print("Spell ID " .. spellID .. "( " .. info.name .. " ) not found.")
        end
    end

    -- Play the login announcement sound when the player logs in
    Speech("Vocal Cooldowns enabled")

    -- Delay for 5 seconds
    C_Timer.After(5, function()
        -- Get the player's class
        local class = select(2, UnitClass("player"))

        -- Print messages in chat with color codes
        local whiteColor = "|cffffffff"
        local mintColor = '|cff00ffcc'
        local redColor = "|cffff0000"
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "Vocal Cooldowns: " .. whiteColor .. "Enabled")
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "Class Detected: " .. whiteColor .. class)
    end)

    local timer = C_Timer.NewTicker(1, CheckAllSpellCooldowns)
end)