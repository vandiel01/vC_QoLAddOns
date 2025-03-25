
local vC_AppName, vC_App = ...

vC_AppTitle = "|c"..RAID_CLASS_COLORS[select(2,UnitClass("player"))].colorStr..strsub(C_AddOns.GetAddOnMetadata("vC_QoLAddOns", "Title"),1).."|r"
vC_AppVersion = C_AddOns.GetAddOnMetadata("vC_QoLAddOns", "Version")
vC_AppNotes = C_AddOns.GetAddOnMetadata("vC_QoLAddOns", "Notes")
-------------------------------------------------------
-- All Kinds of Hard Code without needing to Query Server for Info
-------------------------------------------------------
vC_VanQoL = "Van's Custom Quality of Life"

vC_Yes_Icon = "|TInterface\\RAIDFRAME\\ReadyCheck-Ready"	-- 136814
vC_No_Icon = "|TInterface\\RAIDFRAME\\ReadyCheck-NotReady" -- 136813
vC_Waiting_Icon = 136815
-------------------------------------------------------
-- AllTheThings Origial Main List
-------------------------------------------------------
vC_AllTheThings_Main_List = {
	"Dungeons & Raids",
	"Outdoor Zones",
	"World Drop",
	"Group Finder",
	"Achievements", -- Now a Dynamic Listing (Marked in Orange)
	"Expansion Features",
	"Holiday",
	"World Event",
	"Promotion",
	"Pet Battles",
	"PvP",
	"Crafted Item",
	"Professions",
	"Secrets",
	"Character",
	"In-Game Shop",
	"Trading Post",
	"Black Market Auction House",
	-- "Factions", -- Removed From ATT 12/13/2023
}
-------------------------------------------------------
-- Custom output to Display from ATT List
-------------------------------------------------------
vC_AllTheThings_Keyword = {						-- May need revision
	"Memory of Scholomance",
	"Tier 3 Sets",
	"Looking For Raid",
	"Looking For Raid / Normal / Heroic",
	"Looking For Raid / Normal / Heroic / Mythic",
	"Normal",
	"Heroic",
	"Mythic",
	"Normal / Heroic",
	"Normal / Heroic / Mythic",
	"Heroic / Mythic",
	"10 Player",
	"10 Player (Heroic)",
	"25 Player",
	"25 Player (Heroic)",
}
-------------------------------------------------------
-- Custom Expansion List
-------------------------------------------------------
vC_Expansions_List = {
	"All Expansions",
	"Classic",
	"Burning Crusade",
	"Wrath of the Lich King",
	"Cataclysm",
	"Mist of Pandaria",
	"Warlords of Draenor",
	"Legion",
	"Battle of Azeroth",
	"Shadowlands",
	"Dragonflight",
	"The War Within",
}
vC_Menu_Top = {
	"Daily, Weekly & WQ",			-- Show Weekly Emissary/World Boss, Item, Resource, Reputation, Gold, PvP,  (Name, Reward, Loc)
	"ATT Quick C&P",						-- Good O'le Copy/Paste from ATT
	"Quest Checker",						-- Quest Checker
	"Misc",						-- Fonts, Background, Chat Fade, Randomize Hearthstone, Close Talking Head, Unlock Lockbox Auto, Auto Mail Certain Items, Coord/XY, CVars (Various of WOW Settings)
}
vC_Menu_Bot = {
	{ -- Emissary/Callings/World Boss/Rares
		"World Boss",			-- Display Current World Boss
		"Emissary",						-- Display Current Emissary/Callings
		"Rares",						-- Display All Missing Xmog from Rares
		"-",
		"Events",						-- Display Any Events
		"-",
		"WQ - Gold",
		"WQ - Currency",
		"WQ - Reputation",
		"WQ - Gear/Items",
		"WQ - Pet Battles",
		"WQ - PvP",
	},
	{ -- ATT Quick C&P
		"Display Label?",		-- Display Label?
		"-",
		"Percent %",			-- Number Display?
		"Remaining ##",
		"Remaining #/#",
		"-",
		"ATT Main %",			-- Main List
		"Dung & Raid %",
		"Both List %",
		"-",
		"Main & Sub",			-- How Deep in the Rabbit Hole You Wanna Go?
		"Main, Sub & Difficulty",
	},
	{ -- Quest Checker, Not Sure How to implement this?
		"WQ Reminder",
		"Quest Reminder",
		"-",
		"Check Quest",
		"=",
		"-",
		"Check Storyline",
		"=",
		"-",
		"Compare Quest ID",
		"Toons Last Logged?",
	},
	{ -- Whatever Else Put it here....
		"Auto Repair Gear",			-- GBank First if allowed and isGuild, it not then Personal & Have Gold
		"'All' in Merchant",
		"Simple iL Display",
		"Quiet the Talking Head",
		"Map Location & XY",
		"Marking Bar",				-- Only Shows When in Leader in Group/Raid
		"Show Choice Box",			-- Testing Window To Display Fonts, BG and Border Options
		"Show Test Box",

		--"CVars",
		--"Keybinding",
		--"Clear All Achivs",
		--"Fill Dragonriding Tree",
		--"Do the Order (DF Prof)",
		--"AH Price Checker",
		--"Unlock & Mail All Box",	-- Rogue Only
		--"Top Bar with Info",
		--"Mini Currency/Rep",
		--"Auto-Mail PB Currency",
		--"Show Addon Usage",
		--"Random Hearthstone!",
		--"Send Gold To Hoarder!",
		--"Show AH Sales",
		--"Spec AddOns for AH Char",
		--"Simpify Chatbox",
		--"Show Class Wear/Equip",
	},
}
-------------------------------------------------------
-- ClassType, Wep ID, Armor ID and Profession By ID
-- Use API GetItemInfo to check
-------------------------------------------------------
vC_Remix_Gem_Stat = {
	{ 1, 629522, "5BAEE1", "Critical Strike", },
	{ 2, 629527, "F4DF59", "Haste", },
	{ 3, 629525, "C251EC", "Mastery", },
	{ 4, 134098, "D2DBDC", "Versatility", },
	{ 5, 629526, "870509", "Leech", },
	{ 6, 629524, "FB9D6F", "Speed", },
	{ 7, 237369, "C2B9F2", "Armor", },
}
vC_Class_Data = {
	{ 1, "C69B6D", "Warrior",		"classicon-warrior",		{ 4,5,6 },	{ 0,1,2,3,4,5,6,7,8,10,13,14,15,18,20, }, },
	{ 2, "F48CBA", "Paladin",		"classicon-paladin",		{ 4,5,6 },	{ 0,1,4,5,6,7,8,14,20, }, },
	{ 3, "AAD372", "Hunter",		"classicon-hunter",			{ 3,5 },	{ 0,1,2,3,6,7,8,10,13,14,15,18,20, }, },
	{ 4, "FFF468", "Rogue",			"classicon-rogue",			{ 2,5 },	{ 0,2,3,4,7,13,14,15,18,20, }, },
	{ 5, "FFFFFF", "Priest",		"classicon-priest",			{ 1,5 },	{ 4,10,14,15,19,20, }, },
	{ 6, "C41E3A", "Death Knight",	"classicon-deathknight",	{ 4,5 },	{ 0,1,4,5,6,7,8,14,20, }, },
	{ 7, "0070DD", "Shaman",		"classicon-shaman",			{ 3,5,6 },	{ 0,1,4,5,10,13,14,15,20, }, },
	{ 8, "3FC7EB", "Mage",			"classicon-mage",			{ 1,5 },	{ 7,10,14,15,19,20, }, },
	{ 9, "8788EE", "Warlock",		"classicon-warlock",		{ 1,5 },	{ 7,10,14,15,19,20, }, },
	{ 10, "00FF98", "Monk",			"classicon-monk",			{ 2,5 },	{ 0,4,6,7,10,13,14,20, }, },
	{ 11, "E26B0A", "Druid",		"classicon-druid",			{ 2,5 },	{ 4,5,6,10,13,14,15,20, }, },
	{ 12, "A330C9", "Demon Hunter", "classicon-demonhunter",	{ 2,5 },	{ 0,7,9,13,14,20, }, },
	{ 13, "33937F", "Evoker", 		"classicon-evoker",			{ 3,5 },	{ 0,1,4,5,7,8,10,13,15,20, }, },
}
vC_Talent = {
	-- Class ID, Spec ID, (1 Critical Strike, 2 Haste, 3 Mastery, 4 Versatility, 5 Leech, 6 Speed, 9 None), Talent Import
	--{ 01, 0071, 1,2,4, "BcEAAAAAAAAAAAAAAAAAAAAAAAQplIRkQOQiWpkkAAAAABRIKkEUEBkISSoJRIABhAAAAAAAAQiWiIgQ0QA", },				-- Warrior Arms*
	{ 01, 0072, 2,3,1, "CgEAmidFBOBFf5oKuZ7r/WeW7MAAAAAAAAAAagZGghZYWGMzCMMjxwMMzsZmxMjlhZMjxMDLDzMzYGAAAIMAAAAAwyA", },		-- Warrior Fury
	--{ 01, 0073, 2,1,4, "BkEAAAAAAAAAAAAAAAAAAAAAAIkEAAAAIJJRSCSLpkkkSBRgEkIRJJBICJBNkkgAECAAAAAAAEBAooBAC", },				-- Warrior Protection*
	
	--{ 02, 0065, 1,2,3, "BEEAAAAAAAAAAAAAAAAAAAAAAAAAAQAARAAACQLJFoUik0ahUSClkEKaiGQSJJIJEpgmkIAgAAFgQSCC", },					-- Paladin Holy*
	--{ 02, 0066, 2,1,4, "BIEAomTTpSA9oX6huYLb5nP3r3SaJkiocAtkkUKtkkIRgEAAgAAAAAAAAIRSSRgkQSaoQCAICIACIAA", },					-- Paladin Protection
	{ 02, 0070, 2,4,1, "CYEAE74QAafj6bdTrgpLZS4VlDAAAwAAMtZbbmZbZZmxyMzssMWGAAAAAAGTegmZYAzMzYWGDzMwsNjtxMYwglFAAAAAAAAA", },	-- Paladin Retribution
	
	{ 03, 0253, 2,1,4, "C0PAFBU0uAhOaNI6RqWjIx917BAAAAAAAAAAAgBAAAAAAYYMMzMzYmZGGzMmZYGjZYixMjhZmZMjZYYMzMzAzsMDWA", },	-- **Hunter Beast Mastery
	--{ 03, 0254, 1,2,3, "B4PAAAAAAAAAAAAAAAAAAAAAA4ABaBgkCCCAAAAQkkQSSgIkk0Ep1kQUkimQiEkIoBAAAAA", },				-- Hunter Marksmanship*
	--{ 03, 0255, 2,1,5, "B8PAAAAAAAAAAAAAAAAAAAAAA4ABaBJEKBBJJJplkgDQkEkIAAAAAQEpUkiGkIhESoAAAAAA", },				-- Hunter Survival*
	
	--{ 04, 0259, 3,1,2, "BMQAAAAAAAAAAAAAAAAAAAAAAEJJhkEEAAAAAASJJSLJAAAAAAgWSCSgkkSaJREEJJJRSTJSAA", },				-- Rogue Assassination*
	{ 04, 0260, 1,4,2, "CQQA27SZpS4XnmFfcXRqkppuwDAMWmBMDzMzMjZGmZmZmBmZmWgtZAAAAAAY22mZmxMzMzGzsMGAAAAmZGAAAAAAA", },	-- Rogue Outlaw
	--{ 04, 0261, 3,4,1, "BUQAAAAAAAAAAAAAAAAAAAAAAAAEEAAAAAASJJJlEQKFkICJJJJRi0SJJJaJJSSCgSaBAAAgEEA", },			-- Rogue Subtlety*
	
	--{ 05, 0256, 2,1,4, "BAQAAAAAAAAAAAAAAAAAAAAAAAAapFRItISCJkSSSSIBAAAAAAAAAAAFl0Og0SCkChgIki0SEBlIA", },			-- Priest Discipline*
	--{ 05, 0257, 1,3,2, "BEQAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAaBtkkkEJkWEJBlEKBAAAAUUSL0SSQKESSigSBSESBA", },			-- Priest Holy*
	{ 05, 0258, 2,3,1, "CIQAJSbRac/22NxZbHdYKOQzcAzYmZAAAAAAAAAAAAAws4BGzMz2gZmZmlxMGMbMzMzMzGDmBDziZbqZGAzMzMAoAMbzyWwsxG", }, -- **Priest Shadow
	
	--{ 06, 0250, 4,1,2, "BoPAAAAAAAAAAAAAAAAAAAAAAACJIIJJJiERkISI4AJJRCAAAAAkIJ5AEJNJiEAAgIJJJAAAA", },				-- Death Knight Blood*
	{ 06, 0251, 1,3,2, "CsPAtbMOTHlnKIwUyAn+DK70SPAMzMMjZGDzYmZmZmxwoZGDDgZGjhZmZmZmZZmBAAAAAAAAAAAAAAAAAgZmZMzA", },		-- Death Knight Frost
	--{ 06, 0252, 2,3,1, "BwPAAAAAAAAAAAAAAAAAAAAAAAAIikEJiERISECJJJRAAAAAAAAAgSSSICAAIJh0SkkkIJA", },				-- Death Knight Unholy*
	
	{ 07, 0262, 3,1,2, "CYQA6DE2ZxOD3n18X41tWLU5RBAAAAAMLzyyAwMLbzMzMzMzMDAAAAAAAAAAAAwYaYMzGzMTjxMzYYzMzYxsNjhZmZmBGD", },		-- Shaman Elemental
	--{ 07, 0263, 2,3,1, "BcQAAAAAAAAAAAAAAAAAAAAAAIRSKRCCJhkk0QJRAAAAAAAAAAAAAKRIJkokioQSTSKAKBJEIB", },				-- Shaman Enhancement*
	--{ 07, 0264, 1,4,2, "BgQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQIRSCJlkSSQUSLKJpEESJJAg0OQCKJCSSkEI", },				-- Shaman Restoration*
	
	--{ 08, 0062, 3,2,1, "B4DAAAAAAAAAAAAAAAAAAAAAAQEUSDJSkigIJERSIRgkkQSLJAAAAAAAAAAAgIJJJkkkcggA", },				-- Mage Arcane*
	{ 08, 0063, 2,1,4, "C8DArhxZfsv/vllYUrQS3iw2nbGbmtZDzYGziBGzYaMzYGAAAAAAGAAAAAgZmZMDjZMsY2mxMzMbmZbGLjFAAAAAAAA", },		-- Mage Fire
	--{ 08, 0064, 3,1,2, "BAEAAAAAAAAAAAAAAAAAAAAAAQEUSDJSkigcgkQERkEAAASJhESSSSIJJJJJBAAAAAAAAAiA", },				-- Mage Frost*
	
	--{ 09, 0256, 2,3,1, "BkQAAAAAAAAAAAAAAAAAAAAAAASSSkkAppQkWSSIlAAAAANAAAAAAASENSSkIJJaJRAAJA", },					-- Warlock Affliction*
	--{ 09, 0266, 4,2,1, "BoQAAAAAAAAAAAAAAAAAAAAAAAIJRSCkmCRaJJh0CAAAAAQgIJpERkkIpkWSkQAAAAAAQSC", },				-- Warlock Demonology*
	{ 09, 0267, 2,3,1, "CsQAA81jxQD71lYhS/t8p6HgAYxYmZGzQgZMmNzMzwmFDzMzsYWYbZmZAAAAgxMzsNzMzAAAAAAYAAAAAAAMMMGAA", },		-- Warlock Destruction
	
	--{ 10, 0268, 4,1,5, "BwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAIFalkkAJJlWEAAAgUSUSiEJ0KkolkUSQo1ISLtSIA", },			-- Monk Brewmaster*
	--{ 10, 0270, 2,1,6, "B4QAAAAAAAAAAAAAAAAAAAAAAUiCSkoUaNCpEJJlAt0aBAAAAAAAAAAAAk0SSBhkElCQk0SkEAAEaE", },			-- Monk Mistweaver*
	{ 10, 0269, 1,4,2, "C0QAUXY49giSj4C5Wpk6qnLyQYGzMYmZY2mxgZGAAAAAAAAAAAYZZYEzMzGzwwyYYZmZmxsgZYWMBAw2MzwMzYWmBAAAAAAA", },	-- Monk Windwalker
	
	{ 11, 0102, 3,2,1, "CYGAqvgeoHLefPLb/Pa8nkKXDBAAAAAAAAAAAAAAAAAA2oYmZmhxYGwMzYmxsALDLmZmlZGmZmxwyMLjZMzYDsAgBAAAAAAAgZGG", },	-- Druid Balance
	--{ 11, 0103, 1,3,2, "BcGAAAAAAAAAAAAAAAAAAAAAAAAAAAAACSLSCSSSSJtIIJJHIJAAAAAAKAkIAAJJJRSi0Sol4AAAAAAAIBAA", },	-- Druid Feral*
	--{ 11, 0104, 2,4,1, "BgGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQiIJJlElICiiESShCAJCCSgkkkkkIFoFOAAAAAAQEQQCA", },	-- Druid Guardian*
	--{ 11, 0105, 2,1,3, "BkGAAAAAAAAAAAAAAAAAAAAAA0ikElWISKS5AIkUopFJBAAAAAAAAAAAAKASiggEAJhkIFSaJCAAAAAICAAiA", },	-- Druid Restoration*
	
	{ 12, 0577, 1,3,2, "CEkAEDLOxe3SEPP2R8Hw6bhoSYGMzMzMjZmZmxMhxAAAAAAAmtxYbGmZsYmZDLzMzMzMLDLLAAAAGjZA", },		-- Demon Hunter Havoc
	--{ 12, 0581, 3,4,1, "BUkAAAAAAAAAAAAAAAAAAAAAAAAiIJJikgkERISJJkolIRiESSkEtIhEEAAAAQSSA", },						-- Demon Hunter Vengeance*
	
	{ 13, 1467, 1,2,4, "CsbBWYnbRY1EREkP8a0IbB+ZHAAAAAAAAAAAAzYGMzwMmZGYgxMTzYmJz2MLzwMDzMzyMgZmBmZMzMYGAAAAAAAA", },		-- Evoker Devastation
	--{ 13, 1468, 1,2,3, "BwbBAAAAAAAAAAAAAAAAAAAAAAAAAAAIJpFJJJEkCkWSCBAAJRigISCIBAAAIJJkIJikEAE", },				-- Evoker Preservation*
	--{ 13, 1473, 3,1,2, "BEcBAAAAAAAAAAAAAAAAAAAAAQikWkkQIJpkESSSDAAAAAEAAkEAISIRSCAAAASk0ikkIJQ0SA", },				-- Evoker Augmentation*
}
vC_All_Class_Data = {
	
}
vC_Factions = {
	{ 0, "Alliance", "143A66", },
	{ 1, "Horde", "661111", },
	{ 2, "Neutral", "00C0FF", },
}
vC_Class_Armor = {
	{ 1, "Cloth", },
	{ 2, "Leather", },
	{ 3, "Mail", },
	{ 4, "Plate", },
	{ 5, "Cosmetic", },
	{ 6, "Shields", },
}
vC_Class_Weapon = {
	{ 0, "One-Handed Axes", },
	{ 1, "Two-Handed Axes", },
	{ 2, "Bows", },
	{ 3, "Guns", },
	{ 4, "One-Handed Maces", },
	{ 5, "Two-Handed Maces", },
	{ 6, "Polearms", },
	{ 7, "One-Handed Swords", },
	{ 8, "Two-Handed Swords", },
	{ 9, "Warglaives", },
	{ 10, "Staves", },
	--{ 11, "Bear Claws", },		-- Not Used
	--{ 12, "CatClaws", },			-- Not Used
	{ 13, "Fist Weapons", },	
	{ 14, "Miscellaneous", },		-- Off Hand?
	{ 15, "Daggers", },
	--{ 16, "Thrown", },			-- Not Used
	--{ 17, "Spears", },			-- Not Used
	{ 18, "Crossbows", },
	{ 19, "Wands", },
	{ 20, "Fishing Poles", },
}
vC_Races = {
	{ 01, 0, "Human", },
	{ 02, 1, "Orc", },
	{ 03, 0, "Dwarf", },
	{ 04, 0, "Night Elf", },
	{ 05, 1, "Undead", },
	{ 06, 1, "Tauren", },
	{ 07, 0, "Gnome", },
	{ 08, 1, "Troll", },
	{ 09, 1, "Goblin", },
	{ 10, 1, "Blood Elf", },
	{ 11, 0, "Draenei", },
	{ 22, 0, "Worgen", },
	{ 24, 2, "Pandaren", },
	{ 25, 0, "Pandaren", },
	{ 25, 1, "Pandaren", },
	{ 27, 1, "Nightborne", },
	{ 28, 1, "Highmountain Tauren", },
	{ 29, 0, "Void Elf", },
	{ 30, 0, "Lightforged Draenei", },
	{ 31, 1, "Zandalari Troll", },
	{ 32, 0, "Kul Tiran", },
	{ 34, 0, "Dark Iron Dwarf", },
	{ 35, 1, "Vulpera", },
	{ 36, 1, "Mag'har Orc", },
	{ 37, 0, "Mechagnome", },
	{ 52, 0, "Dracthyr", },
	{ 70, 1, "Dracthyr", },
}
vC_UnitClassification = {
	{ 1, "World Boss", },
	{ 2, "Rare Elite", },
	{ 3, "Elite", },
	{ 4, "Rare", },
	{ 5, "Normal", },
	{ 6, "Trivial", },
	{ 6, "Minus", },
}
vC_Reputation =  {
    { 1, -42000, "Hated", "CC2222", },
    { 2, -6000, "Hostile", "FF0000", },
    { 3, -3000, "Unfriendly", "EE6622", },
    { 4, 0, "Neutral", "FFFF00", },
    { 5, 3000, "Friendly", "00FF00", },
    { 6, 9000, "Honored", "00FF88", },
    { 7, 21000, "Revered", "00FFCC", },
    { 8, 42000, "Exalted", "00FFFF", },
}
-------------------------------------------------------
-- Currency
-------------------------------------------------------
vC_SL_SanctumBldg = {
	{ 1000, 1, 5000, 8, 10000, 22, }, -- Transport Network
	{ 1000, 1, 5000, 8, 10000, 22, }, -- Anima Conductor
	{ 1000, 1, 5000, 8, 10000, 22, }, -- Command Table
	{ 1500, 6, 5000, 12, 10000, 22, 12500, 40, 15000, 70, }, -- Abom Factory, Garden, Ember Court, Path of Ascension
}
vC_Shadowlands_AnimaID = {						-- Shadowlands Anima(s)
	181368, 181377, 181477, 181478, 181479, 181540, 181541, 181544, 181545, 181546,
	181547, 181548, 181549, 181550, 181551, 181552, 181621, 181622, 181642, 181643,
	181644, 181645, 181646, 181647, 181648, 181649, 181650, 181743, 181744, 181745,
	182749, 183723, 183727, 184146, 184147, 184148, 184149, 184150, 184151, 184152,
	184286, 184293, 184294, 184305, 184306, 184307, 184315, 184360, 184362, 184363,
	184371, 184373, 184374, 184378, 184379, 184380, 184381, 184382, 184383, 184384,
	184385, 184386, 184387, 184388, 184389, 184519, 184763, 184764, 184765, 184766,
	184767, 184768, 184769, 184770, 184771, 184772, 184773, 184774, 184775, 184776,
	184777, 186200, 186201, 186202, 186204, 186205, 186206, 187175, 187347, 187349,
	187517, 188003, 188004, 189544, 189864, 189865, 188198
}
vC_Current_Currency = {
	1166,						-- Timewarped Badge (Any Expansion)
	515,						-- Darkmoon Prize Ticket (Any Expansion)
	2588,						-- Riders of Azeroth Badge (Any Expansion)
	2123,						-- Bloody Tokens
	1602,						-- Conquest
	1792,						-- Honor
}
vC_Currency_By_Expansion = {
	{ 						-- Classic (None)
	},
	{ 						-- Burning Crusade
		1704,						-- Spirit Shard
	},
	{ 						-- Wrath of the Lich King
		241,						-- Champion's Seal
		61,							-- Dalaran Jewelcrafter's Token
	},
	{ 						-- Cataclysm
		615,						-- Essence of Corrupted Deathwing
		416,						-- Mark of the World Tree
		614,						-- Mote of Darkness
		391,						-- Tol Barad Commedation (PvP)
	},
	{ 						-- Mist of Pandaria
		697,						-- Elder Charm of Good Fortune
		738,						-- Lesser Charm of Good Fortune
		777,						-- Timeless Coin
		752,						-- Mogu Rune of Fate (MoP Bonus Roll)
		776,						-- Warforged Seal (MoP Bonus Roll)
		81,							-- Epicurean's Award (Cooking)
		402,						-- Ironpaw Tokens (Cooking)
		789,						-- Bloody Coin (PvP)
	},
	{ 						-- Warlords of Draenor
		823,						-- Apexis Crystal
		944,						-- Artifact Fragment
		824,						-- Garrison Resources
		1101,						-- Oil
		1129,						-- Seal of Inevitable Fate (WoD Bonus Roll)
		994,						-- Seal of Tempered Fate (WoD Bonus Roll)
	},
	{ 						-- Legion
		1155,						-- Ancient Manapearl
		1275,						-- Curious Coin
		1342,						-- Legionfall War Supplies
		1314,						-- Lingering Soul Fragment
		1226,						-- Nethershard
		1220,						-- Order Resources
		1533,						-- Wakening Essence
		1149,						-- Sightless Eye
		1533,						-- Wakening Essence
		1273,						-- Seal of Broken Fate (Legion Bonus Roll)
	},
	{ 						-- Battle of Azeroth
		1717,						-- 7th Legion Service Medallion
		1600,						-- Honorbound Service Medallion
		1755,						-- Coalescing Visions
		1719,						-- Corrupted Mementos
		1803,						-- Echoes of Ny'alotha
		1721,						-- Prismatic Manapearl
		1710,						-- Seafarer's Dubloon
		1718,						-- Titan Residuum (Need Check)
		1560,						-- War Resources
		1580,						-- Seal of Wartorn Fate (BfA Bonus Roll)
		1299,						-- Brawler's Gold (BfA, 3rd Season)
	},
	{ 						-- Shadowlands
		{ 1931, "Cataloged Research", },
		--{ 2009, "Cosmic Flux", },
		{ 1979,	"Cyphers of the First Ones", },
		{ 1885, "Grateful Offering", },
		--{ 1820, "Infused Ruby", }, -- Max 100
		--{ 1813, "Reservoir Anima", },
		--{ 1816, "Sinstone Fragments", },
		--{ 1828, "Soul Ash", },
		{ 1906, "Soul Cinders", },
		{ 1767, "Stygia", },
		--{ 1977, "Stygian Ember", },
		--{ 1904, "Tower Knowledge", },
		{ 1810, "Redeemed Soul", },
		--{ 1889, "Adventure Campaign Progress", },
		--{ 1819, "Medallion of Service", },
	},
	{ 						-- Dragonflight
		2003,						-- Dragon Isles Supplies
		2707,						-- Drake's Dreaming Crest
		2777,						-- Dream Infusion
		2118,						-- Elemental Overflow
		2650,						-- Emerald Dewdrop
		2245,						-- Fligthstones
		2657,						-- Mysterious Fragments
		2594,						-- Paracasual Flakes
		2122,						-- Storm Sigil
		2706,						-- Whelping's Dreaming Crest
	},
}
-------------------------------------------------------
-- Zone ID
-------------------------------------------------------
vC_GetMapInfo_mapType = {						-- Starts at 0
	"Cosmic",
	"World",
	"Continent",
	"Zone",
	"Dungeon",
	"Micro",
	"Orphan",
}
vC_ZoneID = {
	{ -- Classic
		12,						-- Kalimdor
			57,						-- Teldrassil
						89,			-- Darnassus (Alliance)
						460,		-- Shadowglen (Night Elf)
						-- Unknown	-- Remains of Darnassus
			62,						-- Darkshore
			83,						-- Winterspring
			80,						-- Moonglade
			77,						-- Felwood
			63,						-- Ashenvale
			76,						-- Azshara
			1,						-- Durotar
						85,			-- Orgrimmar (Horde)
						463,			-- Echo Isles (Troll)
						461,			-- Valley of Trials (Orc)
			10,						-- Northern Barrens
			65,						-- Stonetalon Mountains
			66,						-- Desolace
			7,						-- Mulgore
						88,			-- Thunder Bluff (Horde)
						462,		-- Camp Narcache (Tauren)
			199,					-- Southern Barrens
			70,						-- Dustwallow Marsh
			64,						-- Thousand Needles
			69,						-- Feralas
			81,						-- Silithus
			327,					-- Ahn'Qiraj: The Fallen Kingdom
			71,						-- Tanaris
			78,						-- Un'Goro Crater
		13,						-- Eastern Kingdom
			407,					-- Darkmoon Faire
			14,						-- Arathi Highlands
			26,						-- The Hinterlands
			23,						-- Eastern Plaguelands
			22,						-- Western Plaguelands
			18,						-- Tirisfal Glades
						90,				-- Undercity (Horde)
						465,			-- Deathknell (Undead)
			21,						-- Silverpine Forest
			217,						-- Ruins of Gilneas (Alliance)
			25,						-- Hillsbrad Foothills
			56,						-- Wetlands
			48,						-- Loch Modan
			27,						-- Dun Morogh
						87,				-- Ironforge (Alliance)
						469,			-- New Tinkertown (Gnome)
						427,			-- Coldridge Valley (Dwarf)
			15,						-- Badlands
			32,						-- Searing Gorge
			36,						-- Burning Steppes
			49,						-- Redridge Mountains
			37,						-- Elwynn Forest
						84,				-- Stormwind (Alliance)
						425,			-- Northshire (Human)
			52,						-- Westfall
			47,						-- Duskwood
			51,						-- Swamp of Sorrows
			17,						-- Blasted Lands
			42,						-- Deadwind Pass
			224,					-- Stranglethorn Vale
						50,			-- Northern Stranglethorn
						210,		-- The Cape of Stranglethorn
	},
	{ -- Burning Crusade
		106,					-- Bloodmyst Isle
		97,						-- Azuremyst Isle
			103,					-- Exodar (Alliance)
			468,					-- Ammen Vale (Draenai)
		95,						-- Ghostlands
		94,						-- Eversong Woods
			110,					-- Silvermoon City (Horde)
			467,					-- Sunstrider Isle (Blood Elf)
		101,					-- Outland (Main Zone)
		108,						-- Terokkar Forest		
			111,						-- Shrattah City (City)
		100,						-- Hellfire Peninsula
		102,						-- Zangarmarsh
		104,						-- Shadowmoon Valley
		107,						-- Nagrand
		105,						-- Blade's Edge Mountains
		109,						-- Netherstorm
		122,						-- Isle of Quel'Danas
	},
	{ -- Wrath of the Lich King
		113,					-- Northrend (Main Zone)
		127,						-- Crystalsong Forest		
			125,						-- Dalaran (City)
		114,						-- Borean Tundra
		115,						-- Dragonblight
		116,						-- Grizzly Hills
		117,						-- Howling Fjord
		118,						-- Icecrown
			--???,						--Acherus: The Ebon Hold (Death Knight)
		119,						-- Sholazar Basin
		120,						-- The Storm Peaks
		121,						-- Zul'Drak
		123,						-- Wintergrasp
	},
	{ -- Cataclysm
		948,					-- The Maelstrom
			194,					-- Kezan (Goblin)
			174,					-- The Lost Isles (Goblin)
		179,					-- Gilneas
			181,					-- Greymane Manor (Gilneas)
			202,		 			-- Gilneas City (Worgen)
		241,					-- Twilight Highlands
		245,					-- Tol Barad Peninsula
		244,						-- Tol Barad
		198,					-- Mount Hyjal
		249,					-- Uldum
		203,					-- Vashj'ir
			201,					-- Kelp'thar Forest
			205,					-- Shimmering Expanse
			204,					-- Abyssal Depths
		948,					-- The Maelstrom
			207,					-- Deepholm
	},
	{ -- Mist of Pandaria
		424,					-- Pandaria
		378,						-- The Wandering Isle (Panda)
		390,						-- Vale of Eternal Blossoms
		376,						-- Valley of the Four Winds
		371,						-- The Jade Forest
		379,						-- Kun-Lai Summit
		388,						-- Townlong Steppes
		422,						-- Dread Wastes
		418,						-- Krasarang Wilds
		504,					-- Isle of Thunder
		507,					-- Isle of Giants
		554,					-- Timeless Isle
	},
	{ -- Warlords of Draenor
		572,					-- Draenor
		588,					-- Ashran
			622,					-- Stormshield (Alliance)
			624,					-- Warspear (Horde)
		539,					-- Shadowmoon Valley
			582,					-- Lunarfall (Alliance)
		525,					-- Frostfire Ridge
			580,					-- Frostwall (Horde)
		542,					-- Spires of Arak
		535,					-- Talador
		550,					-- Nagrand
		543,					-- Gorgrond
		534,					-- Tanaan Jungle
	}, 
	{ -- Legion
		619,					-- Broken Isles (Main Map)
			627, 628, 629,			-- Dalaran (City & Underbelly)
						720,			-- * Mardum, the Shattered Abyss (Demon Hunter)
						702,			-- * Netherlight Temple (Priest)
						734,			-- * Hall of the Guardian (Mage)
						717,			-- * Dreadscar Rift (Warlock)
						715, 747,		-- * Emerald Dreamway/The Dreamgrove (Druid)
						709,			-- * The Wandering Isle (Monk)
						626,			-- * The Hall of Shadows (Rogue)
						739,			-- * Trueshot Lodge (Hunter)
						726,			-- * The Maelstrom (Shaman)
						647, 648,		-- * Acherus: The Ebon Hold (Death Knight)
						24,				-- * Light's Hope Chapel (Paladin)
						695,			-- * Skyhold (Warrior)
			630,					-- Azsuna
			641,					-- Val'sharah
			650, 750,				-- Highmountain\Thunder Totem
			634,					-- Stormheim
			680,					-- Suramar
			646,					-- Broken Shore
		905,					-- Argus
			830,					-- Krokuun
			885,					-- Antoran Wastes
			882,					-- Eredath
	},
	{ -- Battle of Azeroth
		876,					-- Kul Tiras (Alliance)
			1161,					-- Boralus
			895,					-- Tiragarde Sound
			896,					-- Drustvar
			942,					-- Stormsong Valley
		875,					-- Zandalar (Horde)
			1165,					-- Dazar'alor
			862,					-- Zuldazar
			863,					-- Nazmir
			864,					-- Vol'dun        
		1462,					-- Mechagon Island
		1355,					-- Nazjatar
		81,						-- Silithus: The Wound
		62,						-- Darkshore Warfronts
		14,						-- Arathi Highlands Warfronts
		1527,					-- Uldum
		1530,					-- Vale of Eternal Blossoms
	},
	{ -- Shadowlands
		1550,					-- The Shadowlands
		1670, 1671,					-- Oribos (Hub)
		1565,						-- Ardenweald (Night Fae)
		1533,						-- Bastion (Kyrian)
		1525,						-- Revendreth (Venthyr)
		1536,						-- Maldraxxus (Necrolord)
		1543,					-- The Maw
		1961,					-- Korthia
		1970,					-- Zereth Mortis
	},
	{ -- Dragonflight
		1978,					-- Dragon Isles
		2118,						-- The Forbidden Reach (Evoker)
		2022,						-- The Waking Shores
		2023,						-- Ohn'ahran Plains
		2024,						-- The Azure Span
		2025,						-- Thaldraszus
			2112,						-- Valdrakken (Hub)
		2151,						-- The Forbidden Reach
		2133,						-- Zaralek Cavern
		2200,						-- Emerald Dream
		2239,						-- Amirdrassil/Bel'ameth
	},
	{ -- The War Within
		2248,						-- Isle of Dorn
		2214,						-- The Ringing Deeps
		2215,						-- Hallowfall
		2255,						-- Azj-Kahet
		2369,						-- Siren Isle
		2346,						-- Undermine(d)
	},
}
-------------------------------------------------------
-- General Array/Table
-------------------------------------------------------
-- 0 - None, 1 Kyrian, 2 Venthyr, 3 NightFae, 4 Necrolord
vC_Covenant_By_Expansion = {
	{},	-- Classic
	{},	-- Burning Crusade
	{},	-- Wrath of the Lich King
	{},	-- Cataclysm
	{},	-- Mist of Pandaria
	{},	-- Warlords of Draenor
	{}, -- Legion
	{}, -- Battle of Azeroth
	{
		{ 1, "Kyrian", "CovenantChoice-Offering-Sigil-Kyrian", },
		{ 2, "Venthyr", "CovenantChoice-Offering-Sigil-Venthyr", },
		{ 3, "Night Fae", "CovenantChoice-Offering-Sigil-NightFae", },
		{ 4, "Necrolord", "CovenantChoice-Offering-Sigil-Necrolord", },
		{ 5, "None", "CovenantChoice-Celebration-Content-Soulbind", },
	},
	{}, -- Dragonflight
}
vC_Reputation_By_Expansion = {
	{},	-- Classic
	{},	-- Burning Crusade
	{},	-- Wrath of the Lich King
	{},	-- Cataclysm
	{},	-- Mist of Pandaria
	{},	-- Warlords of Draenor
	{}, -- Legion
	{}, -- Battle of Azeroth
	{	-- Shadowlands
		{ 2439, 0, "The Avowed", },
		{ 2478, 0, "The Enlightened", },
		{ 2472, 0, "The Archivists' Codex", },
		{ 2470, 0, "Death's Advance", },
		{ 2432, 0, "Ve'nari", },
		{ 2407, 0, "The Ascended", },				-- 1 Kyrian
		{ 2413, 0, "Court of Harvesters", },		-- 2 Venthyr
			{ 2445, 2, "The Ember Courts", },
				-- Tier 1
				{ 2454, 2, "Choofa", },
				{ 2455, 2, "Cryptkeeper Kassir", },
				{ 2461, 2, "Plague Deviser Marileth", },
				{ 2459, 2, "Sika", },
				-- Tier 2
				{ 2456, 2, "Droman Aliothe", },
				{ 2460, 2, "Stonehead", },
				{ 2457, 2, "Grandmaster Vole", },
				{ 2458, 2, "Kleia and Pelagos", },
				-- Tier 3
				{ 2451, 2, "Hunt Captain Korayn", },
				{ 2453, 2, "Rendle and Cudgelface", },
				{ 2450, 2, "Alexandros Mograine", },
				{ 2452, 2, "Polemarch Adrestes", },
				-- Tier 4
				{ 2447, 2, "Lady Moonberry", },
				{ 2449, 2, "The Countess", },
				{ 2446, 2, "Baroness Vashj", },
				{ 2448, 2, "Mikanikos", },
		{ 2465, 0, "The Wild Hunt", },				-- 3 Night Fae
			{ 2463, 3, "Marasmius", },
			{ 2464, 3, "Court of Night", },
		{ 2410, 0, "The Undying Army", },			-- 4 Necrolord
			{ 2462, 4, "Stitchmasters", },
	}, 
	{}, -- Dragonflight
}
vC_Events = {
	{},	-- Classic (None)
	{},	-- Burning Crusade (None)
	{},	-- Wrath of the Lich King (None)
	{},	-- Cataclysm (None)
	{},	-- Mist of Pandaria (None)
	{},	-- Warlords of Draenor (None)
	{ -- Legion (Any Zones)
		{ 45838, "Assault on Aszuna", "Legion Assault", "Aszuna is", },												-- Aszuna
		{ 45812, "Assault on Val'sharah", "Legion Assault", "Val'sharah is", },										-- Val'sharah
		{ 45840, "Assault on Highmountain", "Legion Assault", "Highmountain is", },									-- Highmountain
		{ 45839, "Assault on Stormheim", "Legion Assault", "Stormheim is", },										-- Stormheim
		{ 49196, "Greater Invasion Point: Pit Lord Vilemus", "Greater Invasion Point", ": Pit Lord Vilemus", },		-- Pit Lord Vilemus
		{ 48620, "Greater Invasion Point: Mistress Alluradel", "Greater Invasion Point", ": Mistress Alluradel", },	-- Mistress Alluradel
		{ 49195, "Greater Invasion Point: Occularus", "Greater Invasion Point", ": Occularus", },					-- Occularus
		{ 49197, "Greater Invasion Point: Sotanathor", "Greater Invasion Point", ": Sotanathor", },					-- Sotanathor
		{ 49199, "Greater Invasion Point: Matron Folnuna", "Greater Invasion Point", ": Matron Folnuna", },			-- Matron Folnuna
		{ 49198, "Greater Invasion Point: Inquisitor Meto", "Greater Invasion Point", ": Inquisitor Meto", },		-- Inquisitor Meto
		{ 48982, "Invasion Point: Aurinor", "Invasion Point", ": Aurinor", },										-- Aurinor
		{ 49099, "Invasion Point: Bonich", "Invasion Point", ": Bonich", },											-- Bonich
		{ 49098, "Invasion Point: Cen'gar", "Invasion Point", ": Cen'gar", },										-- Cen'gar
		{ 49096, "Invasion Point: Naigtal", "Invasion Point", ": Naigtal", },										-- Naigtal
		{ 49097, "Invasion Point: Sangua", "Invasion Point", ": Sangua", },											-- Sangua
		{ 49091, "Invasion Point: Val", "Invasion Point", ": Val", },												-- Val
	},
	{ -- Battle of Azeroth
		-- Alliance
		{ 53711, "A Sound Defense", "Assault", "Tiragarde Sound is under attack by the alliance", },		-- Tiragarde Sound
		{ 51982, "Storm's Rage", "Assault", "xxx is", }, 													-- Stormsong Valley
		{ 53701, "A Drust Cause", "Assault", "xxx is", }, 													-- Drustvar
		{ 54134, "Many Fine Heroes", "Assault", "xxx is", }, 												-- Vol'dun
		{ 54136, "March on the Marsh", "Assault", "xxx is", }, 												-- Nazmir
		{ 54138, "Ritual Rampage", "Assault", "Zuldazar is under attack by the alliance", }, 				-- Zuldazar
		
		-- Horde
		{ 54135, "Romp in the Swamp", "Assault", "Nazmir is under attack by the alliance", },				-- Nazmir		


		{ 52847, "Doom's Howl", },													-- Alliance Warfront: Arathi Highlands
		{ 52848, "The Lion's Roar", },												-- Horde Warfront: Arathi Highlands
		{ 54895, "Ivus the Decayed", },												-- Alliance Warfront: Darkshore
		{ 54896, "Ivus the Forest Lord", },											-- Horde Warfront: Darkshore
						-- Island Expedition
						-- Uldum
						-- Vale of Eternal Blossoms
	},
	{ -- Shadowlands
			-- Covenant Assault (Maw)
		{ 63824, "Kyrian Assault", "Kyrian Assault", "xxx leads the xxx assault", },
		{ 63822, "Venthyr Assault", "Venthyr Assault", "xxx leads the xxx assault", },
		{ 63543, "Necrolord Assault", "Necrolord Assault", "xxx leads the xxx assault", },
		{ 63823, "Night Fae Assault", "Night Fae Assault", "Lord Herne leads the Night Fae assault", },
			-- The Hunt in Maw
		{ 62593, "Hunt: Death Elementals", },
		{ 63180, "Hunt: Shadehounds", },
		{ 63199, "Hunt: Soul Eaters", },
		{ 63194, "Hunt: Winged Soul Eaters", },
	},
	{ -- Dragonflight
			-- Great Vault (Check if reward is available)
		{ 00000, "", "Great Vault", "Rewards are now available", },		-- Reward available to obtain via Vault
		{ 00000, "", "Great Vault", "Defeat bosses in", },					-- Need to do some activity to use Vault
						-- Siege of Dragonbane Keep (Waking Shores)
						-- Maruukai Camp (Ohn'haran Plains)
						-- The Big Dig (The Azure Span)
						-- Time Rift (Thaldrassus)
						-- Superbloom (Dream Emerald)
						-- Tons of Events (Zaralek Cavern)
						-- Researchers Under Fire: (Several Events)
						-- Elemental Spawn (The Forbidden Reach)
						-- Dreamsurge (Random)
						-- Fyrakk Assault (Random)
						-- Elemental Storm (Random)
						-- The Grand Hunt (Random)
						-- Fishing Frenzy (Random)
	},
}
vC_Calling_Emissary = {
	{},		-- Classic (None)
	{},		-- Burning Crusade (None)
	{},		-- Wrath of the Lich King (None)
	{},		-- Cataclysm (None)
	{},		-- Mist of Pandaria (None)
	{},		-- Warlords of Draenor (None)
	{ 	-- Legion
		{ 42420, "Court of Farondis", },
		{ 42422, "The Wardens", },
		{ 42170, "The Dreamweavers", },
		{ 42233, "Highmountain Tribes", },
		{ 42234, "The Valarjar", },
		{ 42421, "The Nightfallen", },
		{ 48639, "Army of the Light", },
		{ 48642, "Argussian Reach", },
		{ 48641, "Armies of Legionfall", },
	},
	{ 	-- Battle of Azeroth
		{ 50562, "Champions of Azeroth", },
		{ 50604, "Tortollan Seekers", },
		{ -- Alliance
			{ 50599, "Proudmoore Admiralty", },
			{ 50600, "Order of Embers", },
			{ 50601, "Storm's Wake", },
			{ 50605, "Alliance War Effort", },
			{ 56119, "The Waveblade Ankoan", },
			-- War Efforts
			{ 53883, "Shores of Zuldazar", }, -- Zuldazar
			{ 00000, "XXX", }, -- Nazmir
			{ 00000, "XXX", }, -- Vol'dun
		},
		{ -- Horde
			{ 50598, "Zandalari Empire", },
			{ 50602, "Talanji's Expedition", },
			{ 50603, "Voldunai", },
			{ 50606, "Horde War Effort", },
			{ 56120, "The Unshackled", },
			-- War Efforts
			{ 00000, "XXX", }, -- Triagarde Sound
			{ 54137, "In Every Dark Corner", }, -- Drustvar
			{ 00000, "XXX", }, -- Stormsong Valley
		},
	},
	{ 	-- Shadowlands
		{ -- Kyrian
			{ 60391, "Aiding Ardenweald", },
			{ 60392, "Aiding Bastion", },
			{ 60395, "Aiding Maldraxxus", },
			{ 60400, "Aiding Revendreth", },
			{ 60403, "Training in Ardenweald", },
			{ 60404, "Training Our Forces", },
			{ 60407, "Training in Maldraxxus", },
			{ 60412, "Training in Revendreth", },
			{ 60424, "A Call to Ardenweald", },
			{ 60425, "Troubles at Home", },
			{ 60430, "A Call to Maldraxxus", },
			{ 60434, "A Call to Revendreth", },
			{ 60439, "Challenges in Ardenweald", },
			{ 60442, "Challenges in Bastion", },
			{ 60447, "Challenges in Maldraxxus", },
			{ 60450, "Challenges in Revendreth", },
			{ 62692, "A Calling in Bastion", },
			{ 60415, "Rare Resources", },
			{ 60454, "Storm the Maw", },
			{ 60458, "Anima Salvage", },
		},
		{ -- Venthyr
			{ 60389, "Aiding Ardenweald", },
			{ 60394, "Aiding Bastion", },
			{ 60397, "Aiding Maldraxxus", },
			{ 60399, "Aiding Revendreth", },
			{ 60401, "Training in Ardenweald", },
			{ 60406, "Training in Bastion", },
			{ 60409, "Training in Maldraxxus", },
			{ 60410, "Training Our Forces", },
			{ 60422, "A Call to Ardenweald", },
			{ 60427, "A Call to Bastion", },
			{ 60431, "A Call to Maldraxxus", },
			{ 60432, "Troubles at Home", },
			{ 60441, "Challenges in Ardenweald", },
			{ 60444, "Challenges in Bastion", },
			{ 60446, "Challenges in Maldraxxus", },
			{ 60448, "Challenges in Revendreth", },
			{ 62691, "A Calling in Revendreth", },
			{ 60417, "Rare Resources", },
			{ 60456, "Storm the Maw", },
			{ 60460, "Anima Salvage", },
		},
		{ -- NightFae
			{ 60381, "Aiding Ardenweald", },
			{ 60382, "Aiding Revendreth", },
			{ 60383, "Aiding Maldraxxus", },
			{ 60384, "Aiding Bastion", },
			{ 60385, "Training in Revendreth", },
			{ 60386, "Training in Maldraxxus", },
			{ 60387, "Training in Bastion", },
			{ 60388, "Training Our Forces", },
			{ 60418, "A Call to Bastion", },
			{ 60419, "Troubles at Home", },
			{ 60420, "A Call to Maldraxxus", },
			{ 60421, "A Call to Revendreth", },
			{ 60435, "Challenges in Revendreth", },
			{ 60436, "Challenges in Maldraxxus", },
			{ 60437, "Challenges in Bastion", },
			{ 60438, "Challenges in Ardenweald", },
			{ 62693, "A Calling in Ardenweald", },
			{ 60414, "Rare Resources", },
			{ 60452, "Storm the Maw", },
			{ 60457, "Anima Salvage", },
		},
		{ -- Necrolord
			{ 60390, "Aiding Ardenweald", },
			{ 60393, "Aiding Bastion", },
			{ 60396, "Aiding Maldraxxus", },
			{ 60398, "Aiding Revendreth", },
			{ 60402, "Training in Ardenweald", },
			{ 60405, "Training in Bastion", },
			{ 60408, "Training Our Forces", },
			{ 60411, "Training in Revendreth", },
			{ 60423, "A Call to Ardenweald", },
			{ 60426, "A Call to Bastion", },
			{ 60429, "Troubles at Home", },
			{ 60433, "A Call to Revendreth", },
			{ 60440, "Challenges in Ardenweald", },
			{ 60443, "Challenges in Bastion", },
			{ 60445, "Challenges in Maldraxxus", },
			{ 60449, "Challenges in Revendreth", },
			{ 62694, "A Calling in Maldraxxus", },
			{ 60416, "Rare Resources", },
			{ 60455, "Storm the Maw", },
			{ 60459, "Anima Salvage", },
		},
	},
	{ 	-- Dragonflight
		{ 70750, "Aiding the Accord", },
		{ 78861, "Aiding the Accord", },
		{ 72374, "Aiding the Accord: Dragonbane Keep", },
		{ 72373, "Aiding the Accord: The Hunt is On", },
		{ 72068, "Aiding the Accord: A Feast For All", },
		{ 78446, "Aiding the Accord: Superbloom", },
		{ 78447, "Aiding the Accord: Emerald Bounty", },
		{ 75859, "Aiding the Accord: Sniffenseeking", },
		{ 75860, "Aiding the Accord: Researchers Under Fire", },
		{ 75861, "Aiding the Accord: Suffusion Camp", },
		{ 77976, "Aiding the Accord: Dreamsurge", },
		{ 77254, "Aiding the Accord: Time Rift", },
		{ 75259, "Aiding the Accord: Zskera Vaults", },
		{ 72375, "Aiding the Accord: The Isles Call", },
	},
}

vC_WorldBoss = {
	-- Exp#, QuestID, CreatureID, EncounterID, Zone, X Coord, Y Coord, Name
	-- Classic (WoW Anniversary)
		{ 1, 47462, 121820, 000, 76, .487, .838, "Azuregos", },
		{ 1, 47461, 121818, 000, 17, .324, .482, "Lord Kazzak", },
		{ 1, 47463, 121913, 000, 47, .465, .397, "Emeriss" },
		{ 1, 47463, 121821, 000, 26, .628, .525, "Lethon", },
		{ 1, 47463, 121911, 000, 63, .938, .408, "Taerar", },
		{ 1, 47463, 121912, 000, 69, .509, .119, "Ysondre", },
		{ 1, 60214, 167749, 000, 71, .600, .377, "Doomwalker", },
	-- Burning Crusade
		{ 2, 00000, 18728, 000, 100, .632, .160, "Doom Lord Kazzak", },
		{ 2, 00000, 17711, 000, 104, .714, .438, "Doomwalker", },
	-- Wrath of the Lich King
		-- No World Boss
	-- Cataclysm
		{ 4, 00000, 50063, 000, 249, .380, .606, "Akma'hat", },
		{ 4, 00000, 50056, 000, 198, .404, .818, "Garr", },
		{ 4, 00000, 50089, 000, 241, .566, .110, "Julak-Doom", },
		{ 4, 00000, 50009, 000, 204, .718, .184, "Mobus", },
		{ 4, 00000, 50061, 000, 207, .454, .638, "Xariona", },
	--Mist of Pandaria
		{ 5, 32518, 69099, 814, 504, .600, .377, "Nalak, The Storm Lord", },
		{ 5, 32519, 69161, 826, 507, .499, .568, "Oondasta", },
		{ 5, 33118, 72057, 861, 504, .600, .377, "Ordos, Fire-God of the Yaungol", },
		{ 5, 32098, 62346, 725, 376, .707, .635, "Salyis's Warband", },
		{ 5, 32099, 60491, 691, 379, .535, .652, "Sha of Anger", },
		{ 5, 33117, 71952, 857, 554, .388, .552, "The Four Celestials", },
	--Warlord of Dreanor
		{ 6, 37460, 81252, 1291, 543, .441, .399, "Drov the Ruiner", },
		{ 6, 37464, 83746, 1262, 542, .370, .393, "Rukhmar", },
		{ 6, 39380, 94015, 1452, 534, .475, .221, "Supreme Lord Kazzak", },
		{ 6, 37462, 81535, 1211, 543, .470, .867, "Tarlna the Ageless", },
	--Legion
		{ 7, 43512, 109943, 1790, 680, .310, .655, "Ana-Mouz", },
		{ 7, 43193, 109331, 1774, 630, .377, .836, "Calamir", },
		{ 7, 43448, 110378, 1789, 650, .584, .726, "Drugon the Frostblood", },
		{ 7, 43985, 099929, 1795, 650, .492, .760, "Flotsam", },
		{ 7, 42819, 108879, 1770, 641, .246, .696, "Humongris", },
		{ 7, 43192, 108829, 1769, 630, .430, .676, "Levantus", },
		{ 7, 43513, 110321, 1783, 685, .360, .664, "Na'zak the Fiend", },
		{ 7, 42270, 107544, 1749, 634, .466, .300, "Nithogg", },
		{ 7, 42779, 108678, 1763, 641, .556, .432, "Shar'thos", },
		{ 7, 42269, 106981, 1756, 634, .782, .860, "The Soultakers", },
		{ 7, 44287, 112350, 1796, 630, .526, .808, "Withered Jim", },
	--Broken Isles
		{ 7, 47061, 121124, 1956, 646, .592, .626, "Apocron", },
		{ 7, 46947, 117239, 1883, 646, .592, .284, "Brutallus", },
		{ 7, 46948, 117303, 1884, 646, .598, .278, "Malificus", },
		{ 7, 46945, 117470, 1885, 646, .896, .330, "Si'vash", },
	--Argus
		{ 7, 49166, 124592, 2012, 0, 0, 0, "Inquisitor Meto", },
		{ 7, 49169, 124514, 2010, 0, 0, 0, "Matron Folnuna", },
		{ 7, 49167, 124625, 2011, 0, 0, 0, "Mistress Alluradel", },
		{ 7, 49170, 124492, 2013, 0, 0, 0, "Occularus", },
		{ 7, 49171, 124555, 2014, 0, 0, 0, "Sotanathor", },
		{ 7, 49168, 124719, 2015, 0, 0, 0, "Pit Lord Vilemus", },
	--Battle of Azeroth
		{ 8, 52163, 136385, 2199, 895, .620, .240, "Azurethos, The Winged Typhoon", },
		{ 8, 52196, 138794, 2210, 864, .443, .555, "Dunegorger Kraulok", },
		{ 8, 52157, 140252, 2197, 896, .492, .746, "Hailstone Construct", },
		{ 8, 52169, 132253, 2141, 862, .690, .310, "Ji'arak", },
		{ 8, 52181, 132701, 2139, 863, .356, .336, "T'zane", },
		{ 8, 52166, 140163, 2198, 942, .832, .496, "Warbringer Yenajz", },
	--Nazjatar
		{ 8, 56057, 152697, 2362, 1355, .842, .359, "Ulmath the Soulbinder", },
		{ 8, 56056, 152671, 2363, 1355, .428, .779, "Wekemara", },
	--Warfront: Arathi Highlands
		{ 8, 52847, 138122, 2213, 14, .378, .402, "Doom's Howl", },						-- Alliance
		{ 8, 52848, 137374, 2212, 14, .355, .389, "The Lion's Roar", },					-- Horde
	--Warfront: Darkshore
		{ 8, 54895, 148295, 2345, 62, .414, .359, "Ivus the Decayed", },				-- Alliance
		{ 8, 54896, 144946, 2329, 62, .414, .359, "Ivus the Forest Lord", },			-- Horde
	--Vale of Eternal Blossoms
		{ 8, 58705, 154638, 2378, 1530, .590, .564, "Grand Empress Shek'zara", },
	--Uldum
		{ 8, 55466, 160970, 2381, 1527, .457, .161, "Vuk'laz the Earthbreaker", },
	--Shadowlands
		{ 9, 62810, 167525, 2431, 1536, .326, .654, "Mortanis", },
		{ 9, 62812, 167526, 2433, 1525, .272, .149, "Nurgash Muckformed", },
		{ 9, 62811, 167527, 2432, 1565, .206, .634, "Oranomonos the Everbranching", },
		{ 9, 62809, 167524, 2430, 1533, .263, .224, "Valinor, the Light of Eons", },
	--The Maw
		{ 9, 64547, 178958, 2456, 1543, .691, .442, "Mor'geth, Tormentor of the Damned", },
	--Zereth Mortis
		{ 9, 65695, 101905, 2468, 1970, .488, .054, "Antros <Keeper of the Antecedents>", },
	--Dragonflight
		{ 10, 72055, 193534, 2515, 2023, .820, .760, "Strunraan, the Sky's Misery", },
		{ 10, 72056, 193535, 2506, 2022, .550, .777, "Basrikron, the Shale Win", },
		{ 10, 72054, 193532, 2517, 2024, .794, .366, "Bazual, the Dreaded Flame", },
		{ 10, 72057, 193533, 2518, 2085, .545, .688, "Liskanoth, the Futurebane", },
	--Zaralek Cavern
		{ 10, 74892, 199853, 2531, 2133, .275, .444, "The Zaqali Elders", },
	--Emerald Dream
		{ 10, 76367, 209574, 2562, 2200, .371, .552, "Aurostor, The Hibernating", },
}
vC_HearthStone_Toy = {
	-- Category, ItemID, TextureID, Name (Toy)
	{ 0, 166747, 2491063, "Brewfest Reveler's Hearthstone", },
	{ 0, 190237, 3954409, "Broker Translocation Matrix", },
	{ 0, 208704, 5333528, "Deepdweller's Earthen Hearthstone", },
	{ 0, 188952, 3528303, "Dominated Hearthstone", },
	{ 0, 190196, 3950360, "Enlightened Hearthstone", },
	{ 0, 172179, 3084684, "Eternal Traveler's Hearthstone", },
	{ 0, 054452, 0236222, "Ethereal Portal", },
	{ 0, 166746, 2491064, "Fire Eater's Hearthstone", },
	{ 0, 162973, 2124576, "Greatfather Winter's Hearthstone", },
	{ 0, 163045, 2124575, "Headless Horseman's Hearthstone", },
	{ 0, 209035, 2491064, "Hearthstone of the Flame", },						-- Don't Have
	{ 0, 168907, 2491049, "Holographic Digitalization Hearthstone", },
	{ 0, 184353, 3257748, "Kyrian Hearthstone", },
	{ 0, 165669, 2491049, "Lunar Elder's Hearthstone", },
	{ 0, 182773, 3716927, "Necrolord Hearthstone", },
	{ 0, 180290, 3489827, "Night Fae Hearthstone", },
	{ 0, 165802, 2491065, "Noble Gardener's Hearthstone", },
	{ 0, 200630, 4080564, "Ohn'ir Windsage's Hearthstone", },
	{ 0, 206195, 1708140, "Path of the Naaru", },
	{ 0, 165670, 2491048, "Peddlefeet's Lovely Hearthstone", },
	{ 0, 212337, 5524923, "Stone of the Hearth", },
	{ 0, 193588, 4571434, "Timewalker's Hearthstone", },
	{ 0, 142542, 1529351, "Tome of Town Portal", },
	{ 0, 210455, 1686574, "Draenic Hologem", }, -- Only Draenei/Lightforge Draenei can use
}
vC_Hearthstone_Other = {
	-- Category, SpellID, TextureID, Name, Race
	{ 0, 265225, 1786409, "Mole Machine", 34, },								-- Dark Iron Dwarf
	-- Category, SpellID, TextureID, Name, Class
	{ 1, 050977, 0135766, "Death Gate", 6, },									-- Death Knight
	{ 1, 000556, 0136010, "Astral Recall", 7, },								-- Shaman
	{ 1, 193759, 1536440, "Guardian Hall", 8, },								-- Mage
	{ 1, 126892, 0775462, "Zen Pilgrimage", 10, },								-- Monk
	{ 1, 193753, 0135763, "Dreamwalk", 11, },									-- Druid
	-- { 1, 343127, 237509, "Teleport", 8, },									-- Mage (Future)
	-- { 1, 343140, 628677, "Portal", 8, },										-- Mage (Future)
	-- Category, ItemID, TextureID, Name, ZoneID (Item ??Must in Bag??)
	{ 2, 180817, 0442739, "Cypher of Relocation", nil, {619,876,1462,1543,1961,}, },				-- Be in Maw to use
	{ 2, 141605, 0132161, "Flight Master's Whistle", nil, {14,62,249,390,619,875,876,905,1462,}, },	-- Any Legion & BfA Zones
	{ 2, 103678, 0643915, "Time-Lost Artifact", },								-- Any (Timeless Isles)
	{ 2, 046874, 0135026, "Argent Crusader's Tabard", },						-- Any (Argent Tournament Grounds)
	{ 2, 167075, 0986487, "Ultrasafe Transporter: Mechagon", },					-- Any (Mechagon)
	{ 2, 037863, 0133015, "Direbrew's Remote", },								-- Any (Port to Grim Guzzler in BRD)
	-- Category, ItemID, TextureID, Name, Profession
	{ 3, 018986, 0133870, "Ultrasafe Transporter: Gadgetzan", 202, },			-- 202 = Engineer Toy
	{ 3, 030544, 0321487, "Ultrasafe Transporter: Toshley's Station", 202, },	-- 202 = Engineer Toy
	-- Category, ItemID, TextureID, Name, Faction, ZoneID
	{ 4, 169297, 0133433, "Stormpike Insignia", 0, {619,876,1462,30,2582,}, },	-- Toy (Alliance)
	{ 4, 169298, 0133287, "Frostwolf Insignia", 1, {619,876,1462,30,2582,}, },	-- Toy (Horde)
	{ 5, 018150, 0134421, "Rune of Recall", 0, {619,876,1462,30,2582,}, },		-- Rune of Recall (Alliance)
	{ 5, 018149, 0134418, "Rune of Recall", 1, {619,876,1462,30,2582,}, },		-- Rune of Recall (Horde)
}
-------------------------------------------------------
-- Cursor, Background, Border & Fonts Choice for Players
-------------------------------------------------------
vC_Cursor_Positioning = {
	"ANCHOR_CURSOR",		-- 1 DEFAULT BkGnd if Nothing, NIL or Over #
	"ANCHOR_PRESERVE",		-- 2
	"ANCHOR_NONE",			-- 3
	"ANCHOR_TOPRIGHT",		-- 4
	"ANCHOR_RIGHT",			-- 5
	"ANCHOR_BOTTOMRIGHT",	-- 6
	"ANCHOR_TOPLEFT",		-- 7
	"ANCHOR_LEFT",			-- 8
	"ANCHOR_BOTTOMLEFT",	-- 9
}
vC_Backdrop = {
	"Interface\\GLUES\\COMMON\\Glue-Tooltip-Background",								-- 1 DEFAULT BkGnd if Nothing, NIL or Over #
	"Interface\\Azerite\\AzeriteTooltipBackground",										-- 2
	"Interface\\CorruptedItems\\CorruptedTooltipBackground",								-- 3
	"Interface\\DialogFrame\\UI-DialogBox-Background",										-- 4
	"Interface\\DialogFrame\\UI-DialogBox-Background-Dark",										-- 5
	"Interface\\DialogFrame\\UI-DialogBox-Gold-Background",										-- 6
	"Interface\\Runecarving\\RuneCarvingTooltipBackground",										-- 7
	"Interface\\Tooltips\\UI-Tooltip-Background-Azerite",											-- 8
	"Interface\\Tooltips\\UI-Tooltip-Background-Corrupted",										-- 9
	"Interface\\Tooltips\\UI-Tooltip-Background-Maw",												-- 10
	"Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Parchment-Horizontal",							-- 11
	"Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Parchment-Horizontal-Desaturated",				-- 12
	"Interface\\ACHIEVEMENTFRAME\\UI-GuildAchievement-Parchment-Horizontal",						-- 13
	"Interface\\ACHIEVEMENTFRAME\\UI-GuildAchievement-Parchment-Horizontal-Desaturated",			-- 14
	"Interface\\BankFrame\\Bank-Background",														-- 15
	"Interface\\BlackMarket\\BlackMarketBackground-Tile",											-- 16
	"Interface\\Collections\\CollectionsBackgroundTile",											-- 17
	"Interface\\Credits\\CreditsScreenBackground0WOW",												-- 18
	"Interface\\Credits\\CreditsScreenBackground1BC",												-- 19
	"Interface\\Credits\\CreditsScreenBackground2WOTLK",											-- 20
	"Interface\\Credits\\CreditsScreenBackground3Cataclysm",										-- 21
	"Interface\\Credits\\CreditsScreenBackground4MOP",												-- 22
	"Interface\\Credits\\CreditsScreenBackground5WOD",												-- 23
	"Interface\\Credits\\CreditsScreenBackground6Legion",											-- 24
	"Interface\\Credits\\CreditsScreenBackground7BFA",												-- 25
	"Interface\\Credits\\CreditsScreenBackground8Shadowlands",										-- 26
	"Interface\\Credits\\CreditsScreenBackground9Dragonflight",									-- 27
	"Interface\\Credits\\CreditsScreenBackground10TheWarWithin",
	"Interface\\Destiny\\EndscreenBG",																-- 28
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-Classic",													-- 29
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-BurningCrusade",											-- 30
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-WrathoftheLichKing",										-- 31
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-CATACLYSM",												-- 32
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-MistsofPandaria",											-- 33
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-WarlordsofDraenor",										-- 34
	"Interface\\ENCOUNTERJOURNAL\\UI-EJ-Legion",													-- 35
	"Interface\\FrameGeneral\\UI-Background-Marble",												-- 36
	"Interface\\FrameGeneral\\UI-Background-Rock",													-- 37
	"Interface\\FrameGeneral\\UIFrameDragonflightBackground",										-- 38
	"Interface\\FrameGeneral\\UIFrameHordeBackground",												-- 39
	"Interface\\FrameGeneral\\UIFrameKyrianBackground",											-- 40
	"Interface\\FrameGeneral\\UIFrameMarineBackground",											-- 41
	"Interface\\FrameGeneral\\UIFrameMechagonBackground",											-- 42
	"Interface\\FrameGeneral\\UIFrameNecrolordBackground",											-- 43
	"Interface\\FrameGeneral\\UIFrameNeutralBackground",											-- 44
	"Interface\\FrameGeneral\\UIFrameNightFaeBackground",											-- 45
	"Interface\\FrameGeneral\\UIFrameOribosBackground",											-- 46
	"Interface\\FrameGeneral\\UIFrameVenthyrBackground",											-- 47
	"Interface\\Garrison\\AdventureMissionsFrameBG1",												-- 48
	"Interface\\Garrison\\AdventureMissionsFrameBG2",												-- 49
	"Interface\\Garrison\\AdventureMissionsFrameParchment",										-- 50
	"Interface\\Garrison\\ClassHallBackground",													-- 51
	"Interface\\Garrison\\ClassHallInternalBackground",											-- 52
	"Interface\\Garrison\\GarrisonLandingPageMiddleTile",											-- 53
	"Interface\\Garrison\\GarrisonMissionParchment",												-- 54
	"Interface\\Garrison\\GarrisonMissionUIInfoBoxBackgroundTile",									-- 55
	"Interface\\Garrison\\GarrisonShipMissionParchment",											-- 56
	"Interface\\Garrison\\GarrisonUIBackground",													-- 57
	"Interface\\Garrison\\GarrisonUIBackground2",													-- 58
	"Interface\\GLUES\\CharacterSelect\\GlueAnnouncementPopupBackground",							-- 59
	"Interface\\GLUES\\Models\\UI_BloodElf\\bloodelf_matte",										-- 60
	"Interface\\GLUES\\Models\\UI_BloodElf\\bloodelf_mountains",									-- 61
	"Interface\\GLUES\\Models\\UI_DarkIronDwarf\\Snowtiling",										-- 62
	"Interface\\GLUES\\Models\\UI_DarkIronDwarf\\WoodPlain",										-- 63
	"Interface\\GLUES\\Models\\UI_DeathKnight\\jlo_IceC_BeamDark",									-- 64
	"Interface\\GLUES\\Models\\UI_DemonHunter\\Legion_DH_LargeRocks_02",							-- 65
	"Interface\\GLUES\\Models\\UI_Dwarf\\mm_irnfg_snwy_wall_03",									-- 66
	"Interface\\GLUES\\Models\\UI_Goblin\\LostIsles_MossyRock_01",									-- 67
	"Interface\\GLUES\\Models\\UI_Goblin\\UI_Goblin_sky",											-- 68
	"Interface\\GLUES\\Models\\UI_Goblin\\UI_Goblin_clouds01",										-- 69
	"Interface\\GLUES\\Models\\UI_HighmountainTauren\\7HM_rocks",									-- 70
	"Interface\\GLUES\\Models\\UI_HighmountainTauren\\7HM_rocks2",									-- 71
	"Interface\\GLUES\\Models\\UI_Horde\\BadCoconut2",												-- 72
	"Interface\\GLUES\\Models\\UI_Horde\\UI_Horde_Sky_01",											-- 73
	"Interface\\GLUES\\Models\\UI_Human\\MM_SKY_02",												-- 74
	"Interface\\GLUES\\Models\\UI_Human\\STREET 02",												-- 75
	"Interface\\GLUES\\Models\\UI_Human\\Large_Human_Background_Sky_01",							-- 76
	"Interface\\GLUES\\Models\\UI_MainMenu\\DarkPortal_nick_01",									-- 77
	"Interface\\GLUES\\Models\\UI_MainMenu\\DurotarRock03",										-- 78
	"Interface\\GLUES\\Models\\UI_MainMenu\\mm_thorns_01",											-- 79
	"Interface\\GLUES\\Models\\UI_MAINMENU_BattleForAzeroth\\UI_BattleForAzeroth_StormCloud01",	-- 80
	"Interface\\GLUES\\Models\\UI_MainMenu_BurningCrusade\\dp_blasted",							-- 81
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_SkyShot01_nite",							-- 82
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_strmwnd_hugesmoke_01",					-- 83
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_strmwnd_lavawall01_nite",					-- 84
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_strmwnd_roof01_nite",						-- 85
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_strmwnd_stonetrim01c_nite",				-- 86
	"Interface\\GLUES\\Models\\UI_MainMenu_Cataclysm\\UI_strmwnd_stonewall01b_nite",				-- 87
	"Interface\\GLUES\\Models\\UI_MAINMENU_Dragonflight\\UI_DragonIsles_BG_SkyA",					-- 88
	"Interface\\GLUES\\Models\\UI_MAINMENU_Dragonflight\\UI_DragonIsles_BG_SkyB",					-- 89
	"Interface\\GLUES\\Models\\UI_MainMenu_Legion\\6TJ_PatchLargeRock",							-- 90
	"Interface\\GLUES\\Models\\UI_MainMenu_Legion\\7LG_Legion_GatewayFelGround",					-- 91
	"Interface\\GLUES\\Models\\UI_MainMenu_Legion\\7XP_Fel_FloatingRock03",						-- 92
	"Interface\\GLUES\\Models\\UI_MainMenu_Legion\\UI_Legion_Rock_03",								-- 93
	"Interface\\GLUES\\Models\\UI_MainMenu_Pandaria\\WideShot_Clouds_08",							-- 94
	"Interface\\GLUES\\Models\\UI_MAINMENU_SHADOWLANDS\\UI_Shadowlands_Sky_Cloud01",				-- 95
	"Interface\\GLUES\\Models\\UI_MAINMENU_SHADOWLANDS\\UI_Shadowlands_Sky_Background01",			-- 96
	"Interface\\GLUES\\Models\\UI_MainMenu_Warlords\\UI_Warlords_Sky",								-- 97
	"Interface\\GLUES\\Models\\UI_NightElf\\aa_moonwell_glow",										-- 98
	"Interface\\GLUES\\Models\\UI_NightElf\\aa_NE_sky",											-- 99
	"Interface\\GLUES\\Models\\UI_NightElf\\mm_NE_treerings_01",									-- 100
	"Interface\\GLUES\\Models\\UI_NightElf\\mm_NE_floor_01",										-- 101
	"Interface\\GLUES\\Models\\UI_Orc\\jlo_mcave_wall_red",										-- 102
	"Interface\\GLUES\\Models\\UI_Orc\\jlo_mcave_wall_darkblue",									-- 103
	"Interface\\GLUES\\Models\\UI_Orc\\mm_orc_sky_01",												-- 104
	"Interface\\GLUES\\Models\\UI_OrcClan\\UI_orcBG_06",											-- 105
	"Interface\\GLUES\\Models\\UI_Pandaren\\UI_Pandaren_Sky_01",									-- 106
	"Interface\\GLUES\\Models\\UI_Scourge\\GN_GrassB",												-- 107
	"Interface\\GLUES\\Models\\UI_TAUREN\\GROUND2",												-- 108
	"Interface\\GLUES\\Models\\UI_TAUREN\\SKY1",													-- 109
	"Interface\\GLUES\\Models\\UI_Troll\\UI_Troll_Water01",										-- 110
	"Interface\\GLUES\\Models\\UI_vulpera\\UI_Vulpera_BG15",										-- 111
	"Interface\\GuildBankFrame\\GuildVaultBG",														-- 112
	"Interface\\HELPFRAME\\DarkSandstone-Tile",													-- 113
	"Interface\\HELPFRAME\\Tileable-Parchment",													-- 114
	"Interface\\RAIDFRAME\\UI-RaidFrame-GroupBg",													-- 115
	"Interface\\Stationery\\AuctionStationery1",													-- 116
	"Interface\\TabardFrame\\TabardFrameBackground",												-- 117
	"Interface\\TALENTFRAME\\WarlockCurses-TopLeft",												-- 118
	"Interface\\TALENTFRAME\\WarlockDestruction-TopLeft",											-- 119
	"Interface\\TALENTFRAME\\WarlockSummoning-TopLeft",											-- 120
	"Interface\\TALENTFRAME\\WarriorArms-TopLeft",													-- 121
	"Interface\\TALENTFRAME\\WarriorArm-TopLeft",													-- 122
	"Interface\\TALENTFRAME\\WarriorFury-TopLeft",													-- 123
	"Interface\\TALENTFRAME\\WarriorProtection-TopLeft",											-- 124
	"Interface\\TALENTFRAME\\ShamanRestoration-TopLeft",											-- 125
	"Interface\\TALENTFRAME\\ShamanEnhancement-TopLeft",											-- 126
	"Interface\\TALENTFRAME\\ShamanElementalCombat-TopLeft",										-- 127
	"Interface\\TALENTFRAME\\RogueSubtlety-TopLeft",												-- 128
	"Interface\\TALENTFRAME\\RogueCombat-TopLeft",													-- 129
	"Interface\\TALENTFRAME\\RogueAssassination-TopLeft",											-- 130
	"Interface\\TALENTFRAME\\PriestShadow-TopLeft",												-- 131
	"Interface\\TALENTFRAME\\PriestHoly-TopLeft",													-- 132
	"Interface\\TALENTFRAME\\PriestDiscipline-TopLeft",											-- 133
	"Interface\\TALENTFRAME\\PALADINPROTECTION-TOPLEFT",											-- 134
	"Interface\\TALENTFRAME\\PALADINHOLY-TOPLEFT",													-- 135
	"Interface\\TALENTFRAME\\PALADINCOMBAT-TOPLEFT",												-- 136
	"Interface\\TALENTFRAME\\MageFrost-TopLeft",													-- 137
	"Interface\\TALENTFRAME\\MageFire-TopLeft",													-- 138
	"Interface\\TALENTFRAME\\MageArcane-TopLeft",													-- 139
	"Interface\\TALENTFRAME\\HunterSurvival-TopLeft",												-- 140
	"Interface\\TALENTFRAME\\HunterMarksmanship-TopLeft",											-- 141
	"Interface\\TALENTFRAME\\HunterBeastMastery-TopLeft",											-- 142
	"Interface\\TALENTFRAME\\DruidRestoration-TopLeft",											-- 143
	"Interface\\TALENTFRAME\\DruidFeralCombat-TopLeft",											-- 144
	"Interface\\TALENTFRAME\\DruidBalance-TopLeft",												-- 145
	"Interface\\TALENTFRAME\\DeathKnightUnholy-TopLeft",											-- 146
	"Interface\\TALENTFRAME\\DeathKnightFrost-TopLeft",											-- 147
	"Interface\\TALENTFRAME\\DeathKnightBlood-TopLeft",											-- 148
	"Interface\\DRESSUPFRAME\\DressingRoomDeathKnight",
	"Interface\\DRESSUPFRAME\\DressingRoomDemonHunter",
	"Interface\\DRESSUPFRAME\\DressingRoomDruid",
	"Interface\\DRESSUPFRAME\\DressingRoomEvoker",
	"Interface\\DRESSUPFRAME\\DressingRoomHunter",
	"Interface\\DRESSUPFRAME\\DressingRoomMage",
	"Interface\\DRESSUPFRAME\\DressingRoomMonk",
	"Interface\\DRESSUPFRAME\\DressingRoomPaladin",
	"Interface\\DRESSUPFRAME\\DressingRoomPriest",
	"Interface\\DRESSUPFRAME\\DressingRoomRogue",
	"Interface\\DRESSUPFRAME\\DressingRoomShaman",
	"Interface\\DRESSUPFRAME\\DressingRoomWarlock",
	"Interface\\DRESSUPFRAME\\DressingRoomWarrior",
	"Interface\\DRESSUPFRAME\\DressUpBackground-BloodElf1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-DarkIronDwarf1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-DeathKnight1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Dracthyr1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Draenei1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Dwarf1",
	"Interface\\DRESSUPFRAME\\DRESSUPBACKGROUND-GNOME1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Goblin1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-HighmountainTauren1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Human1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Kultiran1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-LightforgedDraenei1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Maghar1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Mechagnome1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Nightborne1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-NightElf1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Orc1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Pandaren1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Pet1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Scourge1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Tauren1",
	"Interface\\DRESSUPFRAME\\DRESSUPBACKGROUND-TROLL1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-VoidElf1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Vulpera1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-Worgen1",
	"Interface\\DRESSUPFRAME\\DressUpBackground-ZandalariTroll1",	-- 187
}
vC_Border = {
	"Interface\\ToolTips\\UI-Tooltip-Border",								-- 1 DEFAULT edge if Nothing, NIL or Over #
	"Interface\\ACHIEVEMENTFRAME\\UI-Achievement-WoodBorder",				-- 2
	"Interface\\BUTTONS\\UI-SliderBar-Border",								-- 3
	"Interface\\DialogFrame\\UI-DialogBox-Border",							-- 4
	"Interface\\DialogFrame\\UI-DialogBox-Gold-Border",					-- 5
	"Interface\\DialogFrame\\UI-DialogBox-TestWatermark-Border",			-- 6
	"Interface\\FriendsFrame\\UI-Toast-Border",							-- 7
	"Interface\\GLUES\\COMMON\\Glue-Tooltip-Border",						-- 8
	"Interface\\GLUES\\COMMON\\TextPanel-Border",							-- 9
	"Interface\\PVPFrame\\UI-Character-PVP-Highlight",						-- 10
	"Interface\\QUESTFRAME\\UI-TextBackground-Backdrop",					-- 11
	"Interface\\TALENTFRAME\\UI-TalentFrame-Active",						-- 12
	"Interface\\ToolTips\\UI-Tooltip-Border-Azerite",						-- 13
	"Interface\\ToolTips\\UI-Tooltip-Border-Corrupted",					-- 14
	"Interface\\ToolTips\\UI-Tooltip-Border-Maw",							-- 15
}
vC_Font = {
	"AchievementCriteriaFont",									-- 1
	"AchievementDateFont",										-- 2
	"AchievementDescriptionFont",								-- 3
	"AchievementFont_Small",									-- 4
	"AchievementPointsFont",									-- 5
	"AchievementPointsFontSmall",								-- 6
	"BossEmoteNormalHuge",										-- 7
	"ChatBubbleFont",											-- 8
	"ChatFontNormal",											-- 9
	"ChatFontSmall",											-- 10
	"CombatLogFont",											-- 11
	"CombatTextFont",											-- 12
	"CoreAbilityFont",											-- 13
	"DestinyFontHuge",											-- 14
	"DestinyFontLarge",											-- 15
	"DestinyFontMed",											-- 16
	"DialogButtonHighlightText",								-- 17
	"DialogButtonNormalText",									-- 18
	"ErrorFont",												-- 19
	"Fancy12Font",												-- 20
	"Fancy14Font",												-- 21
	"Fancy16Font",												-- 22
	"Fancy18Font",												-- 23
	"Fancy20Font",												-- 24
	"Fancy22Font",												-- 25
	"Fancy24Font",												-- 26
	"Fancy27Font",												-- 27
	"Fancy30Font",												-- 28
	"Fancy32Font",												-- 29
	"Fancy36Font",												-- 30
	"Fancy40Font",												-- 31
	"Fancy48Font",												-- 32
	"FocusFontSmall",											-- 33
	"FriendsFont_11",											-- 34
	"FriendsFont_Large",										-- 35
	"FriendsFont_Normal",										-- 36
	"FriendsFont_Small",										-- 37
	"FriendsFont_UserText",										-- 38
	"Game11Font",												-- 39
	"Game11Font_Shadow",										-- 40
	"Game11Font_o1",											-- 41
	"Game12Font",												-- 42
	"Game12Font_o1",											-- 43
	"Game13Font",												-- 44
	"Game13FontShadow",											-- 45
	"Game13Font_o1",											-- 46
	"Game15Font",												-- 47
	"Game15Font_o1",											-- 48
	"Game18Font",												-- 49
	"Game20Font",												-- 50
	"Game24Font",												-- 51
	"Game27Font",												-- 52
	"Game32Font",												-- 53
	"GameFontBlackSmall",										-- 54
	"GameFontBlackTiny",										-- 55
	"GameFontDarkGraySmall",									-- 56
	"GameFontDisableLeft",										-- 57
	"GameFontDisableMed3",										-- 58
	"GameFontDisableTiny",										-- 59
	"GameFontGreen",											-- 60
	"GameFontGreenLarge",										-- 61
	"GameFontGreenSmall",										-- 62
	"GameFontHighlightCenter",									-- 63
	"GameFontHighlightExtraSmall",								-- 64
	"GameFontHighlightExtraSmallLeft",							-- 65
	"GameFontHighlightExtraSmallLeftTop",						-- 66
	"GameFontHighlightLarge2",									-- 67
	"GameFontHighlightLeft",									-- 68
	"GameFontHighlightRight",									-- 69
	"GameFontHighlightSmallLeftTop",							-- 70
	"GameFontHighlightSmallOutline",							-- 71
	"GameFontHighlightSmallRight",								-- 72
	"GameFontNormalCenter",										-- 73
	"GameFontNormalGraySmall",									-- 74
	"GameFontNormalHugeBlack",									-- 75
	"GameFontNormalLargeLeft",									-- 76
	"GameFontNormalLargeLeftTop",								-- 77
	"GameFontNormalLeft",										-- 78
	"GameFontNormalLeftBottom",									-- 79
	"GameFontNormalLeftGreen",									-- 80
	"GameFontNormalLeftGrey",									-- 81
	"GameFontNormalLeftLightGreen",								-- 82
	"GameFontNormalLeftOrange",									-- 83
	"GameFontNormalLeftRed",									-- 84
	"GameFontNormalLeftYellow",									-- 85
	"GameFontNormalRight",										-- 86
	"GameFontNormalSmallLeft",									-- 87
	"GameFontRedLarge",											-- 88
	"GameFontRedSmall",											-- 89
	"GameFontWhite",											-- 90
	"GameFontWhiteSmall",										-- 91
	"GameFont_Gigantic",										-- 92
	"GameNormalNumberFont",										-- 93
	"GameTooltipText",											-- 94
	"GameTooltipTextSmall",										-- 95
	"InvoiceFont_Med",											-- 96
	"InvoiceFont_Small",										-- 97
	"InvoiceTextFontNormal",									-- 98
	"InvoiceTextFontSmall",										-- 99
	"ItemTextFontNormal",										-- 100
	"MailFont_Large",											-- 101
	"MailTextFontNormal",										-- 102
	"MovieSubtitleFont",										-- 103
	"NewSubSpellFont",											-- 104
	"Number11Font",												-- 105
	"Number12Font",												-- 106
	"Number12FontOutline",										-- 107
	"Number12Font_o1",											-- 108
	"Number13Font",												-- 109
	"Number15Font",												-- 110
	"Number16Font",												-- 111
	"Number18Font",												-- 112
	"NumberFontNormal",											-- 113
	"NumberFontNormalGray",										-- 114
	"NumberFontNormalHuge",										-- 115
	"NumberFontNormalLarge",									-- 116
	"NumberFontNormalLargeRight",								-- 117
	"NumberFontNormalLargeRightRed",							-- 118
	"NumberFontNormalLargeRightYellow",							-- 119
	"NumberFontNormalLargeYellow",								-- 120
	"NumberFontNormalRight",									-- 121
	"NumberFontNormalRightRed",									-- 122
	"NumberFontNormalRightYellow",								-- 123
	"NumberFontNormalSmall",									-- 124
	"NumberFontNormalSmallGray",								-- 125
	"NumberFontNormalYellow",									-- 126
	"NumberFont_GameNormal",									-- 127
	"NumberFont_Normal_Med",									-- 128
	"NumberFont_OutlineThick_Mono_Small",						-- 129
	"NumberFont_Outline_Huge",									-- 130
	"NumberFont_Outline_Large",									-- 131
	"NumberFont_Outline_Med",									-- 132
	"NumberFont_Small",											-- 133
	"ObjectiveFont",											-- 134
	"OrderHallTalentRowFont",									-- 135
	"PVPInfoTextFont",											-- 136
	"PriceFont",												-- 137
	"QuestDifficulty_Difficult",								-- 138
	"QuestDifficulty_Header",									-- 139
	"QuestDifficulty_Impossible",								-- 140
	"QuestDifficulty_Standard",									-- 141
	"QuestDifficulty_Trivial",									-- 142
	"QuestDifficulty_VeryDifficult",							-- 143
	"QuestFont",												-- 144
	"QuestFontLeft",											-- 145
	"QuestFont_Enormous",										-- 146
	"QuestFont_Outline_Huge",									-- 147
	"QuestFont_Shadow_Enormous",								-- 148
	"QuestFont_Shadow_Huge",									-- 149
	"QuestFont_Shadow_Small",									-- 150
	"QuestFont_Shadow_Super_Huge",								-- 151
	"QuestFont_Super_Huge",										-- 152
	"QuestFont_Super_Huge_Outline",								-- 153
	"QuestTitleFont",											-- 154
	"QuestTitleFontBlackShadow",								-- 155
	"ReputationDetailFont",										-- 156
	"SpellFont_Small",											-- 157
	"SplashHeaderFont",											-- 158
	"SubSpellFont",												-- 159
	"SubZoneTextFont",											-- 160
	"SystemFont_Huge1",											-- 161
	"SystemFont_Huge1_Outline",									-- 162
	"SystemFont_InverseShadow_Small",							-- 163
	"SystemFont_LargeNamePlate",								-- 164
	"SystemFont_LargeNamePlateFixed",							-- 165
	"SystemFont_NamePlate",										-- 166
	"SystemFont_NamePlateCastBar",								-- 167
	"SystemFont_NamePlateFixed",								-- 168
	"SystemFont_Outline",										-- 169
	"SystemFont_OutlineThick_Huge2",							-- 170
	"SystemFont_OutlineThick_Huge4",							-- 171
	"SystemFont_OutlineThick_WTF",								-- 172
	"SystemFont_Outline_Small",									-- 173
	"TextStatusBarText",										-- 174
	"TextStatusBarTextLarge",									-- 175
	"VehicleMenuBarStatusBarText",								-- 176
	"WhiteNormalNumberFont",									-- 177
	"WorldMapTextFont",											-- 178
	"ZoneTextFont",												-- 179
	"ArtifactAppearanceSetHighlightFont",						-- 180
	"ArtifactAppearanceSetNormalFont",							-- 181
	"CommentatorDampeningFont",									-- 182
	"CommentatorFontMedium",									-- 183
	"CommentatorFontSmall",										-- 184
	"CommentatorTeamNameFont",									-- 185
	"CommentatorTeamScoreFont",									-- 186
	"ConsoleFontNormal",										-- 187
	"ConsoleFontSmall",											-- 188
	"Game10Font_o1",											-- 189
	"Game16Font",												-- 190
	"Game17Font_Shadow",										-- 191
	"GameFontBlack",											-- 192
	"GameFontBlackMedium",										-- 193
	"GameFontBlackSmall2",										-- 194
	"GameFontBlackTiny2",										-- 195
	"GameFontDisable",											-- 196
	"GameFontDisableHuge",										-- 197
	"GameFontDisableLarge",										-- 198
	"GameFontDisableMed2",										-- 199
	"GameFontDisableOutline22",									-- 200
	"GameFontDisableSmall",										-- 201
	"GameFontDisableSmall2",									-- 202
	"GameFontDisableSmallLeft",									-- 203
	"GameFontDisableTiny2",										-- 204
	"GameFontHighlight",										-- 205
	"GameFontHighlight_NoShadow",								-- 206
	"GameFontHighlightHuge",									-- 207
	"GameFontHighlightLarge",									-- 208
	"GameFontHighlightMed2",									-- 209
	"GameFontHighlightMedium",									-- 210
	"GameFontHighlightOutline",									-- 211
	"GameFontHighlightOutline22",								-- 212
	"GameFontHighlightShadowHuge2",								-- 213
	"GameFontHighlightShadowOutline22",							-- 214
	"GameFontHighlightSmall",									-- 215
	"GameFontHighlightSmall2",									-- 216
	"GameFontHighlightSmallLeft",								-- 217
	"GameFontNormal",											-- 218
	"GameFontNormal_NoShadow",									-- 219
	"GameFontNormalHuge",										-- 220
	"GameFontNormalHugeOutline",								-- 221
	"GameFontNormalLarge",										-- 222
	"GameFontNormalLarge2",										-- 223
	"GameFontNormalLargeOutline",								-- 224
	"GameFontNormalMed1",										-- 225
	"GameFontNormalMed2",										-- 226
	"GameFontNormalMed2Outline",								-- 227
	"GameFontNormalMed3",										-- 228
	"GameFontNormalMed3Outline",								-- 229
	"GameFontNormalOutline",									-- 230
	"GameFontNormalOutline22",									-- 231
	"GameFontNormalShadowHuge2",								-- 232
	"GameFontNormalShadowOutline22",							-- 233
	"GameFontNormalSmall",										-- 234
	"GameFontNormalSmall2",										-- 235
	"GameFontNormalSmallBattleNetBlueLeft",						-- 236
	"GameFontNormalTiny",										-- 237
	"GameFontNormalTiny2",										-- 238
	"GameFontRed",												-- 239
	"GameFontWhiteTiny",										-- 240
	"GameFontWhiteTiny2",										-- 241
	"GameTooltipHeader",										-- 242
	"GameTooltipHeaderText",									-- 243
	"IMEHighlight",												-- 244
	"IMENormal",												-- 245
	"Number11FontWhite",										-- 246
	"Number13FontGray",											-- 247
	"Number13FontRed",											-- 248
	"Number13FontWhite",										-- 249
	"Number13FontYellow",										-- 250
	"Number14FontGray",											-- 251
	"Number14FontGreen",										-- 252
	"Number14FontRed",											-- 253
	"Number14FontWhite",										-- 254
	"Number15FontWhite",										-- 255
	"Number18FontWhite",										-- 256
	"NumberFont_Shadow_Large",									-- 257
	"NumberFont_Shadow_Med",									-- 258
	"NumberFont_Shadow_Small",									-- 259
	"NumberFont_Shadow_Tiny",									-- 260
	"NumberFontNormalLargeRightGray",							-- 261
	"NumberFontNormalRightGray",								-- 262
	"NumberFontNormalRightGreen",								-- 263
	"NumberFontSmallBattleNetBlueLeft",							-- 264
	"NumberFontSmallWhiteLeft",									-- 265
	"NumberFontSmallYellowLeft",								-- 266
	"OptionsFontHighlight",										-- 267
	"OptionsFontHighlightSmall",								-- 268
	"OptionsFontLarge",											-- 269
	"OptionsFontLeft",											-- 270
	"OptionsFontSmall",											-- 271
	"OptionsFontSmallLeft",										-- 272
	"PriceFontGray",											-- 273
	"PriceFontGreen",											-- 274
	"PriceFontRed",												-- 275
	"PriceFontWhite",											-- 276
	"PriceFontYellow",											-- 277
	"QuestFont_Huge",											-- 278
	"QuestFont_Large",											-- 279
	"QuestFontHighlightHuge",									-- 280
	"QuestFontNormalHuge",										-- 281
	"QuestFontNormalLarge",										-- 282
	"QuestFontNormalSmall",										-- 283
	"QuestMapRewardsFont",										-- 284
	"System_IME",												-- 285
	"System15Font",												-- 286
	"SystemFont_Large",											-- 287
	"SystemFont_Large2",										-- 288
	"SystemFont_Med1",											-- 289
	"SystemFont_Med2",											-- 290
	"SystemFont_Med3",											-- 291
	"SystemFont_Shadow_Huge1",									-- 292
	"SystemFont_Shadow_Huge1_Outline",							-- 293
	"SystemFont_Shadow_Large",									-- 294
	"SystemFont_Shadow_Large_Outline",							-- 295
	"SystemFont_Shadow_Large2",									-- 296
	"SystemFont_Shadow_Large2_Outline",							-- 297
	"SystemFont_Shadow_Med1",									-- 298
	"SystemFont_Shadow_Med1_Outline",							-- 299
	"SystemFont_Shadow_Med2",									-- 300
	"SystemFont_Shadow_Med2_Outline",							-- 301
	"SystemFont_Shadow_Med3",									-- 302
	"SystemFont_Shadow_Med3_Outline",							-- 303
	"SystemFont_Shadow_Outline_Huge3",							-- 304
	"SystemFont_Shadow_Small",									-- 305
	"SystemFont_Shadow_Small_Outline",							-- 306
	"SystemFont_Shadow_Small2",									-- 307
	"SystemFont_Shadow_Small2_Outline",							-- 308
	"SystemFont_Small",											-- 309
	"SystemFont_Small2",										-- 310
	"SystemFont_Tiny",											-- 311
	"SystemFont_Tiny2",											-- 312
	"SystemFont16_Shadow_ThickOutline",							-- 313
	"SystemFont18_Shadow_ThickOutline",							-- 314
	"SystemFont22_Outline",										-- 315
	"SystemFont22_Shadow_Outline",								-- 316
	"SystemFont22_Shadow_ThickOutline",							-- 317
	"Tooltip_Med",												-- 318
	"Tooltip_Small",											-- 319
}
-------------------------------------------------------
-- Oddities but Worth It
-------------------------------------------------------
vC_Specific_AddOn = {
	"AllTheThings",
	"CanIMogIt",
	"WoWthing_Collector",
	"AutoCage",
	"Auctionator",
	"BagSync",
	--"Collectionator",
	--"TomTom",
	--"Titan",				-- Will be removed once I build my own top bar
	--"SexyMap",
	"vC_QoLAddOns",			-- New Addon replacement from WOWTweaks
	--"Postal",
	"WowLua",				-- Maybe not need
	"BugSack",
	--"TitanGold",			-- Will be removed once I build my own top bar
	--"TitanRepair",			-- Will be removed once I build my own top bar
	"!BugGrabber",
	"DialogKey",
	--"StatBlock_Memory",		-- Will be removed once I build my own top bar
	--"ExtendedVendorLite",
}
vC_Openable_Container = {
	-- MoP: Remix
	{ 211279, 0, "Cache of Infinite Treasure", },			-- Cache of Infinite Treasure
	{ 223911, 0, "Greater Bronze Cache", },					-- Greater Bronze Cache
	{ 223909, 0, "Lesser Bronze Cache", },					-- Lesser Bronze Cache
	{ 223908, 0, "Minor Bronze Cache", },					-- Minor Bronze Cache
	{ 223910, 0, "Bronze Cache", },							-- Bronze Cache
	-- MoP
	{ 095601, 0, "Shiny Pile of Refuse", },					-- Shiny Pile of Refuse
	-- Timewalking - Vendor/Misc Bags
	{ 046007, 0, "Bag of Fishing Treasures", },				-- Wrath of Lich King Timewalking
	{ 044113, 0, "Small Spice Bag", },						-- Wrath of Lich King Timewalking
	-- Darkmoon Faire
	{ 093724, 0, "Darkmoon Game Prize", },					-- DMF - Darkmoon Faire Prize Bag
	{ 078904, 0, "Pouch o' Tokens", },						-- DMF - Pouch o' Tokens
	{ 078910, 0, "Sack o' Tokens", },						-- DMF - Sack o' Tokens
	{ 091086, 0, "Darkmoon Pet Supplies", },				-- DMF - Darkmoon Pet Supplies
	{ 116062, 0, "Greater Darkmoon Pet Supplies", },		-- DMF - Greater Darkmoon Pet Supplies
	-- Blingtron
	{ 086623, 0, "Blingtron 4000 Gift Package", },			-- Blingstron 4000
	{ 113258, 0, "Blingtron 5000 Gift Package", },			-- Blingstron 5000
	{ 132892, 0, "Blingtron 6000 Gift Package", },			-- Blingstron 6000
	{ 168740, 0, "Blingtron 7000 Gift Package", },			-- Blingstron 7000
	-- Trial of Style Event
	{ 147573, 0, "Trial of Style: First Place", },			-- Trial of Style - First
	{ 147574, 0, "Trial of Style: Second Place", },			-- Trial of Style - Second
	{ 147575, 0, "Trial of Style: Third Place", },			-- Trial of Style - Third
	{ 147576, 0, "Trial of Style Consolation Prize", }, 	-- Trial of Style - End Prize for no Win
	-- Any Holiday Event
	{ 045072, 0, "Brightly Colored Egg", },					-- Noblegarden
	{ 216874, 0, "Loot-Filled Basket", }, 					-- Noblegarden
	{ 021746, 0, "Lucky Red Envelope", }, 					-- Lunar
	-- Reowned/Purse Bags
	{ 198866, 0, "Small Iskaaran Supply Pack", },			-- Iskaar Reowned Bag
	{ 205983, 0, "Scentsational Niffen Treasures", },		-- Loamm Niffen Reowned Bag
	{ 204379, 0, "Brimming Iskaaran Supply Pack", },		-- Iskaara Reowned Bag
	{ 215362, 0, "Cache of Storms", },						-- Iskaara Cooking Bag
	{ 226256, 0, "Token of the Remembrancers", },			-- Pre-TWW Events
	-- Dragonracing
	{ 199192, 0, "Dream Racer's Purse", },					-- Blue (Waking Shore)
	{ 210549, 0, "Dream Racer's Purse", },					-- Blue
	{ 205226, 0, "Cavern Racer's Purse", },					-- ZC Bag
	-- The Digsite
	{ 213175, 0, "Dusty Djaradin Tome", },					-- Green
	{ 213188, 0, "Dusty Dracthyr Tome", },					-- Green
	{ 213187, 0, "Dusty Drakonid Tome", },					-- Green
	{ 213185, 0, "Dusty Centaur Tome", },					-- Green
	{ 213186, 0, "Dusty Niffen Tome", },					-- Green
	{ 213429, 0, "Meticulous Archivist's Appendix", },		-- Green
	{ 213190, 0, "Perserved Djaradin Tome", },				-- Blue
	{ 213189, 0, "Perserved Dragonkin Tome", },				-- Blue
	{ 213176, 0, "Perserved Isles Tome", },					-- Blue
	{ 213177, 0, "Immaculate Tome", },						-- Purple
	-- Dream Bloom & Anything in Dream Emerald
	{ 211411, 0, "Sprouting Dreamtrove", },					-- Green
	{ 211413, 0, "Budding Dreamtrove", },					-- Blue
	{ 211414, 0, "Blossoming Dreamtrove", },				-- Purple
	{ 211410, 0, "Bloomed Wildling Cache", },				-- Green
	-- Major Faction Rewards
	{ 210872, 0, "Satchel of Dreams", },					-- Purple
	-- Time Rift
	{ 207582, 0, "Box of Tampered Reality", },				-- Green
	{ 207584, 0, "Box of Volatile Reality", },				-- Blue
	{ 207583, 0, "Box of Collapsed Reality", },				-- Purple
	-- Forbidden Reach
	{ 203217, 0, "Dragonscale Surplus Crate", },			-- Dragonscale Surplus Crate
	{ 204383, 0, "Sack of Oddities", },						-- Sack of Oddities
	{ 203220, 0, "Iskaara Surplus Bag", },					-- Iskaara Surplus Bag
	{ 203222, 0, "Maruuk Surplus Bundle", },				-- Maruuk Surplus Bundle
	{ 203224, 0, "Valdrakken Surplus Chest", },				-- Valdrakken Surplus Chest
	-- WoD Inn Chests
	{ 118924, 0, "Cache of Arms", },						-- Cache of Arms
	{ 119037, 0, "Supply of Storied Rarities", },			-- Supply of Storied Rarities
	{ 119040, 0, "BoCache of Mingled Treasures", },			-- Cache of Mingled Treasures
	{ 119041, 0, "Strongbox of Mysterious Treasures", },	-- Strongbox of Mysterious Treasures
	{ 119042, 0, "Crate of Valuable Treasures", },			-- Crate of Valuable Treasures
	{ 119043, 0, "Trove of Smoldering Treasures", },		-- Trove of Smoldering Treasures
	-- TWW Chest/Token
	{ 226147, 0, "Bunch of Brave Rocks", },					-- Bunch of Brave Rocks
	{ 226148, 0, "Wax-sealed Weathered Crests", },			-- Wax-sealed Weathered Crests
	
	-- Timewalking Bags in CoT
	--{ 232598, 0, "Bag of Timewarped Badges", },				-- Bag of Timewarped Badges

	-- Cannot Auto Open
	-- { 223907, 2, "Asynchronized Prismatic Gem", },			-- MoP Remix: Asynchronized Prismatic Gem
	-- { 210917, 2, "Pouch of Whelping's Dreaming Crests", },	-- Crests
	-- { 213389, 2, "Ancient Centaur Diary", },					-- Green
	-- { 213025, 2, "Ancient Djaradin Bolt", },					-- Green
	-- { 213020, 2, "Ancient Drakonid Shovel", },				-- Green
	-- { 213200, 2, "Book of Horoscope", },						-- Green
	-- { 213365, 2, "Carved Cave Crystal", },					-- Green
	-- { 213215, 2, "Carved Votive Stone", },					-- Green
	-- { 213021, 2, "Corked Drakonid Vial", },					-- Green
	-- { 212687, 2, "Crude Toy Ducky", },						-- Green
	-- { 213357, 2, "Crystal Scrying Bowl", },					-- Green
	-- { 213022, 2, "Drakonid Blacksmith Hammer", },			-- Green
	-- { 212976, 2, "Drakonid Duck Carving", },					-- Green
	-- { 212977, 2, "Drakonid Sign Placard", },					-- Green
	-- { 212978, 2, "Dragon Painter's Palette", },				-- Green
	-- { 213183, 2, "Makeshift Beaded Bracelet", },				-- Green
	-- { 213023, 2, "Oil-Drenched Djaradin Torch", },			-- Green
	-- { 205223, 2, "Ornamented Centaur Axe", },				-- Green
	-- { 213382, 2, "Partial Centaur Hunting Map", },			-- Green
	-- { 213208, 2, "Pot of Pickled Ancheevies", },				-- Green
	-- { 212650, 2, "Pot of Tattooing Ink", },					-- Green
	-- { 213204, 2, "Ruby-Studded Locket", },					-- Green
	-- { 212773, 2, "Rusted Locket", },							-- Green
	-- { 213192, 2, "Scratched-Out List of Names", },			-- Green
	-- { 213375, 2, "Satchel of Buried Valuables", },			-- Green
	-- { 212762, 2, "Tarnished Horn Signet", },					-- Green
	-- { 212769, 2, "Tattered Wanted Poster", },				-- Green
	-- { 209837, 2, "Faint Whispers of Dreaming", },			-- Flightstone
	-- { 217242, 2, "Awakening Stone Wing", },					-- New Crest with 10.2.6
	-- { 217243, 2, "Awakening Ruby Wing", },					-- New Crest with 10.2.6
	-- { 219274, 2, "Infinite Thread of Power", },				-- Infinite Thread of Power
	-- { 219275, 2, "Infinite Thread of Stamina", },			-- Infinite Thread of Stamina
	-- { 219281, 2, "Infinite Thread of Versatility", },		-- Infinite Thread of Versatility
	-- { 219279, 2, "Infinite Thread of Leech", },				-- Infinite Thread of Leech
	-- { xxxxxx, 2, "Infinite Thread of ", },					-- Infinite Thread of ???
	-- { xxxxxx, 2, "Infinite Thread of ", },					-- Infinite Thread of ???
	-- { xxxxxx, 2, "Infinite Thread of ", },					-- Infinite Thread of ???
}
vC_Any_PickType_Boxes = {
	{ 004632, 0134344, "Ornate Bronze Lockbox", },
	{ 004633, 0134344, "Heavy Bronze Lockbox", },
	{ 004634, 0134344, "Iron Lockbox", },
	{ 004636, 0134344, "Strong Iron Lockbox", },
	{ 004637, 0134344, "Steel Lockbox", },
	{ 004638, 0134344, "Reinforced Steel Lockbox", },
	{ 005758, 0134344, "Mithril Lockbox", },
	{ 005759, 0134344, "Thorium Lockbox", },
	{ 005760, 0134344, "Eternium Lockbox", },
	{ 016882, 0132594, "Battered Junkbox", },
	{ 016883, 0132594, "Worn Junkbox", },
	{ 016884, 0132596, "Sturdy Junkbox", },
	{ 016885, 0132596, "Heavy Junkbox", },
	{ 029569, 0132595, "Strong Junkbox", },
	{ 031952, 0134344, "Khorium Lockbox", },
	{ 043575, 0132597, "Reinforced Junkbox", },
	{ 043622, 0134344, "Froststeel Lockbox", },
	{ 043624, 0134344, "Titanium Lockbox", },
	{ 045986, 0133875, "Tiny Titanium Lockbox", },
	{ 063349, 0132597, "Flame-Scarred Junkbox", },
	{ 068729, 0134344, "Elementium Lockbox", },
	{ 088165, 0132596, "Vine-Cracked Junkbox", },
	{ 088567, 0134344, "Ghost Iron Lockbox", },
	{ 106895, 0132596, "Iron-Bound Junkbox", },
	{ 116920, 0644388, "True Steel Lockbox", },
	{ 118193, 0134344, "Mysterious Shining Lockbox", },
	{ 119000, 1001980, "Highmaul Lockbox", },
	{ 121331, 0644388, "Leystone Lockbox", },
	{ 137563, 1394945, "Farondis Lockbox", },
	{ 146750, 1394945, "Farondis Lockbox", },
	{ 151467, 1394945, "Farondis Lockbox", },
	{ 154906, 1394945, "Farondis Lockbox", },
	{ 157825, 1394945, "Farondis Lockbox", },
	{ 169475, 0644388, "Barnacled Lockbox", },
	{ 179311, 1542861, "Synvir Lockbox", },
	{ 180522, 1542844, "Phaedrum Lockbox", },
	{ 180532, 0132597, "Oxxein Lockbox", },
	{ 180533, 1542848, "Solenium Lockbox", },
	{ 186161, 1542849, "Stygian Lockbox", },
	{ 187278, 1518647, "Talon-Pierced Mawsworn Lockbox", },
	{ 190954, 0644388, "Serevite Lockbox", },
	{ 191296, 0134344, "Enchanted Lockbox", },
	{ 204307, 0134344, "Ornate Bronze Lockbox", },
}

-------------------------------------------------------
-- Darkmoon Faire Profession Monthly and Daily
-------------------------------------------------------
vC_Darkmoon_Monthly = {	
	-- Prof ID, Quest ID, NPC Name, Quest Title
	{ 794, 29507, "Professor Thaddeus Paleo", "Fun for the Little Ones", },		-- Archaeology
	{ 164, 29508, "Yebb Neblegear", "Baby Needs Two Pair of Shoes", },			-- Blacksmith
	{ 185, 29509, "Stamp Thunderhorn", "Putting the Crunch in the Frog", },		-- Cooking
	{ 333, 29510, "Sayge", "Putting Trash to Good Use", },						-- Enchant
	{ 202, 29511, "Rinling", "Talkin' Tonks", },								-- Engineer
	{ 356, 29513, "Stamp Thunderhorn", "Spoilin' For Salty Sea Dogs", },		-- Fishing
	{ 182, 29514, "Chronos", "Herbs for Healing", },							-- Herbalism
	{ 773, 29515, "Sayge", "Writing the Future", },								-- Inscription
	{ 755, 29516, "Chronos", "Keeping the Faire Sparkling", },					-- Jewelcrafting
	{ 165, 29517, "Rinling", "Eyes on the Prizes", },							-- Leatherwork
	{ 186, 29518, "Rinling", "Rearm, Reuse, Recycle", },						-- Mining
	{ 393, 29519, "Chronos", "Tan My Hide", },									-- Skinning
	{ 197, 29520, "Selina Dourman", "Banners, Banners Everywhere!", },			-- Tailor
	{ 171, 29506, "Sylannia", "A Fizzy Fusion", },								-- Alchemy
}
vC_Darkmoon_Daily = {
	-- Quest ID, NPC Name, Quest Title
	{ 29463, "Mola", "It's Hammer Time", },										-- Whack a Gnoll til 30 pts
	{ 29436, "Maxima Blastenheimer", "The Humanoid Cannonball", },				-- Humanoid Cannonball shoot
	{ 29438, "Rinling", "He Shoots He Scores!", },								-- Hit Target 25 times
	{ 29434, "Finlay Coolshot", "Tonk Commander", },							-- Destroy 30 Tonks
	{ 36481, "Ziggie Sparks", "Firebird's Challenge", },						-- Fly thru 15 hoops
	{ 29455, "Jessica Rogers", "Target: Turtle", },								-- Toss Ring to Turtle
	{ 64783, "Simin Sezdans", "Dance Dance Darkmoon", },						-- Dance Contest
	{ 32175, "Jeremy Feasel", "Darkmoon Pet Battle!", },						-- Pet Battle
	{ 36471, "Christoph VonFeasel", "A New Darkmoon Challenger!", },			-- Pet Battle
	{ 37911, "Patti Earnhard", "The Real Big Race", },							-- Powermonger Race
	{ 37910, "Malle Earnhard", "The Real Race", },								-- Powermonger Race
}

-------------------------------------------------------
-- Default Settings for Certain Addons
-------------------------------------------------------
-- vC_CraftOrders Default Variables
-------------------------------------------------------
vC_OrgDef_CraftOrders = {
	["vC_Config"] = {
		["OrderType"] = 2,
		["Duration"] = 2,
		["TipAmount"] = 100,
		["TargetOrder"] = "Mayland-Korgath",
	},
	["vC_Professions"] = {
		{
			["ProfessionID"] = 164, -- Blacksmith --C_TradeSkillUI.GetProfessionInfoBySkillLineID(v.ProfessionID).professionName
			["NumberToCraft"] = 3,
			["SkillLineID"] = 47974,
		},
		{
			["ProfessionID"] = 202, -- Engineer
			["NumberToCraft"] = 2,
			["SkillLineID"] = 47447,
		},
		{
			["ProfessionID"] = 773, -- Inscription
			["NumberToCraft"] = 2,
			["SkillLineID"] = 47590,
		},
		{
			["ProfessionID"] = 755, -- Jewelcrafting
			["NumberToCraft"] = 2,
			["SkillLineID"] = 46968,
		},
		{
			["ProfessionID"] = 165, -- Leatherwork
			["NumberToCraft"] = 3,
			["SkillLineID"] = 47097,
		},
		{
			["ProfessionID"] = 197, -- Tailor
			["NumberToCraft"] = 3,
			["SkillLineID"] = 47280,
		},
	},
}
vC_OrgDef_Treaties = {
	["vC_Professions"] = {
		{
			["ProfessionID"] = 171,
			["ProfessionName"] = "Alchemy",
			["TreatiesID"] = 47601,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 164,
			["ProfessionName"] = "Blacksmithing",
			["TreatiesID"] = 47600,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 333,
			["ProfessionName"] = "Enchanting",
			["TreatiesID"] = 47599,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 202,
			["ProfessionName"] = "Engineering",
			["TreatiesID"] = 47602,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 182,
			["ProfessionName"] = "Herbalism",
			["TreatiesID"] = 47598,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 773,
			["ProfessionName"] = "Inscription",
			["TreatiesID"] = 47597,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 755,
			["ProfessionName"] = "Jewelcrafting",
			["TreatiesID"] = 47596,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 165,
			["ProfessionName"] = "Leatherworking",
			["TreatiesID"] = 47595,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 186,
			["ProfessionName"] = "Mining",
			["TreatiesID"] = 47594,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 393,
			["ProfessionName"] = "Skinning",
			["TreatiesID"] = 47928,
			["TargetOrder"] = nil,
		},
		{
			["ProfessionID"] = 197,
			["ProfessionName"] = "Tailoring",
			["TreatiesID"] = 47593,
			["TargetOrder"] = nil,
		},
	},
}

-------------------------------------------------------
-- Miscellaneous Search
-------------------------------------------------------
--UI_Sigil_Kyrian, Necrolord, NighFae, Venthyr