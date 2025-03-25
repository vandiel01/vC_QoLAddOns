
local vC_AppName, vC_App = ...
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local engFaction, locFaction				= UnitFactionGroup("player")
-------------------------------------------------------
-- Frame for New Interface
-------------------------------------------------------
-- Minimap Icons
if vC_QoLMiniMap == nil then
	local vC_QoLMiniMap = CreateFrame("Button", "vC_QoLMiniMap", Minimap)
		vC_QoLMiniMap:SetSize(32, 32)
		vC_QoLMiniMap:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMLEFT", -16, -16)
		vC_QoLMiniMap:SetNormalTexture((locFaction == "Alliance" and 137203 or (locFaction == "Horde" and 137204 or 137205)))
		vC_QoLMiniMap:SetHighlightTexture((locFaction == "Alliance" and 137201 or (locFaction == "Horde" and 137219 or 137201)))
		vC_QoLMiniMap:SetMovable(false)
		vC_QoLMiniMap:SetScript("OnClick", function()
			if vC_QoLFr:IsVisible() then vC_QoLFr:Hide() else vC_QoLFr:Show() end
		end)
		vC_QoLMiniMap:SetScript("OnEnter", function() vC_cToolTips(vC_QoLMiniMap,1,1,vC_AppTitle.." v"..vC_AppVersion.."\n\n"..vC_AppNotes) end)
		vC_QoLMiniMap:SetScript("OnLeave", function() vC_cToolTips(0) end)
