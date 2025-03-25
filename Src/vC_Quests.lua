local vC_AppName, vC_App = ...

if not ( vC_Run_Quests ) then return end
-------------------------------------------------------
-- Declare for this Page
-------------------------------------------------------
local locClass, engClass, classIdx			= UnitClass
local vC_pName, vC_pRealm					= UnitName("player")

local GetActiveCovenantID					= C_Covenants.GetActiveCovenantID
local GetCurrencyInfo 						= C_CurrencyInfo.GetCurrencyInfo
local GetSecondsUntilWeeklyReset 			= C_DateAndTime.GetSecondsUntilWeeklyReset

local CloseGossip							= C_GossipInfo.CloseGossip
local GetOptions							= C_GossipInfo.GetOptions
local GetAvailableQuests					= C_GossipInfo.GetAvailableQuests
local GetActiveQuests						= C_GossipInfo.GetActiveQuests
local SelectOption							= C_GossipInfo.SelectOption
local SelectAvailableQuest					= C_GossipInfo.SelectAvailableQuest
local SelectActiveQuest						= C_GossipInfo.SelectActiveQuest

local GetBestMapForUnit						= C_Map.GetBestMapForUnit("player")
local GetMapInfo							= C_Map.GetMapInfo
local GetPlayerMapPosition					= C_Map.GetPlayerMapPosition

local GetQuestLineInfo						= C_QuestLine.GetQuestLineInfo
local GetQuestLineQuests					= C_QuestLine.GetQuestLineQuests

local AddWorldQuestWatch					= C_QuestLog.AddWorldQuestWatch
local GetLogIndexForQuestID					= C_QuestLog.GetLogIndexForQuestID
local GetQuestDifficultyLevel				= C_QuestLog.GetQuestDifficultyLevel
local GetTitleForQuestID					= C_QuestLog.GetTitleForQuestID
local IsComplete							= C_QuestLog.IsComplete
local IsOnQuest								= C_QuestLog.IsOnQuest
local IsQuestFlaggedCompleted				= C_QuestLog.IsQuestFlaggedCompleted
local ReadyForTurnIn						= C_QuestLog.ReadyForTurnIn

local IsActive								= C_TaskQuest.IsActive
local GetQuestTimeLeftSeconds				= C_TaskQuest.GetQuestTimeLeftSeconds
local GetQuestZoneID						= C_TaskQuest.GetQuestZoneID
local GetQuestLocation						= C_TaskQuest.GetQuestLocation


