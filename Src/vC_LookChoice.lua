-- Completed 03/xx/2024
local vC_AppName, vC_App				= ...
if not ( vC_Run_LookChoice ) then return end
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local engFaction, locFaction			= UnitFactionGroup("player")
local locClass, engClass, classIdx		= UnitClass("player")
-------------------------------------------------------
-- Additional Backdrop, Fonts, Border Choice - Visual Test
-------------------------------------------------------
function vC_MinMax_LookChoice()
	if ( vC_LookChoice:GetHeight() > 30) then
		vC_LookChoice:SetSize(450, 28)
		vC_FontChoice:Hide()
		vC_BkgndChoice:Hide()
		vC_BorderChoice:Hide()
		vC_ResultChoice:Hide()
		vC_FactionFr:Hide()
		vC_OutputBox_Info:Hide()
		vC_LookChoice:ClearAllPoints()
		vC_LookChoice:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -56)
	else
		vC_LookChoice:SetSize(1171, 968)
		vC_FontChoice:Show()
		vC_BkgndChoice:Show()
		vC_BorderChoice:Show()
		vC_ResultChoice:Show()
		vC_FactionFr:Show()
		vC_OutputBox_Info:Show()
		vC_LookChoice:ClearAllPoints()
		vC_LookChoice:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	end
end
function vC_LookChoiceTest()
	local fo = vC_Font[(vC_FontNbr:GetNumber() == 0 and 1 or vC_FontNbr:GetNumber())]
	local bk = (vC_BkgndNbr:GetNumber() == 0 and 1 or vC_BkgndNbr:GetNumber())
	local bo = (vC_BorderNbr:GetNumber() == 0 and 1 or vC_BorderNbr:GetNumber())
	
	-- Testbox Config
	if ( vC_TestBox ~= nil and vC_TestBox:IsVisible() ) then
		vC_SetBackdrop_Choice(vC_TestBox, bk, bo)
		vC_TestBoxTitle:SetFontObject(fo)
		vC_TestResultArea:SetFontObject(fo)
	end
	-- Zone, Loc, X & Y
	if ( vC_CoordLocFrame ~= nil and vC_CoordLocFrame:IsVisible() ) then
		vC_SetBackdrop_Choice(vC_CoordLocFrame, bk, bo)
		vC_CoordLocText:SetFontObject(fo)
	end
	if ( vC_CoordXYFrame ~= nil and vC_CoordXYFrame:IsVisible() ) then	
		vC_SetBackdrop_Choice(vC_CoordXYFrame, bk, bo)
		vC_CoordXYText:SetFontObject(fo)
	end
	-- Gold Hoarding
	if ( vC_GH_Body_Frame ~= nil and vC_GH_Body_Frame:IsVisible() ) then
		--vC_SetBackdrop_Choice(vC_GH_Body_Frame, bk, bo)
		vC_SetBackdrop_Choice(vC_GH_Body_TitleFrame, bk, bo)
		vC_GH_Body_Title:SetFontObject(fo)
		--vC_SetBackdrop_Choice(vC_GH_ServerList_Frame, bk, bo)
		vC_SetBackdrop_Choice(vC_GH_ServerList_TitleFrame, bk, bo)
		vC_GH_ServerList_Title:SetFontObject(fo)
		vC_GH_YouHave_Text:SetFontObject(fo)
		vC_GH_SendInfo_Lbl1:SetFontObject(fo)
		vC_GH_SendInfo_Lbl2:SetFontObject(fo)
		vC_GH_ResultArea:SetFontObject(fo)
	end
	-- Anima Counter
	if ( vC_AnimaCounter ~= nil and vC_AnimaCounter:IsVisible() ) then	
		vC_SetBackdrop_Choice(vC_AnimaCounter, bk, bo)
		for i = 1, 4 do
			_G["vC_AC_RLabel_"..i]:SetFontObject(fo)
		end
		for i = 1, #vC_Currency_By_Expansion[9] do
			_G["vC_AC_Qty_"..vC_Currency_By_Expansion[9][i][1]]:SetFontObject(fo)
		end
	end
