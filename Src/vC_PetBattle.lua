-- In Progress 03/05/2025
local vC_AppName, vC_App = ...
if not ( vC_Run_PetBattle ) then return end
-------------------------------------------------------
-- Declare & Data for this Page
-------------------------------------------------------
local vC_PB_Pet_Currency = {
	{
		["icon"] = 0237618, ["name"] = "Only Gold",
		["list"] = {
			
		},
	},
	{
		["icon"] = 2004597, ["name"] = "Polished",
		["list"] = {
			{ 163036, "Polished Pet Charm", },
		},
	},
	{
		["icon"] = 774766, ["name"] = "Any Stones",
		["list"] = {
			{ 092742, "Polished Battle-Stone", },
			{ 092741, "Flawless Battle-Stone", },
			{ 092665, "Flawless Elemental Battle-Stone", },
			{ 092675, "Flawless Beast Battle-Stone", },
			{ 092676, "Flawless Critter Battle-Stone", },
			{ 092677, "Flawless Flying Battle-Stone", },
			{ 092678, "Flawless Magic Battle-Stone", },
			{ 092679, "Flawless Aquatic Battle-Stone", },
			{ 092680, "Flawless Mechanical Battle-Stone", },
			{ 092681, "Flawless Undead Battle-Stone", },
			{ 092682, "Flawless Humanoid Battle-Stone", },
			{ 092683, "Flawless Dragonkin Battle-Stone", },
			{ 098715, "Marked Flawless Battle-Stone", },
			{ 116374, "Beast Battle-Training Stone", },
			{ 116416, "Humanoid Battle-Training Stone", },
			{ 116417, "Mechanical Battle-Training Stone", },
			{ 116418, "Critter Battle-Training Stone", },
			{ 116419, "Dragonkin Battle-Training Stone", },
			{ 116420, "Elemental Battle-Training Stone", },
			{ 116421, "Flying Battle-Training Stone", },
			{ 116422, "Magic Battle-Training Stone", },
			{ 116423, "Undead Battle-Training Stone", },
			{ 116424, "Aquatic Battle-Training Stone", },
			{ 116429, "Flawless Battle-Training Stone", },
			{ 122457, "Ultimate Battle-Training Stone", },
			{ 127755, "Fel-Touched Battle-Training Stone", },
			{ 137387, "Immaculate Dragonkin Battle-Stone", },
			{ 137388, "Immaculate Humanoid Battle-Stone", },
			{ 137389, "Immaculate Undead Battle-Stone", },
			{ 137390, "Immaculate Mechanical Battle-Stone", },
			{ 137391, "Immaculate Aquatic Battle-Stone", },
			{ 137392, "Immaculate Magic Battle-Stone", },
			{ 137393, "Immaculate Critter Battle-Stone", },
			{ 137394, "Immaculate Beast Battle-Stone", },
			{ 137395, "Immaculate Elemental Battle-Stone", },
			{ 137396, "Immaculate Flying Battle-Stone", },
			{ 137627, "Immaculate Battle-Stone", },
			--{ 086143, "Battle Pet Bandage", },
		},	
	},
	{
		["icon"] = 1005027, ["name"] = "Resources",
		["list"] = {
			{ 236096, "Coffer Key Shard", },
			-- Will Add More Resource
		},
	},
}
local vC_PetBattle_Quest = {
	{							-- 7 Legions
		42146, 42165, 42063, 42154, 42148, 42159,		-- Azsuna
		49058, 49054, 49053, 49057, 49055, 49056,		-- Antoran Wastes
		46111, 46112, 46113,							-- Broken Shore
		42442, 40277, 40298, 40299, 42062, 41886,
		41881,											-- Dalaran
		49047, 49052, 49051, 49050, 49048, 49049,		-- Eredath
		40280, 41687, 40282, 42064, 41624, 41766,		-- Highmountain
		49041, 49042, 49044, 49045, 49046, 49043,		-- Krokuun
		41948, 41935, 41958, 42067, 40278, 41944,		-- Stormheim
		41914, 40337, 41895, 42015, 41990, 41931,		-- Suramar
		41860, 41861, 42190, 41862, 43344, 40279,
		41855,											-- Val'sharah
	},
	{							-- 8 Battle for Azeroth
		52218, 52278, 52009, 52297,						-- Drustvar
		52165, 52325, 52316, 52126,						-- Stormsong Valley
		52430, 52455, 52471, 52751,						-- Tiragarde Sound
		52938, 52923, 52937, 52892,						-- Zuldazar
		52754, 52779, 52803, 52799,						-- Nazmir
		52850, 52878, 52864, 52856,						-- Vol'dun
		56396, 56395, 56393, 56394, 56400, 56399,
		56397, 56398,									-- Mechagon
		56385, 56387, 56386, 56391, 56382, 56384,
		56383, 56390, 56389, 56381, 56388, 56392,		-- Nazjatar
		58743, 58745, 58742, 58744,						-- Uldum
		58748, 58746, 58747, 58749,						-- Vale of Eternal Blossoms
	},
	{							-- 9 Shadowland
		61948, 61946, 61947, 61949,						-- Ardenweald
		61791, 61784, 61787, 61783,						-- Bastion
		61868, 61870, 61867, 61866,						-- Maldraxxus
		61879, 61886, 61885, 61883,						-- Revendreth
	},
	{							-- 10 Dragonflight
		74492, 73135, 73132, 74489, 73128, 73134,
		73133, 73130, 73131, 74491, 74490, 74488,
		73124, 73126, 73119, 73120,						-- Little Scales Daycare
		74837, 71140, 74838, 71206,						-- Ohn'ahran Plains
		74792, 71180, 74794, 71166,						-- Thaldraszus
		74836, 71145, 74835, 71202,						-- The Azure Span
		73146, 73148, 73147, 73149, 					-- The Forbidden Reach
		74840, 66551, 74841, 66588,						-- The Waking Shores
		75680, 75750, 75834, 75835,						-- Zaralek Cavern
	},
	{							-- 11 The War Within
		82292, 82291,									-- Isle of Dorn
		82293, 82300,									-- The Ringing Deeps
		82294, 82298,									-- Hallowfall
		82295, 82297,									-- Azj-Kahet
		86943, 86949, 86952, 00000, 					-- Undermine (Drilling Down - Loyal Crewmates - Approach the Croach - Tiny, Expensive, and Deadly)
	},
}
local vC_PB_Xpac_List = {
	"All Expansions",
	"Legion",
	"Battle of Azeroth",
	"Shadowlands",
	"Dragonflight",
	"The War Within",
}
local vC_PB_Zone_ID = {
	{			-- Legion
		{ 0627, "Dalaran", },
		{ 0630, "Azsuna", },
		{ 0641, "Val'sharah", },
		{ 0650, "Highmountain", },
		{ 0634, "Stormheim", },
		{ 0680, "Suramar", },
		{ 0646, "Broken Shore", },
		{ 0830, "Krokuun", },
		{ 0885, "Antoran Wastes", },
		{ 0882, "Eredath", },
	},{			-- Battle of Azeroth
		{ 1161, "Boralus", },
		{ 0895, "Tiragarde Sound", },
		{ 0896, "Drustvar", },
		{ 0942, "Stormsong Valley", },
		{ 1165, "Dazar'alor", },
		{ 0862, "Zuldazar", },
		{ 0863, "Nazmir", },
		{ 0864, "Vol'dun", },    
		{ 1462, "Mechagon Island", },
		{ 1355, "Nazjatar", },
		{ 1527, "Uldum", },
		{ 1530, "Vale of Eternal Blossoms", },
	},{			-- Shadowlands
		{ 1550, "The Shadowlands", },
		{ 1565, "Ardenweald", },
		{ 1533, "Bastion", },
		{ 1525, "Revendreth", },
		{ 1536, "Maldraxxus", },
	},{			-- Dragonflight
		{ 2022, "The Waking Shores", },
		{ 2023, "Ohn'ahran Plains", },
		{ 2024, "The Azure Span", },
		{ 2025, "Thaldraszus", },
		{ 2112, "Valdrakken", },
		{ 2151, "The Forbidden Reach", },
		{ 2133, "Zaralek Cavern", },
	},{			-- The War Within
		{ 2248, "Isle of Dorn", },
		{ 2214, "The Ringing Deeps", },
		{ 2215, "Hallowfall", },
		{ 2255, "Azj-Kahet", },
		{ 2346, "Undermine(d)", },
	},
}
-------------------------------------------------------
-- Pet Battle Displaying Information
-------------------------------------------------------
-- INV_Currency_PetBattle
-- Icon_PetFamily_Beast, Critter, Dragon, Elemental, Flying, Humanoid, Magical, Mechanical, Undead, Water
-- INV_Box_PetCarrier_01
-- PetJournalPortrait
-- Pet_Type_Beast, Critter, Dragon, Elemental, Flying, Humanoid, Magical, Mechanical, Undead, Water
-- TARGETINGFRAME\\PetBadge-Beast, Critter, Dragon, Elemental, Flying, Humanoid, Magical, Mechanical, Undead, Water
function vC_FindMe_PetBattles()