-------------------------------------------------------
-- Needs Fixing
-------------------------------------------------------
function vC_Gossip_Bypass()
	-- /run print(C_Map.GetBestMapForUnit("player"))
	local vC_BMU = C_Map.GetBestMapForUnit("player")
	if not ( GossipFrame:IsShown() ) then return end
	
	-- WoW Anniversary
	if ( vC_BMU == 71 and ( UnitName("target") == "Historian Llore" or UnitName("target") == "Historian Ju'pa" )) then 
		if ( vC_Historian == nil ) then
			local vC_Historian = CreateFrame("Frame", "vC_Historian", GossipFrame.GreetingPanel, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_Historian, 18, 1)
				vC_Historian:SetSize(GossipFrame.GreetingPanel:GetWidth()-85,35)
				vC_Historian:SetPoint("TOPLEFT", GossipFrame.GreetingPanel, "LEFT", 8, -50)
			local vC_HistorianT = vC_Historian:CreateFontString("vC_HistorianT", "ARTWORK", "GameFontNormalMed1")
				vC_HistorianT:SetPoint("CENTER", vC_Historian, "CENTER", 0, 0)
				vC_HistorianT:SetText("...")
		else
			vC_Historian:Show()
		end

		local vC_tString = C_GossipInfo.GetText():gsub("'","`"):gsub('"',"'")
		local vC_tAnswer = nil

		local vC_Data = {
			{ "Succubus demons revel in causing anguish, and they serve the Legion by conducting nightmarish interrogations. What species is the succubus?", "Sayaad", },
			{ "Name the titan lore-keeper who was a member of the elite Pantheon", "Norgannon", },
			{ "Arthas`s death knights were trained in a floating citadel that was taken by force when many of them rebelled against the Lich King. What was the fortress`s name?", "Acherus", },
			{ "At what location did Sargeras plunge his sword into Azeroth, creating the wound?", "Silithus", },
			{ "Before Ripsnarl became a worgen, he had a family. What was his wife`s name?", "Calissa Harrington", },
			{ "Before she was raised from the dead by Arthas to serve the Scourge, Sindragosa was a part of what dragonflight?", "Blue dragonflight", },
			{ "Before succumbing to magical addiction, the Wretched were once members of which race?", "Blood Elves", },
			{ "Before the Cataclysm, where could the remains of Mankrik`s wife be found?", "The Barrens", },
			{ "Before the original Horde formed, a highly contagious sickness began spreading rapidly among the orcs. What did the orcs call it?", "Red pox", },
			{ "Bloodfeather, Windfury and Witchwing are all types of which race?", "Harpy", },
			{ "Brown-skinned orcs first began showing up on Azeroth several years after the Third War, when the Dark Portal was reactivated. What are these orcs called?", "Mag’har", },
			{ "Centaur use this title to refer to the leaders of their tribes.", "Khan", },
			{ "Cro Threadstrong continually threatened what specific type of vendor in Shattrath City?", "Fruit Vendor", },
			{ "Draka was a tenacious warrior in life, but what combat role was she assigned in the afterlife?", "Rogue", },
			{ "Formerly a healthy paladin, this draenei fell ill after fighting the Burning Legion and becoming one of the Broken. He later became a powerful shaman.", "Nobundo", },
			{ "In Taur-ahe, the language of the tauren, what does lar`korwi mean?", "Sharp claw", },
			{ "In Zandali, the language of the trolls, what does 'atal`ai' mean?", "Devoted Ones", },
			{ "In the assault on Icecrown, rogue Forsaken forces dishonorably attacked the army that was busy fighting the Scourge and trying to capture this gate.", "Mord’rethar", },
			{ "King Krush, King Mosh, and King Dred are all what type of creature?", "Devilsaur", },
			{ "What area was reshaped by goblins to resemble the symbol of the Horde?", "Azshara", },
			{ "Malfurion Stormrage helped found this group, which is the primary druidic organization of Azeroth.", "Cenarion Cricle", },
			{ "Merithra of the Dream is the daughter of which former Dragon Aspect?", "Ysera", },
			{ "Name the homeworld of the ethereals.", "K’aresh", },
			{ "One name for this loa is 'Night`s Friend'.", "Mueh’zala", },
			{ "One of Alexstrasza`s trusted ambassadors, this red drake`s chosen visage form is a vulpera.", "Majordomo Selistra", },
			{ "Razormane and Bristleback are two feuding tribes of which race?", "Quillboar", },
			{ "Tell me, hero, what are undead murlocs called?", "Mur’ghouls", },
			{ "Thane Kurdran Wildhammer suffered a tragic loss when his valiant gryphon was killed in a fire. What was this gryphon`s name?", "Sky’ree", },
			{ "The destruction of this artifact pierced the veil between Azeroth and the Shadowlands.", "The Helm of Domination", },
			{ "The draenei like to joke that in the language of the naaru, the word Exodar has this meaning.", "Defective elekk turd", },
			{ "The Ironforge library features a replica of an unusually large ram skeleton. What was the name of this legendary ram?", "Toothgnasher", },
			{ "The mark of the naaru on Yrel`s forehead was given to her by this notable draenei", "Prophet Velen", },
			{ "The night elves and the dragonflights stood against the armies of the Qiraji in what war?", "War of the Shifting Sands", },
			{ "The orc that Orgrimmar is named after (Orgrim Doomhammer) belonged to which orcish clan?", "Blackrock", },
			{ "These fuzzy, alpaca-driving nomads have settled in Vol`dun.", "Vulpera", },
			{ "This bronze dragon interrupted the trial of Garrosh Hellscream, bringing him to alternate Draenor before Garrosh killed him.", "Kairozdormu", },
			{ "This cult was affiliated with the orcish Shadow Council and included members such as Nagaz and Marez Cowl.", "Argus Wake", },
			{ "This defender of the Scarlet Crusade was killed while slaying the dreadlord Beltheris.", "Holia Sunshield", },
			{ "This emissary of the Horde felt that Silvermoon City was a little too bright and clean.", "Tatai", },
			{ "This frail Zandalari troll sought to tame a direhorn. Although he journeyed to the Isle of Giants, he was slain in his quest. What was his name?", "Talak", },
			{ "This Horde ship was crafted by goblins. Originally intended to bring Thrall and Aggra to the Maelstrom, the ship was destroyed in a surprise attack by the Alliance.", "Draka's Fury", },
			{ "This monument in Stormwind commemorates the late King Varian Wrynn and fallen Alliance soldiers.", "Lion’s Rest", },
			{ "This queen oversaw the evacuation of her people after the Cataclysm struck and the Forsaken attacked her nation.", "Queen Mia Greymane", },
			{ "This structure, located in Zangarmarsh, was controlled by naga who sought to drain a precious and limited resource: the water of Outland.", "Coilfang Reservoir", },
			{ "What Pandaria creatures are the embodiments of negative emotions including doubt, despair, and anger?", "Sha", },
			{ "What are the final words from this Headless Horseman quote: 'It is over, your search is done! Let fate choose now, ...'", "\"the righteous one!\"", },
			{ "What did the Dragon Aspects give the night elves after the War of the Ancients?", "Nordrassil", },
			{ "What dragon appears in the human guise of Lord Victor Nefarius?", "Nefarian", },
			{ "What entity made a pact with N`Zoth and was later freed from the blade she was imprisoned in?", "Xal'atath", },
			{ "What evidence drove Prince Arthas to slaughter the people of Stratholme during the Third War?", "Tainted grain", },
			{ "What freed the Nightfallen from their addiction to the Nightwell?", "Fruit of the Arcan’dor", },		
			{ "What is a grummle`s most prized personal possession?", "A Luckydo", },
			{ "What is the highest rank that can be bestowed on a night elf Watcher?", "Warden", },
			{ "What is the highest rank bestowed on a druid?", "Archdruid", },		
			{ "What is the name of Tirion Fordring`s gray stallion?", "Mirador", },
			{ "What is the name of the bridge that connects the Arathi Highlands and the Wetlands?", "Thandol Span", },
			{ "What is the name of the desert that surrounds the Caverns of Time?", "Tanaris", },
			{ "What is the name of the mate of Har`koa?", "Loque’nahak", },
			{ "What is the name of the red dragon whose skull is on display in the Hall of Explorers?", "Tyranastrasz", },
			{ "What phrase means 'Safe journey' in the language of the draenei?", "Dioniss aca", },
			{ "What phrase means 'Thank you' in draconic, the language of dragons?", "Belan shi", },
			{ "What pit lord was the ruler of Outland before being imprisoned by Illidan Stormrage?", "Magtheridon", },
			{ "What planet do the draenei originate from?", "Argus", },
			{ "What ritual are souls in Revendreth required to go through in order to attain cleansing", "Ritual of absolution", },
			{ "What was in the Chalice of Rebirth that Gul`dan offered the orcs?", "The blood of Mannoroth", },
			{ "What was the name of the first pandaren to ever tame a cloud serpent?", "Jiang", },
			{ "What was the name of the human that kept Thrall as a slave in Durnholde Keep?", "Aedelas Blackmoore", },
			{ "What was the name of the human who helped Thrall escape his imprisonment in Durnholde Keep?", "Taretha Foxton", },
			{ "What was the name of the once benevolent spiritual leader in Stormwind City that sided with Deathwing?", "Benedictus", },
			{ "Where was Dalaran originally located in the Eastern Kingdoms?", "Hillsbrad Foothills", },
			{ "Which Alliance city located in Darkshore was destroyed by Deathwing`s return?", "Auberdine", },
			{ "Which apothecary cannot be found in Shadowfang Keep during the Love is in the Air event?", "Copeland", },
			{ "Which arm and which eye did Zul`jin lose during his captivity and eventual escape?", "Right eye, Left Arm", },
			{ "Which goblin cartel is known for plundering the natural resources of Azeroth?", "Venture Company", },
			{ "Which musical trinket could be used to invoke spontaneous dancing in others against their will?", "Piccolo of the Flaming Fire", },
			{ "Which night elf was appointed the jailor of Illidan Stormrage?", "Maiev Shadowsong", },
			{ "Which of the following is not a possible result from drinking a Noggenfogger Elixer?", "You breathe fire", },
			{ "Which of the following is not an orc clan?", "Bloodfang", },
			{ "Which of these is the correct name for King Varian Wrynn`s wife?", "Tiffin Ellerian Wrynn", },
			{ "Which orc was responsible for opening numerous portals on Draenor and shattering the orc homeworld?", "Ner’zhul", },
			{ "Which paladin was not among the five when the Silver Hand was originally created?", "Alexandros", },
			{ "Which son of an Alliance traitor would one day become a leader of the Syndicate?", "Aliden", },
			{ "Which war saw the destruction of both Darnassus and the Undercity?", "The Fourth War", },
			{ "While working as a tutor, Stalvan Mistmantle became obsessed with one of his students, a young woman named Tilloa. What was the name of her younger brother?", "Giles", },
			{ "White wolves were once the favored mounts of which orc clan?", "Frostwolf clan", },
			{ "Who became Ragnaros` second Majordomo, protecting the entrance of Sulfuron Keep in the Firelands?", "Majordomo Staghelm", },
			{ "Who became the Lich King after Arthas was defeated?", "Bolvar Fordragon", },
			{ "Who became the current Arbiter in Oribos?", "Pelagos", },
			{ "Who is known as 'the Speaker?'", "Magni Bronzebeard", },
			{ "Who is the current leader of the gnomish people?", "Gelbin Mekkatorque", },
			{ "Who was Jaina Proudmoore`s mentor in the Kirin Tor?", "Archmage Antonidas", },
			{ "Who was the brother of Varok Saurfang and the only orc to fight in the War of the Ancients?", "Broxigar", },
			{ "Who was the first death knight to be created on Azeroth?", "Teron Gorefiend", },
			{ "Who was the first satyr to be created?", "Xavius", },
			{ "Who was the first to leave Pandaria on the back of the sea turtle, Shen\-zin Su?", "Liu Lang", },
			{ "Who was the mighty proto-dragon captured by Loken and transformed into Razorscale?", "Veranus", },
			{ "Who was the naga lieutenant of Illidan and once handmaiden of Queen Azshara?", "Vashj", },
			{ "Who was the original Aspect of the blue dragonflight", "Malygos", },
			{ "Who were the three young twilight drakes guarding twilight dragon eggs in the Obsidian Sanctum?", "Tenebron, Vesperon, and Shadron", },
			{ "Whose tomb includes the inscription 'May the bloodied crown stay lost and forgotten'?", "King Terenas Menethil II", },
		}
		
		if ( vC_tString == "That is correct!" and vC_Historian ~= nil ) then
			GossipFrameCloseButton:Click()
			vC_Historian:Hide()
			return
		end
		
		for i = 1, #vC_Data do
			if ( string.find(vC_tString,vC_Data[i][1],46,true) ~= nil ) then
				vC_HistorianT:SetText(vC_Data[i][2])
				break
			end
		end
	end
	-- Darkmoon Faire Daily
	if ( vC_BMU == 407 ) then
		-- ZoneID 407 Darkmoon Island
		-- Darkmoon Game Prize ItemID 93724 (Auto Open when In Bag)
		-- Teleport User Back after using Cannon
		if ( UnitName("target") == "Teleportologist Fozlebub" ) then
			local info = GetOptions()
			for j, v in pairs(info) do
				if string.find(v.name,"Teleport me") ~= nil then
					SelectOption(GetOptions()[j].gossipOptionID)
					_G["StaticPopup1Button1"]:Click()
					break
				end
			end
		end
		local vC_tQuestID, vC_tNPCName, vC_tQuestName = nil, nil, nil
		for i = 1, #vC_Darkmoon_Daily do
			if ( UnitName("target") == vC_Darkmoon_Daily[i][2] ) then
				vC_tQuestID = vC_Darkmoon_Daily[i][1]
				vC_tNPCName = vC_Darkmoon_Daily[i][2]
				break
			end
		end
		if ( vC_tQuestID == nil ) then return end
		-- QUEST already picked up, but need to START the EVENT
		if ( IsOnQuest(vC_tQuestID) and not ReadyForTurnIn(vC_tQuestID) and not IsComplete(vC_tQuestID) ) then
			local info = GetOptions()
			for j, v in pairs(info) do
				if string.match(v.name,"(Darkmoon Game Token)") ~= nil then
					SelectOption(GetOptions()[j].gossipOptionID)
					break
				end
			end
		end
		-- Auto Remove Buff from Firebird Challenge
		if ( IsComplete(vC_tQuestID) and UnitName("target") == "Ziggie Sparks" ) then
			for i = 1, 32 do
				local vC_Quest_tVal = UnitBuff("player",i)
				if ( vC_Quest_tVal == "Wings of Flame" ) then
					CancelUnitBuff("player", i)
					break
				end
			end
		end
	end
	-- Fishing Dragonflight Repeat Turn-ins
	if ( vC_BMU == 2022 ) then
		if ( UnitName("target") == "Khuri" ) then
			SelectAvailableQuest(70200)
			C_Timer.After(1, function() CompleteQuest() end)
			C_Timer.After(3, function() GetQuestReward() end)
		end
	end
	-- Court of Stars Gossip
	if ( vC_BMU == 761 or vC_BMU == 762 or vC_BMU == 763 ) then
		if ( vC_CoS_Hint == nil ) then
			local vC_CoS_Hint = CreateFrame("Frame", "vC_CoS_Hint", PlayerFrame, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_CoS_Hint, 16, 1)
				vC_CoS_Hint:SetSize(167,120)
				vC_CoS_Hint:SetPoint("TOPRIGHT", PlayerFrame, "TOPLEFT", 20, -20)
				vC_CoS_Hint:SetClampedToScreen(true)
				vC_CoS_Hint:SetMovable(true)
				vC_CoS_Hint:EnableMouse(true)
				vC_CoS_Hint:RegisterForDrag("LeftButton")
				vC_CoS_Hint:SetScript("OnDragStart", function(s) s:StartMoving() end)
				vC_CoS_Hint:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
				local vC_CoS_Title = vC_CoS_Hint:CreateFontString(nil, "ARTWORK", "GameFontNormalOutline")
					vC_CoS_Title:SetHeight(32)
					vC_CoS_Title:SetPoint("CENTER", vC_CoS_Hint, "TOP", -8, -17)
					vC_CoS_Title:SetText("Court of Stars\nRumormongers")
				local vC_CoS_Close = CreateFrame("Button", "vC_CoS_Close", vC_CoS_Hint, "UIPanelCloseButton")
					vC_CoS_Close:SetSize(22,22)
					vC_CoS_Close:SetPoint("TOPRIGHT", vC_CoS_Hint, "TOPRIGHT", -3, -3)
					vC_CoS_Close:SetScript("OnClick", function() vC_CoS_Hint:Hide() end)

				local vC_Hdr = -32
				for i = 1, 6 do
					local vC_CoS_Ans = vC_CoS_Hint:CreateFontString("vC_CoS_Ans"..i, "ARTWORK", "GameFontGreen")
						vC_CoS_Ans:SetPoint("TOPLEFT", vC_CoS_Hint, "TOPLEFT", 10, vC_Hdr)
						vC_CoS_Ans:SetText("---")
						vC_Hdr = vC_Hdr - 14
				end
		else
			vC_CoS_Hint:Show()
		end
		
		local g = C_GossipInfo.GetOptions()
		for j, v in pairs(g) do
			if (
				( string.find(v.name,"Send a signal to") ~= nil ) or
				( string.find(v.name,"Go ahead.") ~= nil and UnitName("target") == "Ly'leth Lunastre" ) or 
				( string.find(v.name,"Yes, take me back.") and UnitName("target") == "Dusk Lily Agent" ) or
				( string.find(v.name,"Go on..") ~= nil and UnitName("target") == "Chatty Rumormonger" )
			)
			then
				C_GossipInfo.SelectOption(v.gossipOptionID)
			end
		end

		local vC_Gossip = {
		-- Gender, Male/Female
			{ 1, "saw him entering the manor alongside the", "male", },
			{ 1, "is here and he's very good looking", "male", },
			{ 1, "somewhere that the spy isn't female", "male", },
			{ 1, "said he would not stop asking questions", "male", },
			{ 1, "our new guest isn't male", "female", },
			{ 1, "and she's quite the sight to behold", "female", },
			{ 1, "saw both her and Elisande arrive", "female", },
			{ 1, "some woman has been constantly asking", "female", },
		-- Long/Short Sleeves
			{ 2, "covering up their arms with long sleeves", "long sleeves", },
			{ 2, "outfit has long sleeves tonight", "long sleeves", },
			{ 2, "long sleeves earlier in the evening", "long sleeves", },
			{ 2, "has long sleeves on", "long sleeves", },
			{ 2, "hates wearing long sleeves", "short sleeves", },
			{ 2, "wears short sleeves to keep their arms", "short sleeves", },
			{ 2, "was wearing. It did not have long sleeves", "short sleeves", },
			{ 2, "cool air and is not wearing long sleeves", "short sleeves", },
		-- Light/Dark Vest
			{ 3, "is wearing a lighter vest to tonight's", "light vest", },
			{ 3, "is not wearing a darker vest tonight", "light vest", },
			{ 3, "prefers the style of light colored vest", "light vest", },
			{ 3, "definitely prefers darker clothing", "dark vest", },
			{ 3, "enjoys darker colored vests", "dark vest", },
			{ 3, "vest is a dark, rich shade", "dark vest", },
			{ 3, "avoiding light colored clothing to try", "dark vest", },
		-- Type of Pouch; Gold, Magicial, Book, Potions
			{ 4, "loves gold and a belt pouch filled with it", "pouch on belt", },
			{ 4, "belt pouch is lined with fancy threading", "pouch on belt", },
			{ 4, "belt pouch is filled with gold to show off", "pouch on belt", },
			{ 4, "carries a magical pouch around at all times", "pouch on belt", },
			{ 4, "away their last potion and no longer", "nothing on belt", },
			{ 4, "is not carrying any potions around", "nothing on belt", },
			{ 4, "loves to read and always carries", "book on belt", },
			{ 4, "always has a book of written secrets", "book on belt", },
			{ 4, "brought along potions, i wonder why", "potion on belt", },
			{ 4, "brought along some potions", "potion on belt", },
			{ 4, "has potions at the belt", "potion on belt", },
			{ 4, "as an alchemist and carrying potions", "potion on belt", },
		-- Wears Capes or Not
			{ 5, "dislikes capes and refuses to wear one", "no cape", },
			{ 5, "left their cape in the palace before coming", "no cape", },
			{ 5, "enjoys wearing capes", "wear cape", },
			{ 5, "came in earlier wearing a cape", "wear cape", },
		-- Wears Gloves or Not
			{ 6, "is likely to be bare handed somewhere", "no gloves", },
			{ 6, "never has gloves on", "no gloves", },
			{ 6, "dislikes wearing gloves", "no gloves", },
			{ 6, "avoids having gloves on, in case some quick", "no gloves", },
			{ 6, "always wears gloves", "wear gloves", },
			{ 6, "carefully hides their hands", "wear gloves", },
			{ 6, "always dons gloves", "wear gloves", },
			{ 6, "wears gloves to cover obvious scars", "wear gloves", },
		}

		if ( UnitName("target") == "Chatty Rumormonger" ) then
			for i = 1, #vC_Gossip do
				if ( string.find(C_GossipInfo.GetText(),vC_Gossip[i][2]) ~= nil ) then
					_G["vC_CoS_Ans"..vC_Gossip[i][1]]:SetText(vC_Gossip[i][3])
					C_GossipInfo.CloseGossip()
				end
			end
		end
		if ( UnitName("target") == "Dusk Lily Agent" ) then
			for i = 1, 6 do _G["vC_CoS_Ans"..i]:SetText("---") end
			vC_CoS_Hint:Hide()
			_G["StaticPopup1Button1"]:Click()
		end
	end
	
	-- Teleport Quick Teleport out of:
	local NPC_Teleport = {
		-- Legion
		{ 712, "Drelanim Whisperwind", "I will let the other wardens know of Cordana's fate.", },	-- vault of the wardens
		{ 733, "Malfurion Stormrage", "I need to be transported out of here.", },					-- Darkheart Thicket
		{ 849, "Illidan Stormrage", "I need to be transported out of here.", },						-- cathedral of eternal night
		-- Battle for Azeroth
		{ 1367, "Anduin Wrynn", "I'm ready to leave.", },											-- battle of dazar'alor
		{ 1520, "First Arcanist Thalyssra", "Teleport to the Tidal Conflux.", },					-- the eternal palace
	}
	for a, b in pairs(NPC_Teleport) do
		if vC_BMU == NPC_Teleport[a][1] and UnitName("target") == NPC_Teleport[a][2] then
			local vC_GossipOptions = C_GossipInfo.GetOptions()
			for j, v in pairs(vC_GossipOptions) do
				if ( string.find(v.name,NPC_Teleport[a][3]) ~= nil ) then
					C_GossipInfo.SelectOption(v.gossipOptionID)
					_G["StaticPopup1Button1"]:Click()
					break
				end
			end
			break
		end
	end
