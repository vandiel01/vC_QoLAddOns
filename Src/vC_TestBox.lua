-- Completed 03/16/2024
local vC_AppName, vC_App = ...
if not ( vC_Run_TestBox ) then return end
-------------------------------------------------------
-- Test Box for Testing Output (Maybe Debugging)
-------------------------------------------------------
function vC_TestBox_MinMax()
	if ( vC_TestBox:GetHeight() > 30 ) then
		vC_TestBox:SetSize(350, 28)
		vC_TestBoxScroll:Hide()
		vC_TestBox:ClearAllPoints()
		vC_TestBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -26)
	else
		vC_TestBox:SetSize(350, 650)
		--vC_TestBox:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		vC_TestBox:ClearAllPoints()
		vC_TestBox:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -26)
		--vC_TestBox:SetPoint("TOP", UIParent, "TOP", -220, -30)
			vC_TestBoxScroll:Show()
			vC_TestBoxScroll:SetWidth(vC_TestBox:GetWidth()-33)
			vC_TestBoxScroll:SetHeight(vC_TestBox:GetHeight()-32)
	end
end
-------------------------------------------------------
-- Test Box for Testing Output (Maybe Debugging)
-------------------------------------------------------
local vC_TestBox = CreateFrame("Frame", "vC_TestBox", UIParent, "BackdropTemplate")
	vC_SetBackdrop_Choice(vC_TestBox, 16, 1)
	vC_TestBox:SetSize(350, 250)
	--vC_TestBox:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	vC_TestBox:SetPoint("TOP", UIParent, "TOP", -219.190, -28.950)
	vC_TestBox:EnableMouse(true)
	vC_TestBox:SetMovable(true)
	vC_TestBox:SetClampedToScreen(true)
	vC_TestBox:SetFrameStrata("TOOLTIP")
	vC_TestBox:RegisterForDrag("LeftButton")
	vC_TestBox:SetScript("OnDragStart", function(s) s:StartMoving() end)
	vC_TestBox:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end) --print(s:GetPoint()) end)
	local vC_TestBoxTitle = vC_TestBox:CreateFontString("vC_TestBoxTitle", "ARTWORK", "GameFontNormalMed1")
		vC_TestBoxTitle:SetPoint("TOP", vC_TestBox, -24, -8)
		vC_TestBoxTitle:SetText("Any Test Goes Here!")
	local vC_TestBoxClose = CreateFrame("Button", "vC_TestBoxClose", vC_TestBox, "UIPanelCloseButton")
		vC_TestBoxClose:SetSize(23, 23)
		vC_TestBoxClose:SetPoint("TOPRIGHT", vC_TestBox, -3, -3)
		vC_TestBoxClose:SetScript("OnClick", function() vC_TestBox:Hide() end)
	local vC_TestBoxMinMax = CreateFrame("Button", "vC_TestBoxMinMax", vC_TestBox)
		vC_TestBoxMinMax:SetSize(23, 23)
		vC_TestBoxMinMax:SetPoint("RIGHT", vC_TestBoxClose, "LEFT", -1, 0)
		vC_TestBoxMinMax:SetNormalAtlas("RedButton-MiniCondense")
		vC_TestBoxMinMax:SetHighlightAtlas("RedButton-MiniCondense-pressed")
		vC_TestBoxMinMax:SetScript("OnClick", function() vC_TestBox_MinMax() end)
		
	local vC_TestBoxScroll = CreateFrame("ScrollFrame", "vC_TestBoxScroll", vC_TestBox, "UIPanelScrollFrameTemplate")
		vC_TestBoxScroll:SetPoint("TOPLEFT", vC_TestBox, 7, -28)
		vC_TestBoxScroll:SetWidth(vC_TestBox:GetWidth()-33)
		vC_TestBoxScroll:SetHeight(vC_TestBox:GetHeight()-32)
			vC_TestResultArea = CreateFrame("EditBox", "vC_TestResultArea", vC_TestBoxScroll)
			vC_TestResultArea:SetWidth(vC_TestBoxScroll:GetWidth())
			vC_TestResultArea:SetFontObject(GameFontNormal)
			vC_TestResultArea:SetAutoFocus(false)
			vC_TestResultArea:SetMultiLine(true)
			vC_TestResultArea:EnableMouse(true)
		vC_TestBoxScroll:SetScrollChild(vC_TestResultArea)

--vC_TestBox_MinMax()