end
-- Standard Frame
if vC_QoLFr == nil then
	local vC_QoLFr = CreateFrame("Frame", "vC_QoLFr", UIParent, "BackdropTemplate")
		vC_QoLFr:SetSize(670, 421)
		vC_QoLFr:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -20)
		vC_QoLFr:EnableMouse(true)
		vC_QoLFr:SetMovable(true)
		vC_QoLFr:SetClampedToScreen(true)
		vC_QoLFr:RegisterForDrag("LeftButton")
		vC_QoLFr:SetScript("OnDragStart", function() vC_QoLFr:StartMoving() end)
		vC_QoLFr:SetScript("OnDragStop", function() vC_QoLFr:StopMovingOrSizing() print(vC_QoLFr:GetPoint()) end)
		vC_QoLFr_TL_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") --Top Left
			vC_QoLFr_TL_Tex:SetPoint("TOPLEFT")
			vC_QoLFr_TL_Tex:SetAtlas("UI-Frame-Metal-CornerTopLeft",true)
		vC_QoLFr_TC_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Top Center
			vC_QoLFr_TC_Tex:SetPoint("TOP")
			vC_QoLFr_TC_Tex:SetAtlas("_UI-Frame-Metal-EdgeTop",true)
			vC_QoLFr_TC_Tex:SetWidth(vC_QoLFr:GetWidth()-150)
			vC_QoLFr_TC_Title = vC_QoLFr:CreateFontString(nil, "ARTWORK", "SystemFont_NamePlateFixed")
				vC_QoLFr_TC_Title:SetPoint("CENTER", vC_QoLFr_TC_Tex, "TOP", 15, -29)
				vC_QoLFr_TC_Title:SetText("Making Your Life Easy!")
		vC_QoLFr_TR_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Top Right
			vC_QoLFr_TR_Tex:SetPoint("TOPRIGHT")
			vC_QoLFr_TR_Tex:SetAtlas("UI-Frame-Metal-CornerTopRightDouble",true)
		vC_QoLFr_L_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Left
			vC_QoLFr_L_Tex:SetPoint("TOPLEFT", 0, -75)
			vC_QoLFr_L_Tex:SetAtlas("!UI-Frame-Metal-EdgeLeft",true)
			vC_QoLFr_L_Tex:SetHeight(vC_QoLFr:GetHeight()-107)
		vC_QoLFr_R_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Right
			vC_QoLFr_R_Tex:SetPoint("TOPRIGHT", 0, -75)
			vC_QoLFr_R_Tex:SetAtlas("!UI-Frame-Metal-EdgeRight",true)
			vC_QoLFr_R_Tex:SetHeight(vC_QoLFr:GetHeight()-107)
		vC_QoLFr_BL_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") --Bottom Left
			vC_QoLFr_BL_Tex:SetPoint("BOTTOMLEFT")
			vC_QoLFr_BL_Tex:SetAtlas("UI-Frame-Metal-CornerBottomLeft",true)
		vC_QoLFr_BC_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Bottom Center
			vC_QoLFr_BC_Tex:SetPoint("BOTTOM")
			vC_QoLFr_BC_Tex:SetAtlas("_UI-Frame-Metal-EdgeBottom",true)
			vC_QoLFr_BC_Tex:SetWidth(vC_QoLFr:GetWidth()-64)
		vC_QoLFr_BR_Tex = vC_QoLFr:CreateTexture(nil, "ARTWORK") -- Bottom Right
			vC_QoLFr_BR_Tex:SetPoint("BOTTOMRIGHT")
			vC_QoLFr_BR_Tex:SetAtlas("UI-Frame-Metal-CornerBottomRight",true)
	local vC_QoLFr_Close = CreateFrame("Button", "vC_QoLFr_Close", vC_QoLFr, "UIPanelCloseButton")
		vC_QoLFr_Close:SetSize(20, 20)
		vC_QoLFr_Close:SetPoint("TOPRIGHT", vC_QoLFr, -5, -18)
		vC_QoLFr_Close:SetScript("OnClick", function() vC_QoLFr:Hide() end)
		
	-- Left Panel Frame
	local vC_QoLFr_LP = CreateFrame("Frame", "vC_QoLFr_LP", vC_QoLFr, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_QoLFr_LP, 0, 1)
		vC_QoLFr_LP:SetSize(170, vC_QoLFr:GetHeight()-43)
		vC_QoLFr_LP:SetPoint("LEFT", vC_QoLFr, "LEFT", 14, -16)
	-- Center Panel Frame
	local vC_QoLFr_CP = CreateFrame("Frame", "vC_QoLFr_CP", vC_QoLFr, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_QoLFr_CP, 0, 1)
		vC_QoLFr_CP:SetSize(170, vC_QoLFr_LP:GetHeight())
		vC_QoLFr_CP:SetPoint("LEFT", vC_QoLFr_LP, "RIGHT", -3, 0)
	-- Right Panel Frame
	local vC_QoLFr_RP = CreateFrame("Frame", "vC_QoLFr_RP", vC_QoLFr, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_QoLFr_RP, 0, 1)
		vC_QoLFr_RP:SetSize(vC_QoLFr:GetWidth()-(vC_QoLFr_LP:GetWidth()+vC_QoLFr_CP:GetWidth())-14, vC_QoLFr_LP:GetHeight())
		vC_QoLFr_RP:SetPoint("LEFT", vC_QoLFr_CP, "RIGHT", -3, 0)
		
	-- Left Panel (Top)
	local vC_LPanel_T = CreateFrame("Frame", "vC_LPanel_T", vC_QoLFr_LP, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_LPanel_T, 0, 1)
		vC_LPanel_T:SetSize(vC_QoLFr_LP:GetWidth(),130)
		vC_LPanel_T:SetPoint("TOPLEFT", vC_QoLFr_LP, "TOPLEFT", -1, 0)
		vC_LPanel_T_Lbl = vC_LPanel_T:CreateFontString(nil, "ARTWORK", "GameFontNormalLeftYellow")
		vC_LPanel_T_Lbl:SetPoint("CENTER", vC_LPanel_T, "TOP", 0, -15)
		vC_LPanel_T_Lbl:SetText("What To Do Today?")
	-- Left Top Panel (Checkbox Choice)
	local vC_Row = -25
	for i = 1, #vC_Menu_Top do
		local vC_LMenu_TM = CreateFrame("CheckButton", "vC-TM-"..i, vC_LPanel_T, "UICheckButtonTemplate")
			vC_LMenu_TM:SetSize(26,26)
			vC_LMenu_TM:SetPoint("TOPLEFT", vC_LPanel_T, 3, vC_Row)
			vC_LMenu_TM:SetText(i)
			vC_LMenu_TM:SetChecked(false)
			vC_LMenu_TM_Lbl = vC_LMenu_TM:CreateFontString(nil, "ARTWORK", "GameFontWhite")
			vC_LMenu_TM_Lbl:SetPoint("LEFT", vC_LMenu_TM, 25, 1)
			vC_LMenu_TM_Lbl:SetText(vC_Menu_Top[i])
			vC_LMenu_TM:SetScript("OnClick", function(s)
				
				for i = 1, #vC_Menu_Top do
					_G["vC-TM-"..i]:SetChecked()
					_G["vC-CF-"..i]:Hide()
				end
				s:SetChecked(true)
				_G["vC-CF-"..s:GetText()]:Show()
				
				-- Clear Checkboxes When changing Main Menu Options
				for i = 1, #vC_Menu_Top do
					for j = 1, #vC_Menu_Bot[i] do
						if not ( vC_Menu_Bot[i][j] == "-" or vC_Menu_Bot[i][j] == "=" ) then
							--vC_ReverseTable(vC_Menu_Bot[i][j])
							_G["vC-CM-"..vC_Menu_Bot[i][j]]:SetChecked()
						end
					end
				end
				vC_QoL_Menu_Misdirection("Top: "..s:GetText()..", "..s:GetName())
				
			end)
			vC_Row = vC_Row - 20
	end
	-- Left Panel (Bottom) Expansion List
	local vC_LPanel_B = CreateFrame("Frame", "vC_LPanel_B", vC_QoLFr_LP, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_LPanel_B, 0, 1)
		vC_LPanel_B:SetSize(vC_QoLFr_LP:GetWidth(),250)
		vC_LPanel_B:SetPoint("TOPLEFT", vC_LPanel_T, "BOTTOMLEFT", 0, 3)
		vC_LPanel_B_Lbl = vC_LPanel_B:CreateFontString(nil, "ARTWORK", "GameFontNormalLeftYellow")
		vC_LPanel_B_Lbl:SetPoint("CENTER", vC_LPanel_B, "TOP", 0, -14)
		vC_LPanel_B_Lbl:SetText("Which Expansion?")
	-- Left Bottom Panel (Checkbox Choice)
	local vC_Row = -22
	for i = 1, #vC_Menu_XPac do
		local vC_LMenu_BM = CreateFrame("CheckButton", "vC-BM-"..i, vC_LPanel_B, "UICheckButtonTemplate")
			vC_LMenu_BM:SetSize(26,26)
			vC_LMenu_BM:SetPoint("TOPLEFT", vC_LPanel_B, 3, vC_Row)
			vC_LMenu_BM:SetText(i)
			vC_LMenu_BM:SetChecked((i == 1 and true or false))
			vC_LMenu_BM_Lbl = vC_LMenu_BM:CreateFontString(nil, "ARTWORK", "GameFontWhite")
			vC_LMenu_BM_Lbl:SetPoint("LEFT", vC_LMenu_BM, 25, 1)
			vC_LMenu_BM_Lbl:SetText(vC_Menu_XPac[i])
			vC_LMenu_BM:SetScript("OnClick", function(s)
			
				for i = 1, #vC_Menu_XPac do
					_G["vC-BM-"..i]:SetChecked()
				end
				s:SetChecked(true)
				vC_QoL_Menu_Misdirection("XPac: "..(tonumber(s:GetText())-1)..", "..s:GetName())
				
			end)
			vC_Row = vC_Row - 20
	end
	-- Center Panel -- Options from Left Top Menu
	for i = 1, #vC_Menu_Top do
		local vC_CPanel_CF = CreateFrame("Frame", "vC-CF-"..i, vC_QoLFr_CP, "BackdropTemplate")
		-- vC_SetBackdrop_Choice(vC_CPanel_CF, 0, 1) -- Debugging Purpose
		vC_CPanel_CF:SetSize(vC_QoLFr_CP:GetWidth(),vC_QoLFr_CP:GetHeight())
		vC_CPanel_CF:SetPoint("TOPLEFT", vC_QoLFr_CP, "TOPLEFT", 0, 0)
		vC_CPanel_CF_Lbl = vC_CPanel_CF:CreateFontString(nil, "ARTWORK", "GameFontNormalLeftYellow")
		vC_CPanel_CF_Lbl:SetPoint("CENTER", vC_CPanel_CF, "TOP", 0, -15)
		vC_CPanel_CF_Lbl:SetText(vC_Menu_Top[i])
		local vC_Row = -25
		for j = 1, #vC_Menu_Bot[i] do
			if vC_Menu_Bot[i][j] == "-" then
				local SepLine = vC_CPanel_CF:CreateTexture()
					SepLine:SetSize(138, 2)
					SepLine:SetTexture(130871)
					SepLine:SetColorTexture(.8, .8, .8, .4)
					SepLine:SetPoint("CENTER", vC_CPanel_CF, "TOP", 1, vC_Row-6)
					vC_Row = vC_Row - 10
			elseif vC_Menu_Bot[i][j] == "=" then
				local vC_CPanel_CT = CreateFrame("EditBox", "vC-CT-"..vC_Menu_Bot[i][j], vC_CPanel_CF, "InputBoxTemplate")
					vC_CPanel_CT:SetPoint("TOPRIGHT", vC_CPanel_CF, -10, vC_Row-3)
					vC_CPanel_CT:SetSize(75,20)
					vC_CPanel_CT:SetMaxLetters(10)
					vC_CPanel_CT:SetAutoFocus(false)
					vC_CPanel_CT:SetMultiLine(false)
					vC_CPanel_CT:SetNumeric(true)
					vC_CPanel_CT:SetNumber(25588)
					--vC_CPanel_CT:SetScript("OnEnterPressed", function() end)
					vC_Row = vC_Row - 24
			else
				local vC_CPanel_CM = CreateFrame("CheckButton", "vC-CM-"..vC_Menu_Bot[i][j], vC_CPanel_CF, "UICheckButtonTemplate")
					vC_CPanel_CM:SetSize(26,26)
					vC_CPanel_CM:SetPoint("TOPLEFT", vC_CPanel_CF, 3, vC_Row)
					vC_CPanel_CM:SetText(j)
					vC_CPanel_CM:SetChecked(false)
					vC_CPanel_CM_Lbl = vC_CPanel_CM:CreateFontString(nil, "ARTWORK", "GameFontWhite")
					vC_CPanel_CM_Lbl:SetPoint("LEFT", vC_CPanel_CM, 25, 1)
					vC_CPanel_CM_Lbl:SetText(vC_Menu_Bot[i][j])
					vC_CPanel_CM:SetScript("OnClick", function(s)
						for i = 1, #vC_Menu_Top do
							for j = 1, #vC_Menu_Bot[i] do
								if not ( vC_Menu_Bot[i][j] == "-" or vC_Menu_Bot[i][j] == "=" ) then
									--vC_ReverseTable(vC_Menu_Bot[i][j])
									_G["vC-CM-"..vC_Menu_Bot[i][j]]:SetChecked()
								end
							end
						end
						s:SetChecked(true)
						vC_QoL_Menu_Misdirection("Sub: "..s:GetText()..", "..s:GetName())
					end)
					vC_Row = vC_Row - 20
			end
		end
		_G["vC-CF-"..i]:Hide()
	end
	-- Right Panel (Results)
	local vC_QoLFr_Scroll = CreateFrame("ScrollFrame", "vC_QoLFr_Scroll", vC_QoLFr_RP, "UIPanelScrollFrameTemplate")
		vC_QoLFr_Scroll:SetSize(vC_QoLFr_RP:GetWidth()-32,vC_QoLFr_RP:GetHeight()-13)
		vC_QoLFr_Scroll:SetPoint("TOPLEFT", vC_QoLFr_RP, "TOPLEFT", 5, -6)
			vC_QoLFr_EBox = CreateFrame("EditBox", "vC_QoLFr_EditBox", vC_QoLFr_Scroll)
			vC_QoLFr_EBox:SetSize(vC_QoLFr_Scroll:GetWidth(),vC_QoLFr_Scroll:GetHeight())
			vC_QoLFr_EBox:SetPoint("TOPLEFT", vC_QoLFr_Scroll, "TOPLEFT", 10, 0)
			vC_QoLFr_EBox:SetFontObject(vC_Font[102])
			vC_QoLFr_EBox:SetTextColor( 1, 1, 1, 1 )
			vC_QoLFr_EBox:SetAutoFocus(false)
			vC_QoLFr_EBox:SetMultiLine(true)
			vC_QoLFr_EBox:EnableMouse(true)
			--vC_QoLFr_EBox:SetText(string.rep("ABCDEFGHIJLKMNOPQRSTUVWXYZ_1234567890_!@#$%^&*()_+{}|:\"<>?[]\;',./\n",100)) -- Debugging Purpose
			vC_QoLFr_EBox:SetScript("OnEditFocusGained", function() vC_QoLFr_EBox:HighlightText() end)
		vC_QoLFr_Scroll:SetScrollChild(vC_QoLFr_EBox)
	vC_QoLFr:Hide()