end

-------------------------------------------------------
-- Darkmoon Faire Map Free Tickets
-------------------------------------------------------
function vC_ChatAnnouncer_Temp()
	--if vC_pName ~= "Kynre" then
	for i = 1, #vC_Account do
		if ( vC_pName == vC_Account[i][2] ) then
			if ( vC_Account[i][1] == 0 ) then
				break
			else
				-- DMF Ticket
				a = "DMF: "..(IsQuestFlaggedCompleted(38934) and "Done" or "Need")
				-- MoP Heroic Deed
				eF = UnitFactionGroup("player")
				b = "MoP Deed: "..(eF == "Alliance" and (IsQuestFlaggedCompleted(32900) and "Done" or "Need") or (IsQuestFlaggedCompleted(32901) and "Done" or "Need"))
				-- WoD "And No Mace!"
				c = "WoD Mace:"..(IsQuestFlaggedCompleted(37167) and "Done" or "Need")
				--d = strlen(vC_pName)*2
				--d = (d > 24 and (12 - d) or (24 - d))
				--e = (string.rep(".",d)..vC_pName)
				--SendChatMessage((e.." - "..a..", "..b..", "..c), "WHISPER", "Common", "Kynre")
				print(vC_pName.." - "..a..", "..b..", "..c)
				break
			end
		end
	end
	--end
