-- Completed 05/16/2024
local vC_AppName, vC_App				= ...
if not ( vC_Run_GoldHoard ) then return end
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local vC_tName, vC_tRealm				= UnitFullName("player")						-- Get Name and/or Realm (if able)
-------------------------------------------------------
-- Get/Set Gold Hoarding Data
-------------------------------------------------------
function vC_GoldHoard_UseData(a)
	C_Timer.After(.2, function() if ( GetMoney() == 0 ) then vC_GoldHoard_UseData() end end)
	local next							= next
	local vC_tDB_GoldHoard				= vC_DB_GoldHoard or {}

	if ( a == "Reset" or next(vC_tDB_GoldHoard) == nil ) then
		vC_tDB_GoldHoard = {
			["SendTo"]					= "No Name-No Server",
			["GoldAmount"]				= 1000,
		}
	end
	if ( a == "Save" ) then
		vC_tDB_GoldHoard = {
			["SendTo"]					= vC_GH_SendInfo_Name:GetText(),
			["GoldAmount"]				= vC_GH_SendInfo_Gold:GetNumber(),
		}
	end
	vC_DB_GoldHoard						= vC_tDB_GoldHoard

	local tSend							= vC_DB_GoldHoard["SendTo"]
	--local tGold							= (vC_tName == "Vandiel" and 250000 or vC_DB_GoldHoard["GoldAmount"])
	local tGold							= vC_DB_GoldHoard["GoldAmount"]
	
	vC_GH_SendInfo_Name:SetText(tSend)
	vC_GH_SendInfo_Gold:SetNumber(tGold)

	vC_GH_SendConf_Send:SetEnabled(false)
	local vC_SelfName					= vC_tName..(vC_tRealm ~= nil and "-"..vC_tRealm or "")
	local vC_AmountToKeep				= vC_GH_SendInfo_Gold:GetNumber()*10000
	local vC_AmountToSend				= GetMoney()-vC_AmountToKeep-GetSendMailPrice()

	vC_GH_YouHave_Text:SetText("Have: "..GetMoneyString(GetMoney(),true))
	
	if (
		strfind(vC_GH_SendInfo_Name:GetText(),"-") == nil or
		vC_GH_SendInfo_Name:GetText() == "No Name-No Server" or
		vC_GH_SendInfo_Name:GetText() == nil or
		vC_GH_SendInfo_Name:GetText() == "" 
	) then
		vC_GH_GoldAmount_Text:SetText("Come on! Need the |cff00ccffName-Realm|r!!")
		return
	end
	--if (
	--	vC_GH_SendInfo_Name:GetText() == vC_SelfName or
	--	string.sub(vC_GH_SendInfo_Name:GetText(),1,strfind(vC_GH_SendInfo_Name:GetText(),"-")-1) == vC_tName
	--) then
	--	vC_GH_GoldAmount_Text:SetText("Greed Much? Can`t send to yourself!")
	--	return
	--end
	if ( vC_GH_SendInfo_Name:GetNumber() == "" or vC_GH_SendInfo_Name:GetNumber() == nil ) then
		vC_GH_GoldAmount_Text:SetText("Gotta Put in |cff00ccffGold|r Amount!")
		return
	end
	if ( vC_AmountToKeep == GetMoney() ) then
		vC_GH_GoldAmount_Text:SetText("Quit trolling your banker!")
		return
	end
	if ( vC_AmountToKeep > GetMoney() ) then
		vC_GH_GoldAmount_Text:SetText("Keep dreaming to send that much!")
		return
	end
	if ( vC_AmountToSend < 0 ) then
		vC_GH_GoldAmount_Text:SetText("Don't Have Enough to Send!")
		return
	end

	vC_GH_GoldAmount_Text:SetText("|cff00ccffSending "..(vC_GH_SendInfo_Gold:GetNumber() == 0 and "ALL: " or ": ").."|r"..vC_GoldFormat(vC_AmountToSend))
	vC_GH_SendConf_Send:SetEnabled(true)

	if ( vC_GH_SendConf_Send:IsEnabled() and a == "Send" ) then
		SetSendMailMoney(vC_AmountToSend)
		SendMail(vC_GH_SendInfo_Name:GetText(),"Auto Gold Hoarding","")
		DEFAULT_CHAT_FRAME:AddMessage("|cff00ccffSent: |r"..vC_GoldFormat(vC_AmountToSend))

		vC_GoldHoard_UseData()
	end
