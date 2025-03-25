vC_QoLFrame:Show()
--Left Panel (Top)
local vC_To_Do_Top = CreateFrame("Frame", "vC_To_Do_Top", vC_QoLFrame_LPanel, "BackdropTemplate")
	vC_SetBackDrop_Choice(vC_To_Do_Top, 0, 9)
	vC_To_Do_Top:SetSize(vC_QoLFrame_LPanel:GetWidth(),150)
	vC_To_Do_Top:SetPoint("TOPLEFT", vC_QoLFrame_LPanel, "TOPLEFT", -1, 0)
	vC_To_Do_Top.Label = vC_To_Do_Top:CreateFontString(nil, "ARTWORK", vC_Fonts[126])
	vC_To_Do_Top.Label:SetPoint("CENTER", vC_To_Do_Top, "TOP", 0, -15)
	vC_To_Do_Top.Label:SetText("What To Do Today?")
	local vC_Row = -22
	for i = 1, #vC_Menu_Top do
		local vC_To_Do_Top_M = CreateFrame("CheckButton", "vC-T-"..vC_Menu_Top[i], vC_To_Do_Top, "UICheckButtonTemplate")
			vC_To_Do_Top_M:SetSize(26,26)
			vC_To_Do_Top_M:SetPoint("TOPLEFT", vC_To_Do_Top, 3, vC_Row)
			vC_To_Do_Top_M:SetText(i)
			vC_To_Do_Top_M:SetChecked(false)
			vC_To_Do_Top_M_Lbl = vC_To_Do_Top_M:CreateFontString(nil, "ARTWORK", vC_Fonts[43])
			vC_To_Do_Top_M_Lbl:SetPoint("LEFT", vC_To_Do_Top_M, 25, 1)
			vC_To_Do_Top_M_Lbl:SetText(vC_Menu_Top[i])
			vC_To_Do_Top_M:SetScript("OnClick", function(s)
				for z = 1, #vC_Menu_Top do
				-- _G["vC-B-"..vC_Menu_Bot[z]]:Hide()
				_G["vC-T-"..vC_Menu_Top[z]]:SetChecked()
				end            
				s:SetChecked(true)
				_G["vC_To_Do_Bot_Lbl"]:SetText(vC_Menu_Top[tonumber(s:GetText())])
				--_G["vC-B-"..vC_Menu_Bot[z]]:Show()
				
				print(
					UIDropDownMenu_GetText(vC_To_Do_Mid_M),
					(UIDropDownMenu_GetSelectedID(vC_To_Do_Mid_M) == nil and 1 or UIDropDownMenu_GetSelectedID(vC_To_Do_Mid_M)),
					s:GetName(),
					tonumber(vC_To_Do_Top_M:GetText())
				)
			end)
		vC_To_Do_Top_M:SetScript("OnEnter", function(s) vC_cToolTips(vC_To_Do_Top_M, 7, vC_Menu_Top[s:GetText()]) end)
		vC_To_Do_Top_M:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
		vC_Row = vC_Row - 20
	end

--Left Panel (Middle)
local vC_To_Do_Mid = CreateFrame("Frame", "vC_To_Do_Mid", vC_QoLFrame_LPanel, "BackdropTemplate")
	vC_SetBackDrop_Choice(vC_To_Do_Mid, 0, 9)
	vC_To_Do_Mid:SetSize(vC_QoLFrame_LPanel:GetWidth(), 56)
	vC_To_Do_Mid:SetPoint("TOPLEFT", vC_To_Do_Top, "BOTTOMLEFT", 0, 3)
	vC_To_Do_Mid.Label = vC_To_Do_Mid:CreateFontString(nil, "ARTWORK", vC_Fonts[126])
	vC_To_Do_Mid.Label:SetPoint("CENTER", vC_To_Do_Mid, "TOP", 0, -14)
	vC_To_Do_Mid.Label:SetText("Pick An Expansion")
	local vC_To_Do_Mid_M = CreateFrame("Frame", "vC_To_Do_Mid_M", vC_To_Do_Mid, "UIDropDownMenuTemplate")
		vC_To_Do_Mid_M:SetPoint("CENTER", vC_To_Do_Mid, "BOTTOM", -1, 18)
		UIDropDownMenu_Initialize(vC_To_Do_Mid_M, function(self, level, menuList)
			local XPacDrop = UIDropDownMenu_CreateInfo()
			for i = 1, #vC_Display_Expansions do
				XPacDrop.text = vC_Display_Expansions[i]
				XPacDrop.checked = false
				XPacDrop.menuList = i
				XPacDrop.func = function(b)
					UIDropDownMenu_SetSelectedValue(vC_To_Do_Mid_M, b.value, b.value)
					UIDropDownMenu_SetText(vC_To_Do_Mid_M, b.value)
					b.checked = true
					vC_SetBackDrop_Choice(vC_QoLFrame_RPanel, i+4, 9)
					for z = 1, #vC_Menu_Top do
						if _G["vC-T-"..vC_Menu_Top[z]]:GetChecked() then tAnyValue = z; break end
					end
					print(
						UIDropDownMenu_GetText(vC_To_Do_Mid_M),
						(UIDropDownMenu_GetSelectedID(vC_To_Do_Mid_M) == nil and 1 or UIDropDownMenu_GetSelectedID(vC_To_Do_Mid_M)),
						vC_Menu_Top[tAnyValue],
						_G["vC-T-"..vC_Menu_Top[tAnyValue]]:GetText()
					)
				end
				UIDropDownMenu_AddButton(XPacDrop)
			end
			UIDropDownMenu_SetWidth(vC_To_Do_Mid_M,140)
			UIDropDownMenu_SetText(vC_To_Do_Mid_M,"All Expansions")
		end)