end
-------------------------------------------------------
-- Darkmoon Faire Map Free Tickets
-------------------------------------------------------
function vC_DarkmoonFaire_FreeTickets()
	--QuestID: 38934
	--Get 100 Fish then see Galissa Sundew for Map
	--/way 42.00, 91.33 C1 (First Map, Bag) 38934
	--/way 53.12, 60.49 C2 (in sandpit)
	--/way 52.50, 85.19 C3 (behind Careless Carnie)
	--/way 52.40, 30.20 C4 (under Darkmoon banner by the road)
	--/way 22.10, 29.10 C5 (under the shipwreck at north-east small island)
	a = IsQuestFlaggedCompleted(38934)
	b = UnitLevel("player") -- Need 25+ for DMF Replicas
	if (not a and b >= 25) then
		print("DMF Free Ticket: You're missing out!")
		DMF = {
			{ .525, .885, "Step 1:\nGive 100 Fishes to `Galissa Sundew`\nfor `Faded Treasure Map`", },
			{ .420, .914, "Step 2:\nBag inside the tent", },
			{ .532, .607, "Step 3:\nIn the sandpit", },
			{ .526, .849, "Step 4:\nBy Careless Carnie in the correl", },
			{ .520, .304, "Step 5:\nBy Darkmoon banner by the road", },
			{ .215, .291, "Step 6:\nIn the water by shipwreck - a small island, NE of DMF", },
		}
		for i = 1, #DMF do
			TomTom:AddWaypoint( 407, DMF[i][1], DMF[i][2], { title = DMF[i][3], from = WT, } )
		end
		-- Need Notification in New Interface
	end