end

function vC_QoL_Menu_Misdirection(arg)

	vC_ReverseTable(arg)

	arg = ""
	-- Get Main Selection
	for i = 1, #vC_Menu_Top do
		if ( _G["vC-TM-"..i]:GetChecked(true) ) then
			vC_ReverseTable("1: "..vC_Menu_Top[i])
			break
		end
		if i == #vC_Menu_Top then return end -- Do Not Continue Below if Nothing is Selected
	end
	-- Get Expansion
	for i = 1, #vC_Menu_XPac do
		if ( _G["vC-BM-"..i]:GetChecked(true) ) then
			vC_ReverseTable("2: "..vC_Menu_XPac[i])
			break
		end
	end
	
	-- Get Sub Menu
	for i = 1, #vC_Menu_Top do
		for j = 1, #vC_Menu_Bot[i] do
			if not ( vC_Menu_Bot[i][j] == "-" or vC_Menu_Bot[i][j] == "=" ) then
				if ( _G["vC-CM-"..vC_Menu_Bot[i][j]]:GetChecked(true) ) then
					vC_ReverseTable("3: "..vC_Menu_Bot[i][j])
					break
				end
			end
			if i == #vC_Menu_Top then return end -- Do Not Continue Below if Nothing is Selected
		end
	end

	--if arg == "ATT Quick C&P" then vC_ReverseTable("ATT Quick C&P Selected") end
	--if arg == "Quest Checker" then vC_ReverseTable("Quest Checker Selected") end
	--if arg == "Daily & Weekly" then vC_ReverseTable("Daily & Weekly Selected")	end
	--if arg == "World Quest" then vC_ReverseTable("World Quest Selected") end
	--if arg == "Misc" then vC_ReverseTable("Misc Selected") end

end