end
-------------------------------------------------------
-- List of Realm that You Can Send To!
-------------------------------------------------------
function vC_GH_ServerList()
	local vC_GH_tDB = {}
	local Realms = GetAutoCompleteRealms()
	if ( Realms[1] ) then
		for k, v in pairs(Realms) do
			v = ( v == GetRealmName() and "|T136814:12|t |cFF3CFA3C" or "")..v.."|r"
			tinsert(vC_GH_tDB,v)
		end
	else
	   tinsert(vC_GH_tDB,"Not Connected\nTo Any Realms...")
	end
	vC_GH_ResultArea:SetText(table.concat(vC_GH_tDB,"\n"))
end
-------------------------------------------------------
-- Main Frame and Movers
-------------------------------------------------------
if ( vC_GH_MailFrame_Icon == nil ) then
	local vC_GH_MailFrame_Icon = CreateFrame("Button", "vC_GH_MailFrame_Icon", MailFrame)
		vC_GH_MailFrame_Icon:SetSize(16, 16)
		vC_GH_MailFrame_Icon:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 60, -6)
		vC_GH_MailFrame_Icon:SetNormalTexture(130767)
		vC_GH_MailFrame_Icon:SetHighlightTexture(130769)
		vC_GH_MailFrame_Icon:SetFrameStrata("TOOLTIP")
		vC_GH_MailFrame_Icon:SetScript("OnClick", function()
			if ( vC_GH_Body_Frame:IsVisible() ) then vC_GH_Body_Frame:Hide() else vC_GH_Body_Frame:Show() end
		end)
		vC_GH_MailFrame_Icon:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,"Gold Hoarding\n\nSend Gold to your Gold Hoarder!") end)
		vC_GH_MailFrame_Icon:SetScript("OnLeave", function() vC_cToolTips(0) end)

end