end
-------------------------------------------------------
-- MoP Group Finder Bag: Heroic Deeds
-------------------------------------------------------
function vC_MoP_HeroicDeed()
	--Trials Actions
	--1. Pick up quest "Heroic Deeds" in your faction's shrine (32900 Alliance, 32901 Horde)
	--2. Talk to Lorewalker Cho and pick up quest "The King and the Council" (32806)
	--3. Queue and complete normal or heroic "Blood in the Snow"
	--4. Turn in "The King and the Council," get normal scenerio cache
	--5. Pick up quest "The Warchief and the Darkness" from Lorewalker Cho (32807)
	--6. Queue and complete normal or heroic "Dark Heart of Pandaria"
	--7. Turn in "The Warchief and the Darkness," get normal scenario cache
	--8. Turn in quest "Heroic Deeds," get heroic scenario cache
	eF = UnitFactionGroup("player")
	a = (eF == "Alliance" and IsQuestFlaggedCompleted(32900) or IsQuestFlaggedCompleted(32901))
	if not a then
		a = (a and "Done" or "Not Done")
		b = (IsQuestFlaggedCompleted(32806) and "Done" or "Not Done") -- The King and the Council
		c = (IsQuestFlaggedCompleted(32807) and "Done" or "Not Done")  -- The Warchief and the Darkness
		print("MoP Group Finder Bag:  Need to do it - " .. a .. "," .. b .. "," .. c)
	end
