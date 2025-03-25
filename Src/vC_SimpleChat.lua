-- Completed/Updated 04/11/2024, 05/25/2024
local vC_AppName, vC_App = ...
if not ( vC_Run_SimpleChat ) then return end
-------------------------------------------------------
-- Future Clickable Zone, SubZone & Coord Announcer
-------------------------------------------------------
function vC_Reset_ChatFrames()
	if ( InCombatLockdown() ) then return end
	
	local vC_Message_Group = {
	   {    -- ChatFrame 1 (General)
		  "SAY", "EMOTE", "YELL", "TEXT_EMOTE",
		  "ACHIEVEMENT",
		  "SYSTEM", "ERRORS", "IGNORED",
		  "AFK", "DND",
		  "TIME_PLAYED_MSG",
		  "CHARACTER_POINTS_CHANGED",
		  "CREATURE",
		  -- "PET_INFO",  -- Remove dash if you want to see pet Summon/Dismiss (Class Pet, not Pet Battle)
		  "RAID_BOSS_WHISPER", "RAID_BOSS_EMOTE", "RAID_BOSS_YELL",  
		  "MONSTER_SAY", "MONSTER_WHISPER", "MONSTER_EMOTE", "MONSTER_PARTY", "MONSTER_YELL",
	   },
	   {},    -- Intentionally Blank 2 (Combat Log)
	   {},    -- Intentionally Blank 3 (Text To Voice)
	   {    -- ChatFrame 4 (Channels)
		  "CHANNEL1", "CHANNEL2", "CHANNEL3", "CHANNEL4", "CHANNEL5",
		  "CHANNEL6", "CHANNEL7", "CHANNEL8", "CHANNEL9", "CHANNEL10",
		  "CHANNEL", "CHANNEL_LIST",
		  "CHANNEL_JOIN", "CHANNEL_LEAVE",
		  "CHANNEL_NOTICE", "CHANNEL_NOTICE_USER",
	   },
	   {    -- ChatFrame 5 (Money, Currency, Loots, XP & Rep)
		  "COMBAT_XP_GAIN", "COMBAT_HONOR_GAIN", "COMBAT_FACTION_CHANGE",
		  "LOOT", "CURRENCY", "MONEY",
		  "SKILL", "SPELL_TRADESKILLS",
		  "PLAYER_LEVEL_UP",
		--  "PET_BATTLE_INFO", "PET_BATTLE_COMBAT_LOG",
	   },
	   {    -- ChatFrame 6 (Chats)
		  "REPLY", "WHISPER", "WHISPER_INFORM", "WHISPER_FOREIGN",
		  "BN_WHISPER", "BN_CONVERSATION", "BATTLENET",
		  "GUILD", "GUILD_MOTD", "OFFICER", "GUILD_ACHIEVEMENT", "GUILD_ITEM_LOOTED",
		  "PARTY", "PARTY_LEADER",
		  "INSTANCE_CHAT_LEADER", "INSTANCE_CHAT",
		  "RAID", "RAID_LEADER", "RAID_WARNING",
		  "TARGETICONS", "PING",
		  "BATTLEGROUND", "BATTLEGROUND_LEADER",
		  "BG_SYSTEM_ALLIANCE", "BG_SYSTEM_HORDE", "BG_SYSTEM_NEUTRAL",
	   },
	}
	local vC_Chat_Class_Color = {
	   "SAY", "EMOTE", "YELL",
	   "GUILD", "OFFICER", "GUILD_ACHIEVEMENT",
	   "ACHIEVEMENT",
	   "WHISPER",
	   "PARTY", "PARTY_LEADER",
	   "RAID", "RAID_LEADER", "RAID_WARNING",
	   "BATTLEGROUND", "BATTLEGROUND_LEADER",
	   "CHANNEL1", "CHANNEL2", "CHANNEL3", "CHANNEL4", "CHANNEL5",
	}
	local vC_Channels_Name = {
	   "General", "Trade", "LookingForGroup", "Services",
	   -- "LocalDefense", "NewcomerChat",						-- Not Using nor Care for PvP
	}

	FCF_ResetChatWindows()

	local vC_playerName, _					= UnitName("player")
	local vC_tVal_Width						= 310
	local vC_tVal_Height					= 100

	local cFrameA = _G["ChatFrame1"]        -- Normal
	ChatFrame_RemoveAllMessageGroups(cFrameA)
	ChatFrame_RemoveAllChannels(cFrameA)
	FCF_Close(cFrameA)
	FCF_SetWindowName(cFrameA, "General")
		FCF_SetChatWindowFontSize(self, cFrameA, 14)
		FCF_SetWindowColor(cFrameA, 0, 0, 0)
		FCF_SetWindowAlpha(cFrameA, 1)
		FCF_SetUninteractable(cFrameA, false)
		FCF_SetLocked(cFrameA, true)
		FCF_DockFrame(cFrameA, #FCFDock_GetChatFrames(GENERAL_CHAT_DOCK)+1, true)
		cFrameA:ClearAllPoints()
		cFrameA:SetWidth((vC_playerName ~= "Xmogforlife" and vC_tVal_Width or 450))
		cFrameA:SetHeight(vC_tVal_Height)
		cFrameA:SetFrameLevel(8)
		cFrameA:SetFading(false)
		cFrameA:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 0)
		cFrameA:SetUserPlaced(true)
		FCF_SavePositionAndDimensions(cFrameA)
	cFrameA:Show()
	_G["ChatFrame1Tab"]:Show()
	SetChatWindowShown(1, true)
	for i = 1, #vC_Message_Group[1] do
	   ChatFrame_AddMessageGroup(cFrameA, vC_Message_Group[1][i])
	end

	local cFrameB = _G["ChatFrame2"]			-- Combat Log (Hidden)
	ChatFrame_RemoveAllMessageGroups(cFrameB)
	ChatFrame_RemoveAllChannels(cFrameB)
	FCF_Close(cFrameB)
	cFrameB:Hide()
	_G["ChatFrame2Tab"]:Hide()
	SetChatWindowShown(2, false)

	local cFrameC = _G["ChatFrame3"]			-- Text To Voice (Hidden)
	ChatFrame_RemoveAllMessageGroups(cFrameC)
	ChatFrame_RemoveAllChannels(cFrameC)
	FCF_Close(cFrameC)
	cFrameC:Hide()
	_G["ChatFrame3Tab"]:Hide()
	SetChatWindowShown(3, false)

	local cFrameD = _G["ChatFrame4"]        -- Channel
	ChatFrame_RemoveAllMessageGroups(cFrameD)
	ChatFrame_RemoveAllChannels(cFrameD)
	FCF_Close(cFrameD)
	FCF_SetWindowName(cFrameD, "Channel")
		FCF_SetChatWindowFontSize(self, cFrameD, 14)
		FCF_SetWindowColor(cFrameD, 0, 0, 0)
		FCF_SetWindowAlpha(cFrameD, 1)
		FCF_SetUninteractable(cFrameD, false)
		FCF_SetLocked(cFrameD, true)
		FCF_DockFrame(cFrameD, #FCFDock_GetChatFrames(GENERAL_CHAT_DOCK)+1, true)
		cFrameD:ClearAllPoints()
		cFrameD:SetWidth(vC_tVal_Width)
		cFrameD:SetHeight(vC_tVal_Height)
		cFrameD:SetFrameLevel(8)
		cFrameD:SetFading(false)
		cFrameD:SetPoint("TOPLEFT", ChatFrame1, "TOPLEFT", 0, 0)
	cFrameD:Show()
	_G["ChatFrame4Tab"]:Show()
	SetChatWindowShown(4, true)
	for i = 1, #vC_Message_Group[4] do
	   ChatFrame_AddMessageGroup(cFrameD, vC_Message_Group[4][i])
	end
	for i = 1, #vC_Channels_Name do
	   JoinChannelByName(vC_Channels_Name[i], nil, _G["ChatFrame4"]:GetID(), 0)
	   ChatFrame_AddChannel(ChatFrame4, vC_Channels_Name[i])
	end

	local cFrameE = _G["ChatFrame5"]        -- Loots
	ChatFrame_RemoveAllMessageGroups(cFrameE)
	ChatFrame_RemoveAllChannels(cFrameE)
	FCF_Close(cFrameE)
	FCF_SetWindowName(cFrameE, "Loots")
		FCF_SetChatWindowFontSize(self, cFrameE, 14)
		FCF_SetWindowColor(cFrameE, 0, 0, 0)
		FCF_SetWindowAlpha(cFrameE, 1)
		FCF_SetUninteractable(cFrameE, false)
		FCF_SetLocked(cFrameE, true)
		FCF_UnDockFrame(cFrameE)
		cFrameE:ClearAllPoints()
		cFrameE:SetWidth(vC_tVal_Width+28)
		cFrameE:SetHeight(vC_tVal_Height)
		cFrameE:SetFrameLevel(8)
		cFrameE:SetFading(false)
		cFrameE:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", -28, 25)
	cFrameE:Show()
	_G["ChatFrame5Tab"]:Show()
	SetChatWindowShown(5, true)
	cFrameE:SetUserPlaced(true)
	FCF_SavePositionAndDimensions(cFrameE)
	for i = 1, #vC_Message_Group[5] do
	   ChatFrame_AddMessageGroup(cFrameE, vC_Message_Group[5][i])
	end

	local cFrameF = _G["ChatFrame6"]        -- Chats
	ChatFrame_RemoveAllMessageGroups(cFrameF)
	ChatFrame_RemoveAllChannels(cFrameF)
	FCF_Close(cFrameF)
	FCF_SetWindowName(cFrameF, "Chats")
		FCF_SetChatWindowFontSize(self, cFrameF, 14)
		FCF_SetWindowColor(cFrameF, 0, 0, 0)
		FCF_SetWindowAlpha(cFrameF, 1)
		FCF_SetUninteractable(cFrameF, false)
		FCF_SetLocked(cFrameF, true)
		FCF_UnDockFrame(cFrameF)
		cFrameF:ClearAllPoints()
		cFrameF:SetWidth(vC_tVal_Width+28)
		cFrameF:SetHeight(vC_tVal_Height)
		cFrameF:SetFrameLevel(8)
		cFrameF:SetFading(false)
		cFrameF:SetPoint("BOTTOMLEFT", ChatFrame5, "TOPLEFT", 0, 25)
	cFrameF:Show()
	_G["ChatFrame6Tab"]:Show()
	SetChatWindowShown(6, true)
	cFrameF:SetUserPlaced(true)
	FCF_SavePositionAndDimensions(cFrameF)
	for i = 1, #vC_Message_Group[6] do
	   ChatFrame_AddMessageGroup(cFrameF, vC_Message_Group[6][i])
	end

	for i = 7, NUM_CHAT_WINDOWS do
	   local cFrameJunk = _G["ChatFrame"..i]
	   ChatFrame_RemoveAllMessageGroups(cFrameJunk)
	   ChatFrame_RemoveAllChannels(cFrameJunk)
	   FCF_Close(cFrameJunk)
	   cFrameJunk:Hide()
	   _G["ChatFrame"..i.."Tab"]:Hide()
	   SetChatWindowShown(i, false)
	end

	for i = 1, #vC_Chat_Class_Color do
		ToggleChatColorNamesByClassGroup(true, vC_Chat_Class_Color[i])
	end
	
	FCF_SelectDockFrame(ChatFrame1)        -- Log to First Tab
end