--Left Panel (Bottom)
local vC_To_Do_Bottom = CreateFrame("Frame", "vC_To_Do_Bottom", vC_QoLFrame_LPanel, "BackdropTemplate")
vC_SetBackDrop_Choice(vC_To_Do_Bottom, 0, 9)
vC_To_Do_Bottom:SetWidth(vC_QoLFrame_LPanel:GetWidth())
vC_To_Do_Bottom:SetHeight(vC_QoLFrame_LPanel:GetHeight()-(vC_To_Do_Top:GetHeight()+vC_To_Do_Mid:GetHeight()-7))
vC_To_Do_Bottom:SetPoint("TOPLEFT", vC_To_Do_Mid, "BOTTOMLEFT", 0, 3)
vC_To_Do_Bottom.Text = vC_To_Do_Bottom:CreateFontString(nil, "ARTWORK", vC_Fonts[126])
vC_To_Do_Bottom.Text:SetPoint("CENTER", vC_To_Do_Bottom, "TOP", 0, -15)
vC_To_Do_Bottom.Text:SetText("Select Above!")

for i = 1, #vC_Menu_Title do
   local vC_Bottom_Selected = CreateFrame("Frame", "vC-B-"..vC_Menu_Title[i], vC_To_Do_Bottom, "BackdropTemplate")
   vC_SetBackDrop_Choice(vC_Bottom_Selected, 0, 7)
   vC_Bottom_Selected:SetWidth(vC_To_Do_Bottom:GetWidth())
   vC_Bottom_Selected:SetHeight(vC_To_Do_Bottom:GetHeight()-30)
   vC_Bottom_Selected:SetPoint("BOTTOMLEFT", vC_To_Do_Bottom, "BOTTOMLEFT", 0, 0)
   _G["vC-B-"..vC_Menu_Title[i]]:Hide()
end

--[[   
   local vC_To_Do_Bottom = CreateFrame("Frame", "vC-B-"..vC_Menu_Title[i], vC_QoLFrame_LPanel, "BackdropTemplate")
   vC_SetBackDrop_Choice(vC_To_Do_Bottom, 0, 9)
   vC_To_Do_Bottom:SetWidth(vC_QoLFrame_LPanel:GetWidth())
   vC_To_Do_Bottom:SetHeight(vC_QoLFrame_LPanel:GetHeight()-(vC_To_Do_Top:GetHeight()+vC_To_Do_Mid:GetHeight()-5))
   vC_To_Do_Bottom:SetPoint("TOPLEFT", vC_To_Do_Mid, "BOTTOMLEFT", 0, 3)
   
   vC_To_Do_Bottom.Text = vC_To_Do_Bottom:CreateFontString(nil, "ARTWORK", vC_Fonts[126])
   vC_To_Do_Bottom.Text:SetPoint("CENTER", vC_FrameName_Main, "TOP", 0, -15)
   vC_To_Do_Bottom.Text:SetText(vC_Menu_Title[i])
   
   _G["vC-"..vC_Menu_Title[i]:Hide()
      
      local vC_Row = -20
      for j = 1, #vC_Menu_Choice[i] do
         local vC_FrameName_Sub = "vC-"..vC_Menu_Choice[i][j]
         if vC_Menu_Choice[i][j] == "-" then
            local SeperateLine = vC_To_Do_Bottom:CreateTexture()
            SeperateLine:SetSize(138, 2)
            SeperateLine:SetTexture("Interface\\BUTTONS\\WHITE8X8")
            SeperateLine:SetColorTexture(.8, .8, .8, .2)
            SeperateLine:SetPoint("TOPLEFT", vC_FrameName_Main, 3, vC_Row-7)
            vC_Row = vC_Row - 9
         else
            local vC_To_Do_Bottom_Menu = CreateFrame("CheckButton", vC_FrameName_Sub, vC_FrameName_Main, "UICheckButtonTemplate")
            vC_To_Do_Bottom_Menu:SetSize(26,26)
            vC_To_Do_Bottom_Menu:SetPoint("TOPLEFT", vC_FrameName_Main, 3, vC_Row)
            vC_To_Do_Bottom_Menu:SetChecked(false)
            
            vC_To_Do_Bottom_Menu.Text = vC_To_Do_Bottom_Menu:CreateFontString(nil, "ARTWORK", vC_Fonts[43])
            vC_To_Do_Bottom_Menu.Text:SetPoint("LEFT", vC_FrameName_Sub, 28, 1)
            vC_To_Do_Bottom_Menu.Text:SetJustifyH("LEFT")
            vC_To_Do_Bottom_Menu.Text:SetText(vC_Menu_Choice[i][j])
            
            vC_To_Do_Bottom_Menu:SetScript("OnClick", function(s)
                  --for k = 1, #vC_Menu_Choice[j] do _G["vC_Menu_Select-"..vC_Menu_Choice[i][k]:SetChecked(false) end
                  s:SetChecked(true)
                  tAnyValue = string.match(s:GetName(),"%d+")
                  vC_QoLResultBox:SetText(s.Text:GetText().." - "..tAnyValue)
            end)
            vC_To_Do_Bottom_Menu:SetScript("OnEnter", function(s) vC_cToolTips(s, 7, s.Text:GetText()) end)
            vC_To_Do_Bottom_Menu:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
            vC_Row = vC_Row - 22
         end
      end
]]--