end
-------------------------------------------------------
-- WoD: And No Maces!
-------------------------------------------------------
function vC_WoD_AndNoMaces()
	a = IsQuestFlaggedCompleted(37167)
	if not a then print("Need To Do 'And No Maces!' from your Garrison Inn") end
end
-------------------------------------------------------
-- Mark Known Coords for 'Robes of the Shadowcaster' (ItemID: 1297)
-------------------------------------------------------
function vC_Coord_RobeoftheShadowcaster()
	Robe = {
		{ .313, .422 }, { .284, .406 }, { .248, .433 }, { .256, .476 }, { .295, .508 }, { .289, .474 },
	}
	for i = 1, #Robe do
		TomTom:AddWaypoint( 14, Robe[i][1], Robe[i][2], { title = "Robes of the Shadowcaster", from = WT, } )
	end
end
-------------------------------------------------------
-- Balance of Power (Unique to each Class) - Quest/Achiv
-------------------------------------------------------
function vC_Legion_BalanceOfPower()
	local BoP = {
		43496, 40668, 43517, 43514, 43518, 43519, 43520, 43521, 43522, 43938,
		43527, 43937, 43523, 40673, 43525, 40675, 43524, 40678, 43526, 40603,
		40608, 40613, 40672, 40614, 40615, 43528, 43898, 43531, 43530, 43532, 43533,
	}
	local LightHeart = {
		44009, -- Paladin Only
		44257, -- All Other Classes
		44004,
		44153,
	}
	local _,_,_,a = GetAchievementCriteriaInfo(11152,1)
	local _,_,_,b = GetAchievementCriteriaInfo(11153,1)
	local _,_,_,c = GetAchievementCriteriaInfo(11154,1)

	BoPQuest = IsQuestFlaggedCompleted(43496)
	if ( (a < 30 or b < 200 or c < 1000) and BoPQuest ) then
		print("|CFF0AC800Class Hall To Do|r: "..
			(a >= 30 and "" or "Dung: "..a),
			(b >= 200 and "" or "WQuest: "..b),
			(c >= 1000 and "" or "Honor: "..c)
		)
	end
