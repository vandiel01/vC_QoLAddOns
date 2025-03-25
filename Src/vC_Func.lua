
local vC_AppName, vC_App = ...
-------------------------------------------------------
-- Global Temp Variable, Interchangable
-------------------------------------------------------
vC_DB, vC_tDB							= {}, {}		-- Temp Table
vC_tVal									= nil			-- Temp Value
vC_Hdr, vC_Row, vC_Col					= nil, nil, nil	-- Temp Header, Row, Column
vC_tBool								= false			-- Temp Boolean
-------------------------------------------------------
-- Run in Background? (true/false) Temp Variables Until Storage is Created Later
-------------------------------------------------------
-- Completed but Always room to improve
vC_Run_LookChoice						= false			-- Pick a Font, Border or BG?
vC_Run_TestBox							= false			-- TextBox?
vC_Run_Personal							= true			-- Personal ATT Window Adjustments
	
-- Forever Tweak
vC_Run_AuctionSales						= true			-- Auction House Sales (Your Own Sales, if any)
vC_Run_MarkingBar						= true			-- Marking/Ping Bar
vC_Run_GoldHoard						= true			-- Send Excessive Gold To Main
vC_Run_CVars							= true			-- List of Common CVars List
vC_Run_SimpleChat						= true			-- Keep Chatframe Simple, BG, Chat in Certain Tabs
vC_Run_SLAnima							= true			-- Shadowland Anima Counter Display
vC_Run_AHToons							= true			-- Run Simplified AH Toon On Any Server?
vC_Run_MiniMap							= true			-- Run Simple Location/X, Y Coords
vC_Run_JunkBox							= true			-- Junkbox Actions
vC_Run_PetBattle						= true			-- Pet Battles Actions
vC_Run_Quests							= true			-- Quest Reminder
vC_Run_CraftOrders						= true			-- Run Crafting Order on Main from Alts

-- Not Started/Not Completed
--vC_Run_RandomHearth					= false			-- Show/Run Random Hearthstone
--vC_Run_MiniCurrRep					= true			-- Mini Window to Show Currency/Rep for Certain Zones
--vC_Run_TopInfoBar						= true			-- Top Info Bar
-------------------------------------------------------
-- Reversed Table Listing
-------------------------------------------------------
function vC_ReverseTable(a,b,...)
	local vC_Check_Type = type(a)
	
	if b == 1 then
		if a == nil then
			a = "Type: "..vC_Check_Type.." - Cannot Read Data /or/ Data not Available"
		else
			a = "Type: "..vC_Check_Type.." - "..a
		end
	end
	if b == 99 then
		wipe(vC_DB)
		vC_TestResultArea:SetText("")
	end
	tinsert(vC_DB,a.."\n")
	
	-- Hold for future to list data in reverse
	-- tinsert(vC_AnyDB,(tH..tB.." ["..tA.."] : "..tD.." ["..tC.."] @ "..tF..", "..tG.."\n"))
	
	local len = #vC_DB
	for i = len, 1, -1 do
		vC_tDB[len - i + 1] = vC_DB[i]
	end
	
	--if vC_QoLFr:IsVisible() then vC_QoLFr_EBox:SetText(table.concat(vC_tDB,"")) end
	if ( vC_TestBox ~= nil and vC_Run_TestBox ) then vC_TestResultArea:SetText(table.concat(vC_tDB,"")) end
end
-------------------------------------------------------
-- Get Covenant ID & Display Proper Icon
-------------------------------------------------------
function vC_GetCovenantID()
	-- Index of the Covenant ID 0 None, 1 K, 2 V, 3 NF, 4 N
	if ( C_Covenants.GetActiveCovenantID() ~= nil and vC_ConvenantIc ~= nil ) then
		local GetActiveCovenantID = C_Covenants.GetActiveCovenantID()
		vC_ConvenantIc:SetAtlas(((GetActiveCovenantID == nil or GetActiveCovenantID == 0)and vC_SL_Covenant[5][3] or vC_SL_Covenant[GetActiveCovenantID][3]))
	end
end
-------------------------------------------------------
-- Fixes ',' for Large Number Format
-------------------------------------------------------
function vC_GoldFormat(a)
	local Copper = (("%d"):format(a % 100))
	local Silver = (("%d"):format((a / 100) % 100))
	local Gold = (("%d"):format(a / 100 / 100))
	local fGold = FormatLargeNumber(Gold)
	return (fGold.."|T237618:16|t "..Silver.."|T237620:16|t "..Copper.."|T237617:16|t")
