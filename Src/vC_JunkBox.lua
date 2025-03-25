
local vC_AppName, vC_App = ...
if not ( vC_Run_JunkBox ) then return end
-------------------------------------------------------
-- Unlock & Send Lockboxes in Mail
-------------------------------------------------------
function vC_Send_Boxes()
	--local TestDB = {}
	local wItem = 161984 -- Bracers
	--local wItem = 16882 -- Battered Lockbox
	
	local i, iC = 0, GetItemCount(wItem)
	if iC == 0 then print("No Lockbox to send!") return end
	
	local tMsg = "Scraps"
	--local tMsg = "Junkbox(s)"
	
	local SendJBTo = "Vrondir"
	MailFrameTab2:Click()
	SendMailNameEditBox:SetText(SendJBTo)
	SendMailSubjectEditBox:SetText(tMsg)

	--wipe(TestDB)
	--tinsert(TestDB,"ItemCount: "..iC.."\n")
	--tinsert(TestDB,"# of Bags: "..(NUM_BAG_SLOTS + 1).."\n")
	for j = 0, NUM_BAG_SLOTS do
		for k = 1, C_Container.GetContainerNumSlots(j) do
			local JBItemID = C_Container.GetContainerItemID(j,k)
			--tinsert(TestDB,("="..i..","..j..","..k..","..(JBItemID and JBItemID or "nil").."\n"))
			if JBItemID == wItem then -- Battered Lockbox
				C_Container.PickupContainerItem(j,k)
				ClickSendMailItemButton()
				ClearCursor()
				i = i + 1
			end
			if ( i == 12 ) then break end
		end
		if ( i == 12 ) then break end
	end
	--vCP_ResultArea:SetText(table.concat(TestDB,""))
	C_Timer.After(1, function()
		if ( HasSendMailItem(1) ) then SendMail(SendJBTo,tMsg) end
	end)
	C_Timer.After(2, function()
		iC = GetItemCount(wItem)
		if ( iC ~= 0 ) then vC_Send_Boxes() else print("All "..tMsg.." Sent!") end
	end)
end
-------------------------------------------------------
-- Any Lockbox in your bag
-------------------------------------------------------
function vC_Bag_Of_Lockboxes()
	-- Coming Soon
end
-------------------------------------------------------
-- Lockbox Frame on SendMailFrame
-------------------------------------------------------
if vC_Mail_Junkbox == nil then
	local vC_Mail_Junkbox = CreateFrame("Frame", "vC_Mail_Junkbox", MailFrame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_Mail_Junkbox, 47, 1)
		vC_Mail_Junkbox:SetSize(150, 45)
		vC_Mail_Junkbox:SetPoint("BOTTOMLEFT", MailFrame, "BOTTOMRIGHT", 0, 0)
		vC_Mail_Junkbox:EnableMouse(true)
		local vC_Mail_Junkbox_Icon = CreateFrame("Button", "vC_Mail_Junkbox_Icon", vC_Mail_Junkbox)
			vC_Mail_Junkbox_Icon:SetSize(38, 38)
			vC_Mail_Junkbox_Icon:SetNormalTexture("Interface\\ICONS\\INV_Box_0"..random(1,4))
			-- INV_Box_01, INV_Box_02, INV_Box_03, INV_Box_04
			vC_Mail_Junkbox_Icon:SetHighlightTexture("Interface\\BUTTONS\\UI-Quickslot-Depress")
			vC_Mail_Junkbox_Icon:SetPoint("LEFT", vC_Mail_Junkbox, "LEFT", 5, 0)
			vC_Mail_Junkbox_Icon:SetScript("OnClick", function()
				print("Disabled: Sending Lockboxes")
				-- vC_Send_Boxes()
			end)
			
			
end