end
-------------------------------------------------------
-- Shadowlands: Zereth Mortis - Weekly Mirror
-------------------------------------------------------
function vC_Shadowland_Unity()
	vC_Unity_Chain = {
		-- Into the Unknown
		{ 64942, 64944, 64945, 65456, 64947, 64950, 64949, 64951, 65271, 64953, 64952, 64957, 64958, },
		-- We Battle Onward
		{ 65768, 65772, 65771, 64794, 64796, 64797, 64815, 64814, 64817, 64818, 64821, 64822, 64820, 64823, 64824, 64825, },
		-- Forming an Understanding
		{ 64218, 64219, 64223, 64224 ,64225 ,64227 ,64226, 64228, 65149, 64230, 65305, },
		-- Forging a New Path
		{ 65335, 64830, 64833, 64832, 64831, 64837, 64834, 64838, 64969, 64836, 64835, 64839 ,64841 ,65331 ,64840 ,64842 ,64843, 64844, },
		-- Crown of Wills
		{ 64799, 64800, 64802, 64801, 64804, 61803, 64805, 64853, 64809, 64811, 64810, 64806, 64807, 64808, 64798, 64812, 64813, 64816, },
		-- A Means to an End
		{ 64875, 64876, 64878, 65245, 64888, 64935, 64889, 64936, 64937, 65237, 65328, },
		-- Starting Over
		{ 64879, 64723, 64733, 64718, 64706, 64720, 64722, 64727, 64726, 64725, 64962, 64728, 64730, 64731, 64729, 65238, },
	}
end
-------------------------------------------------------
-- Shadowlands: Venthyr - Weekly Mirror
-------------------------------------------------------
function vC_Coord_Mirror_Venthyr()
	local vC_Specific_PetBattle = { 61879, 61883, 61885, 61886, }

	for i = 1, #vC_Specific_PetBattle do
		if (IsActive(vC_Specific_PetBattle[i])) then i = i break end
	end
	local vC_Area_Names = { "Dominance Keep Mirror", "The Banewood Mirror", "Halls of Atonement Mirror", "Dominance Keep Mirror", }
	local vC_Mirror_Locs = {
		{
			{ .294, .372, "G1 - Cliff North of Sinfall - Room with Cooking Pot", },
			{ .271, .216, "G1 - Dominance Keep - Room with Elite Spider", },
			{ .404, .733, "G1 - Dredhollow - House with Sleeping Wildlife", },
		},{
			{ .390, .521, "G2 - Charred Ramparts - Ground Floor", },
			{ .588, .678, "G2 - Stonevigil Overlook - Corner House next to Feeders' Thicket", },
			{ .709, .436, "G2 - Halls of Atonement - Room with Disciples", },
		},{
			{ .726, .436, "G3 - Halls of Atonement - Crypt with Disciples", },
			{ .403, .771, "G3 - Dredhollow - House with Fighting Wildlife", },
			{ .771, .654, "G3 - Caretaker's Manor - Elite Mobs", },
		},{
			{ .296, .258, "G4 - Dominance Keep - Room with Elite Soulbinder", },
			{ .207, .542, "G4 - The Shrouded Asylum - Entrance of Main Building", },
			{ .551, .356, "G4 - Redelav District - Inside Crypt with Nobles", },
		}
	}
	print("Mirror: |cFF00FE00"..vC_Area_Names[i].."|r")
	TomTom:AddWaypoint( 1525, vC_Mirror_Locs[i][1], vC_Mirror_Locs[i][2], { title = vC_Mirror_Locs[i][3], from = vC_WT, } )
	TomTom:AddWaypoint( 1525, vC_Mirror_Locs[i][1], vC_Mirror_Locs[i][2], { title = vC_Mirror_Locs[i][3], from = vC_WT, } )
	TomTom:AddWaypoint( 1525, vC_Mirror_Locs[i][1], vC_Mirror_Locs[i][2], { title = vC_Mirror_Locs[i][3], from = vC_WT, } )
end
-------------------------------------------------------
-- Ardenweald - Mark Coords for Mystic Rainbowhorn
-------------------------------------------------------
function vC_Coord_MysticRainbowhorn()
	Horn = {
		{ .250, .500, }, { .270, .450, }, { .280, .450, }, { .294, .558, },
		{ .300, .360, }, { .310, .460, }, { .338, .446, }, { .338, .455, },
		{ .341, .458, }, { .350, .590, }, { .384, .659, }, { .387, .657, },
		{ .390, .600, }, { .412, .717, }, { .448, .192, }, { .500, .200, },
		{ .554, .558, }, { .570, .510, }, { .584, .610, }, { .650, .290, },
		{ .678, .547, }, { .400, .700, }, { .550, .730, }, { .380, .580, },
	}
	for i = 1, #Horn do
		TomTom:AddWaypoint( 1565, Horn[i][1], Horn[i][2], { title = "Loc Horn #"..i, from = WT, } )
	end
end
-------------------------------------------------------
-- Weekly Treasure for Necrolord with Professor
-------------------------------------------------------
function vC_Coord_Treasures_Necrolord()
	Chests = {
		-- Aldrenweld
		{ 1565, .496, .762 },
		{ 1565, .507, .756 },
		{ 1565, .508, .732 },
		{ 1565, .508, .754 },
		{ 1565, .518, .796 },
		{ 1565, .521, .741 },
		{ 1565, .521, .773 },
		{ 1565, .527, .787 },
		{ 1565, .530, .757 },
		 -- Revendreth
		{ 1525, .415, .674 },
		{ 1525, .423, .634 },
		{ 1525, .423, .635 },
		{ 1525, .433, .669 },
		{ 1525, .439, .648 },
		{ 1525, .440, .616 },
		{ 1525, .446, .677 },
		{ 1525, .458, .641 },
		{ 1525, .458, .673 },
	}	
	for i = 1, #Chests do
		TomTom:AddWaypoint( Chests[i][1], Chests[i][2], Chests[i][3], { title = "Buried Chest", from = WT, } )
	end
