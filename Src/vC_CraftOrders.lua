-- Completed 02/27/2025
local vC_AppName, vC_App = ...
if not ( vC_Run_CraftOrders ) then return end
-------------------------------------------------------
-- Declare for this Page
-------------------------------------------------------
	-- Profession ID, Profession Icon, How Many Weekly Craft Need for Weekly Quest, Who Crafts
	-- [XPac] = [Treatise ItemID, Treatise SpellID] & [QuestID, Weekly SpellID]
	-- Draconic Treatise on xxx : Algari Treatise on xxx
local vC_Artisan_Craft = {
	{ ["pID"] = 171, ["Icon"] = 4620669, ["hMany"] = 2, ["sWho"] = "Zukio-Korgath",								-- Alchemy
		["DF"] = { ["ItemID"] = 194697, ["TreatiseID"] = 383522, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
		["TW"] = { ["ItemID"] = 222546, ["TreatiseID"] = 444187, ["QuestID"] = 84133, ["WeeklySpellID"] = 430615, },	-- Phial of Truesight
	},
	{ ["pID"] = 182, ["Icon"] = 4620675, ["hMany"] = 0, ["sWho"] = "Zukio-Korgath",								-- Herbalism
		["DF"] = { ["ItemID"] = 194704, ["TreatiseID"] = 383515, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
		["TW"] = { ["ItemID"] = 222552, ["TreatiseID"] = 444182, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
	},
	{ ["pID"] = 164, ["Icon"] = 4620670, ["hMany"] = 3, ["sWho"] = "Evesec-Korgath",							-- Blacksmithing
		["DF"] = { ["ItemID"] = 198454, ["TreatiseID"] = 383517, ["QuestID"] = 70589, ["WeeklySpellID"] = 388279, },	-- Sturdy Expedition Shovel
		["TW"] = { ["ItemID"] = 222554, ["TreatiseID"] = 444184, ["QuestID"] = 84127, ["WeeklySpellID"] = 450291, },	-- Coreforged Repair Hammer
	},
	{ ["pID"] = 197, ["Icon"] = 4620681, ["hMany"] = 3, ["sWho"] = "Vandiel-Korgath",							-- Tailor
		["DF"] = { ["ItemID"] = 194698, ["TreatiseID"] = 383520, ["QuestID"] = 70595, ["WeeklySpellID"] = 376509, },	-- Surveyor's Cloth Bands
		["TW"] = { ["ItemID"] = 222547, ["TreatiseID"] = 444186, ["QuestID"] = 84132, ["WeeklySpellID"] = 446956, },	-- Pioneer's Cloth Cuffs
	},
	{ ["pID"] = 333, ["Icon"] = 4620672, ["hMany"] = 0, ["sWho"] = "Vandiel-Korgath",							-- Enchanting
		["DF"] = { ["ItemID"] = 194702, ["TreatiseID"] = 383523, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
		["TW"] = { ["ItemID"] = 222550, ["TreatiseID"] = 444188, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
	},
	{ ["pID"] = 202, ["Icon"] = 4620673, ["hMany"] = 2, ["sWho"] = "Halim-Korgath",								-- Engineering
		["DF"] = { ["ItemID"] = 198510, ["TreatiseID"] = 383844, ["QuestID"] = 70591, ["WeeklySpellID"] = 382375, },	-- Handful of Serevite Bolts
		["TW"] = { ["ItemID"] = 222621, ["TreatiseID"] = 444223, ["QuestID"] = 84128, ["WeeklySpellID"] = 447336, },	-- Handful of Bismuth Bolts
	},
	{ ["pID"] = 773, ["Icon"] = 4624755, ["hMany"] = 2, ["sWho"] = "Mayland-Korgath",							-- Inscription
		["DF"] = { ["ItemID"] = 194699, ["TreatiseID"] = 383759, ["QuestID"] = 70592, ["WeeklySpellID"] = 429149, },	-- Glyph of the Lunar Chameleon
		["TW"] = { ["ItemID"] = 222548, ["TreatiseID"] = 447868, ["QuestID"] = 84129, ["WeeklySpellID"] = 444196, },	-- Inquisitor's Torch
	},
	{ ["pID"] = 755, ["Icon"] = 4620677, ["hMany"] = 2, ["sWho"] = "Vandien-Korgath",							-- Jewelcrafting
		["DF"] = { ["ItemID"] = 194703, ["TreatiseID"] = 383524, ["QuestID"] = 70593, ["WeeklySpellID"] = 374483, },	-- Blotting Sand
		["TW"] = { ["ItemID"] = 222551, ["TreatiseID"] = 444189, ["QuestID"] = 84130, ["WeeklySpellID"] = 435380, },	-- Malleable Pendant
	},
	{ ["pID"] = 165, ["Icon"] = 4620678, ["hMany"] = 3, ["sWho"] = "Vrondir-Korgath",							-- Leatherworking
		["DF"] = { ["ItemID"] = 194700, ["TreatiseID"] = 383519, ["QuestID"] = 70594, ["WeeklySpellID"] = 375181, },	-- Floral Basket
		["TW"] = { ["ItemID"] = 222549, ["TreatiseID"] = 444185, ["QuestID"] = 84131, ["WeeklySpellID"] = 443710, },	-- Tracker's Chitin Cuffs
	},
	{ ["pID"] = 393, ["Icon"] = 4620680, ["hMany"] = 0, ["sWho"] = "Vrondir-Korgath",							-- Skinning
		["DF"] = { ["ItemID"] = 201023, ["TreatiseID"] = 392944, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
		["TW"] = { ["ItemID"] = 222649, ["TreatiseID"] = 444236, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
	},
	{ ["pID"] = 186, ["Icon"] = 4620679, ["hMany"] = 0, ["sWho"] = "Vashlam-Korgath",							-- Mining
		["DF"] = { ["ItemID"] = 194708, ["TreatiseID"] = 383516, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
		["TW"] = { ["ItemID"] = 222553, ["TreatiseID"] = 444183, ["QuestID"] = 00000, ["WeeklySpellID"] = 000000, },	-- None
	},
}
------------------------------------------------------------------------
-- Create An Order Requests for Weekly
------------------------------------------------------------------------
function vC_PlaceAnCraft(pID)
	for i = 1, #vC_Artisan_Craft do
		if ( vC_Artisan_Craft[i]["pID"] == pID ) then
			for j = 1, vC_Artisan_Craft[i]["hMany"] do
				C_CraftingOrders.PlaceNewOrder({
					skillLineAbilityID		= C_TradeSkillUI.GetRecipeInfo(vC_Artisan_Craft[i]["TW"]["WeeklySpellID"]).skillLineAbilityID,
					orderType				= 2,						-- 0 Public, 1 Guild, 2 Personal
					orderDuration			= (pID == 197 and 2 or 0),	-- 0 12h, 1 24h, 2 48h (Less Expensive with Lower Duration) 48h for Eudemons
					tipAmount				= 100,						-- 1 Silver is minimium to place an order
					customerNotes			= "",
					reagentItems			= {},
					craftingReagentItems	= {},
					orderTarget				= (pID == 197 and "Eudemons-Korgath" or vC_Artisan_Craft[i]["sWho"]),
				})
			end
			vC_OrderLabel:SetText(
				"Order Placed: |cffFFFF00"..vC_Artisan_Craft[i]["hMany"].."|rx "..
				"|cff0DDD00"..C_TradeSkillUI.GetRecipeInfo(vC_Artisan_Craft[i]["TW"]["WeeklySpellID"]).name.."|r"..
				" for |cff6495ED"..(pID == 197 and "Eudemons-Korgath" or vC_Artisan_Craft[i]["sWho"].."|r")
			)
			break
		end
	end
	C_Timer.After(.5, function() ProfessionsCustomerOrdersFrame.MyOrdersPage.RefreshButton:Click() end)
end
------------------------------------------------------------------------
-- Create An Treatise Requests for Weekly
------------------------------------------------------------------------
function vC_PlaceAnTreatise(pID,xPack,iCnt)
	for i = 1, #vC_Artisan_Craft do
		if ( vC_Artisan_Craft[i]["pID"] == pID ) then
			for j = 1, iCnt do
				C_CraftingOrders.PlaceNewOrder({
					skillLineAbilityID		= C_TradeSkillUI.GetRecipeInfo(vC_Artisan_Craft[i][xPack]["TreatiseID"]).skillLineAbilityID,
					orderType				= 2,			-- 0 Public, 1 Guild, 2 Personal
					orderDuration			= 0,			-- 0 12h, 1 24h, 2 48h (Less Expensive with Lower Duration)
					tipAmount				= 100,			-- 1 Silver is minimium to place an order
					customerNotes			= "",
					reagentItems			= {},
				--	{ quantity = 10, itemID = 190456, dataSlotIndex = 1, }, -- DF Artist's Mettle for Treatises
					craftingReagentItems	= {},
					orderTarget				= "Mayland-Korgath",
				})
			end
			vC_OrderLabel:SetText(
				"Order Placed: |cffFFFF00"..iCnt.."|rx "..
				"|cff0DDD00"..C_TradeSkillUI.GetRecipeInfo(vC_Artisan_Craft[i][xPack]["TreatiseID"]).name.."|r"..
				" for |cff6495ED"..vC_Artisan_Craft[i]["sWho"].."|r"
			)
			break
		end
	end
	C_Timer.After(.5, function() ProfessionsCustomerOrdersFrame.MyOrdersPage.RefreshButton:Click() end)
end
------------------------------------------------------------------------
-- Build a Frame for Placing Crafting Orders
------------------------------------------------------------------------
function vC_PlaceCraftFrame(e)
	local p1, p2			= GetProfessions()
	local p1				= (p1 ~= nil and ((select(7,GetProfessionInfo(p1)))) or 0)
	local p2				= (p2 ~= nil and ((select(7,GetProfessionInfo(p2)))) or 0)
	if (p1 == nil and p2 == nil) then print("You don't have any profession!") return end
	local vC_pName, _		= UnitName("player")
	
	if ( ProfessionsCustomerOrdersFrame or e == "CRAFTINGORDERS_SHOW_CUSTOMER" ) then
		if ( vC_PlaceOrder == nil ) then	
			local vC_PlaceOrder = CreateFrame("Frame", "vC_PlaceOrder", UIParent, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_PlaceOrder, 16, 1)
				vC_PlaceOrder:SetSize(400,25)
				vC_PlaceOrder:SetPoint("BOTTOMRIGHT", ProfessionsCustomerOrdersFrame, "BOTTOMRIGHT", 1, -24)
				local vC_OrderLabel = vC_PlaceOrder:CreateFontString("vC_OrderLabel", "ARTWORK", "GameFontWhiteSmall")
					vC_OrderLabel:SetPoint("LEFT", vC_PlaceOrder, "LEFT", 8, 0)
					vC_OrderLabel:SetText("")
		end
		if ( vC_PlaceTreat == nil ) then
			local vC_PlaceTreat = CreateFrame("Frame", "vC_PlaceTreat", UIParent, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_PlaceTreat, 16, 1)
				vC_PlaceTreat:SetSize(270,38)
				vC_PlaceTreat:SetPoint("TOPRIGHT", vC_PlaceOrder, "BOTTOMRIGHT", 0, 3)
				vC_PlaceTreat:EnableMouse(true)
				vC_PlaceTreat:SetMovable(false)
				local vC_TreatLabel = vC_PlaceTreat:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
					vC_TreatLabel:SetPoint("LEFT", vC_PlaceTreat, "LEFT", 10, 0)
					vC_TreatLabel:SetText("|cffFFFF00Treatise(s):|r")
			local vC_TreatDF = CreateFrame("Frame", "vC_TreatDF", vC_PlaceTreat, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_TreatDF, 27, -1)
				vC_TreatDF:SetSize(90,34)
				vC_TreatDF:SetPoint("RIGHT", vC_PlaceTreat, "RIGHT", -2, 0)
				local vC_TreatDFLabel = vC_TreatDF:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
					vC_TreatDFLabel:SetPoint("LEFT", vC_TreatDF, "LEFT", 5, 0)
					vC_TreatDFLabel:SetText("|cffFFFF00DF:|r")
			local vC_TreatTW = CreateFrame("Frame", "vC_TreatTW", vC_PlaceTreat, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_TreatTW, 28, -1)
				vC_TreatTW:SetSize(90,34)
				vC_TreatTW:SetPoint("RIGHT", vC_TreatDF, "LEFT", 3, 0)
				local vC_TreatsieTWLabel = vC_TreatTW:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
					vC_TreatsieTWLabel:SetPoint("LEFT", vC_TreatTW, "LEFT", 5, 0)
					vC_TreatsieTWLabel:SetText("|cffFFFF00TW:|r")
			local cSpace = -5
			for xPac = 1, 2 do
				for i = 1, #vC_Artisan_Craft do
					if ( p1 == vC_Artisan_Craft[i]["pID"] or p2 == vC_Artisan_Craft[i]["pID"] ) then
						local vC_Treatise = CreateFrame("Button", "T"..xPac.."_"..vC_Artisan_Craft[i]["pID"], (xPac == 1 and vC_TreatDF or vC_TreatTW), "BackdropTemplate")
							vC_Treatise:SetSize(26, 26)
							vC_Treatise:SetPoint("RIGHT", (xPac == 1 and vC_TreatDF or vC_TreatTW), "RIGHT", cSpace, 0)
							vC_Treatise:SetNormalTexture(vC_Artisan_Craft[i]["Icon"])
							vC_Treatise:SetScript("OnClick", function(s)
								vC_PlaceAnTreatise(
									vC_Artisan_Craft[i]["pID"],
									(xPac == 1 and "DF" or "TW"),
									(3 - GetItemCount(vC_Artisan_Craft[i][(xPac == 1 and "DF" or "TW")]["ItemID"], true))
								)
							end)
							vC_Treatise:SetScript("OnEnter", function(s)
								vC_cToolTips(s,4,1,(xPac == 1 and "DF " or "TWW ")..C_TradeSkillUI.GetProfessionInfoBySkillLineID(vC_Artisan_Craft[i]["pID"]).professionName)
							end)
							vC_Treatise:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
							
							local n = GetItemCount(vC_Artisan_Craft[i][(xPac == 1 and "DF" or "TW")]["ItemID"], true)
							vC_Treatise:SetEnabled((n <= 3 and true or false))
							
							local vC_TreatCount = vC_Treatise:CreateFontString(nil, "ARTWORK", "SystemFont_Shadow_Large2_Outline")
								vC_TreatCount:SetPoint("BOTTOMRIGHT", vC_Treatise, "BOTTOMRIGHT", 1, 1)
								vC_TreatCount:SetText(
									(n <= 3 and "|cff00FFFF"..n.."|r" or "|cffFFFFFF"..n.."|r")
								)
						cSpace = cSpace - 29
					end
				end
				cSpace = -5
			end
		end
		if ( vC_PlaceOrderMsg == nil and (vC_pName == "Vandiel" or vC_pName == "Eudemons")) then
			local vC_PlaceOrderMsg = CreateFrame("Frame", "vC_PlaceOrderMsg", UIParent, "BackdropTemplate")
				vC_SetBackdrop_Choice(vC_PlaceOrderMsg, 16, 1)
				vC_PlaceOrderMsg:SetSize(270,38)
				vC_PlaceOrderMsg:SetPoint("TOPRIGHT", vC_PlaceTreat, "BOTTOMRIGHT", 0, 3)
				vC_PlaceOrderMsg:EnableMouse(true)
				vC_PlaceOrderMsg:SetMovable(false)
				local vC_CraftLabel = vC_PlaceOrderMsg:CreateFontString(nil, "ARTWORK", "GameFontWhiteSmall")
					vC_CraftLabel:SetPoint("LEFT", vC_PlaceOrderMsg, "LEFT", 10, 0)
					vC_CraftLabel:SetText("|cffFFFF00Craft(s):|r")
			local cSpace = -5
			for i = 1, #vC_Artisan_Craft do
				if ( vC_Artisan_Craft[i]["TW"]["WeeklySpellID"] ~= 0 ) then
					local vC_CraftIcon = CreateFrame("Button", "C_"..vC_Artisan_Craft[i]["pID"], vC_PlaceOrderMsg, "BackdropTemplate")
						vC_CraftIcon:SetSize(26, 26)
						vC_CraftIcon:SetPoint("RIGHT", vC_PlaceOrderMsg, "RIGHT", cSpace, 0)
						vC_CraftIcon:SetNormalTexture(vC_Artisan_Craft[i]["Icon"])
						vC_CraftIcon:SetScript("OnClick", function(s)
							vC_PlaceAnCraft(
								vC_Artisan_Craft[i]["pID"]
							)
						end)
						vC_CraftIcon:SetScript("OnEnter", function(s) vC_cToolTips(s,4,1,C_TradeSkillUI.GetProfessionInfoBySkillLineID(vC_Artisan_Craft[i]["pID"]).professionName) end)
						vC_CraftIcon:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
					cSpace = cSpace - 30
				end
			end
		end
	end
	if ( e == "CRAFTINGORDERS_HIDE_CUSTOMER" ) then
		vC_PlaceOrder:Hide()
		vC_PlaceTreat:Hide()
		if ( vC_PlaceOrderMsg ~= nil ) then vC_PlaceOrderMsg:Hide() end
	end
end
------------------------------------------------------------------------
-- Do the Craft Order Frame
------------------------------------------------------------------------
function vC_DoTheCraftFrame(e)
	if ( not ProfessionsFrame or ProfessionsFrame == nil ) then return end
	
	if ( vC_DoCraftFrame == nil and e == "CRAFTINGORDERS_CAN_REQUEST" ) then
		local vC_DoCraftFrame = CreateFrame("Button", "vC_DoCraftFrame", ProfessionsFrame, "BackdropTemplate")
			vC_DoCraftFrame:SetSize(46,46)
			vC_DoCraftFrame:SetPoint("TOPRIGHT", ProfessionsFrame, "TOPRIGHT", -3, -24)
			vC_DoCraftFrame:SetNormalTexture("Interface\\ICONS\\Ability_Evoker_EssenceBurst"..random(2,6))
			vC_DoCraftFrame:SetScript("OnClick", function(s) vC_DoTheCraft() end)
	end
	--if ( e == "CRAFTINGORDERS_HIDE_CRAFTER" ) then
	--	vC_DoCraftFrame:Hide()
	--end
end
------------------------------------------------------------------------
-- Do the Craft Order
------------------------------------------------------------------------
function vC_DoTheCraft()
	local a = ProfessionsFrame.OrdersPage.OrderView
	if a.OrderInfo.StartOrderButton:IsVisible() then a.OrderInfo.StartOrderButton:Click() end
	if a.CreateButton:IsVisible() then a.CreateButton:Click() end
	if StaticPopup1Button1:IsVisible() then StaticPopup1Button1:Click() end
	if a.CompleteOrderButton:IsVisible() then a.CompleteOrderButton:Click() end
end
------------------------------------------------------------------------
-- References
------------------------------------------------------------------------
	-- Zone: 2112 The Artisan's Market, Valdrakken (DF)
	-- Zone: 2339 Dornogal, Dornogal (TWW)

	-- Create An Crafting Order
	-- print(
	--   C_TradeSkillUI.GetRecipeInfo(vC_Treatises[b]["SpellID"]).skillLineAbilityID,
	--   C_TradeSkillUI.GetProfessionInfoBySkillLineID(vC_Treatises[b]["pID"]).professionName,
	--   C_TradeSkillUI.GetRecipeInfo(vC_Treatises[b]["SpellID"]).name
	-- )
	
	-- Check An Crafating Order
	-- local i = C_CraftingOrders.GetPersonalOrdersInfo()
	-- print(
	--  i[1].profession,
	--   i[1].numPersonalOrders,
	--   i[1].professionName
	-- )