end
-------------------------------------------------------
-- Pet Battle Frame - Listing PB WQ
-------------------------------------------------------
if ( vC_PetBattle_WQuest == nil ) then
	local vC_PetBattle_WQuest = CreateFrame("Frame", "vC_PetBattle_WQuest", UIParent, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_PetBattle_WQuest, 16, 1)
		vC_PetBattle_WQuest:SetSize(400, 325)
		vC_PetBattle_WQuest:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		vC_PetBattle_WQuest:EnableMouse(true)
		vC_PetBattle_WQuest:SetMovable(true)
		vC_PetBattle_WQuest:SetClampedToScreen(true)
		vC_PetBattle_WQuest:RegisterForDrag("LeftButton")
		vC_PetBattle_WQuest:SetScript("OnDragStart", function(s) s:StartMoving() end)
		vC_PetBattle_WQuest:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)
			vC_PB_Title = vC_PetBattle_WQuest:CreateFontString(nil, "ARTWORK", "GameFontNormalOutline")
			vC_PB_Title:SetPoint("CENTER", vC_PetBattle_WQuest, "TOP", 0, -14)
			vC_PB_Title:SetText("World Quest Finder!")
			local vC_PB_XClose = CreateFrame("Button", "vC_PB_XClose", vC_PetBattle_WQuest, "UIPanelCloseButton")
				vC_PB_XClose:SetSize(23, 23)
				vC_PB_XClose:SetPoint("TOPRIGHT", vC_PetBattle_WQuest, "TOPRIGHT", -3, -3)
				vC_PB_XClose:SetScript("OnClick", function() vC_PetBattle_WQuest:Hide() end)
			local vC_PB_Logo = CreateFrame("Button", "vC_PB_Logo", vC_PetBattle_WQuest)
				vC_PB_Logo:SetSize(58, 58)
				vC_PB_Logo:SetPoint("TOPLEFT", vC_PetBattle_WQuest, "TOPLEFT", -15, 30)
				vC_PB_Logo:SetNormalTexture("Interface\\ICONS\\Tracking_WildPet")

	local vC_PB_Choice = CreateFrame("Frame", "vC_PB_Choice", vC_PetBattle_WQuest, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_PB_Choice, -1, 1)
		vC_PB_Choice:SetSize(135, vC_PetBattle_WQuest:GetHeight()-26)
		vC_PB_Choice:SetPoint("BOTTOMLEFT", vC_PetBattle_WQuest, "BOTTOMLEFT", 3, 2)

		local PT_Top = -10
		vC_PB_PXp = vC_PB_Choice:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
			vC_PB_PXp:SetPoint("TOPLEFT", vC_PB_Choice, "TOPLEFT", 10, PT_Top)
			vC_PB_PXp:SetText("|cffFFFF00Pick An Expansion|r")
		PT_Top = PT_Top - 12
		for i = 1, #vC_PB_Xpac_List do
			local vC_PB_EList = CreateFrame("CheckButton", "vC_PB_EList"..i, vC_PB_Choice, "InterfaceOptionsCheckButtonTemplate")
				vC_PB_EList:SetPoint("TOPLEFT", vC_PB_Choice, "TOPLEFT", 5, PT_Top)
				vC_PB_EList:SetChecked(false)
				vC_PB_EList:SetScript("OnClick", function(s) print(vC_PB_Xpac_List[i]) end)
				vC_PB_ELblHdr = vC_PB_EList:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
				vC_PB_ELblHdr:SetPoint("LEFT", vC_PB_EList, "RIGHT", 0, 0)
				vC_PB_ELblHdr:SetJustifyH("LEFT")
				vC_PB_ELblHdr:SetText(vC_PB_Xpac_List[i])
			PT_Top = PT_Top - 18
		end

		local vC_PB_Line1 = vC_PB_Choice:CreateTexture("vC_PB_Line1")
			vC_PB_Line1:SetSize(vC_PB_Choice:GetWidth()-16, 2)
			vC_PB_Line1:SetTexture(130871)
			vC_PB_Line1:SetColorTexture(.8, .8, .8, .2)
			vC_PB_Line1:SetPoint("TOPLEFT", vC_PB_Choice, "TOPLEFT", 8, PT_Top-10)

		PT_Top = PT_Top - 17
		vC_PB_PPB = vC_PB_Choice:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
			vC_PB_PPB:SetPoint("TOPLEFT", vC_PB_Choice, "TOPLEFT", 10, PT_Top)
			vC_PB_PPB:SetText("|cffFFFF00What To Find?|r")
		PT_Top = PT_Top - 12
		for i = 1, #vC_PB_Pet_Currency do
			local vC_PB_PList = CreateFrame("CheckButton", "vC_PB_PList"..i, vC_PB_Choice, "InterfaceOptionsCheckButtonTemplate")
				vC_PB_PList:SetPoint("TOPLEFT", vC_PB_Choice, "TOPLEFT", 5, PT_Top)
				vC_PB_PList:SetChecked(false)
				vC_PB_PList:SetScript("OnClick", function(s) print(vC_PB_Pet_Currency[i]["name"]) end)
				vC_PB_PList:SetScript("OnEnter", function(s)
					local t = {}
					for j = 1, #vC_PB_Pet_Currency[i]["list"] do
						tinsert(t,vC_PB_Pet_Currency[i]["list"][j][2].."\n")
					end
					vC_cToolTips(s,4,1,table.concat(t),"")
				end)
				vC_PB_PList:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
				
				vC_PB_Icon = vC_PB_PList:CreateTexture(nil, "ARTWORK")
				vC_PB_Icon:SetSize(20, 20)
				vC_PB_Icon:SetTexture(vC_PB_Pet_Currency[i]["icon"])
				vC_PB_Icon:SetPoint("LEFT", "vC_PB_PList"..i, "RIGHT", 0, 0)
				vC_PB_PLblHdr = vC_PB_PList:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
				vC_PB_PLblHdr:SetPoint("LEFT", vC_PB_Icon, "RIGHT", 5, 0)
				vC_PB_PLblHdr:SetJustifyH("LEFT")
				vC_PB_PLblHdr:SetText(vC_PB_Pet_Currency[i]["name"])
			PT_Top = PT_Top - 22
		end
	
	local vC_PB_Result = CreateFrame("Frame", "vC_PB_Result", vC_PetBattle_WQuest, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_PB_Result, -1, 1)
		vC_PB_Result:SetSize(vC_PetBattle_WQuest:GetWidth()-138, vC_PetBattle_WQuest:GetHeight()-26)
		vC_PB_Result:SetPoint("LEFT", vC_PB_Choice, "RIGHT", -3, 0)
		local vC_PB_ScrollArea = CreateFrame("ScrollFrame", "vC_PB_ScrollArea", vC_PB_Result, "UIPanelScrollFrameTemplate")
			vC_PB_ScrollArea:SetPoint("TOPLEFT", vC_PB_Result, "TOPLEFT", 7, -7)
			vC_PB_ScrollArea:SetWidth(vC_PB_Result:GetWidth()-34)
			vC_PB_ScrollArea:SetHeight(vC_PB_Result:GetHeight()-13)
				vC_PB_ResultArea = CreateFrame("EditBox", "vC_PB_ResultArea", vC_PB_ScrollArea)
				vC_PB_ResultArea:SetWidth(vC_PB_ScrollArea:GetWidth())
				vC_PB_ResultArea:SetFontObject(GameFontNormalSmall)
				vC_PB_ResultArea:SetAutoFocus(false)
				vC_PB_ResultArea:SetMultiLine(true)
				vC_PB_ResultArea:EnableMouse(true)
				vC_PB_ResultArea:SetScript("OnEditFocusGained", function() vC_PB_ResultArea:HighlightText() end)
				--vC_PB_ResultArea:SetText(string.rep("ABCDEFGHIJLKMNOPQRSTUVWXYZ_0123456789_",100)) -- Debugging
			vC_PB_ScrollArea:SetScrollChild(vC_PB_ResultArea)
			
	vC_PetBattle_WQuest:Hide()
