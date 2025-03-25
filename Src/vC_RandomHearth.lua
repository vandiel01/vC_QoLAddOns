
local vC_AppName, vC_App = ...
if not ( vC_Run_RandomHearth ) then return end
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local locClass, engClass, classIdx							= UnitClass("player")			-- What Class?
local engFaction, locFaction								= UnitFactionGroup("player")	-- What Factions?
local raceName, raceFile, raceID							= UnitRace("player")			-- What Race?
local pro1, pro2, arch, fish, cook							= GetProfessions()				-- Which Profession?
local vC_RegHSDB, vC_OtherHSDB, vC_ClassHSDB, vC_PvPHSDB	= {}, {}, {}, {}
-------------------------------------------------------
-- Randomize Your Hearthstone Methods
-------------------------------------------------------
function vC_Randomize_HearthStone()
	local vC_tLoc		= C_Map.GetMapInfo(C_Map.GetBestMapForUnit("player")).parentMapID or 0
	local prof1			= (select(7,GetProfessionInfo(pro1))) or 0
	local prof2			= (select(7,GetProfessionInfo(pro2))) or 0
	for i = 1, #vC_Professions do if (vC_Professions[1] == prof1 or vC_Professions[1] == prof2) then vC_tBool = true break end end
	for i = 1, #vC_Factions do if (engFaction == vC_Factions[i][2]) then local vC_tFac = vC_Factions[i][1] break end end
	
	wipe(vC_RegHSDB, vC_OtherHSDB, vC_PvPHSDB)
	
	for i = 1, #vC_HearthStone_Toy do
		if ( vC_HearthStone_Toy[i][1] == 0 ) then
			local hasToy = PlayerHasToy(vC_HearthStone_Toy[i][2])
			if ( hasToy ) then tinsert(vC_tAnyDB,{vC_HearthStone_Toy[i][2],vC_HearthStone_Toy[i][3],vC_HearthStone_Toy[i][4]}) end
		end
	end
	local rnd = vC_tAnyDB[random(1,#vC_tAnyDB)]

	--vC_TestResultArea:SetText(rnd[3].."("..rnd[1]..") |T"..rnd[2]..":32|t") -- Debug
	vC_RandomHearth_Icon:SetTexture(rnd[2])
	vC_RandomHearth:SetAttribute("macrotext1","/use "..rnd[3])
	vC_RandomHearth:SetScript("OnEnter", function(s)
		local sTime, dur = GetItemCooldown(rnd[1])
		local vC_HS_tVal = ""..
			"\n"..(dur-(GetTime()-sTime) > 0 and vC_Convert_Timestamp(dur-(GetTime()-sTime),1) or "Ready To Use!")..
			"\n\nYour Hearth: "..GetBindLocation()
		vC_cToolTips(vC_HearthFrame,7,1,rnd[3]..vC_HS_tVal,"|T"..rnd[2]..":42|t")
	end)
end

function CloseHearthStone()
	if UnitCastingInfo('player') ~= nil then vC_HearthFrame:SetPoint("TOP", BagsBar, "RIGHT", 80, 110) end
end
-------------------------------------------------------
-- Randomize your Hearthstone to keep things LIVELY!
-------------------------------------------------------
function vC_HearthStone()
	if ( InCombatLockdown() ) then return end
	if ( vC_HearthFrame == nil ) then
		local vC_HearthFrame = CreateFrame("Frame", "vC_HearthFrame", BagsBar, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_HearthFrame, 47, 1)
				vC_HearthFrame:SetSize(120, 45)
				--vC_HearthFrame:SetPoint("TOP", BagsBar, "RIGHT", 75, 110)
				vC_HearthFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0) -- Keep for Debugging
				vC_HearthFrame:SetFrameStrata("TOOLTIP")
				vC_HearthFrame:EnableMouse(true)

				-- Not Movable, Only Movable During Debugging
				vC_HearthFrame:SetMovable(true)
				--vC_HearthFrame:SetClampedToScreen(true)
				vC_HearthFrame:RegisterForDrag("LeftButton")
				vC_HearthFrame:SetScript("OnDragStart", function() vC_HearthFrame:StartMoving() end)
				vC_HearthFrame:SetScript("OnDragStop", function() vC_HearthFrame:StopMovingOrSizing() end) --print(vC_HearthFrame:GetPoint()) end)
				
				local vC_HearthClose = CreateFrame("Button", "vC_HearthClose", vC_HearthFrame, "UIPanelCloseButton")
					vC_HearthClose:SetSize(22, 22)
					vC_HearthClose:SetPoint("TOPLEFT", vC_HearthFrame, 0, 20)
					vC_HearthClose:SetScript("OnClick", function() vC_HearthFrame:Hide() end)
				local vC_HearthRandom = CreateFrame("Button", "vC_HearthRandom", vC_HearthFrame, "BackdropTemplate")
					vC_HearthRandom:SetSize(22, 22)
					vC_HearthRandom:SetPoint("RIGHT", vC_HearthClose, "LEFT", 0, 0)
					vC_HearthRandom:SetNormalTexture(851904)
					vC_HearthRandom:SetScript("OnClick", function() vC_Randomize_HearthStone() end)

			-- Arrow Right/Left
			local vC_HearthInOutArrow = vC_HearthFrame:CreateTexture("vC_HearthInOutArrow", "ARTWORK")
				vC_HearthInOutArrow:SetSize(32, 60)
				vC_HearthInOutArrow:SetPoint("LEFT", vC_HearthFrame, "LEFT", -15, 0)
				vC_HearthInOutArrow:SetAtlas("NPE_ArrowLeft")
				--vC_HearthInOutArrow:SetAtlas("NPE_ArrowRight")

			local vC_RandomHearth = CreateFrame("Button", "vC_RandomHearth", vC_HearthFrame, "SecureActionButtonTemplate")
				vC_RandomHearth:SetSize(30, 30)
				vC_RandomHearth:SetPoint("LEFT", vC_HearthFrame, "LEFT", 10, 0)
				vC_RandomHearth:SetNormalTexture(136511)
				vC_RandomHearth:SetHighlightTexture(368363, "ADD")
				vC_RandomHearth_Icon = vC_RandomHearth:CreateTexture("vC_RandomHearth_Icon", "OVERLAY")
				vC_RandomHearth_Icon:SetSize(28, 28)
				vC_RandomHearth_Icon:SetPoint("CENTER", vC_RandomHearth, "CENTER", 0, 0)
				vC_RandomHearth_Icon:SetTexture(136511)
				vC_RandomHearth:SetMouseClickEnabled(true)
				vC_RandomHearth:RegisterForClicks("AnyUp", "AnyDown")
				vC_RandomHearth:SetAttribute("type", "macro")
				vC_RandomHearth:SetAttribute("macrotext1","")
				vC_RandomHearth:SetScript("OnEnter", function(s)
					if vC_RandomHearth_Icon:GetTexture() == 136511 then
						vC_cToolTips(vC_HearthFrame,8,1,"","")
					else
						local s,d = GetItemCooldown(6948)
						AnyValue = ""..
							"\n"..(d-(GetTime()-s) > 0 and vC_Convert_Timestamp(d-(GetTime()-s),1) or "Ready To Use!")..
							"\n\nYour Hearth: "..GetBindLocation()
						vC_cToolTips(vC_HearthFrame,8,1,rnd[3]..AnyValue,"|T"..rnd[2]..":42|t")
					end
				end)
				vC_RandomHearth:SetScript("OnLeave", function(s)
					vC_cToolTips(0)
					--CloseHearthStone()
				end)
				
			local vC_LegionHearth = CreateFrame("Button", "vC_LegionHearth", vC_HearthFrame, "SecureActionButtonTemplate")
				vC_LegionHearth:SetSize(30, 30)
				vC_LegionHearth:SetPoint("LEFT", vC_RandomHearth, "RIGHT", 5, 0)
				vC_LegionHearth:SetNormalTexture(136511)
				vC_LegionHearth:SetHighlightTexture(368363, "ADD")
				vC_LegionHearth_Icon = vC_LegionHearth:CreateTexture("vC_LegionHearth_Icon", "OVERLAY")
				vC_LegionHearth_Icon:SetSize(28, 28)
				vC_LegionHearth_Icon:SetPoint("CENTER", vC_LegionHearth, "CENTER", 0, 0)
				vC_LegionHearth_Icon:SetTexture(1444943)
				vC_LegionHearth:SetMouseClickEnabled(true)
				vC_LegionHearth:RegisterForClicks("AnyUp", "AnyDown")  
				vC_LegionHearth:SetAttribute("type", "macro")
				vC_LegionHearth:SetAttribute("macrotext1","/use Dalaran Hearthstone")
				vC_LegionHearth:SetScript("OnEnter", function(s)
					local s,d = GetItemCooldown(140192)
					AnyValue = "\n"..(d-(GetTime()-s) > 0 and vC_Convert_Timestamp(d-(GetTime()-s),1) or "Ready To Use!")
					vC_cToolTips(vC_HearthFrame,8,1,"Dalaran (Legion) Hearthstone"..AnyValue,"|T1444943:42|t")
				end)
				vC_LegionHearth:SetScript("OnLeave", function(s)
					vC_cToolTips(0)	
					--CloseHearthStone()
				end)
				
			local vC_GarrisonHearth = CreateFrame("Button", "vC_GarrisonHearth", vC_HearthFrame, "SecureActionButtonTemplate")
				vC_GarrisonHearth:SetSize(30, 30)
				vC_GarrisonHearth:SetPoint("LEFT", vC_LegionHearth, "RIGHT", 5, 0)
				vC_GarrisonHearth:SetNormalTexture(136511)
				vC_GarrisonHearth:SetHighlightTexture(368363, "ADD")
				vC_GarrisonHearth_Icon = vC_GarrisonHearth:CreateTexture("vC_GarrisonHearth_Icon", "OVERLAY")
				vC_GarrisonHearth_Icon:SetSize(28, 28)
				vC_GarrisonHearth_Icon:SetPoint("CENTER", vC_GarrisonHearth, "CENTER", 0, 0)
				vC_GarrisonHearth_Icon:SetTexture(1041860)
				vC_GarrisonHearth:SetMouseClickEnabled(true)
				vC_GarrisonHearth:RegisterForClicks("AnyUp", "AnyDown")    
				vC_GarrisonHearth:SetAttribute("type", "macro")
				vC_GarrisonHearth:SetAttribute("macrotext1","/use Garrison Hearthstone")
				vC_GarrisonHearth:SetScript("OnEnter", function(s)
					local s,d = GetItemCooldown(110560)
					AnyValue = "\n"..(d-(GetTime()-s) > 0 and vC_Convert_Timestamp(d-(GetTime()-s),1) or "Ready To Use!")
					vC_cToolTips(vC_HearthFrame,8,1,"Garrison Hearthstone"..AnyValue,"|T1041860:42|t")
				end)
				vC_GarrisonHearth:SetScript("OnLeave", function(s)
					vC_cToolTips(0)	
					--CloseHearthStone()
				end)

			--[[
				if ( engClass == "SHAMAN" and HasSpell ) then print("Shaman 'Astral Recall' Will Appear Here") end
				if ( engClass == "DEATHKNIGHT" and HasSpell ) then print("Death Knight 'Death Gate' Will Appear Here") end
				if ( engClass == "DRUID" and HasSpell ) then print("Druid 'Dreamwalk' Will Appear Here") end
				if ( engClass == "MONK" and HasSpell ) then print("Monk 'Zen Pilgrimage', 1m CD, Will Appear Here") end
				if ( engClass == "MAGE" and HasSpell ) then print("Mage 'Guardian Hall' Will Appear Here") end
				if ( engClass == "MAGE" and HasSpell ) then print("Mage 'Self and Group Portal' Will Appear Here") end
				
				if ( Race == "Dark Iron Dwarf" and HasSpell("Mole") ) then print("Dark Iron Dwarf 'Mole' Will Appear Here") end

				if ( Profession == "Engineer" and HasToy ) then print("Eng 'Ultrasafe Transporter: Toshley's Station' Will Appear Here") end 
				if ( Profession == "Engineer" and HasToy ) then print("Eng 'Ultrasafe Transporter: Gadgetzan' Will Appear Here") end 
				if ( Profession == "Engineer" and HasItem ) then print("Engineer 'Teleporter' Will Appear Here") end 
				
				if ( engFaction == "Alliance" and Battleground == "AV" and HasToy ) then
					print("Alliance 'Stormpike Insignia' Will Appear Here")
				else
					print("Horde 'Frostwolf Insignia' Will Appear Here")
				end

				if InSpecificZone and not ZeroCypher and InBag then print("All 'Cypher of Relcation' Will Appear Here") end
				if HasItem and InBag then print("All 'Timeless Port' Will Appear Here") end
				if HasItem and (InBag or Equipped) then print("All 'Argent Tournament Tabard' Will Appear Here") end
			]]--
	end
end