if ( vC_GH_Body_Frame == nil ) then
	-- Main Body Frame
	local vC_GH_Body_Frame = CreateFrame("Frame", "vC_GH_Body_Frame", MailFrame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_GH_Body_Frame, 16, 1)
		vC_GH_Body_Frame:SetSize(265, 151)
		vC_GH_Body_Frame:SetPoint("TOPLEFT", MailFrame, "TOPRIGHT", 0, 0)
		vC_GH_Body_Frame:EnableMouse(true)
		-- Title Frame
		local vC_GH_Body_TitleFrame = CreateFrame("Frame", "vC_GH_Body_TitleFrame", vC_GH_Body_Frame, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_GH_Body_TitleFrame, 15, -1)
			vC_GH_Body_TitleFrame:SetSize(vC_GH_Body_Frame:GetWidth()-3, 26)
			vC_GH_Body_TitleFrame:SetPoint("TOPLEFT", vC_GH_Body_Frame, "TOPLEFT", 2, -1)
		-- Title
		local vC_GH_Body_Title = vC_GH_Body_TitleFrame:CreateFontString(nil, "ARTWORK", vC_Font[218])
			vC_GH_Body_Title:SetAllPoints()
			vC_GH_Body_Title:SetText("Gold Hoarding!")
		-- Keep for Debug
		--local vC_GH_Body_Close = CreateFrame("Button", "vC_GH_Body_Close", vC_GH_Body_Frame, "UIPanelCloseButton")
		--	vC_GH_Body_Close:SetSize(20, 20)
		--	vC_GH_Body_Close:SetPoint("TOPRIGHT", vC_GH_Body_Frame, "TOPRIGHT", -5, -5)
		--	vC_GH_Body_Close:SetScript("OnClick", function() vC_GH_Body_Frame:Hide() end)

	-- 'You Have' Frame
	local vC_GH_YouHave_Frame = CreateFrame("Frame", "vC_GH_YouHave_Frame", vC_GH_Body_Frame, "BackdropTemplate")
		vC_GH_YouHave_Frame:SetSize(vC_GH_Body_Frame:GetWidth()-4, 18)
		vC_GH_YouHave_Frame:SetPoint("TOPLEFT", vC_GH_Body_TitleFrame, "BOTTOMLEFT", 0, 0)
		-- Display Your Current Gold Label
		local vC_GH_YouHave_Text = vC_GH_YouHave_Frame:CreateFontString("vC_GH_YouHave_Text", "ARTWORK", vC_Font[216])
			vC_GH_YouHave_Text:SetPoint("CENTER", vC_GH_YouHave_Frame, "CENTER", 0, 0)
			vC_GH_YouHave_Text:SetText("Have: "..vC_GoldFormat(GetMoney()))

	-- 'Send Info' Frame
	local vC_GH_SendInfo_Frame = CreateFrame("Frame", "vC_GH_SendInfo_Frame", vC_GH_Body_Frame, "BackdropTemplate")
		vC_GH_SendInfo_Frame:SetSize(vC_GH_Body_Frame:GetWidth()-4, 53)
		vC_GH_SendInfo_Frame:SetPoint("TOPLEFT", vC_GH_YouHave_Frame, "BOTTOMLEFT", 0, 1)
	-- Send Gold To Whom
		local vC_GH_SendInfo_Lbl1 = vC_GH_SendInfo_Frame:CreateFontString("vC_GH_SendInfo_Lbl1", "ARTWORK", vC_Font[216])
			vC_GH_SendInfo_Lbl1:SetSize(60, 18)
			vC_GH_SendInfo_Lbl1:SetPoint("TOPLEFT", vC_GH_SendInfo_Frame, "TOPLEFT", 8, -6)
			vC_GH_SendInfo_Lbl1:SetJustifyH("RIGHT")
			vC_GH_SendInfo_Lbl1:SetText("Mail To:")
	-- Put in Name to Send To
			local vC_GH_SendInfo_Name = CreateFrame("EditBox", "vC_GH_SendInfo_Name", vC_GH_SendInfo_Frame, "InputBoxTemplate")
				vC_GH_SendInfo_Name:SetSize(145, 18)
				vC_GH_SendInfo_Name:SetPoint("LEFT", vC_GH_SendInfo_Lbl1, "RIGHT", 8, -1)
				vC_GH_SendInfo_Name:SetFontObject(vC_Font[216])
				vC_GH_SendInfo_Name:SetJustifyH("LEFT")
				vC_GH_SendInfo_Name:SetMaxLetters(100)
				vC_GH_SendInfo_Name:SetAutoFocus(false)
				vC_GH_SendInfo_Name:SetMultiLine(false)
				vC_GH_SendInfo_Name:SetNumeric(false)
				vC_GH_SendInfo_Name:SetText("")
				vC_GH_SendInfo_Name:SetScript("OnEnterPressed", function(s) vC_GoldHoard_UseData("Save") end)
				vC_GH_SendInfo_Name:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,"Press 'Enter' to Save Data") end)
				vC_GH_SendInfo_Name:SetScript("OnLeave", function() vC_cToolTips(0) end)
	-- Place Mail Icon Next to EditBox
			local vC_GH_SendInfo_Mail_Icon = vC_GH_SendInfo_Frame:CreateTexture()
				vC_GH_SendInfo_Mail_Icon:SetSize(32, 32)
				vC_GH_SendInfo_Mail_Icon:SetPoint("LEFT", vC_GH_SendInfo_Name, "RIGHT", 1, 0)
				vC_GH_SendInfo_Mail_Icon:SetTexture(516778)
	-- Keep # Gold On Toon
		local vC_GH_SendInfo_Lbl2 = vC_GH_SendInfo_Frame:CreateFontString("vC_GH_SendInfo_Lbl2", "ARTWORK", vC_Font[216])
			vC_GH_SendInfo_Lbl2:SetSize(60, 18)
			vC_GH_SendInfo_Lbl2:SetPoint("TOPLEFT", vC_GH_SendInfo_Lbl1, "BOTTOMLEFT", 0, -4)
			vC_GH_SendInfo_Lbl2:SetJustifyH("RIGHT")
			vC_GH_SendInfo_Lbl2:SetText("Keep:")
	-- Put in Amount to Keep
			local vC_GH_SendInfo_Gold = CreateFrame("EditBox", "vC_GH_SendInfo_Gold", vC_GH_SendInfo_Frame, "InputBoxTemplate")
				vC_GH_SendInfo_Gold:SetSize(145, 18)
				vC_GH_SendInfo_Gold:SetPoint("LEFT", vC_GH_SendInfo_Lbl2, "RIGHT", 8, 0)
				vC_GH_SendInfo_Gold:SetFontObject(vC_Font[216])
				vC_GH_SendInfo_Gold:SetJustifyH("LEFT")
				vC_GH_SendInfo_Gold:SetMaxLetters(100)
				vC_GH_SendInfo_Gold:SetAutoFocus(false)
				vC_GH_SendInfo_Gold:SetMultiLine(false)
				vC_GH_SendInfo_Gold:SetNumeric(true)
				vC_GH_SendInfo_Gold:SetNumber(0)
				vC_GH_SendInfo_Gold:SetScript("OnEnterPressed", function() vC_GoldHoard_UseData("Save") end)
				vC_GH_SendInfo_Gold:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,"Press 'Enter' to Save Data") end)
				vC_GH_SendInfo_Gold:SetScript("OnLeave", function() vC_cToolTips(0) end)
	-- Place Gold Icon Next to Edit Box
			local vC_GH_SendInfo_Gold_Icon = vC_GH_SendInfo_Frame:CreateTexture()
				vC_GH_SendInfo_Gold_Icon:SetSize(18, 18)
				vC_GH_SendInfo_Gold_Icon:SetPoint("LEFT", vC_GH_SendInfo_Gold, "RIGHT", 8, 0)
				vC_GH_SendInfo_Gold_Icon:SetTexture(237618)
				vC_GH_SendInfo_Gold_Icon:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,"0 to send ALL gold\nor\nSpecific Amount of Gold to Keep") end)
				vC_GH_SendInfo_Gold_Icon:SetScript("OnLeave", function() vC_cToolTips(0) end)

	-- Sending Amount of Gold Frame
	local vC_GH_GoldAmount_Frame = CreateFrame("Frame", "vC_GH_GoldAmount_Frame", vC_GH_Body_Frame, "BackdropTemplate")
		vC_GH_GoldAmount_Frame:SetSize(vC_GH_Body_Frame:GetWidth()-4, 20)
		vC_GH_GoldAmount_Frame:SetPoint("TOPLEFT", vC_GH_SendInfo_Frame, "BOTTOMLEFT", 0, 2)
	-- Sending Amount
		local vC_GH_GoldAmount_Text = vC_GH_GoldAmount_Frame:CreateFontString("vC_GH_GoldAmount_Text", "ARTWORK", vC_Font[216])
			vC_GH_GoldAmount_Text:SetAllPoints()
			vC_GH_GoldAmount_Text:SetText("")

	-- Send/Config Frame
	local vC_GH_SendConf_Frame = CreateFrame("Frame", "vC_GH_SendConf_Frame", vC_GH_Body_Frame, "BackdropTemplate")
		vC_GH_SendConf_Frame:SetSize(vC_GH_Body_Frame:GetWidth()-4, 33)
		vC_GH_SendConf_Frame:SetPoint("TOPLEFT", vC_GH_GoldAmount_Frame, "BOTTOMLEFT", 0, 2)
	-- Send Button
		local vC_GH_SendConf_Send = CreateFrame("Button", "vC_GH_SendConf_Send", vC_GH_SendConf_Frame, "UIPanelButtonTemplate")
			vC_GH_SendConf_Send:SetSize(100, 24)
			vC_GH_SendConf_Send:SetText("Send")
			vC_GH_SendConf_Send:SetPoint("CENTER", vC_GH_SendConf_Frame, "CENTER", 0, 0)
			vC_GH_SendConf_Send:SetScript("OnClick", function() vC_GoldHoard_UseData("Send") end)
	-- Reset Button
		local vC_GH_ResetConf = CreateFrame("Button", "vC_GH_ResetConf", vC_GH_SendConf_Frame)
			vC_GH_ResetConf:SetSize(18, 18)
			vC_GH_ResetConf:SetNormalAtlas("UI-RefreshButton")
			vC_GH_ResetConf:SetPoint("CENTER", vC_GH_SendConf_Frame, "RIGHT", -15, 0)
			vC_GH_ResetConf:SetScript("OnClick", function() vC_GoldHoard_UseData("Reset") end)
			vC_GH_ResetConf:SetScript("OnEnter", function(s) vC_cToolTips(s,1,1,"Reset") end)
			vC_GH_ResetConf:SetScript("OnLeave", function() vC_cToolTips(0) end)

	-- 'Can Send To' Server Frame
	local vC_GH_ServerList_Frame = CreateFrame("Frame", "vC_GH_ServerList_Frame", vC_GH_Body_Frame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_GH_ServerList_Frame, 16, 1)
		vC_GH_ServerList_Frame:SetSize(150, vC_GH_Body_Frame:GetHeight())
		vC_GH_ServerList_Frame:SetPoint("TOPLEFT", vC_GH_Body_Frame, "TOPRIGHT", -2, 0)
	-- Server Title Frame
		local vC_GH_ServerList_TitleFrame = CreateFrame("Frame", "vC_GH_ServerList_TitleFrame", vC_GH_ServerList_Frame, "BackdropTemplate")
			vC_SetBackdrop_Choice(vC_GH_ServerList_TitleFrame, 15, -1)
			vC_GH_ServerList_TitleFrame:SetSize(vC_GH_ServerList_Frame:GetWidth()-3, 26)
			vC_GH_ServerList_TitleFrame:SetPoint("TOPLEFT", vC_GH_ServerList_Frame, "TOPLEFT", 2, -1)
	-- Server Title
		local vC_GH_ServerList_Title = vC_GH_ServerList_TitleFrame:CreateFontString("vC_GH_ServerList_Title", "ARTWORK", vC_Font[218])
			vC_GH_ServerList_Title:SetAllPoints()
			vC_GH_ServerList_Title:SetPoint("CENTER", vC_GH_ServerList_TitleFrame, "CENTER", 0, -2)
			vC_GH_ServerList_Title:SetText("Can Send To")
	-- List of Server You Can Send To
		local vC_GH_Scroll = CreateFrame("ScrollFrame", "vC_GH_Scroll", vC_GH_ServerList_Frame, "UIPanelScrollFrameTemplate")
			vC_GH_Scroll:SetWidth(vC_GH_ServerList_Frame:GetWidth()-34)
			vC_GH_Scroll:SetHeight(vC_GH_ServerList_Frame:GetHeight()-32)
			vC_GH_Scroll:SetPoint("TOPLEFT", vC_GH_ServerList_Frame, 7, -28)
			vC_GH_ResultArea = CreateFrame("EditBox", "vC_GH_ResultArea", vC_GH_Scroll)
			vC_GH_ResultArea:SetWidth(vC_GH_Scroll:GetWidth())
			vC_GH_ResultArea:SetFontObject(vC_Font[216])
			vC_GH_ResultArea:SetAutoFocus(false)
			vC_GH_ResultArea:SetMultiLine(true)
			vC_GH_ResultArea:EnableMouse(true)
			vC_GH_Scroll:SetScrollChild(vC_GH_ResultArea)
	vC_GH_ServerList()
end