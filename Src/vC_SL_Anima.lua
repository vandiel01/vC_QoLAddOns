-- Temporary Completed 05/26/2024
local vC_AppName, vC_App 					= ...
if not ( vC_Run_SLAnima ) then return end
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local GetBestMapForUnit						= C_Map.GetBestMapForUnit
local GetMapInfo							= C_Map.GetMapInfo
local vC_AnimaLabel = {
	"Bag/Bank: ",
	"Reservoir: ",
	"Total: ",
	"Til Cap: ",
	"Cache: ",
}
------------------------------------------------------------------------
-- Anima Counts
------------------------------------------------------------------------
function vC_AnimaCount()
	if vC_AnimaCounter == nil then return end
	local vC_tBool = true
	local tA = GetBestMapForUnit("player") or 0
	if GetMapInfo(tA) == nil then return end
	
	for i = 1, #vC_ZoneID[9] do
		if ( tA == vC_ZoneID[9][i] or GetMapInfo(tA).parentMapID == vC_ZoneID[9][i] ) then
			vC_tBool = true
			break
		end
		vC_tBool = false
	end
	if ( vC_tBool ) then
		vC_AnimaCounter:Show()
	else
		vC_AnimaCounter:Hide()
		return
	end
	
	local TotalCount, TotalItem, tHCnt = 0, 0, 0
	local AnimaReservoir = C_CurrencyInfo.GetCurrencyInfo(1813).quantity
	local MaxAnimaTotal = C_CurrencyInfo.GetCurrencyInfo(1813).maxQuantity
	
	for a = 1, #vC_Shadowlands_AnimaID do
		local InBagBank = GetItemCount(vC_Shadowlands_AnimaID[a],true)
		TotalItem = TotalItem + InBagBank
		local _, _, iRare = GetItemInfo(vC_Shadowlands_AnimaID[a])		
		local tCnt = 0
		if iRare == 2 then tCnt = InBagBank*5 end
		if iRare == 3 then tCnt = InBagBank*35 end
		if iRare == 4 then tCnt = InBagBank*250 end
		if iRare == 7 then tHCnt = InBagBank*1000 end
		TotalCount = TotalCount + tCnt
	end
	vC_AC_RLabel_1:SetText((BreakUpLargeNumbers(TotalItem) or 0).." ("..(BreakUpLargeNumbers(TotalCount) or 0)..")")
	vC_AC_RLabel_2:SetText(BreakUpLargeNumbers(AnimaReservoir) or 0)
	vC_AC_RLabel_3:SetText(BreakUpLargeNumbers(TotalCount + AnimaReservoir) or 0)
	vC_AC_RLabel_4:SetText(BreakUpLargeNumbers(MaxAnimaTotal-(AnimaReservoir+TotalCount)) or 0)
	vC_AC_RLabel_5:SetText(BreakUpLargeNumbers(tHCnt) or 0)
	--for i = 1, 5 do
	--	_G["vC_AC_RLabel_"..i]:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,s:GetText()) end)
	--	_G["vC_AC_RLabel_"..i]:SetScript("OnLeave", function() vC_cToolTips(0) end)
	--end
	for i = 1, #vC_Currency_By_Expansion[9] do
		local vC_tLbl = _G["vC_AC_Qty_"..vC_Currency_By_Expansion[9][i][1]]
			if vC_tLbl == nil then return end
			vC_tLbl:SetText(C_CurrencyInfo.GetCurrencyInfo(vC_Currency_By_Expansion[9][i][1]).quantity)
	end	
	if ( C_Covenants.GetActiveCovenantID() == 0 ) then 
		vC_AC_Seperator:SetAtlas("CovenantChoice-Celebration-KyrianCloudyLine")
	else
		local vC_cID = C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID()).name
		vC_AC_Seperator:SetAtlas("CovenantChoice-Celebration-"..vC_cID:gsub(" ","").."-DetailLine")
	end