end
-------------------------------------------------------
-- Convert Epoch Sec to D/H:M.S
-------------------------------------------------------
function vC_Convert_Timestamp(a1, a2)
	if ( a1 == 0 and a2 == 0 ) then return end
	
	local vC_tVal = nil
	local d = floor(a1/86400)
	local h = floor(mod(a1,86400)/3600)
	local m = floor(mod(a1,3600)/60)
	local s = floor(mod(a1,60))
	dText = "day"..(d == 1 and ", " or "s, ")
	hText = "hr"..(h == 1 and ", " or "s, ")
	mText = "min"..(m == 1 and ", " or "s, ")
	sText = "sec"..(s == 1 and "" or "s")
	if d > 0 then
		vC_tVal = d..dText..h..hText..m..mText..s..sText
	elseif h > 0 then
		vC_tVal = h..hText..m..mText..s..sText
	elseif m > 0 then
		vC_tVal = m..mText..s..sText
	else
		vC_tVal = s..sText
	end
	return (a2 == 1 and "Cooldown: " or (a2 == 2 and "Time Left: " or ""))..vC_tVal
end
-------------------------------------------------------
-- Background/Border for Frame
-------------------------------------------------------
function vC_SetBackdrop_Choice(fname, bkgnd, edge)
	if ( fname == "" and bkgnd == "" or edge == "" ) then return end
	
	fname:SetBackdrop({
		bgFile = (bkgnd == -1 and "" or (bkgnd == 0 and vC_Backdrop[random(1,#vC_Backdrop)] or vC_Backdrop[bkgnd])),
		tileEdge = true,
		tileSize = 16,
		edgeFile = (edge == -1 and "" or (edge == 0 and vC_Border[random(1,#vC_Border)] or vC_Border[edge])),
		edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
end
-------------------------------------------------------
-- Custom Tooltips
-------------------------------------------------------
function vC_cToolTips(fname, curpos, hyptex, arg1, arg2)
	GameTooltip:ClearLines()
	C_CVar.SetCVar("alwaysCompareItems",0)				-- Prevent Comparison, my addon doesn't do any comparison
	
	if fname == 0 then
		GameTooltip:Hide()
		C_CVar.SetCVar("alwaysCompareItems",1)			-- Prevent Comparison, my addon doesn't do any comparison
		return
	end
	
	GameTooltip:SetOwner(fname,vC_Cursor_Positioning[(curpos == nil and 1 or curpos)])

	if ( hyptex == 0 ) then
		GameTooltip:SetHyperlink(arg1)
	else
		if ( arg2 == 0 or arg2 == "" ) then
			GameTooltip:AddLine(arg1)
		else
			GameTooltip:AddDoubleLine(arg1,arg2)
		end
	end
	
	GameTooltip:Show()
end
-------------------------------------------------------
-- RGB to Hex (Maybe remove)
-------------------------------------------------------
function vC_RGB_To_Hex(r, g, b)
	r = r <= 255 and r >= 0 and r or 0
	g = g <= 255 and g >= 0 and g or 0
	b = b <= 255 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r, g, b)
end
-------------------------------------------------------
-- Open Any Openable Containers (Except Lockbox)
-------------------------------------------------------
function vC_AutoOpen_Container()
	-- Need to Find Map, Check Bag for Specific Item #
	if ( MerchantFrame:IsShown() ) then return end -- end up TRYING sell openable container to vender and get error
	
	local j = 0
	for i = 1, #vC_Openable_Container do
		local vC_ItemCount = C_Item.GetItemCount(vC_Openable_Container[i][1]) or 0
		j = j + vC_ItemCount
	end
	if ( j == 0 ) then return end
	
	for h = 1, #vC_Openable_Container do
		local vC_ItemCount = C_Item.GetItemCount(vC_Openable_Container[h][1]) or 0
		if ( vC_ItemCount ~= 0 ) then
			for i = 1, vC_ItemCount do
				for j = 0, NUM_BAG_SLOTS do
					for k = 1, C_Container.GetContainerNumSlots(j) do
						local BagItemsID = C_Container.GetContainerItemID(j, k)
						if BagItemsID == vC_Openable_Container[h][1] then
							C_Container.UseContainerItem(j, k)
						end
					end
				end
			end
		end
	end
end
-------------------------------------------------------
-- Events Registered
-------------------------------------------------------
local vC_RegisterEvents = CreateFrame("Frame")
	vC_RegisterEvents:RegisterEvent("ADDON_LOADED")
	vC_RegisterEvents:SetScript("OnEvent", function(s, e, ...)
	if ( e == "ADDON_LOADED" ) then
		local vC_ListOfEvents = {
			"QUEST_DETAIL",												-- Checks when Quest Being Looked At/Ready To Accept/Decline
			"GOSSIP_SHOW",												-- Gossip Options with the NPC (Quest, Dialog or else)
			"QUEST_LOG_UPDATE",

			"PLAYER_LOGIN",
			"PLAYER_ENTERING_WORLD",
			"PLAYER_LEVEL_UP",											-- Did Player Level Up?
			"PLAYER_SPECIALIZATION_CHANGED",							-- Check if Player Changed Specs
			"TIME_PLAYED_MSG",											-- Check How Long Played

			--"TRAIT_CONFIG_LIST_UPDATED",								-- Talent Tree for Class Specs
			--"TRAIT_NODE_CHANGED",										-- Talent Tree for Class Specs
			--"TRAIT_TREE_CHANGED",										-- Talent Tree for Class Specs
			--"TRAIT_TREE_CURRENCY_INFO_UPDATED",						-- Talent Tree for Class Specs
			
			"MAIL_SHOW",												-- See if Mailbox Frame is Shown/Open
			"MAIL_CLOSED",												-- See if Mailbox Frame is Closed
			"MAIL_INBOX_UPDATE",										-- See if Mailbox Frame is Mail Internal Update

			"MERCHANT_SHOW",											-- Watch for Merchant UI Open
			"MERCHANT_FILTER_ITEM_UPDATE",
			"MERCHANT_UPDATE",
			"MERCHANT_CLOSED",											-- Watch for Merchant UI Close

			"AUCTION_HOUSE_SHOW",										-- Create AH Frame for Sales
			"OWNED_AUCTIONS_UPDATED",									-- Display Owned AH Sales

			"CRAFTINGORDERS_SHOW_CUSTOMER",								-- Detect if SEND AN Crafting Order Window is Open
			"CRAFTINGORDERS_HIDE_CUSTOMER",								-- Detect if SEND AN Crafting Order Window is Closed
			"CRAFTINGORDERS_CAN_REQUEST",

			"PLAYER_MONEY",												-- Listen for Any Currency or Gold Changes
			"BAG_UPDATE",												-- Fire when there are changes in the bag

			"GUILDBANK_UPDATE_MONEY",									-- Check Guild Repair Funding Available
			"GUILDBANK_UPDATE_WITHDRAWMONEY",							-- Check Guild Repair Funding Available

			"ZONE_CHANGED",												-- Zone ID, Map, Coord Updates
			"ZONE_CHANGED_NEW_AREA",									-- Zone ID, Map, Coord Updates
			"ZONE_CHANGED_INDOORS",										-- Zone ID, Map, Coord Updates

			"GROUP_ROSTER_UPDATE",										-- Check for MarkingBar, Watches for PARTY, RAID, isLEADER
			
			"INSPECT_READY",											-- Gear iL Inspection of Others/Self
			"PLAYER_REGEN_ENABLED",
			"PLAYER_EQUIPMENT_CHANGED",									-- New Gear Equipped?

			--"PLAYER_STARTED_MOVING",									-- For Real-time Coord X,Y Updates ?? (Almost)
			
			"LFG_PROPOSAL_DONE",
			"LFG_UPDATE",-- C update frequently
		}
		for i = 1, #vC_ListOfEvents do
			vC_RegisterEvents:RegisterEvent(vC_ListOfEvents[i])
		end
	end

	-- Player Login/Entering/Logout Events
	if ( e == "TIME_PLAYED_MSG" ) then
		vC_totalLvlPlayed, vC_thisLvlPlayed = ...
	end
	if ( e == "PLAYER_LOGIN" ) then
		DEFAULT_CHAT_FRAME:AddMessage("Loaded: "..vC_AppTitle)			-- Display Title with Version in Chat
	end
	if ( e == "PLAYER_ENTERING_WORLD" ) then
		--WorldMapFrame:HookScript("OnShow", vC_Reposition_WorldMap)			-- Reposition World Map
		if ( vC_Run_MarkingBar ) then vC_MarkingBar() end					-- Marking Bar Toggle
		if ( vC_Run_MiniMap ) then vC_GetZoneInfo(3,4) end					-- Update Zone, X,Y Location
		--if ( vC_Run_RandomHearth ) then vC_HearthStone() end				-- Random Your Hearthstone!
		--if ( vC_Run_LookChoice ) then vC_GetCovenantID() end				-- Get Covenant ID since it can only be pulled after loaded
		if ( vC_Run_SimpleChat ) then vC_Reset_ChatFrames() end				-- Reset/Fix Chatbox
		if ( vC_Run_SLAnima ) then vC_AnimaCount() end						-- Temp Anima Counter
		if C_AddOns.IsAddOnLoaded("AllTheThings") then vC_ATT_WindowPosition() end	-- Positioning ATT Windows
		--vC_Priority_Stats()
		if ( vC_Run_AHToons ) then vC_CrossRealm_AH() end
		vC_CurrencyFix()													-- Fix Currency Display on Bag
		vC_Display_DR_Activity()
	end
	
	-- Check if Player Levelled Up
	if ( e == "PLAYER_LEVEL_UP" ) then
		C_Timer.After(1, function() SendChatMessage("<-- Level "..UnitLevel("player"),"GUILD") end)
	end
	-- Update Priority Stats (for Remix)
	--if ( e == "PLAYER_EQUIPMENT_CHANGED" ) then
	--	vC_Priority_Stats()
	--end
	-- Reposition Addon When Spec is changed
	if ( e == "PLAYER_SPECIALIZATION_CHANGED" ) then
	--	if ( C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") and PlayerSpellsFrame ~= nil and not InCombatLockdown() ) then vC_Fill_Talent() end
		if ( vC_Run_SimpleChat ) then vC_Reset_ChatFrames() end				-- Reset/Fix Chatbox
		if C_AddOns.IsAddOnLoaded("AllTheThings") then vC_ATT_WindowPosition() end	-- Positioning ATT Windows
	end
	-- Any Modification to Talent Tree
	--if ( e == "TRAIT_CONFIG_LIST_UPDATED" or e == "TRAIT_TREE_CHANGED" or e == "TRAIT_TREE_CURRENCY_INFO_UPDATED" or e == "TRAIT_NODE_CHANGED" ) then
	--	if ( C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") and PlayerSpellsFrame ~= nil and not InCombatLockdown() ) then vC_Fill_Talent() end
	--end
	
	-- Group/Raid Events
	if ( e == "GROUP_ROSTER_UPDATE" ) then
		--if ( vC_Run_MarkingBar ) then vC_MarkingBar() end					-- Marking Bar Toggle
	end
	if ( e == "LFG_PROPOSAL_DONE" or e == "LFG_UPDATE" ) then
		vC_LeaveGroupIcon(e)
	end
	
	-- Zone Sub, Zone, Map, Parent Map Events
	if ( e == "ZONE_CHANGED" or e == "ZONE_CHANGED_NEW_AREA" or e == "ZONE_CHANGED_INDOORS" ) then
		if ( vC_Run_MiniMap ) then vC_GetZoneInfo(3,4) end					-- Update Zone, X,Y Location
		if ( vC_Run_SLAnima ) then vC_AnimaCount() end						-- Temp Anima Counter
	end
	
	-- Auction House Events
	if ( e == "AUCTION_HOUSE_SHOW" or e == "OWNED_AUCTIONS_UPDATED" ) then
		if ( vC_Run_AuctionSales ) then vC_AuctionHouse_Sales() end 		-- Auction House Windows for Incoming Sales
	end
	
	-- Place An Craft Orders
	if ( e == "CRAFTINGORDERS_SHOW_CUSTOMER" or e == "CRAFTINGORDERS_HIDE_CUSTOMER" ) then
		vC_PlaceCraftFrame(e)
	end
	-- Do An Craft Orders
	if ( e == "CRAFTINGORDERS_CAN_REQUEST" ) then
		vC_DoTheCraftFrame(e)
	end
	
	-- Player Bag/Money/Currency Events
	if ( e == "PLAYER_MONEY" or e == "BAG_UPDATE" ) then
		if ( vC_Run_GoldHoard and vC_GH_Body_Frame:IsVisible() ) then vC_GoldHoard_UseData() end	-- Update GetMoney() for Gold Hoarding
		if not ( MerchantFrame:IsShown() ) then C_Timer.After(.5, function() vC_AutoOpen_Container() end) end	-- Auto Open Any Specific Bag/Token/Prize
		if ( vC_Run_SLAnima ) then vC_AnimaCount() end						-- Anima Counter
		if ( vC_XMogAHFrame and vC_XMogGoldFrame:IsVisible() ) then vC_XMogGoldAmount:SetText(vC_GoldFormat(GetMoney())) end
	end
	
	-- Mailbox Events
	if ( e == "MAIL_SHOW" ) then
		if ( vC_Run_GoldHoard ) then vC_GoldHoard_UseData() end				-- Load Configuration for Gold Hoarding
	end
	if ( e == "MAIL_INBOX_UPDATE" ) then
		if ( vC_Run_GoldHoard ) then vC_GoldHoard_UseData() end				-- Update GetMoney() for Gold Hoarding
	end
	if ( e == "MAIL_CLOSED" ) then
		if ( vC_Run_GoldHoard ) then vC_GoldHoard_UseData("Save") end		-- Save Configuration for Gold Hoarding
	end
	
	-- Merchant Events
	if ( e == "MERCHANT_CLOSED" ) then
		if not ( MerchantFrame:IsShown() ) then C_Timer.After(.5, function() vC_AutoOpen_Container() end) end
	end
	
	-- Quest/Gossip Events
	if ( e == "GOSSIP_SHOW" or e == "QUEST_DETAIL" ) then
		if ( vC_Run_Quests ) then vC_Gossip_Bypass() end
	end

end)

