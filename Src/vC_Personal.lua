-- In Progress 05/26/2024
local vC_AppName, vC_App				= ...
if not ( vC_Run_Personal ) then return end

-------------------------------------------------------
-- Collect Simple Information of Your Character
-------------------------------------------------------
function vC_Display_DR_Activity()
	local lfr = CreateFrame("Button", "vC_Dal_LFR", Minimap)
		lfr:SetSize(22,22)
		lfr:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 10, -15)
		lfr:SetNormalTexture("Interface\\CHATFRAME\\UI-ChatWhisperIcon")
		lfr:SetMovable(false)
		lfr:SetScript("OnClick", function(s)
			--/run print(C_Map.GetMapInfo(C_Map.GetBestMapForUnit("player")).name)
			local vC_m = C_Map.GetBestMapForUnit("player")
			local UnitName = UnitName("player")
			local RealmName = GetRealmName()
			if (vC_m == 619) then SlashCmdList["AllTheThings"]("npcid:111246") end -- Legion LFR (Archmage Timear)
			if (vC_m == 1165) then SlashCmdList["AllTheThings"]("npcid:177193") end -- Battle of Azeroth LFR (Horde Kiku)
			if (vC_m == 1161) then SlashCmdList["AllTheThings"]("npcid:177193") end -- Battle of Azeroth LFR (Alliance Kiku)
			if (vC_m == 1550) then SlashCmdList["AllTheThings"]("npcid:205959") end -- Shadowland LFR (Ta'elfar)
			--if (vC_m == 1978) then SlashCmdList["AllTheThings"]("npcid:000000") end -- Dragonflight LFR (xxx)
			if (vC_m == 42) then SlashCmdList["AllTheThings"]("instanceid:860") end -- Legion D Return to Karazhan

			if (UnitName == "Vandiel" and RealmName == "Korgath") then -- Enchanting
				SlashCmdList["AllTheThings"]("instanceid:707") -- D Vault of Warden
			end
		end)
		lfr:SetScript("OnEnter", function(s) vC_cToolTips(s,8,1,"Open List of Dungeon for Recipes\nOr Raid List based on Zone",0) end)
		lfr:SetScript("OnLeave", function(s) vC_cToolTips(0) end)

		local wb = CreateFrame("Button", "vC_WB_List", Minimap)
		wb:SetSize(28,28)
		wb:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", -10, -20)
		wb:SetNormalTexture("Interface\\ENCOUNTERJOURNAL\\UI-EncounterJournalTextures")
		wb:GetNormalTexture():SetTexCoord(0.898, 0.269, 0.898, 0.322, 1, 0.269, 1, 0.322)
		wb:SetMovable(false)
		wb:SetScript("OnClick", function(s)
			local IsActive = C_TaskQuest.IsActive
			local vC_m = C_Map.GetBestMapForUnit("player")
			local IsOnQuest = C_QuestLog.IsOnQuest
			-- Garrison, Shadowmoon Valleym, Spire of Arak, Nagrand, Talador, Frostfire Ridge, Gorgrond
			--if (vC_m == 582 or vC_m == 000 or vC_m == 542 or vC_m == 000 or vC_m == 000 or vC_m == 000) then
				if IsOnQuest(37142) then SlashCmdList["AllTheThings"]("questid:37142") end -- Ogre Ancestry (Bloodsmaul Slag)
				if IsOnQuest(37145) then SlashCmdList["AllTheThings"]("questid:37145") end -- Budd's Gambit (Iron Dock)
				if IsOnQuest(37146) then SlashCmdList["AllTheThings"]("questid:37146") end -- Go Fetch (Auchindoun)
				if IsOnQuest(37147) then SlashCmdList["AllTheThings"]("questid:37147") end -- Sky Dancers (Skyreach)
				
				--SlashCmdList["AllTheThings"]("itemid:118924") -- Cache of Arms (One Time Quest - And No Maces!)
				--SlashCmdList["AllTheThings"]("itemid:119037") -- Supply of Storied Rarities
				--SlashCmdList["AllTheThings"]("itemid:119040") -- Cache of Mingled Treasures (Ogre Ancestry)
				--SlashCmdList["AllTheThings"]("itemid:119041") -- Strongbox of Mysterious Treasures (Budd's Gambit)
				--SlashCmdList["AllTheThings"]("itemid:119042") -- Crate of Valuable Treasures (Go Fetch)
				--SlashCmdList["AllTheThings"]("itemid:119043") -- Trove of Smoldering Treasures (Sky Dancer)
			--else			
				if IsActive(37464) then SlashCmdList["AllTheThings"]("npcid:083746") end -- WoD Rukhmar
			--	if IsActive(39380) then SlashCmdList["AllTheThings"]("npcid:094015") end -- WoD Supreme Lord Kazzak
			--		if IsActive(37460) then SlashCmdList["AllTheThings"]("npcid:081252") end -- WoD Drov the Ruiner
			--		if IsActive(37462) then SlashCmdList["AllTheThings"]("npcid:081535") end -- WoD Tarlna the Ageless
				
			--	if IsActive(43512) then SlashCmdList["AllTheThings"]("npcid:109943") end -- Legion Ana-Mouz
			--	if IsActive(43193) then SlashCmdList["AllTheThings"]("npcid:109331") end -- Legion Calamir
			--	if IsActive(43448) then SlashCmdList["AllTheThings"]("npcid:110378") end -- Legion Drugon the Frostblood
			--	if IsActive(43985) then SlashCmdList["AllTheThings"]("npcid:099929") end -- Legion Flotsam
			--	if IsActive(42819) then SlashCmdList["AllTheThings"]("npcid:108879") end -- Legion Humongris
			--	if IsActive(43192) then SlashCmdList["AllTheThings"]("npcid:108829") end -- Legion Levantus
			--	if IsActive(43513) then SlashCmdList["AllTheThings"]("npcid:110321") end -- Legion Na'zak the Fiend
			--	if IsActive(42270) then SlashCmdList["AllTheThings"]("npcid:107544") end -- Legion Nithogg
			--	if IsActive(42779) then SlashCmdList["AllTheThings"]("npcid:108678") end -- Legion Shar'thos
			--	if IsActive(42269) then SlashCmdList["AllTheThings"]("npcid:106981") end -- Legion The Soultakers
			--	if IsActive(44287) then SlashCmdList["AllTheThings"]("npcid:112350") end -- Legion Withered Jim
			--		if IsActive(47061) then SlashCmdList["AllTheThings"]("npcid:121124") end -- Legion Broken Isle Apocron
			--		if IsActive(46947) then SlashCmdList["AllTheThings"]("npcid:117239") end -- Legion Broken Isle Brutallus
			--		if IsActive(46948) then SlashCmdList["AllTheThings"]("npcid:117303") end -- Legion Broken Isle Malificus
			--		if IsActive(46945) then SlashCmdList["AllTheThings"]("npcid:117470") end -- Legion Broken Isle Si'vash
				if IsActive(49166) then SlashCmdList["AllTheThings"]("npcid:127535") end -- Legion Argus Inquisitor Meto
				if IsActive(49169) then SlashCmdList["AllTheThings"]("npcid:127528") end -- Legion Argus Matron Folnuna
				if IsActive(49167) then SlashCmdList["AllTheThings"]("npcid:127536") end -- Legion Argus Mistress Alluradel
				if IsActive(49170) then SlashCmdList["AllTheThings"]("npcid:127533") end -- Legion Argus Occularus
				if IsActive(49168) then SlashCmdList["AllTheThings"]("npcid:127531") end -- Legion Argus Pit Lord Vilemus
				if IsActive(49171) then SlashCmdList["AllTheThings"]("npcid:127532") end -- Legion Argus Sotanathor
					if IsActive(48982) then SlashCmdList["AllTheThings"]("npcid:125849") end -- Legion Argus IP: Aurinor
					if IsActive(49099) then SlashCmdList["AllTheThings"]("npcid:126547") end -- Legion Argus IP: Bonich
					if IsActive(49098) then SlashCmdList["AllTheThings"]("npcid:126120") end -- Legion Argus IP: Cen'gar
					if IsActive(49096) then SlashCmdList["AllTheThings"]("npcid:126593") end -- Legion Argus IP: Naigtal
					if IsActive(49097) then SlashCmdList["AllTheThings"]("npcid:125863") end -- Legion Argus IP: Sangua
					if IsActive(49091) then SlashCmdList["AllTheThings"]("npcid:126499") end -- Legion Argus IP: Val
				
			--	if IsActive(52163) then SlashCmdList["AllTheThings"]("npcid:136385") end -- BfA Tiragarde Sound Azurethos, The Winged Typhoon
			--	if IsActive(52166) then SlashCmdList["AllTheThings"]("npcid:140163") end -- BfA Stormsong Valley Warbringer Yenajz
				if IsActive(52157) then SlashCmdList["AllTheThings"]("npcid:140252") end -- BfA Drustvar Hailstone Construct
				if IsActive(52196) then SlashCmdList["AllTheThings"]("npcid:138794") end -- BfA Vol'dun Dunegorger Kraulok
			--	if IsActive(52169) then SlashCmdList["AllTheThings"]("npcid:132253") end -- BfA Nazmir Ji'arak
				if IsActive(52181) then SlashCmdList["AllTheThings"]("npcid:132701") end -- BfA Nazmir T'zane
			--		if IsActive(56056) then SlashCmdList["AllTheThings"]("npcid:152671") end -- BfA Nazjatar Wekemara
					if IsActive(56057) then SlashCmdList["AllTheThings"]("npcid:152697") end -- BfA Nazjatar Ulmath, the Soulbinder			
			--	if IsActive(55466) then SlashCmdList["AllTheThings"]("npcid:160970") end -- BfA Uldum Vuk'laz the Earthbreaker
			--		if IsActive(57157) then SlashCmdList["AllTheThings"]("questid:57157") end -- BfA Uldum The Black Empire
			--		if IsActive(55350) then SlashCmdList["AllTheThings"]("questid:55350") end -- BfA Uldum Amathet Advance
			--		if IsActive(56308) then SlashCmdList["AllTheThings"]("questid:56308") end -- BfA Uldum Aqir Unearthed
			--	if IsActive(58705) then SlashCmdList["AllTheThings"]("npcid:154638") end -- BfA Vale of Eternal Blossoms Grand Empress Shek'zara
			--		if IsActive(56064) then SlashCmdList["AllTheThings"]("questid:56064") end -- BfA Uldum The Black Empire
			--		if IsActive(57008) then SlashCmdList["AllTheThings"]("questid:57008") end -- BfA Uldum The Warring Clans
			--		if IsActive(57728) then SlashCmdList["AllTheThings"]("questid:57728") end -- BfA Uldum The Endless Swarm			
				if IsActive(52847) then SlashCmdList["AllTheThings"]("npcid:138122") end -- BfA Arathi Highland Doom's Howl
				if IsActive(52848) then SlashCmdList["AllTheThings"]("npcid:137374") end -- BfA Arathi Highland The Lion's Roar
				if IsActive(54895) then SlashCmdList["AllTheThings"]("npcid:148295") end -- BfA Darkshore Ivus the Decayed
				if IsActive(54896) then SlashCmdList["AllTheThings"]("npcid:144946") end -- BfA Darkshore Ivus the Forest Lord

				if IsActive(65695) then SlashCmdList["AllTheThings"]("npcid:182466") end -- SL Zereth Mortis Antros
				if IsActive(64531) then SlashCmdList["AllTheThings"]("npcid:178958") end -- SL The Maw Mor'geth, Tormentor of the Damned
				if IsActive(61816) then SlashCmdList["AllTheThings"]("npcid:167525") end -- SL Maldraxxus Mortanis
				if IsActive(61814) then SlashCmdList["AllTheThings"]("npcid:167526") end -- SL Revendreth Nurgash Muckformed
				if IsActive(61815) then SlashCmdList["AllTheThings"]("npcid:167527") end -- SL Ardenweald Oranomonus the Everbranching
				if IsActive(61813) then SlashCmdList["AllTheThings"]("npcid:167524") end -- SL Bastion Valinor, the Light of Eons
				
			--	if IsActive(69930) then SlashCmdList["AllTheThings"]("npcid:193535") end -- DF Dragon Isle Basrikron, the Shale Wing
			--	if IsActive(69927) then SlashCmdList["AllTheThings"]("npcid:193532") end -- DF Dragon Isle Bazual, the Dreaded Flame
			--	if IsActive(69928) then SlashCmdList["AllTheThings"]("npcid:193533") end -- DF Dragon Isle Liskanoth, the Futurebane
			--	if IsActive(69929) then SlashCmdList["AllTheThings"]("npcid:193534") end -- DF Dragon Isle Strunraan, the Sky's Misery
			--	if IsActive(74892) then SlashCmdList["AllTheThings"]("npcid:199853") end -- DF Zaralek Caverns The Zaqali Elders
			--	if IsActive(76367) then SlashCmdList["AllTheThings"]("npcid:209574") end -- DF Emerald Dream Aurostor, The Hibernating
				
			--	if IsActive(81630) then SlashCmdList["AllTheThings"]("npcid:221084") end -- TWW Isle of Dorn Kordac, the Dormant Protector
			--	if IsActive(82653) then SlashCmdList["AllTheThings"]("npcid:220999") end -- TWW The Ringing Deeps Aggregation of Horrors
			--	if IsActive(81653) then SlashCmdList["AllTheThings"]("npcid:221224") end -- TWW Hallowfall Shurral, Atrocity of the Undersea
			--	if IsActive(81624) then SlashCmdList["AllTheThings"]("npcid:221067") end -- TWW City of Threads Orta, the Broken Mountain		
			--end
		end)
		wb:SetScript("OnEnter", function(s) vC_cToolTips(s,8,1,"Open List of World Boss",0) end)
		wb:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
end
-------------------------------------------------------
-- Collect Simple Information of Your Character
-------------------------------------------------------
function vC_LeaveGroupIcon(arg)
	if ( vC_Leave_Group == nil ) then
		local vC_Leave_Group = CreateFrame("Button", "vC_Leave_Group", QueueStatusButtonIcon)
			vC_Leave_Group:SetSize(40,40)
			vC_Leave_Group:SetPoint("RIGHT", QueueStatusButtonIcon, "LEFT", -12, 0)
			vC_Leave_Group:SetNormalAtlas("XMarksTheSpot")
			vC_Leave_Group:SetMovable(false)
			vC_Leave_Group:SetScript("OnClick", function(s) C_PartyInfo.LeaveParty() end)
			vC_Leave_Group:SetScript("OnEnter", function(s) vC_cToolTips(s,8,1,"Click here to leave:\nParty, Raid, LFR or LFG",0) end)
			vC_Leave_Group:SetScript("OnLeave", function(s) vC_cToolTips(0) end)			
	end
	if ( QueueStatusButtonIcon:IsShown() ) then vC_Leave_Group:Show() else vC_Leave_Group:Hide() end
	--if ( IsInRaid() and arg == "LFG_PROPOSAL_DONE" and QueueStatusButtonIcon:IsShown() ) then vC_Leave_Group:Show() end
	--if ( not IsInRaid() and arg == "LFG_UPDATE" ) then vC_Leave_Group:Hide() end
end
-------------------------------------------------------
-- Collect Simple Information of Your Character
-------------------------------------------------------
function vC_CurrencyFix()
	local s = C_CurrencyInfo.GetCurrencyListSize()
	for i = 1, s do
		local data = C_CurrencyInfo.GetCurrencyListInfo(i)
		if (data == nil) then
			C_Timer.After(5, function() vC_CurrencyFix() end)
			break
		end
		if (data.isTypeUnused) then C_CurrencyInfo.SetCurrencyUnused(i,false) end
		C_CurrencyInfo.SetCurrencyBackpack(i, false)
		
		if (
			--data.name == "Trader's Tender" or 
			--data.name == "Honor"
			data.name == "Dragon Isles Supplies" or
			--data.name == "Resonance Crystals" or
			--data.name == "Kej" or
			--data.name == "Valorstones" or
			data.name == "Wakening Essence" or
			data.name == "Timewarped Badge"
		) then
			C_CurrencyInfo.SetCurrencyBackpack(i, true)
		end
	end
end
-------------------------------------------------------
-- Collect Simple Information of Your Character
-------------------------------------------------------
function vC_Collect_Info()
	local vC_pName, _						= UnitName("player")
	local vC_pLevel							= UnitLevel("player")
	local vC_pGUID							= UnitGUID("player")
	local vC_pRealm							= GetRealmName()
	local vC_pFaction, _					= UnitFactionGroup("player")
	local _, _, vC_cIndex					= UnitClass("player")

	C_Timer.After(.2, function() if ( GetMoney() == 0 ) then vC_Collect_Info() end end)
	
	--for k, v in ipairs(vC_DB_PlayerInfo) do
		
	--end
	local vC_tDB_PlayerInfo				= vC_DB_PlayerInfo or {}
	
	local requesting
	local o = ChatFrame_DisplayTimePlayed
	ChatFrame_DisplayTimePlayed = function(...)
		if requesting then
			requesting = false
			return
		end
		return o(...)
	end
	function RequestTimePlayed()
		requesting = true
		RequestTimePlayed()
	end

	--if ( not vC_tDB_PlayerInfo ) then
		
		vC_tDB_PlayerInfo = {
			[vC_playerGUID] = {
				["Name"]				= vC_pName,
				["Realm"]				= vC_pRealm,
				["Level"]				= vC_pLevel,
				["Class"]				= vC_cIndex,
				["Faction"]				= vC_pFaction,
				["TotalPlayed"]			= vC_totalLvlPlayed,
				["ThisPlayed"]			= vC_thisLvlPlayed,
				["Gold"]				= GetMoney(),
			},
		}
	--end
	
	vC_DB_PlayerInfo					= vC_tDB_PlayerInfo
end
-------------------------------------------------------
-- Quick Account Listing Globals
-------------------------------------------------------
vC_Account = {
	-- Sean
	{ 1, "Digglebear", "Cairne", "Shaman", },
	{ 1, "Digglebear", "Korgath", "Shaman", },
	{ 1, "Evesec", "Cairne", "Paladin", },
	{ 1, "Evesec", "Korgath", "Paladin", },
	{ 1, "Halim", "Korgath", "Monk", },
	{ 1, "Hellbilly", "Cairne", "Warrior", },
	{ 1, "Hellbilly", "Korgath", "Warrior", },
	{ 1, "Mayland", "Cairne", "Mage", },
	{ 1, "Mayland", "Korgath", "Mage", },
	{ 1, "Numinex", "Korgath", "Evoker", },
	{ 1, "Semtex", "Korgath", "Death Knight", },
	{ 1, "Vandiel", "Korgath", "Priest", },
	{ 1, "Vandiem", "Cairne", "Druid", },
	{ 1, "Vandiem", "Korgath", "Druid", },
	{ 1, "Vandien", "Korgath", "Warlock", },
	{ 1, "Vashlam", "Cairne", "Demon Hunter", },
	{ 1, "Vashlam", "Korgath", "Demon Hunter", },
	{ 1, "Vrondir", "Cairne", "Hunter", },
	{ 1, "Vrondir", "Korgath", "Hunter", },
	{ 1, "Zukio", "Cairne", "Rogue", },
	{ 1, "Zukio", "Korgath", "Rogue", },
	-- Kim
	{ 2, "Aladia", "Korgath", "Warrior", },
	{ 2, "Crystallish", "Korgath", "Hunter", },
	{ 2, "Kjari", "Korgath", "Warrior", },
	{ 2, "Kynre", "Korgath", "Druid", },
	{ 2, "Qawaiianne", "Korgath", "Mage", },
	-- Annie
	{ 3, "Amason", "Korgath", "Druid", },
	{ 3, "Bellain", "Korgath", "Druid", },
	{ 3, "Chellysia", "Korgath", "Death Knight", },
	{ 3, "Crystalpearl", "Korgath", "Paladin", },
	{ 3, "Darktadmill", "Korgath", "Warlock", },
	{ 3, "Darlanwing", "Korgath", "Paladin", },
	{ 3, "Frozentoon", "Korgath", "Evoker", },
	{ 3, "Krstina", "Korgath", "Rogue", },
	{ 3, "Kryala", "Korgath", "Shaman", },
	{ 3, "Linzeysong", "Korgath", "Rogue", },
	{ 3, "Maybook", "Korgath", "Warrior", },
	{ 3, "Menosaychare", "Korgath", "Demon Hunter", },
	{ 3, "Nomahappy", "Korgath", "Monk", },
	{ 3, "Opria", "Korgath", "Shaman", },
	{ 3, "Roseyice", "Korgath", "Priest", },
	{ 3, "Skyicemage", "Korgath", "Mage", },
	{ 3, "Vanassa", "Korgath", "Hunter", },
	-- Christie
	{ 4, "Ashlexia", "Korgath", "Druid", },
	{ 4, "Darkleanna", "Cairne", "Shaman", },
	{ 4, "Elviira", "Korgath", "Paladin", },
	{ 4, "Eudemons", "Korgath", "Mage", },
	{ 4, "Fujia", "Cairne", "Warlock", },
	{ 4, "Imenand", "Korgath", "Rogue", },
	{ 4, "Jarhild", "Korgath", "Warrior", },
	{ 4, "Jaxquline", "Cairne", "Druid", },
	{ 4, "Kamila", "Korgath", "Priest", },
	{ 4, "Matsbank", "Korgath", "Warrior", },
	{ 4, "Maylaa", "Korgath", "Demon Hunter", },
	{ 4, "Memis", "Korgath", "Evoker", },
	{ 4, "Misericordix", "Korgath", "Warlock", },
	{ 4, "Monticello", "Korgath", "Shaman", },
	{ 4, "Mypandasii", "Korgath", "Monk", },
	{ 4, "Naazu", "Cairne", "Priest", },
	{ 4, "Parvania", "Korgath", "Hunter", },
	{ 4, "Razzlia", "Cairne", "Rogue", },
	{ 4, "Sarcissanna", "Korgath", "Mage", },
}
-------------------------------------------------------
-- Declare for this Page
-------------------------------------------------------
function vC_ATT_WindowPosition()
	local vC_Pri = _G["AllTheThings-Window-Prime"]
	local vC_Cur = _G["AllTheThings-Window-CurrentInstance"]
	local vC_RAs = _G["AllTheThings-Window-RaidAssistant"]

	if ( vC_Pri == nil ) then C_Timer.After(1.5, function() vC_ATT_WindowPosition() end) end
	if ( vC_Pri ~= nil ) then
		vC_Pri:ClearAllPoints()
		vC_Pri:SetWidth(180)
		vC_Pri:SetHeight(223)
		vC_Pri:SetPoint("LEFT", UIParent, "LEFT", 0, -85)
	end
	
	if ( vC_Cur == nil ) then C_Timer.After(3, function() vC_ATT_WindowPosition() end) end
	if ( vC_Cur ~= nil ) then
		vC_Cur:ClearAllPoints()
		vC_Cur:SetWidth(vC_Pri:GetWidth())
		vC_Cur:SetHeight(vC_Pri:GetHeight())
		vC_Cur:SetPoint("LEFT", vC_Pri, "RIGHT", -2, 0)
	end

	if ( _G["AllTheThingsProfiles"]["Profiles"]["Default"]["Tooltips"]["Auto:RaidAssistant"] == true ) then
		if ( vC_RAs == nil ) then C_Timer.After(1.5, function() vC_ATT_WindowPosition() end) end
		if ( vC_RAs ~= nil ) then
			vC_RAs:ClearAllPoints()
			vC_RAs:SetWidth(vC_Pri:GetWidth())
			vC_RAs:SetHeight(93)
			vC_RAs:SetPoint("BOTTOMLEFT", vC_Pri, "TOPLEFT", 0, -2)
		end
	end
	
	-- Debug Windows Positions
	--[[
	local Pri = _G["AllTheThings-Window-Prime"]
	local Cur = _G["AllTheThings-Window-CurrentInstance"]
	local RaA = _G["AllTheThings-Window-RaidAssistant"]
		a1,a2,a3,a4,a5 = Pri:GetPoint(1)
		b1,b2,b3,b4,b5 = Cur:GetPoint(1)
		c1,c2,c3,c4,c5 = RaA:GetPoint(1)
	print(
		time().."\n"..
		"Prime: "..Pri:GetWidth(),Pri:GetHeight(),a1,a2,a3,a4,a5.."\n"..
		"Curre: "..Cur:GetWidth(),Cur:GetHeight(),b1,b2,b3,b4,b5.."\n"..
		"Assis: "..RaA:GetWidth(),RaA:GetHeight(),c1,c2,c3,c4,c5
	)
	]]--
end
-------------------------------------------------------
-- Bag Open/Close for D&R
-------------------------------------------------------
function vC_BagControlDR()
	if ( ProfessionsFrame or ProfessionsFrame ~= nil ) then
		vC_DoTheCraft()
	else
		BagItemAutoSortButton:Click()
		-- F1 F2 F3 F4 F5 
		-- T0 T1 T2 T3 T4
		-- C0 C1 C2 C3 C4
		if not ContainerFrame1:IsShown() then ToggleBag(0) end -- Bag 1

		local IsRaid = IsInRaid()
		local IsGroup = IsInGroup()

		C_Timer.After(.25, function()
			local n, _ = C_Container.GetContainerNumFreeSlots
			
			if ( IsGroup or IsRaid ) then
				if (n(1) ~= 0 and not ContainerFrame2:IsShown()) then ToggleBag(1) end -- Bag 2
					if (n(1) == 0 and ContainerFrame2:IsShown()) then ContainerFrame2:Hide() end
			end
			if ( IsRaid ) then
				if (n(2) ~= 0 and not ContainerFrame3:IsShown()) then ToggleBag(2) end -- Bag 3
					if (n(2) == 0 and ContainerFrame3:IsShown()) then ContainerFrame3:Hide() end
					
				if (n(3) ~= 0 and not ContainerFrame4:IsShown()) then ToggleBag(3) end -- Bag 4
					if (n(3) == 0 and ContainerFrame4:IsShown()) then ContainerFrame4:Hide() end
			end
			
			if (not ContainerFrame5:IsShown()) then ToggleBag(4) end -- Bag 5
			
			if ContainerFrame6:IsShown() then ContainerFrame6:Hide() end -- Bag 6 Raegant
		end)
		--if (not ContainerFrame6:IsShown()) then ToggleBag(5) end -- Bag 6 (Raegant Bag)
		--for i = 0, 5 do
		--	print("Bag "..(i+1)..": "..n(i).." Slot(s) Left")
		--end
	end
end
-------------------------------------------------------
-- Reposition World Map
-------------------------------------------------------
function vC_Reposition_WorldMap()
	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -35)
end
-------------------------------------------------------
-- Auto Fill In Dragonriding Tree
-------------------------------------------------------
function vC_FillDragonridingTree()
	--DragonridingPanelSkillsButtonMixin:OnClick() -- Open Dragonriding Skill Tree
	--if IsAddOnLoaded("Blizzard_GenericTraitUI") and GenericTraitFrame:IsShown() then
		local DragonGlyphsCurrency = GenericTraitFrame.Currency.UnspentPointsCount:GetText():match("%d+")
		if tonumber(DragonGlyphsCurrency) > 1 then
			local c = C_Traits.GetConfigIDBySystemID(1)
			for count = 1, 10 do
				for i, n in ipairs(C_Traits.GetTreeNodes(672)) do
					local f = C_Traits.GetNodeInfo(c, n)
					if #f.entryIDs < 2 then
						C_Traits.PurchaseRank(c, n)
					else
						C_Traits.SetSelection(c, n, f.entryIDs[2])
					end
				end
			end
			C_Traits.CommitConfig(c)
		else
			print("Dragonriding Talent Tree is already filled!")
		end
	--end
	--GenericTraitFrame.CloseButton:Click() -- Close When Done Filling
end
-------------------------------------------------------
-- Talent Filling
-------------------------------------------------------
function vC_Fill_Talent()
	if ( InCombatLockdown() and not PlayerSpellsFrame:IsShown() ) then return end
	
	local GetSpec					= GetSpecialization()
	local sID, sName, _, _, _, _	= GetSpecializationInfo(GetSpec)
	local pLevel					= UnitLevel("player")
	local _, _, cIndex				= UnitClass("player")
	local iTmp, vTmp				= 0, nil

	if ( cIndex == nil or sID == nil ) then return end
	
	if ( vC_Talent_Btn == nil ) then
		local vC_Talent_Btn = CreateFrame("Button", "vC_Talent_Btn", PlayerSpellsFrame.TalentsFrame)
			vC_Talent_Btn:SetSize(38,38)
			vC_Talent_Btn:SetPoint("BOTTOMLEFT", PlayerSpellsFrame.TalentsFrame, "BOTTOMLEFT", 5, 25)
			vC_Talent_Btn:SetNormalTexture(3015743)
			vC_Talent_Btn:SetHighlightTexture(2967105)
	end
	if ( vC_Talent_Msg == nil ) then
		local vC_Talent_Msg = PlayerSpellsFrame.TalentsFrame:CreateFontString("vC_Talent_Msg", "ARTWORK", "GameFontNormalMed3Outline")
			vC_Talent_Msg:SetPoint("BOTTOMLEFT", PlayerSpellsFrame.TalentsFrame, "BOTTOMLEFT", 10, 90)
			vC_Talent_Msg:SetText("")
	end

	vC_Talent_Msg:SetText("Click Below to Load Talents Tree for: "..vC_Class_Data[cIndex][3].." ("..sName..")")
	
	for i = 1, #vC_Talent do
		if ( vC_Talent[i][1] == cIndex and vC_Talent[i][2] == sID ) then iTmp = i; break; end
	end
	
	vC_Talent_Btn:SetScript("OnClick", function()
		for k, v in ipairs(C_ClassTalents.GetConfigIDsBySpecID()) do
			local c = C_Traits.GetConfigInfo(v)
			if c ~= nil then C_ClassTalents.DeleteConfig(c.ID) end
		end

		-- Find List in the DropDownMenu for "Import" Talent Trees
		PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown("Import"):Click()
		--ClassTalentLoadoutImportDialog.ImportControl.InputContainer:Show()
		
		--for k = 1, 50 do
		--	local dTMP = _G["DropDownList1Button"..k]
		--	if ( dTMP == nil or dTMP:GetText() == nil or dTMP:GetText() == "" ) then PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown:Click() end
			
		--	vTmp = dTMP:GetText():gsub("%[([^]]*)%]","%1",1):gsub("|cff"..("%w"):rep(6),""):gsub("|r","") or 0
		--	if ( vTmp == 0 ) then break end

			--print(k,time(),vTmp,dTMP:GetText(),dTMP:GetName())
		--	if ( vTmp == "Import" ) then
		--		_G["DropDownList1Button"..k]:Click()
		--		break
		--	end
		--end
		if ( ClassTalentLoadoutImportDialog:IsShown() ) then
			vC_Talent_Msg:SetText("Loading Talent Tree for: "..vC_Class_Data[cIndex][3].." ("..sName..")")
			ClassTalentLoadoutImportDialog.NameControl.EditBox:SetText(vC_Talent[iTmp][6])
			ClassTalentLoadoutImportDialog.InputContainer:SetText("["..pLevel.."] "..vC_Class_Data[cIndex][3].."-"..sName)
			C_Timer.After(1, function() ClassTalentLoadoutImportDialog.AcceptButton:Click() end)
		end
		
	end)
end
-------------------------------------------------------
-- Enchancement Stat Priority - (Haste/Crit/Mast/Vers/Speed/Armor/Leech)
-------------------------------------------------------
function vC_Priority_Stats()
	local GetSpec					= GetSpecialization()
	local sID, _, _, _, _, _		= GetSpecializationInfo(GetSpec)
	local _, _, cIndex				= UnitClass("player")
	local vTDB, iTmp				= {}, 0
	
	if ( vC_Class_Stat == nil ) then
		local vC_Class_Frame = CreateFrame("Frame", "vC_Class_Frame", UIParent, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_Class_Frame, 49, 1)
			vC_Class_Frame:SetSize(0, 28) -- Proper Size based on StrLen (Bottom final)
			vC_Class_Frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -28)
			local vC_Class_Stat = vC_Class_Frame:CreateFontString("vC_Class_Stat", "ARTWORK", "Game13Font_o1")
				vC_Class_Stat:SetPoint("CENTER", vC_Class_Frame, "CENTER", 0, -1)
	end	
	for i = 1, #vC_Talent do
		if ( vC_Talent[i][1] == cIndex and vC_Talent[i][2] == sID ) then iTmp = i; break; end
	end
	
	for j = 3, 5 do
		if ( vC_Talent[iTmp][j] ~= 0 ) then
			local sTmp = vC_Talent[iTmp][j]
			if sTmp == 1 then statTmp = GetCritChance() end
			if sTmp == 2 then statTmp = GetHaste() end
			if sTmp == 3 then
				local _, masBonus = GetMasteryEffect()
				statTmp = (GetCombatRatingBonus(CR_MASTERY)*masBonus)
			end
			if sTmp == 4 then statTmp = (GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE)+GetVersatilityBonus(CR_VERSATILITY_DAMAGE_DONE)) end
			if sTmp == 5 then statTmp = (GetLifesteal() == 0 and 0 or math.floor(GetLifesteal()*10)/10) end
			if sTmp == 6 then statTmp = GetSpeed() end
			if sTmp == 7 then statTmp = (select(2,UnitArmor("player"))) end

			tinsert(
				vTDB,
				"|T"..vC_Remix_Gem_Stat[sTmp][2]..":16|t"..
				"|cff"..vC_Remix_Gem_Stat[sTmp][3]..
				vC_Remix_Gem_Stat[sTmp][4]..
				" ["..string.format("%.1f",statTmp).."%]|r"
			)
		end
	end
	vC_Class_Stat:SetText("Priority Stat(s): "..table.concat(vTDB," > "))
	vC_Class_Frame:SetSize(strlen(vC_Class_Stat:GetText())*4.1, 28)
end
