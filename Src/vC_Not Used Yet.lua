-------------------------------------------------------
-- Declaration - Need Verification
-------------------------------------------------------
local Unitname, Unitrealm					= UnitName
local UnitGUID								= UnitGUID
local UnitLevel								= UnitLevel
local locClass, engClass, classIdx			= UnitClass
local raceName, raceFile, raceID			= UnitRace
local engFaction, locFaction				= UnitFactionGroup
local prof1, prof2, arch, fish, cook		= GetProfessions()

local GetCurrencyInfo 						= C_CurrencyInfo.GetCurrencyInfo
local GetSecondsUntilWeeklyReset 			= C_DateAndTime.GetSecondsUntilWeeklyReset

local GetQuestLineInfo						= C_QuestLine.GetQuestLineInfo
local GetQuestLineQuests					= C_QuestLine.GetQuestLineQuests

local AddWorldQuestWatch					= C_QuestLog.AddWorldQuestWatch
local GetLogIndexForQuestID					= C_QuestLog.GetLogIndexForQuestID
local GetQuestDifficultyLevel				= C_QuestLog.GetQuestDifficultyLevel
local GetTitleForQuestID					= C_QuestLog.GetTitleForQuestID
local IsComplete							= C_QuestLog.IsComplete
local IsOnQuest								= C_QuestLog.IsOnQuest
local IsQuestFlaggedCompleted				= C_QuestLog.IsQuestFlaggedCompleted

local GetNumQuestLogRewards					= GetNumQuestLogRewards

local IsActive								= C_TaskQuest.IsActive
local GetQuestTimeLeftSeconds				= C_TaskQuest.GetQuestTimeLeftSeconds
local GetQuestZoneID						= C_TaskQuest.GetQuestZoneID
local GetQuestLocation						= C_TaskQuest.GetQuestLocation

local itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subclassID = GetItemInfoInstant