end
------------------------------------------------------------------------
-- Anima Counter Frame
------------------------------------------------------------------------
if ( vC_AnimaCounter == nil ) then
	local vC_AnimaCounter = CreateFrame("Frame", "vC_AnimaCounter", UIParent, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_AnimaCounter, 16, 1)
		vC_AnimaCounter:SetSize(155,10)
		vC_AnimaCounter:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 355, 200)
		vC_AnimaCounter:SetClampedToScreen(true)
		vC_AnimaCounter:SetMovable(true)
		vC_AnimaCounter:EnableMouse(true)
		vC_AnimaCounter:RegisterForDrag("LeftButton")
		vC_AnimaCounter:SetScript("OnDragStart", function(s) s:StartMoving() end)
		vC_AnimaCounter:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end) --print(s:GetPoint()) end)
		local vC_AC_Title = vC_AnimaCounter:CreateFontString(nil, "ARTWORK", "GameFontNormalOutline")
			vC_AC_Title:SetPoint("CENTER", vC_AnimaCounter, "TOP", -10, -15)
			vC_AC_Title:SetText("Anima Counter")
		local vC_AC_Close = CreateFrame("Button", "vC_AC_Close", vC_AnimaCounter, "UIPanelCloseButton")
			vC_AC_Close:SetSize(22,22)
			vC_AC_Close:SetPoint("TOPRIGHT", vC_AnimaCounter, "TOPRIGHT", -3, -3)
			vC_AC_Close:SetScript("OnClick", function() vC_AnimaCounter:Hide() end)

		vC_Hdr = -25
		for i = 1, #vC_AnimaLabel do
			local vC_AC_FrameA = CreateFrame("Frame", "vC_AC_FrameA", vC_AnimaCounter, "BackdropTemplate")
				vC_AC_FrameA:SetSize(vC_AnimaCounter:GetWidth()-4,15)
				vC_AC_FrameA:SetPoint("TOPLEFT", vC_AnimaCounter, "TOPLEFT", 10, vC_Hdr)
				local vC_AC_LLabel = vC_AC_FrameA:CreateFontString("vC_AC_LLabel", "ARTWORK", "GameFontNormalSmall")
					vC_AC_LLabel:SetSize(65,18)
					vC_AC_LLabel:SetPoint("LEFT", vC_AC_FrameA, "LEFT", -6, 0)
					vC_AC_LLabel:SetJustifyH("RIGHT")
					vC_AC_LLabel:SetText(vC_AnimaLabel[i])
				local vC_AC_RLabel = vC_AC_FrameA:CreateFontString("vC_AC_RLabel_"..i, "ARTWORK", "NumberFont_GameNormal")
					vC_AC_RLabel:SetPoint("LEFT", vC_AC_LLabel, "RIGHT", 0, 0)
					vC_AC_RLabel:SetJustifyH("LEFT")
					vC_AC_RLabel:SetText("---")
			vC_Hdr = vC_Hdr - 15
		end

		vC_AC_Seperator = vC_AnimaCounter:CreateTexture("vC_AC_Seperator", "ARTWORK")
		vC_AC_Seperator:SetSize(vC_AnimaCounter:GetWidth()+10, 14)
		vC_AC_Seperator:SetPoint("TOP", vC_AnimaCounter, "TOP", 0, (-14*#vC_AnimaLabel-30))
		vC_AC_Seperator:SetTexture(3743728)

		local vC_ColDiv = math.ceil(#vC_Currency_By_Expansion[9] / 2)
		local vC_tWidth = vC_AnimaCounter:GetWidth()/2-8
		local vC_Hdr, vC_Col = -1*(#vC_AnimaLabel*16)-36, 7
		for i = 1, #vC_Currency_By_Expansion[9] do
			local vC_AC_Currency = CreateFrame("Frame", "vC_AC_Currency"..i, vC_AnimaCounter, "BackdropTemplate")
				vC_AC_Currency:SetSize(vC_tWidth, 20)
				vC_AC_Currency:SetPoint("TOPLEFT", vC_AnimaCounter, "TOPLEFT", vC_Col, vC_Hdr)
				local vC_AC_Icon = CreateFrame("Button", "vC_AC_Icon", vC_AnimaCounter)
					vC_AC_Icon:SetSize(18,18)
					vC_AC_Icon:SetNormalTexture(C_CurrencyInfo.GetCurrencyInfo(vC_Currency_By_Expansion[9][i][1]).iconFileID)
					vC_AC_Icon:SetPoint("LEFT", vC_AC_Currency, "LEFT", 0, 0)
					vC_AC_Icon:SetScript("OnClick", function() SlashCmdList["AllTheThings"]("currencyid:"..vC_Currency_By_Expansion[9][i][1]) end)
					vC_AC_Icon:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,vC_Currency_By_Expansion[9][i][2]) end)
					vC_AC_Icon:SetScript("OnLeave", function() vC_cToolTips(0) end)
				local vC_AC_Qty = vC_AC_Currency:CreateFontString("vC_AC_Qty_"..vC_Currency_By_Expansion[9][i][1], "ARTWORK", "NumberFont_GameNormal")
					vC_AC_Qty:SetPoint("LEFT", vC_AC_Icon, "RIGHT", 5, 0)
					vC_AC_Qty:SetText("---")
			if (i % vC_ColDiv == 0) then
				vC_Hdr = -1*(#vC_AnimaLabel*16)-36
				vC_Col = vC_Col + vC_tWidth
			else
				vC_Hdr = vC_Hdr - 21
			end
		end
		
		-- Fix Height for Anima Counter
		vC_AnimaCounter:SetHeight((#vC_AnimaLabel*16)+(vC_ColDiv*21)+40)
end