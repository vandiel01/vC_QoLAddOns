-- In Progress 05/26/2024
local vC_AppName, vC_App = ...
if not ( vC_Run_AHToons ) then return end
-------------------------------------------------------
-- Cross Realm AH Quick Configure, Minimize Addon, Maximize Common Actions
-------------------------------------------------------
local vC_Van_Char							= { "Vandiel-Korgath", "Kjari-Korgath", "Xmogforlife-Korgath"}
local RideThisMount							= 741		-- Mystic Runesaber
local RideAHMount							= 2265		-- Trader's Gilded Brutosaur
-------------------------------------------------------
-- Run Simplified Interface for AH Toons
-------------------------------------------------------
function vC_CrossRealm_AH()
	local pName, _							= UnitName("player")
	if not ( pName == "Xmogforlife" ) then return end

	local vC_CheckAddOn						= 0
	for i = 1, C_AddOns.GetNumAddOns() do
		if ( C_AddOns.GetAddOnEnableState(C_AddOns.GetAddOnInfo(i), pName) ~= 0 ) then
			vC_CheckAddOn = vC_CheckAddOn + 1
		end
	end	
	
	if ( vC_CheckAddOn ~= #vC_Specific_AddOn ) then
		C_AddOns.DisableAllAddOns(pName)
		for i = 1, #vC_Specific_AddOn do
			C_AddOns.EnableAddOn(vC_Specific_AddOn[i], pName)
		end
		local vC_XMogAHFrame = CreateFrame("Button", "vC_XMogAHFrame", UIParent, "SecureActionButtonTemplate")
			vC_XMogAHFrame:SetSize(42, 42)
			vC_XMogAHFrame:SetNormalTexture("Interface\\ICONS\\Ability_Domination_Rune0"..random(1,9))
			vC_XMogAHFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 35, -30)
			vC_XMogAHFrame:SetMouseClickEnabled(true)
			vC_XMogAHFrame:RegisterForClicks("AnyUp", "AnyDown")				
			vC_XMogAHFrame:SetAttribute("type", "macro")
			vC_XMogAHFrame:SetAttribute("macrotext1","/reload")
	end
	
	if ( vC_XMogAHFrame == nil and vC_CheckAddOn == #vC_Specific_AddOn ) then
		local vC_XMogAHFrame = CreateFrame("Frame", "vC_XMogAHFrame", UIParent, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_XMogAHFrame, 36, 9)
			vC_XMogAHFrame:SetSize(270,68)
			vC_XMogAHFrame:ClearAllPoints()
			vC_XMogAHFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -10)
			vC_XMogAHFrame:EnableMouse(true)
			vC_XMogAHFrame:SetMovable(true)
			vC_XMogAHFrame:SetClampedToScreen(true)
			vC_XMogAHFrame:RegisterForDrag("LeftButton")
			vC_XMogAHFrame:SetScript("OnDragStart", function(s) s:StartMoving() end)
			vC_XMogAHFrame:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end) --print(s:GetPoint()) end)
			local vC_XMogAHTitle = vC_XMogAHFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
				vC_XMogAHTitle:SetPoint("TOP", vC_XMogAHFrame, -10, -5)
				vC_XMogAHTitle:SetText("Cross Realm AH Check")
			local vC_XMogAHClose = CreateFrame("Button", "vC_XMogAHClose", vC_XMogAHFrame, "UIPanelCloseButton")
				vC_XMogAHClose:SetSize(22,22)
				vC_XMogAHClose:SetPoint("TOPRIGHT", vC_XMogAHFrame, -3, -3)
				vC_XMogAHClose:SetScript("OnClick", function() vC_XMogAHFrame:Hide() end)
				
		local vC_XMogGoldFrame = CreateFrame("Frame", "vC_XMogGoldFrame", vC_XMogAHFrame, "BackdropTemplate")
			vC_XMogGoldFrame:ClearAllPoints()
			vC_SetBackdrop_Choice(vC_XMogGoldFrame, 16, 1)
			vC_XMogGoldFrame:SetSize(270, 30)
			vC_XMogGoldFrame:SetPoint("BOTTOM", vC_XMogAHFrame, "BOTTOM", 0, -30)
				vC_XMogGoldAmount = vC_XMogGoldFrame:CreateFontString("vC_XMogGoldAmount", "ARTWORK", vC_Font[216])
				vC_XMogGoldAmount:SetPoint("CENTER", vC_XMogGoldFrame, "CENTER", 0, 0)
				vC_XMogGoldAmount:SetText(vC_GoldFormat(GetMoney()))

		local vC_XMogMountUpReg = CreateFrame("Button", "vC_XMogMountUpReg", vC_XMogAHFrame)
			vC_XMogMountUpReg:SetSize(42,42)
			vC_XMogMountUpReg:SetNormalTexture(132267)			-- Ability_Mount_WhiteTiger
			vC_XMogMountUpReg:SetPoint("LEFT", vC_XMogAHFrame, "LEFT", 4, -10)
			vC_XMogMountUpReg:SetScript("OnClick", function() C_MountJournal.SummonByID(RideThisMount) end)
				
		local vC_XMogMountUpAH = CreateFrame("Button", "vC_XMogMountUpAH", vC_XMogAHFrame)
			vC_XMogMountUpAH:SetSize(42,42)
			vC_XMogMountUpAH:SetNormalTexture(6075464) 			-- inv_brontsaurusmountspecial
			vC_XMogMountUpAH:SetPoint("LEFT", vC_XMogMountUpReg, "RIGHT", 2, 0)
			vC_XMogMountUpAH:SetScript("OnClick", function() C_MountJournal.SummonByID(RideAHMount) end)
			
		local vC_XMogInvite = CreateFrame("Button", "vC_XMogInvite", vC_XMogAHFrame)
			vC_XMogInvite:SetSize(42,42)
			vC_XMogInvite:SetNormalTexture(134149) 				-- INV_Misc_GroupNeedMore
			vC_XMogInvite:SetPoint("LEFT", vC_XMogMountUpAH, "RIGHT", 2, 0)
			vC_XMogInvite:SetScript("OnClick", function()
				for i = 1, #vC_Van_Char do C_PartyInfo.InviteUnit(vC_Van_Char[i]) end
			end)
			
		local vC_XMogTrade = CreateFrame("Button", "vC_XMogTrade", vC_XMogAHFrame)
			vC_XMogTrade:SetSize(42,42)
			vC_XMogTrade:SetNormalTexture(tonumber("463045"..random(4,8)))	--  Ability_Evoker_InnateMagic..random(2,5)
			vC_XMogTrade:SetPoint("LEFT", vC_XMogInvite, "RIGHT", 2, 0)
			vC_XMogTrade:SetScript("OnClick", function()
				for i = 1, #vC_Van_Char do InitiateTrade(vC_Van_Char[i]) end
				if( not ContainerFrame1:IsShown() ) then ToggleBag(0) end
			end)
			
		local vC_XMogReturnGold = CreateFrame("Button", "vC_XMogReturnGold", vC_XMogAHFrame)
			vC_XMogReturnGold:SetSize(42,42)
			vC_XMogReturnGold:SetNormalTexture(4638725)			-- INV_10_Fishing_DragonIslesCoins_Gold
			vC_XMogReturnGold:SetPoint("LEFT", vC_XMogTrade, "RIGHT", 2, 0)
			vC_XMogReturnGold:SetScript("OnClick", function()
				if not TradeFrame:IsVisible() then return end
				TradePlayerInputMoneyFrameCopper:SetNumber(math.floor(GetMoney() % 100))
				TradePlayerInputMoneyFrameSilver:SetNumber(math.floor((GetMoney() / 100) % 100))
				TradePlayerInputMoneyFrameGold:SetNumber(math.floor(GetMoney() / 100 / 100))
			end)
			
		local vC_XMogLeave = CreateFrame("Button", "vC_XMogLeave", vC_XMogAHFrame)
			vC_XMogLeave:SetSize(42,42)
			vC_XMogLeave:SetNormalTexture(132219)				-- Ability_Kick
			vC_XMogLeave:SetPoint("LEFT", vC_XMogReturnGold, "RIGHT", 2, 0)
			vC_XMogLeave:SetScript("OnClick", function()
				if TradeFrame:IsVisible() then TradeFrameCloseButton:Click() end
				C_PartyInfo.LeaveParty()
				local vC_XMogLogoff = CreateFrame("Button", "vC_XMogLogoff", vC_XMogLeave, "SecureActionButtonTemplate")
					vC_XMogLogoff:SetSize(42,42)
					vC_XMogLogoff:SetNormalTexture(tonumber("40051"..random(51,62))) -- Ability_Domination_Rune0"..random(1,9))
					vC_XMogLogoff:SetPoint("TOPLEFT", vC_XMogLeave)
					vC_XMogLogoff:SetMouseClickEnabled(true)
					vC_XMogLogoff:RegisterForClicks("AnyUp", "AnyDown")				
					vC_XMogLogoff:SetAttribute("type", "macro")
					vC_XMogLogoff:SetAttribute("macrotext1","/logout")
			end)
	end
end