end
-------------------------------------------------------
-- Backdrop, Fonts, Border Choice (Visual)
-------------------------------------------------------
if ( vC_LookChoice == nil ) then
	--if #vC_tDB ~= 0 then wipe(vC_tDB) end

	local vC_LookChoice = CreateFrame("Frame", "vC_LookChoice", UIParent, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_LookChoice, 16, 1)
		vC_LookChoice:SetSize(1171, 968)
		--vC_LookChoice:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
		vC_LookChoice:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -56)
		vC_LookChoice:EnableMouse(true)
		vC_LookChoice:SetMovable(true)
		vC_LookChoice:SetClampedToScreen(false)
		vC_LookChoice:SetFrameStrata("TOOLTIP")
		vC_LookChoice:RegisterForDrag("LeftButton")
		vC_LookChoice:SetScript("OnDragStart", function(s) s:StartMoving() end)
		vC_LookChoice:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end) --print(s:GetPoint()) end)
		local vC_LCTitle = vC_LookChoice:CreateFontString(nil, "ARTWORK", "GameFontNormalMed1")
			vC_LCTitle:SetPoint("CENTER", vC_LookChoice, "TOP", 0, -15)
			vC_LCTitle:SetText("Experiment with Fonts, Background & Borders")
		local vC_LCClose = CreateFrame("Button", "vC_LCClose", vC_LookChoice, "UIPanelCloseButton")
			vC_LCClose:SetSize(23, 23)
			vC_LCClose:SetPoint("TOPRIGHT", vC_LookChoice, "TOPRIGHT", -3, -3)
			vC_LCClose:SetScript("OnClick", function() vC_LookChoice:Hide() end)
			
		local vC_LCMinMax = CreateFrame("Button", "vC_LCMinMax", vC_LookChoice)
			vC_LCMinMax:SetSize(23, 23)
			vC_LCMinMax:SetPoint("RIGHT", vC_LCClose, "LEFT", -1, 0)
			vC_LCMinMax:SetNormalAtlas("RedButton-MiniCondense")
			vC_LCMinMax:SetHighlightAtlas("RedButton-MiniCondense-pressed")
			vC_LCMinMax:SetScript("OnClick", function() vC_MinMax_LookChoice() end)
			
	local vC_FontChoice = CreateFrame("Frame", "vC_FontChoice", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_FontChoice, 16, 1)
		vC_FontChoice:SetSize(620, 867)
		vC_FontChoice:SetPoint("TOPLEFT", vC_LookChoice, "TOPLEFT", 3, -24)
		vC_FontChoice:EnableMouse(true)
		local vC_FontTitle = vC_FontChoice:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_FontTitle:SetPoint("CENTER", vC_FontChoice, "TOP", 0, -15)
			vC_FontTitle:SetText(#vC_Font.." Fonts")
	local vC_Hdr, vC_Col = -25, 5
	for i = 1, #vC_Font do
		local vC_sFF = CreateFrame("Frame", "vC_sFF"..i, vC_FontChoice, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_sFF, 2, 1)
			vC_sFF:SetSize(50, 30)
			vC_sFF:SetPoint("TOPLEFT", vC_FontChoice, vC_Col, vC_Hdr)
			vC_sFT = vC_sFF:CreateFontString(nil, "ARTWORK", vC_Font[i])
			vC_sFT:SetText(i)
			vC_sFT:SetPoint("CENTER", vC_sFF, "CENTER", 0, 0)
			local vC_sFB = CreateFrame("Button", "vC_sFB"..i, vC_sFF)
				vC_sFB:SetSize(16, 16)
				vC_sFB:SetPoint("BOTTOMRIGHT", vC_sFF, "BOTTOMRIGHT", 0, 0)
				vC_sFB:SetNormalTexture(1673939)
				vC_sFB:RegisterForClicks("LeftButtonUp")
				vC_sFB:SetScript("OnClick", function(s)
					vC_FontNbr:SetNumber(i)
					vC_FontName:SetText(vC_Font[i])
					vC_ResultOutTxt:SetFontObject((vC_FontNbr:GetNumber() == 0 and vC_Font[1] or vC_Font[i]))
					vC_SetBackdrop_Choice(
						vC_ResultOutFr,
						(vC_BkgndNbr:GetNumber() == 0 and 1 or vC_BkgndNbr:GetNumber()),
						(vC_BorderNbr:GetNumber() == 0 and 1 or vC_BorderNbr:GetNumber())
					)
					vC_LookChoiceTest()
				end)
		if (i % 27 == 0) then
			vC_Hdr = -25
			vC_Col = vC_Col + 51
		else
			vC_Hdr = vC_Hdr - 31 
		end
	end

	local vC_BkgndChoice = CreateFrame("Frame", "vC_BkgndChoice", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_BkgndChoice, 16, 1)
		vC_BkgndChoice:SetSize(417, 773)
		vC_BkgndChoice:SetPoint("TOPLEFT", vC_FontChoice, "TOPRIGHT", -3, 0)
		vC_BkgndChoice:EnableMouse(true)        
		local vC_BkgndTitle = vC_BkgndChoice:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_BkgndTitle:SetPoint("CENTER", vC_BkgndChoice, "TOP", 0, -15)
			vC_BkgndTitle:SetText(#vC_Backdrop.." Backgrounds")
	local vC_Hdr, vC_Col = -25, 5
	for i = 1, #vC_Backdrop do
		local vC_bFF = CreateFrame("Frame", "vC_bFF"..i, vC_BkgndChoice, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_bFF, i, 1)
			vC_bFF:SetSize(50, 30)
			vC_bFF:SetPoint("TOPLEFT", vC_BkgndChoice, vC_Col, vC_Hdr)
			vC_bFT = vC_bFF:CreateFontString(nil, "ARTWORK", "GameFontWhite")
			vC_bFT:SetText(i)
			vC_bFT:SetPoint("CENTER", vC_bFF, "CENTER", 0, 0)
			local vC_bFB = CreateFrame("Button", "vC_bFB"..i, vC_bFF)
				vC_bFB:SetSize(16, 16)
				vC_bFB:SetPoint("BOTTOMRIGHT", vC_bFF, "BOTTOMRIGHT", 0, 0)
				vC_bFB:SetNormalTexture(1673939)
				vC_bFB:RegisterForClicks("LeftButtonUp")
				vC_bFB:SetScript("OnClick", function(s)
					vC_BkgndNbr:SetNumber(i)
					vC_BkgndName:SetText("Interface\\"..vC_Backdrop[i])
					vC_ResultOutTxt:SetFontObject((vC_FontNbr:GetNumber() == 0 and vC_Font[1] or vC_Font[vC_FontNbr:GetNumber()]))
					vC_SetBackdrop_Choice(
						vC_ResultOutFr,
						i,
						(vC_BorderNbr:GetNumber() == 0 and 1 or vC_BorderNbr:GetNumber())
					)
					vC_LookChoiceTest()
				end)
		if (i % 24 == 0) then
			vC_Hdr = -25
			vC_Col = vC_Col + 51
		else
			vC_Hdr = vC_Hdr - 31 
		end
	end

	local vC_BorderChoice = CreateFrame("Frame", "vC_BorderChoice", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_BorderChoice, 16, 1)
		vC_BorderChoice:SetSize(134, 773)
		vC_BorderChoice:SetPoint("TOPLEFT", vC_BkgndChoice, "TOPRIGHT", -3, 0)
		vC_BorderChoice:EnableMouse(true)        
		local vC_BorderTitle = vC_BorderChoice:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_BorderTitle:SetPoint("CENTER", vC_BorderChoice, "TOP", 0, -15)
			vC_BorderTitle:SetText(#vC_Border.." Borders")
	local vC_Hdr, vC_Col = -25, 7
	for i = 1, #vC_Border do
		local vC_rFF = CreateFrame("Frame", "vC_rFF"..i, vC_BorderChoice, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_rFF, 2, i)
			vC_rFF:SetSize(120, 48)
			vC_rFF:SetPoint("TOPLEFT", vC_BorderChoice, vC_Col, vC_Hdr)
			vC_rFT = vC_rFF:CreateFontString(nil, "ARTWORK", "GameFontWhite")
			vC_rFT:SetText(i)
			vC_rFT:SetPoint("CENTER", vC_rFF, "CENTER", 0, 0)
			local vC_rFB = CreateFrame("Button", "vC_rFB"..i, vC_rFF)
				vC_rFB:SetSize(16,16)
				vC_rFB:SetPoint("BOTTOMRIGHT", vC_rFF, "BOTTOMRIGHT", -5, 5)
				vC_rFB:SetNormalTexture(1673939)
				vC_rFB:RegisterForClicks("LeftButtonUp")
				vC_rFB:SetScript("OnClick", function(s)
					vC_BorderNbr:SetNumber(i)
					vC_BorderName:SetText("Interface\\"..vC_Border[i])
					vC_ResultOutTxt:SetFontObject((vC_FontNbr:GetNumber() == 0 and vC_Font[1] or vC_Font[vC_FontNbr:GetNumber()]))
					vC_SetBackdrop_Choice(
						vC_ResultOutFr,
						(vC_BkgndNbr:GetNumber() == 0 and 1 or vC_BkgndNbr:GetNumber()),
						i
					)
					vC_LookChoiceTest()
				end)
		if (i % 15 == 0) then
			vC_Hdr = -25
			vC_Col = vC_Col + 122
		else
			vC_Hdr = vC_Hdr - 49
		end
	end

	local vC_ResultChoice = CreateFrame("Frame", "vC_ResultChoice", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_ResultChoice, 16, 1)
		vC_ResultChoice:SetSize(518, 170)
		vC_ResultChoice:SetPoint("BOTTOMRIGHT", vC_LookChoice, "BOTTOMRIGHT", -3, 3)
		vC_ResultChoice:EnableMouse(true)
		local vC_ResultTitle = vC_ResultChoice:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_ResultTitle:SetPoint("CENTER", vC_ResultChoice, "TOP", 0, -15)
			vC_ResultTitle:SetText("Results from Choices")
		local vC_ResultOutFr = CreateFrame("Frame", "vC_ResultOutFr", vC_ResultChoice, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_ResultOutFr, 1, 1)
			vC_ResultOutFr:SetSize(468, 120)
			vC_ResultOutFr:SetPoint("CENTER", vC_ResultChoice, "CENTER", 0, -5)
			local vC_ResultOutTxt = vC_ResultOutFr:CreateFontString("vC_ResultOutTxt", "ARTWORK", "GameFontNormal")
				vC_ResultOutTxt:SetPoint("CENTER", vC_ResultOutFr, "CENTER", 0, 0)
				vC_ResultOutTxt:SetText("ABCDEFGHIJKLMNOPQRSTUVWXYZ\n\n1234567890\n\n![]@#${}%^:&*()_+;\"'<,>.?/\n\nThe quick brown fox jumps over the lazy dog")

	local vC_FactionFr = CreateFrame("Frame", "vC_FactionFr", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_FactionFr, 16, 1)
		vC_FactionFr:SetSize(33, 96)
		vC_FactionFr:SetPoint("TOPRIGHT", vC_ResultChoice, "TOPLEFT", 3, 0)
		local vC_FactionIc = vC_FactionFr:CreateTexture()
			vC_FactionIc:SetSize(28, 28)
			vC_FactionIc:SetPoint("CENTER", vC_FactionFr, "TOP", 0, -20)
			vC_FactionIc:SetAtlas((engFaction == "Alliance" and "AllianceEmblem" or "HordeEmblem"))
		local vC_ConvenantIc = vC_FactionFr:CreateTexture("vC_ConvenantIc")
			vC_ConvenantIc:SetSize(24, 24)
			vC_ConvenantIc:SetPoint("TOP", vC_FactionIc, "BOTTOM", 0, -2)
			vC_ConvenantIc:SetAtlas(607861)
		local vC_ClassIc = vC_FactionFr:CreateTexture()
			vC_ClassIc:SetSize(22, 22)
			vC_ClassIc:SetPoint("TOP", vC_ConvenantIc, "BOTTOM", 0, -3)
			vC_ClassIc:SetAtlas(vC_Class_Data[classIdx][4])

	local vC_OutputBox_Info = CreateFrame("Frame", "vC_OutputBox_Info", vC_LookChoice, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_OutputBox_Info, 16, 1)
		vC_OutputBox_Info:SetSize(651, 77)
		vC_OutputBox_Info:SetPoint("BOTTOMLEFT", vC_LookChoice, "BOTTOMLEFT", 2, 3)
		
		local vC_FontLbl = vC_OutputBox_Info:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_FontLbl:SetSize(70, 22)
			vC_FontLbl:SetPoint("TOPLEFT", vC_OutputBox_Info, "TOPLEFT", 0, -5)
			vC_FontLbl:SetJustifyH("RIGHT")
			vC_FontLbl:SetText("Font:")
		local vC_FontNbr = CreateFrame("EditBox", "vC_FontNbr", vC_OutputBox_Info, "InputBoxTemplate")
			vC_FontNbr:SetSize(35, 22)
			vC_FontNbr:SetPoint("LEFT", vC_FontLbl, "RIGHT", 8, 0)
			vC_FontNbr:SetAutoFocus(false)
			vC_FontNbr:SetNumeric(true)
			vC_FontNbr:SetNumber(0)
		local vC_FontName = CreateFrame("EditBox", "vC_FontName", vC_OutputBox_Info, "InputBoxTemplate")
			vC_FontName:SetSize(525, 22)
			vC_FontName:SetPoint("LEFT", vC_FontNbr, "RIGHT", 7, 0)
			vC_FontName:SetAutoFocus(false)
			vC_FontName:SetText("")

		local vC_BkgndLbl = vC_OutputBox_Info:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_BkgndLbl:SetSize(70, 22)
			vC_BkgndLbl:SetPoint("TOPLEFT", vC_FontLbl, "BOTTOMLEFT", 0, -1)
			vC_BkgndLbl:SetJustifyH("RIGHT")
			vC_BkgndLbl:SetText("Bkgnd:")
		local vC_BkgndNbr = CreateFrame("EditBox", "vC_BkgndNbr", vC_OutputBox_Info, "InputBoxTemplate")
			vC_BkgndNbr:SetSize(35, 22)
			vC_BkgndNbr:SetPoint("LEFT", vC_BkgndLbl, "RIGHT", 8, 0)
			vC_BkgndNbr:SetAutoFocus(false)
			vC_BkgndNbr:SetNumeric(true)
			vC_BkgndNbr:SetNumber(0)
		local vC_BkgndName = CreateFrame("EditBox", "vC_BkgndName",vC_OutputBox_Info, "InputBoxTemplate")
			vC_BkgndName:SetSize(525, 22)
			vC_BkgndName:SetPoint("LEFT", vC_BkgndNbr, "RIGHT", 7, 0)
			vC_BkgndName:SetAutoFocus(false)
			vC_BkgndName:SetText("")

		local vC_BorderLbl = vC_OutputBox_Info:CreateFontString(nil, "ARTWORK", "Game13Font_o1")
			vC_BorderLbl:SetSize(70, 22)
			vC_BorderLbl:SetPoint("TOPLEFT", vC_BkgndLbl, "BOTTOMLEFT", 0, -1)
			vC_BorderLbl:SetJustifyH("RIGHT")
			vC_BorderLbl:SetText("Border:")
		local vC_BorderNbr = CreateFrame("EditBox", "vC_BorderNbr", vC_OutputBox_Info, "InputBoxTemplate")
			vC_BorderNbr:SetSize(35, 22)
			vC_BorderNbr:SetPoint("LEFT", vC_BorderLbl, "RIGHT", 8, 0)
			vC_BorderNbr:SetAutoFocus(false)
			vC_BorderNbr:SetNumeric(true)
			vC_BorderNbr:SetNumber(0)
		local vC_BorderName = CreateFrame("EditBox", "vC_BorderName", vC_OutputBox_Info, "InputBoxTemplate")
			vC_BorderName:SetSize(525, 22)
			vC_BorderName:SetPoint("LEFT", vC_BorderNbr, "RIGHT", 7, 0)
			vC_BorderName:SetAutoFocus(false)
			vC_BorderName:SetText("")

			vC_MinMax_LookChoice()
end