end
-------------------------------------------------------
-- Auto Send Pet Battle Tokens & Stuff
-------------------------------------------------------
function SendPetItems()			-- Check/Send Pet Items
	local CheckMore = false
	if ( vC_PB_tAnyDB == nil ) then vC_PB_tAnyDB = {} else wipe(vC_PB_tAnyDB) end
	
	for i = 1, #vC_PetBattle_Currency do
		if GetItemCount(vC_PetBattle_Currency[i]) ~= 0 then
			tinsert(vC_PB_tAnyDB,vC_PetBattle_Currency[i])
			if #vC_PB_tAnyDB == 12 then
				CheckMore = true
				break
			end
		end
	end
	
	if #vC_PB_tAnyDB ~= 0 then
		--print("Preparing to Send Battle Pet related items!")
		MailFrameTab2:Click()
		SendMailNameEditBox:SetText(TheMainName)
		SendMailSubjectEditBox:SetText("Pet Battle Item(s)")
		
		for l = 1, #vC_PB_tAnyDB do
			for j = 0, NUM_BAG_SLOTS do
				for k = 1, C_Container.GetContainerNumSlots(j) do
					local BagItemsID = C_Container.GetContainerItemID(j, k)
					if vC_PB_tAnyDB[l] == BagItemsID then
					--	print(l, j, k, BagItemsID)
						C_Container.PickupContainerItem(j, k)
						ClickSendMailItemButton()
						ClearCursor()
					end
				end
			end
			if ( l == #vC_PB_tAnyDB ) then break end
		end
		C_Timer.After(1, function() SendMail(TheMainName,"Pet Battle Item(s)") end)
	end
	if ( CheckMore ) then SendPetItems() end
end
-------------------------------------------------------
-- Auto Cage Duplicate Pets
-------------------------------------------------------

-------------------------------------------------------
-- Pet Battle Frame on SendMailFrame
-------------------------------------------------------
if ( vC_Mail_PetBattle == nil ) then
	local vC_Mail_PetBattle = CreateFrame("Frame", "vC_Mail_PetBattle", MailFrame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_Mail_PetBattle, 47, 1)
		vC_Mail_PetBattle:SetSize(150, 45)
		vC_Mail_PetBattle:SetPoint("BOTTOMLEFT", MailFrame, "BOTTOMRIGHT", 0, 44)
		local vC_Mail_PetBattle_Icon = CreateFrame("Button", "vC_Mail_PetBattle_Icon", vC_Mail_PetBattle)
			vC_Mail_PetBattle_Icon:SetSize(38, 38)
			vC_Mail_PetBattle_Icon:SetNormalTexture("Interface\\ICONS\\INV_Currency_PetBattle")
			vC_Mail_PetBattle_Icon:SetHighlightTexture("Interface\\BUTTONS\\UI-Quickslot-Depress")
			vC_Mail_PetBattle_Icon:SetPoint("LEFT", vC_Mail_PetBattle, "LEFT", 5, 0)
			vC_Mail_PetBattle_Icon:SetScript("OnClick", function()
				print("Disabled: Sending Pet Tokens")
				-- vC_Send_PetBattle_Token()
			end)
end