end
-------------------------------------------------------
-- Locations of Souls in Dragonflight
-------------------------------------------------------
function vC_Coord_SoulCapture()
	Souls = {
		{ 2022, .528, .306, "Earth Soul", },
		{ 2023, .242, .335, "Air Soul", },
		{ 2023, .556, .772, "Frost Soul", },
		{ 2024, .786, .388, "Fire Soul", },
	}
	for i = 1, #Souls do
		TomTom:AddWaypoint( Souls[i][1], Souls[i][2], Souls[i][3], { title = Souls[i][4], from = WT, } )
	end
end
-------------------------------------------------------
-- Reminder of Quest that Requires Thinking or Checking WoWhead
-------------------------------------------------------
function vC__Quest_Refresher()
	--	A 'Cheat' for Order of the Quest in Ohn Plains
		ClansOfthePlains = IsOnQuest(66969)
		if ( ClansOfthePlains ) then print("Teeral -> Oh'nir -> Nokhud -> Shikaar") end

	--	A 'Cheat' for Element Whispers (Dig in ZC)
		ElementWhispers = IsOnQuest(75621)
		if ( ElementWhispers ) then print("N Fire (Behind Elementals) -> E Air -> S Water -> W Earth") end

	--	A 'Cheat' for Liars of Spirit (Dig in ZC)
		LiarsofSpirit = IsOnQuest(76081)
		if ( LiarsofSpirit ) then print("Regal Statue") end

	--	A 'Cheat' for Limbo (Kyrian Anima Conductor Daily)
		Limbo_Kyrian = IsOnQuest(62280)
		if ( Limbo_Kyrian ) then print("Naaru = L S S, Child = S L S, Knight = L L L, Protector = S S S, Sapper = S L L") end

end
-------------------------------------------------------
-- Reminder of WQ that Requires Thinking or Checking WoWhead
-------------------------------------------------------
function vC_Active_WQ()
	-- Revendreth Venthyr WQ Tea Party for Ember Courts
		VenA = IsActive(59848) --Tea Tales: Theotar
		if ( VenA ) then print(GetTitleForQuestID(VenA).." WQ is up now at Revendreth!") end
		VenB = IsActive(59850) --Tea Tales: Vulca
		if ( VenB ) then print(GetTitleForQuestID(VenB).." WQ is up now at Revendreth!") end
		VenC = IsActive(59852) --Tea Tales: Gubbins and Tubbins
		if ( VenC ) then print(GetTitleForQuestID(VenC).." WQ is up now at Revendreth!") end
		VenD = IsActive(59853) --Tea Tales: Lost Sybille
		if ( VenD ) then print(GetTitleForQuestID(VenD).." WQ is up now at Revendreth!") end

	--	Check for 'Greater Invasion Point: Matron Folnuna' on Argus
		MatronFolnuna = IsActive(49199)
		if ( MatronFolnuna ) then print("Greater Invasion Point: Matron Folnuna is up") end

	-- Check for 'Claws for Concern' WQ in Dream Emerald
		ClawsForConcerns = IsActive(49199)
		if ( ClawsForConcerns ) then print("Claws for Concern WQ is up") end

	-- Legion Legionaries for Monk?? (Need Verify)
		MonkA = IsActive(44194)
		MonkB = IsActive(44035)
		if ( MonkA or MonkB ) then print("Torrentius WQ is up now at Azsuna!") end

	-- Rare Item from SUPER Rare that Spawns from this particular WQ
		SummonYourSins = IsActive(60656)
		if ( SummonYourSins and (classIdx == 1 or classIdx == 2 or classIdx == 6) ) then print("Summon Your Sins is up in Revendreth!") end
end
-------------------------------------------------------
-- Achievement - Just One More Thing
-------------------------------------------------------
function vC_Achiv_Just_One_More_Thing() -- Archival Achiv, must be 'RESEARCH', not Technoscyering
	local vC_tAnyDB = {}
	WQ_Title = {
		"Lost Atheneum",
		"The Riverbed",
		"Igira's Watch",
		"Gaze of Neltharion",
		"Concord Observatory",
		"Winglord's Perch",
	}
	WQ_ID = {
		{ 79601, 79600, 79599, }, -- Lost Atheneum
		{ 79596, 79597, 79598, }, -- The Riverbed
		{ 79604, 79603, 79602, }, -- Igira's Watch
		{ 79607, 79606, 79605, }, -- Gaze of Neltharion
		{ 79610, 79609, 79608, }, -- Concord Observatory
		{ 79613, 79612, 79611, }, -- Winglord's Perch
	}
	tinsert(vC_tAnyDB,"Just One More Thing Achiv\n\n")
	for j = 1, #WQ_Title do
		tinsert(vC_tAnyDB,(WQ_Title[j].."\n"))
		vC_tAnyValue = ""
		for i = 1, #WQ_ID[j] do
			vC_tAnyValue = vC_tAnyValue..WQ_ID[j][i]..": "..(IsQuestFlaggedCompleted(i) and "|cFF90EE90Y|r" or "|cFF02D8E9N|r")..(i ~= 3 and " " or "\n")
		end
		tinsert(vC_tAnyDB, vC_tAnyValue)
	end
	vC_TestResultArea:SetText(table.concat(vC_tAnyDB,""))
end
-------------------------------------------------------
-- Monk Quest Exist?
-------------------------------------------------------
function vC_Monk_Quest()
	vC_Monk_Training = {
		31856,
		31834,
		31840,
		31855,
		31833,
		31841,
		31857,
		31835,
		31842,
		31858,
		31836,
		31843,
		31859,
		31837,
		31844,
		31860,
		31838,
		31845,
		31861,
		31839,
		31846,
		31989,
		31944,
	}
end