-- Completed 04/10/2024
local vC_AppName, vC_App = ...
if not ( vC_Run_CVars ) then return end
-------------------------------------------------------
-- List of Common cVars Issues That Won't Stick Between Accounts (or multiples)
-------------------------------------------------------
-- 0 = Off/1 = On/2 = Put on Default
cVars_Data = {
	-- Accessbility/Tutorial/Tooltips
	{ 0, "showLoadingScreenTips", },					-- 1 Show Hints/Tips on Loading Screen
	{ 1, "movieSubtitle", },							-- 1 Show Subtitle on all Cutscene/Cinimera
	{ 255, "excludedCensorSources", },					-- 1 Inappropriate msg exemptions 0 Nobody/1 Friend/3 Friend-Guild/255 All
	{ 1, "doNotFlashLowHealthWarning", },				-- 0 Do not flash your screen red when you are low on health.
	{ 0, "alwaysCompareItems", },						-- 1 show item comparison tooltips
	{ 0, "showTutorials", },							-- 1 display tutorials
	{ 1, "UberTooltips", },								-- 1 Show verbose tooltips
	{ 0, "speechToText", },
	
	-- Target of Target
	
	-- Self
	{ 1, "statusText", },								-- 1 Show Text HP ##/% on Portrait
	{ "BOTH", "statusTextDisplay", },					-- 1 Show 1 NUMERIC, 2 PERCENT, 3 BOTH or 4 NONE
	{ 1, "showCastableBuffs", },						-- 1 only Buffs the player can cast. Only applies to raids.
	{ 1, "showDispelDebuffs", },
	{ 1, "ShowClassColorInFriendlyNameplate", },		-- 1 display the class color in friendly nameplate health bars
	{ 1, "ShowClassColorInNameplate", },				-- 1 display the class color in enemy nameplate health bars
	{ 1, "chatBubbles", },								-- 1 show in-game chat bubbles
	{ 0, "chatBubblesParty", },							-- 1 show in-game chat bubbles for party chat
	{ 1, "autoClearAFK", },								-- 1 clear AFK when moving or chatting
	{ 1, "autoStand", },								-- 1 Automatically stand when needed
	
	-- Bag
	{ 1, "expandBagBar", },								-- 1 Expand/Minimize Bag 6 to 2 or 2 to 6
	{ 0, "combinedBags", },								-- 0 All Bag in 1
	
	-- Action Bar
	{ 1, "countdownForCooldowns", },					-- 0 Show CD Timer?
	{ 1, "lockActionBars", },							-- 1 action bars should be locked, preventing changes
	
	-- Social/Guild/Friend
	{ 1, "guildMemberNotify", }	,						-- 1 Show if Guildmate is Online/Offline in Chat Msg
	{ 1, "guildShowOffline", },							-- 1 Show if Guildmate is Online/Offline in Guild UI
	{ 4, "toastDuration", },							-- 4 How long to display toast windows, in seconds
	{ 0, "showToastOnline", },							-- 1 friend coming online
	{ 0, "showToastOffline", },							-- 1 friend going offline
	{ 0, "showToastWindow", },							-- 1 system messages in a toast window
	{ 1, "showToastClubInvitation", },					-- 1 show Battle.net message for club invitations
	{ 1, "showToastConversation", },					-- 1 show Battle.net message for conversations
	{ 1, "showToastFriendRequest", },					-- 1 show Battle.net message for friend requests
	{ 0, "blockChannelInvites", },						-- 0 automatically block chat channel invites

	-- Error Log/Reporting
	{ 1, "taintLog", },									-- 0 Turn On/Off Taint Log
	{ 1, "scriptErrors", },								-- 0 Turn On/Off Blizzard UI Error
	
	-- Auto Actions
	{ 1, "autoDismountFlying", },						-- 0 Auto Dismount When Some Action Occurs
	{ 1, "autoDismount", },								-- 1 Automatically dismount when needed
	{ 0, "lootUnderMouse", },							-- 1 Loot Under Mouse Cursor?
	{ 1, "autoLootDefault", },							-- 0 Automatically loot items when the loot window opens
	{ 0, "SoftTargetInteract", },						-- 1 0 Off/1 Gamepad/2 KBM/3 Always
	{ 1, "mountJournalShowPlayer", },					-- 0 Show the player on the mount preview
	{ 0, "timeMgrUseLocalTime", },						-- 0 Toggles to either the realm or ur system time
	{ 1, "restrictCalendarInvites", },					-- 1 restrict calendar invites to friends and guilds only.
	{ 0, "blockTrades", },								-- 0 automatically block trade requests
	{ 1, "buffDurations", },							-- 1 show buff durations
	{ 1, "autoUnshift", },								-- 1 leave shapeshift form when needed
	{ 0, "autoInteract", },								-- 0 Toggles auto-move to interact target
	
	-- Quest
	{ 1, "autoQuestPopUps", },							-- 1 Saves current pop-ups for quests
	{ 1, "autoQuestProgress", },						-- 1 Whether to automatically watch all quests when they are updated
	{ 1, "autoQuestWatch", },							-- 1 Whether to automatically watch all quests when you obtain them
	{ 1, "showQuestObjectivesOnMap", },					-- 1 Shows quest POIs on the main map
	
	-- World Map/Minimap
	{ 0, "mapFade", },									-- 1 fade out the world map when moving
	{ 1, "digSites", },									-- 1 enabled, the archaeological dig site system will be used.
	{ 1, "contentTrackingFilter", },					-- 1 enabled, tracked items will display on the world map.
	{ 1, "showDungeonEntrancesOnMap", },				-- 1 enabled, dungeon entrances will display on the world map.
	{ 1, "questPOI", },									-- 1 enabled, the quest POI system will be used
	{ 1, "worldQuestFilterAnima", },					-- 1 enabled, WQ with ANIMA rewards, shown on the map
	{ 1, "worldQuestFilterReputation", },				-- 1 enabled, WQ with REP rewards, shown on the map
	{ 1, "worldQuestFilterEquipment", },				-- 1 enabled, WQ with Gears rewards, shown on the map
	{ 1, "worldQuestFilterProfessionMaterials", },		-- 1 enabled, WQ with Prof mats rewards, shown on the map
	{ 1, "worldQuestFilterArtifactPower", },			-- 1 enabled, WQ with APower rewards, shown on the map
	{ 1, "worldQuestFilterResources", },				-- 1 enabled, WQ with Order Res or war resource rewards, shown on the map
	{ 1, "worldQuestFilterGold", },						-- 1 enabled, WQ with gold rewards, shown on the map
	{ 1, "primaryProfessionsFilter", },					-- 1 enabled, primary Prof WQ icons, shown on world maps
	{ 1, "secondaryProfessionsFilter", },				-- 1 enabled, secondary Prof WQ icons, shown on world maps
	{ 1, "showTamers", },								-- 1 enabled, pet battle icons, shown on world maps
	{ 1, "minimapShowArchBlobs", },						-- 1 show the quest blobs on the minimap.
	{ 1, "minimapShowQuestBlobs", },					-- 1 show the quest blobs on the minimap.
	
	-- Raid Frame Options
	{ 1, "raidFramesDisplayClassColor", },				-- 0 Colors raid frames with the class color
	{ 0, "raidOptionShowBorders", },					-- 1 Displays borders around the raid frames
	{ "PERCENT", "raidFramesHealthText", },				-- 4 display HP text, raid frames Show 1 NUMERIC, 2 PERCENT, 3 BOTH or 4 NONE
	{ 72, "raidFramesWidth", },							-- 72 width of the individual raid frames
	{ 36, "raidFramesHeight", },						-- 36 height of the individual raid frames
	{ 0, "raidFramesPosition", },						-- 0 Where the raid frames should be placed
	{ 0, "raidFramesDisplayOnlyHealerPowerBars", },		-- 0 display power bars only for healers on Raid Frames
	{ 0, "raidFramesDisplayPowerBars", },				-- 0 display mana, rage, etc. on Raid Frames
	{ 1, "raidFramesDisplayIncomingHeals", },			-- 1 display incoming heals on Raid Frames
	{ 1, "raidFramesDisplayOnlyDispellableDebuffs", },	-- 0 display only dispellable debuffs on Raid Frames
	{ 1, "raidFramesDisplayDebuffs", },					-- 1 display debuffs on Raid Frames
	{ 1, "raidFramesDisplayAggroHighlight", },			-- 1 display aggro highlights on Raid Frames
	{ 0, "raidOptionDisplayMainTankAndAssist", },		-- 1 display main tank and main assist units in the raid frames
	{ 0, "raidOptionDisplayPets", },					-- 0 display pets on the raid frames
	{ "LOCK", "raidOptionLocked", },					-- LOCK Whether the raid frames are locked, LOCK/UNLOCKED
	{ 0, "raidOptionKeepGroupsTogether", },				-- 0 The way to group raid frames
	{ "ROLE", "raidOptionSortMode", },					-- ROLE The way to sort raid frames
}

for i = 1, #cVars_Data do
	C_CVar.SetCVar(cVars_Data[i][2],cVars_Data[i][1])
end

--[[
List of Console Variables
NoteNote: This list is up to date as of Patch  (53840) Mar 18 2024
Name											Default		Category	Scope		Description

acknowledgedArrowCallouts						0			Game		Character	Bit field of Looking for guild player settings
ActionButtonUseKeyDown							1			Game		Account		Activate the action button on a keydown
ActionButtonUseKeyHeldSpell						0			Game		Account		Activate the press and hold cast option on a keydown
actionedAdventureJournalEntries								Game		Account		Which adventure journal entries flagged with ADVENTURE_JOURNAL_HIDE_AFTER_ACTION the user acted upon
activeCUFProfile											Game		Character	The last active CUF Profile.
addFriendInfoShown								0			Game		Account		The info for Add Friend has been shown
advancedCombatLogging							0			Game					Whether we want advanced combat log data sent from the server
advancedWatchFrame								0			Game		Account		Enables advanced Objectives tracking features
AdvFlyingDynamicFOVEnabled						1			Game					Enables adjustment of camera field of view based on gliding speed
advFlyKeyboardMaxPitchFactor					5.0			Game		Account		Modifies the maximum pitch rate when using advFlyKeyboard.
advFlyKeyboardMaxTurnFactor						8.0			Game		Account		Modifies the maximum turn rate when using advFlyKeyboard.
advFlyKeyboardMinPitchFactor					2.5			Game		Account		Modifies the minimum pitch rate when using advFlyKeyboard.
advFlyKeyboardMinTurnFactor						5.0			Game		Account		Modifies the minimum turn rate when using advFlyKeyboard.
advFlyPitchControl								3			Game		Account		Modifies forward/backwards inputs to control pitch when Dragonriding.
advFlyPitchControlCameraChase					20.0		Game		Account		Modifies the speed at which camera pitch follows player pitch while dragonriding with forward/backward pitch control.
advFlyPitchControlGroundDebounce				0			Game		Account		If enabled, will debounce forwards/backwards inputs used to control pitch when transitioning between dragonriding and grounded.
advJournalLastOpened							0			Game		Account		Last time the Adventure Journal opened
agentUID													Game					The UID provided by Battle.net to be passed to Agent
AIBrain											0
AIController									0
AIControllerEventLog							0
AIEventLog										0
allowCompareWithToggle							1			Game		Account	
alwaysCompareItems								0			Game		Account		Always show item comparison tooltips
alwaysShowActionBars							0			Game		Account		Whether to always show the action bar grid
animFrameSkipLOD								0			Graphics				animations will skip frames at distance
AreaTriggerEventLog								0
AreaTriggers									0
assaoAdaptiveQualityLimit						0.45		Graphics				ASSAO Adaptive Quality Limit [0.0, 1.0] (only for Quality Level 3)
assaoBlurPassCount								2			Graphics				ASSAO Blur Pass Count [ 0, 6] Number of edge-sensitive smart blur passes to apply. Quality 0 is an exception with only one 'dumb' blur pass used.
assaoDetailShadowStrength						0			Graphics				ASSAO Detail Shadow Strength [0.0, 5.0] Used for high-res detail AO using neighboring depth pixels: adds a lot of detail but also reduces temporal stability (adds aliasing).
assaoFadeOutFrom								50.0		Graphics				ASSAO Fade Out From [0.0, ~ ] Distance to start start fading out the effect.
assaoFadeOutTo									300.0		Graphics				ASSAO Fade Out To [0.0, ~ ] Distance at which the effect is faded out.
assaoHorizonAngleThresh							0.4			Graphics				ASSAO Horizon Angle Thresh [0.0, 0.2] Limits self-shadowing
assaoNormals									1			Graphics				Use Normals for ASSAO
assaoRadius										1.85		Graphics				ASSAO Radius [0.0, ~ ] World (view) space size of the occlusion sphere
assaoShadowClamp								0.98		Graphics				ASSAO Shadow Clamp [0.0, 1.0]
assaoShadowMult									1.1			Graphics				ASSAO Shadow Multiplier [0.0, 5.0] Effect strength linear multiplier
assaoShadowPower								1.34		Graphics				ASSAO Shadow Power [0.5, 5.0] Effect strength pow modifier
assaoSharpness									0.98		Graphics				ASSAO Sharpness [0.0, 1.0] (How much to bleed over edges; 1: not at all, 0.5: half-half; 0.0: completely ignore edges)
assaoTemporalSSAngleOffset						0.0			Graphics				ASSAO Temporal Super Sampling Angle Offset [0.0, PI] Used to rotate sampling kernel; If using temporal AA / supersampling, suggested to rotate by ( (frame%3)/3.0*PI ) or similar. Kernel is already symmetrical, which is why we use PI and not 2*PI.
assaoTemporalSSRadiusOffset						1.0			Graphics				ASSAO Temporal Super Sampling Radius Offset [0.0, 2.0] Used to scale sampling kernel; If using temporal AA / supersampling, suggested to scale by ( 1.0f + (((frame%3)-1.0)/3.0)*0.1 ) or similar.
assistAttack									0			Game					Character	Whether to start attacking after an assist
asyncHandlerTimeout								100			Debug					Engine option: Async read main thread timeout
asyncThreadSleep								0			Debug					Engine option: Async read thread sleep
auctionDisplayOnCharacter						0			Game					Account	Show auction items on the dress-up paperdoll
auctionHouseDurationDropdown					2			Game					Account	The previously selected duration index in the auction house duration dropdown
audioLocale													Game					Set the game locale for audio content
AuraDebugger									0
AuraEventLog									0
autoAcceptQuickJoinRequests						0			Game		Account		Whether or not to auto-accept players who are trying to join your party through quick join
autoClearAFK									1			Game		Account		Automatically clear AFK when moving or chatting
autoCompleteResortNamesOnRecency				1			Game		Account		Shows people you recently spoke with higher up on the AutoComplete list.
autoCompleteUseContext							1			Game		Account		The system will, for example, only show people in your guild when you are typing /gpromote. Names will also never be removed.
autoCompleteWhenEditingFromCenter				1			Game		Account		If you edit a name by inserting characters into the center, a smarter auto-complete will occur.
autoDismount									1			Game		Account		Automatically dismount when needed
autoDismountFlying								0			Game		Account		If enabled, your character will automatically dismount before casting while flying
autoFilledMultiCastSlots						0			Game		Character	Bitfield that saves whether multi-cast slots have been automatically filled.
autoInteract									0			Game		Account		Toggles auto-move to interact target
autojoinBGVoice									0			Sound		Account		Automatically join the voice session in battleground chat
autojoinPartyVoice								0			Sound		Account		Automatically join the voice session in party/raid chat
autoLootDefault									0			Game		Character	Automatically loot items when the loot window opens
autoLootRate									150			Game		Character	Rate in milliseconds to tick auto loot
AutoPushSpellToActionBar						1			Game		Character	Determines if spells are automatically pushed to the Action Bar. 0: No, 1: Yes (default).
autoQuestPopUps												Game		Character	Saves current pop-ups for quests that are automatically acquired or completed.
autoQuestProgress								1			Game		Account		Whether to automatically watch all quests when they are updated
autoQuestWatch									1			Game		Account		Whether to automatically watch all quests when you obtain them
autoSelfCast									1			Game		Character	Whether spells should automatically be cast on you if you don't have a valid target
autoStand										1			Game		Account		Automatically stand when needed
autoUnshift										1			Game		Account		Automatically leave shapeshift form when needed
BeckonTriggerEventlog							0
BehaviorTree									0
blockChannelInvites								0			Game		Character	Whether to automatically block chat channel invites
blockTrades										0			Game		Character	Whether to automatically block trade requests
bodyQuota										100			Graphics				Maximum number of componented bodies seen at once
breakUpLargeNumbers								1			Game		Account		Toggles using commas in large numbers
Brightness										50.000000	Graphics				Brightness adjustment. Range: [0 - 100]
buffDurations									1			Game		Account		Whether to show buff durations
cacaoBilateralSimilarityDistanceSigma			0.01		Graphics				CACAO Sigma squared value for use in bilateral upsampler giving similarity weighting for neighbouring pixels. Should be greater than 0.0.
calendarShowBattlegrounds						1			Game		Character	Whether Battleground holidays should appear in the calendar
calendarShowDarkmoon							1			Game		Character	Whether Darkmoon Faire holidays should appear in the calendar
calendarShowHolidays							1			Game		Character	Whether holidays should appear in the calendar
calendarShowLockouts							1			Game		Character	Whether raid lockouts should appear in the calendar
calendarShowResets								0			Game		Character	Whether raid resets should appear in the calendar
calendarShowWeeklyHolidays						1			Game		Character	Whether weekly holidays should appear in the calendar
cameraBobbing									0			Game		
cameraBobbingSmoothSpeed						0.800000	Game		Account	
cameraCustomViewSmoothing						0			Game		Account	
cameraDistanceMaxZoomFactor						1.900000	Game		Account	
cameraDistanceRateMult							1.000000	Game		Account	
cameraDive										1			Game		Account	
CameraFollowGamepadAdjustDelay					1.000000	Game		Account		Delay before follow resuming after manually adjusting the camera with Gamepad input
CameraFollowGamepadAdjustEaseIn					1.000000	Game		Account		Ease-in time for follow resuming after manually adjusting the camera with Gamepad input
CameraFollowOnStick								0			Game		Account		Enable camera to follow target as though being pushed/pulled along on a stick
CameraFollowPitchDeadZone						5.000000	Game		Account		Controls pitch follow deadzone size
CameraFollowPitchSpeed							1.000000	Game		Account		Controls speed of pitch following
CameraFollowPitchStrength						0.700000	Game		Account		Controls strength of pitch following
CameraFollowSnapCharacterAngle					45.000000	Game		Account		Angle beyond which character will snap to camera's facing when moving
CameraFollowTargetCombat						1			Game		Account		Camera follow the locked target only during combat.
CameraFollowYawSpeed							1.000000	Game		Account		Controls speed of yaw following
cameraFov										90.000000	Graphics	Default		camera field of view
cameraFoVSmoothSpeed							0.500000	Game		Account	
cameraGroundSmoothSpeed							7.500000	Game		Account	
cameraHeightIgnoreStandState					0			Game		Account	
CameraKeepCharacterCentered						1			Game		Account		Motion sickness control to keep character's head at center of screen to act as motion reference point. Can override other cvar settings.
cameraPitchMoveSpeed							90.000000	Game		Account	
cameraPitchSmoothMax							23.000000	Game		Account	
cameraPitchSmoothMin							0.000000	Game		Account	
cameraPitchSmoothSpeed							45.000000	Game		Account	
cameraPivot										1			Game		Account	
cameraPivotDXMax								0.050000	Game		Account	
cameraPivotDYMin								0.000000	Game		Account	
CameraReduceUnexpectedMovement					0			Game		Account		Motion sickness control to reduce camera movement without player input. Can override other cvar settings.
cameraSavedDistance								5.550000	Game		Character	
cameraSavedPetBattleDistance					10.000000	Game		Character	
cameraSavedPitch								10.000000	Game		Character	
cameraSavedVehicleDistance						-1.000000	Game		Character	
cameraSmooth									1			Game		Account	
cameraSmoothAlwaysFearDelay						0.000000	Game		Account	
cameraSmoothAlwaysFearFactor					1.000000	Game		Account	
cameraSmoothAlwaysIdleDelay						0.000000	Game		Account	
cameraSmoothAlwaysIdleFactor					1.000000	Game		Account	
cameraSmoothAlwaysMoveDelay						0.000000	Game		Account	
cameraSmoothAlwaysMoveFactor					1.000000	Game		Account	
cameraSmoothAlwaysStopDelay						0.000000	Game		Account	
cameraSmoothAlwaysStopFactor					1.000000	Game		Account	
cameraSmoothAlwaysStrafeDelay					0.000000	Game		Account	
cameraSmoothAlwaysStrafeFactor					1.000000	Game		Account	
cameraSmoothAlwaysTrackDelay					0.000000	Game		Account	
cameraSmoothAlwaysTrackFactor					1.000000	Game		Account	
cameraSmoothAlwaysTurnDelay						0.000000	Game		Account	
cameraSmoothAlwaysTurnFactor					1.000000	Game		Account	
cameraSmoothNeverFearDelay						0.000000	Game		Account	
cameraSmoothNeverFearFactor						0.000000	Game		Account	
cameraSmoothNeverIdleDelay						0.000000	Game		Account	
cameraSmoothNeverIdleFactor						0.000000	Game		Account	
cameraSmoothNeverMoveDelay						0.000000	Game		Account	
cameraSmoothNeverMoveFactor						0.000000	Game		Account	
cameraSmoothNeverStopDelay						0.000000	Game		Account	
cameraSmoothNeverStopFactor						0.000000	Game		Account	
cameraSmoothNeverStrafeDelay					0.000000	Game		Account	
cameraSmoothNeverStrafeFactor					0.000000	Game		Account	
cameraSmoothNeverTrackDelay						0.000000	Game		Account	
cameraSmoothNeverTrackFactor					0.000000	Game		Account	
cameraSmoothNeverTurnDelay						0.000000	Game		Account	
cameraSmoothNeverTurnFactor						0.000000	Game		Account	
cameraSmoothPitch								1			Game		Account	
cameraSmoothSmarterFearDelay					0.400000	Game		Account	
cameraSmoothSmarterFearFactor					10.000000	Game		Account	
cameraSmoothSmarterIdleDelay					0.000000	Game		Account	
cameraSmoothSmarterIdleFactor					0.000000	Game		Account	
cameraSmoothSmarterMoveDelay					0.000000	Game		Account	
cameraSmoothSmarterMoveFactor					1.000000	Game		Account	
cameraSmoothSmarterStopDelay					0.000000	Game		Account	
cameraSmoothSmarterStopFactor					0.000000	Game		Account	
cameraSmoothSmarterStrafeDelay					0.000000	Game		Account	
cameraSmoothSmarterStrafeFactor					1.000000	Game		Account	
cameraSmoothSmarterTrackDelay					0.400000	Game		Account	
cameraSmoothSmarterTrackFactor					10.000000	Game		Account	
cameraSmoothSmarterTurnDelay					0.000000	Game		Account	
cameraSmoothSmarterTurnFactor					1.000000	Game		Account	
cameraSmoothSmartFearDelay						0.400000	Game		Account	
cameraSmoothSmartFearFactor						10.000000	Game		Account	
cameraSmoothSmartIdleDelay						0.000000	Game		Account	
cameraSmoothSmartIdleFactor						0.000000	Game		Account	
cameraSmoothSmartMoveDelay						0.000000	Game		Account	
cameraSmoothSmartMoveFactor						1.000000	Game		Account	
cameraSmoothSmartStopDelay						0.000000	Game		Account	
cameraSmoothSmartStopFactor						0.000000	Game		Account	
cameraSmoothSmartStrafeDelay					0.000000	Game		Account	
cameraSmoothSmartStrafeFactor					1.000000	Game		Account	
cameraSmoothSmartTrackDelay						0.400000	Game		Account	
cameraSmoothSmartTrackFactor					10.000000	Game		Account	
cameraSmoothSmartTurnDelay						0.000000	Game		Account	
cameraSmoothSmartTurnFactor						1.000000	Game		Account	
cameraSmoothSplineFearDelay						0.000000	Game		Account	
cameraSmoothSplineFearFactor					4.000000	Game		Account	
cameraSmoothSplineIdleDelay						0.000000	Game		Account	
cameraSmoothSplineIdleFactor					4.000000	Game		Account	
cameraSmoothSplineMoveDelay						0.000000	Game		Account	
cameraSmoothSplineMoveFactor					1.000000	Game		Account	
cameraSmoothSplineStopDelay						0.000000	Game		Account	
cameraSmoothSplineStopFactor					4.000000	Game		Account	
cameraSmoothSplineStrafeDelay					0.000000	Game		Account	
cameraSmoothSplineStrafeFactor					1.000000	Game		Account	
cameraSmoothSplineTrackDelay					0.000000	Game		Account	
cameraSmoothSplineTrackFactor					4.000000	Game		Account	
cameraSmoothSplineTurnDelay						0.000000	Game		Account	
cameraSmoothSplineTurnFactor					1.000000	Game		Account	
cameraSmoothStyle								4			Game		Account	
cameraSmoothTimeMax								2.000000	Game		Account	
cameraSmoothTimeMin								0.100000	Game		Account	
cameraSmoothTrackingStyle						4			Game		Account	
cameraSmoothViewDataAlwaysDistanceDelay			0.000000	Game		Account	
cameraSmoothViewDataAlwaysDistanceFactor		0.000000	Game		Account	
cameraSmoothViewDataAlwaysPitchDelay			0.000000	Game		Account	
cameraSmoothViewDataAlwaysPitchFactor			1.000000	Game		Account	
cameraSmoothViewDataAlwaysYawDelay				0.000000	Game		Account	
cameraSmoothViewDataAlwaysYawFactor				1.000000	Game		Account	
cameraSmoothViewDataNeverDistanceDelay			0.000000	Game		Account	
cameraSmoothViewDataNeverDistanceFactor			0.000000	Game		Account	
cameraSmoothViewDataNeverPitchDelay				0.000000	Game		Account	
cameraSmoothViewDataNeverPitchFactor			0.000000	Game		Account	
cameraSmoothViewDataNeverYawDelay				0.000000	Game		Account	
cameraSmoothViewDataNeverYawFactor				0.000000	Game		Account	
cameraSmoothViewDataSmartDistanceDelay			0.000000	Game		Account	
cameraSmoothViewDataSmartDistanceFactor			0.000000	Game		Account	
cameraSmoothViewDataSmarterDistanceDelay		0.000000	Game		Account	
cameraSmoothViewDataSmarterDistanceFactor		0.000000	Game		Account	
cameraSmoothViewDataSmarterPitchDelay			0.000000	Game		Account	
cameraSmoothViewDataSmarterPitchFactor			1.000000	Game		Account	
cameraSmoothViewDataSmarterYawDelay				0.000000	Game		Account	
cameraSmoothViewDataSmarterYawFactor			1.000000	Game		Account	
cameraSmoothViewDataSmartPitchDelay				0.000000	Game		Account	
cameraSmoothViewDataSmartPitchFactor			0.000000	Game		Account	
cameraSmoothViewDataSmartYawDelay				0.000000	Game		Account	
cameraSmoothViewDataSmartYawFactor				1.000000	Game		Account	
cameraSmoothViewDataSplineDistanceDelay			0.000000	Game		Account	
cameraSmoothViewDataSplineDistanceFactor		0.000000	Game		Account	
cameraSmoothViewDataSplinePitchDelay			0.000000	Game		Account	
cameraSmoothViewDataSplinePitchFactor			1.000000	Game		Account	
cameraSmoothViewDataSplineYawDelay				0.000000	Game		Account	
cameraSmoothViewDataSplineYawFactor				1.000000	Game		Account	
cameraSmoothYaw									1			Game		Account	
cameraSubmergePitch								18.000000	Game		Account	
cameraSurfacePitch								0.000000	Game		Account	
cameraTargetSmoothSpeed							90.000000	Game		Account	
cameraTerrainTilt								0			Game		Account	
cameraTerrainTiltAlwaysFallAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysFallDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysFallFactor				0.750000	Game		Account	
cameraTerrainTiltAlwaysFearAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysFearDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysFearFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysIdleAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysIdleDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysIdleFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysJumpAbsorb				0.000000	Game		Account	
cameraTerrainTiltAlwaysJumpDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysJumpFactor				-1.000000	Game		Account	
cameraTerrainTiltAlwaysMoveAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysMoveDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysMoveFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysStrafeAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysStrafeDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysStrafeFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysSwimAbsorb				0.000000	Game		Account	
cameraTerrainTiltAlwaysSwimDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysSwimFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysTaxiAbsorb				0.000000	Game		Account	
cameraTerrainTiltAlwaysTaxiDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysTaxiFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysTrackAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysTrackDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysTrackFactor				1.000000	Game		Account	
cameraTerrainTiltAlwaysTurnAbsorb				1.000000	Game		Account	
cameraTerrainTiltAlwaysTurnDelay				0.000000	Game		Account	
cameraTerrainTiltAlwaysTurnFactor				1.000000	Game		Account	
cameraTerrainTiltNeverFallAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverFallDelay					0.000000	Game		Account	
cameraTerrainTiltNeverFallFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverFearAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverFearDelay					0.000000	Game		Account	
cameraTerrainTiltNeverFearFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverIdleAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverIdleDelay					0.000000	Game		Account	
cameraTerrainTiltNeverIdleFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverJumpAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverJumpDelay					0.000000	Game		Account	
cameraTerrainTiltNeverJumpFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverMoveAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverMoveDelay					0.000000	Game		Account	
cameraTerrainTiltNeverMoveFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverStrafeAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverStrafeDelay				0.000000	Game		Account	
cameraTerrainTiltNeverStrafeFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverSwimAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverSwimDelay					0.000000	Game		Account	
cameraTerrainTiltNeverSwimFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverTaxiAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverTaxiDelay					0.000000	Game		Account	
cameraTerrainTiltNeverTaxiFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverTrackAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverTrackDelay				0.000000	Game		Account	
cameraTerrainTiltNeverTrackFactor				-1.000000	Game		Account	
cameraTerrainTiltNeverTurnAbsorb				0.000000	Game		Account	
cameraTerrainTiltNeverTurnDelay					0.000000	Game		Account	
cameraTerrainTiltNeverTurnFactor				-1.000000	Game		Account	
cameraTerrainTiltSmarterFallAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmarterFallDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterFallFactor				0.750000	Game		Account	
cameraTerrainTiltSmarterFearAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmarterFearDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterFearFactor				1.000000	Game		Account	
cameraTerrainTiltSmarterIdleAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmarterIdleDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterIdleFactor				-1.000000	Game		Account	
cameraTerrainTiltSmarterJumpAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmarterJumpDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterJumpFactor				-1.000000	Game		Account	
cameraTerrainTiltSmarterMoveAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmarterMoveDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterMoveFactor				1.000000	Game		Account	
cameraTerrainTiltSmarterStrafeAbsorb			1.000000	Game		Account	
cameraTerrainTiltSmarterStrafeDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterStrafeFactor			1.000000	Game		Account	
cameraTerrainTiltSmarterSwimAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmarterSwimDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterSwimFactor				1.000000	Game		Account	
cameraTerrainTiltSmarterTaxiAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmarterTaxiDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterTaxiFactor				1.000000	Game		Account	
cameraTerrainTiltSmarterTrackAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmarterTrackDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterTrackFactor				1.000000	Game		Account	
cameraTerrainTiltSmarterTurnAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmarterTurnDelay				0.000000	Game		Account	
cameraTerrainTiltSmarterTurnFactor				1.000000	Game		Account	
cameraTerrainTiltSmartFallAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartFallDelay					0.000000	Game		Account	
cameraTerrainTiltSmartFallFactor				0.750000	Game		Account	
cameraTerrainTiltSmartFearAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartFearDelay					0.000000	Game		Account	
cameraTerrainTiltSmartFearFactor				1.000000	Game		Account	
cameraTerrainTiltSmartIdleAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmartIdleDelay					0.000000	Game		Account	
cameraTerrainTiltSmartIdleFactor				-1.000000	Game		Account	
cameraTerrainTiltSmartJumpAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmartJumpDelay					0.000000	Game		Account	
cameraTerrainTiltSmartJumpFactor				-1.000000	Game		Account	
cameraTerrainTiltSmartMoveAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartMoveDelay					0.000000	Game		Account	
cameraTerrainTiltSmartMoveFactor				1.000000	Game		Account	
cameraTerrainTiltSmartStrafeAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartStrafeDelay				0.000000	Game		Account	
cameraTerrainTiltSmartStrafeFactor				1.000000	Game		Account	
cameraTerrainTiltSmartSwimAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmartSwimDelay					0.000000	Game		Account	
cameraTerrainTiltSmartSwimFactor				1.000000	Game		Account	
cameraTerrainTiltSmartTaxiAbsorb				0.000000	Game		Account	
cameraTerrainTiltSmartTaxiDelay					0.000000	Game		Account	
cameraTerrainTiltSmartTaxiFactor				1.000000	Game		Account	
cameraTerrainTiltSmartTrackAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartTrackDelay				0.000000	Game		Account	
cameraTerrainTiltSmartTrackFactor				1.000000	Game		Account	
cameraTerrainTiltSmartTurnAbsorb				1.000000	Game		Account	
cameraTerrainTiltSmartTurnDelay					0.000000	Game		Account	
cameraTerrainTiltSmartTurnFactor				1.000000	Game		Account	
cameraTerrainTiltSplineFallAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineFallDelay				0.000000	Game		Account	
cameraTerrainTiltSplineFallFactor				0.750000	Game		Account	
cameraTerrainTiltSplineFearAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineFearDelay				0.000000	Game		Account	
cameraTerrainTiltSplineFearFactor				1.000000	Game		Account	
cameraTerrainTiltSplineIdleAbsorb				0.000000	Game		Account	
cameraTerrainTiltSplineIdleDelay				0.000000	Game		Account	
cameraTerrainTiltSplineIdleFactor				-1.000000	Game		Account	
cameraTerrainTiltSplineJumpAbsorb				0.000000	Game		Account	
cameraTerrainTiltSplineJumpDelay				0.000000	Game		Account	
cameraTerrainTiltSplineJumpFactor				-1.000000	Game		Account	
cameraTerrainTiltSplineMoveAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineMoveDelay				0.000000	Game		Account	
cameraTerrainTiltSplineMoveFactor				1.000000	Game		Account	
cameraTerrainTiltSplineStrafeAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineStrafeDelay				0.000000	Game		Account	
cameraTerrainTiltSplineStrafeFactor				1.000000	Game		Account	
cameraTerrainTiltSplineSwimAbsorb				0.000000	Game		Account	
cameraTerrainTiltSplineSwimDelay				0.000000	Game		Account	
cameraTerrainTiltSplineSwimFactor				1.000000	Game		Account	
cameraTerrainTiltSplineTaxiAbsorb				0.000000	Game		Account	
cameraTerrainTiltSplineTaxiDelay				0.000000	Game		Account	
cameraTerrainTiltSplineTaxiFactor				1.000000	Game		Account	
cameraTerrainTiltSplineTrackAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineTrackDelay				0.000000	Game		Account	
cameraTerrainTiltSplineTrackFactor				1.000000	Game		Account	
cameraTerrainTiltSplineTurnAbsorb				1.000000	Game		Account	
cameraTerrainTiltSplineTurnDelay				0.000000	Game		Account	
cameraTerrainTiltSplineTurnFactor				1.000000	Game		Account	
cameraTerrainTiltTimeMax						10.000000	Game		Account	
cameraTerrainTiltTimeMin						3.000000	Game		Account	
cameraView										2			Game		Account	
cameraViewBlendStyle							1			Game		Account	
cameraWaterCollision							0			Game		Account	
cameraYawMoveSpeed								180.000000	Game		Account	
cameraYawSmoothMax								0.000000	Game		Account	
cameraYawSmoothMin								0.000000	Game		Account	
cameraYawSmoothSpeed							180.000000	Game		Account	
cameraZoomSpeed									20.000000	Game		Account	
cameraZSmooth									1			Game		Account		Smooths camera vertical movement. 1 = only while moving, 2 = also while standing still
ChatAmbienceVolume								0.3			Sound					Ambience Volume (0.0 to 1.0)
chatBubbles										1			Game		Account		Whether to show in-game chat bubbles
chatBubblesParty								1			Game		Account		Whether to show in-game chat bubbles for party chat
chatClassColorOverride							0			Game					Whether or not class names are colored in chat. 0 = always color by class name (where applicable), 1 = never color by class name, 2 = respect the legacy per-channel class color settings
chatMouseScroll									1			Game		Account		Whether the user can use the mouse wheel to scroll through chat
ChatMusicVolume									0.3			Sound					Music volume (0.0 to 1.0)
ChatSoundVolume									0.4			Sound					Sound volume (0.0 to 1.0)
chatStyle										im			Game		Account		The style of Edit Boxes for the ChatFrame. Valid values: "classic", "im"
checkAddonVersion								1			Game					Check interface addon version number
ClientCastDebug									0									debug client cast allocation
ClientMessageEventLog							0
ClipCursor										0			Graphics				Lock the cursor to the game window
cloakFixEnabled									1
closedExtraAbiltyTutorials									Game		Character	Bitfield for which extra ability tutorials have been acknowledged by the user
closedInfoFrames											Game		Character	Bitfield for which help frames have been acknowledged by the user
closedInfoFramesAccountWide									Game		Account		Bitfield for which help frames have been acknowledged by the user (account-wide)
clubFinderCacheExpiry							1000		Game					Value in (MS) for time to expire the cache.
clubFinderCachePendingExpiry					5000		Game					Value in (MS) for time to expire the cache.
clubFinderPlayerLanguageSettings				0			Game		Character	Bit field of Looking for club/guild player language settings
clubFinderPlayerSettings						1			Game		Character	Bit field of Looking for guild player settings
CMAA2ExtraSharpness								0			Graphics				Set to 1 to preserve even more text and shape clarity at the expense of less AA
CMAA2HalfFloat									0			Graphics				0: 32-bit Float. 1: 16-bit Float.
CMAA2Quality									3			Graphics				CMAA2 Quality Level. 0 - LOW, 1 - MEDIUM, 2 - HIGH, 3 - ULTRA
Collision										0
colorblindMode									0			Game		Account		Enables colorblind accessibility features in the game
colorblindSimulator								0			Graphics				Type of color blindness
colorblindWeaknessFactor						0.5			Graphics				Amount of sensitivity. e.g. Protanope (red-weakness) 0.0 = not colorblind, 1.0 = full weakness(Protanopia), 0.5 = mid weakness(Protanomaly)
colorChatNamesByClass							0			Game		Account		If enabled, the name of a player speaking in chat will be colored according to his class.
combatLogRetentionTime							300			Game		Account		The maximum duration in seconds to retain combat log entries
combatLogUniqueFilename							1			Game					Write combat log file with a timestamped name per client launch
combinedBags									0			Game		Account		Use combined bag frame for all bags
comboPointLocation								2			Game					Location of combo points in UI. 1=target, 2=self
commentatorLossOfControlIconUnitFrame			1			Game		Account		0: Off, 1: On.
commentatorLossOfControlTextNameplate			0			Game		Account		0: Off, 1: On.
commentatorLossOfControlTextUnitFrame			0			Game		Account		0: Off, 1: On.
communitiesShowOffline							1			Game		Account		Show offline community members in the communities frame roster
componentCompress								1			Graphics	Character 	component texture compression
componentEmissive								1			Graphics	Character 	component unlit/emissive
componentSpecular								1			Graphics	Character 	component specular highlights
componentTexCacheSize							32			Graphics	Character 	component texture cache size (in MB)
componentTexLoadLimit							16			Graphics	Character	component texture loading limit per frame
componentTextureLevel							0			Graphics				Level of detail for character component textures. 0 means full detail.
componentThread									1			Graphics				Multi thread character component processing
ConsoleKey										`			Console					Set key that opens the console
contentTrackingFilter							1			Game		Character	If enabled, tracked items will display on the world map.
ContentTuning									0
Contrast										50.000000	Graphics				Contrast adjustment. Range: [0 - 100]
countdownForCooldowns							0			Game		Account		Whether to use number countdown instead of radial swipe for action button cooldowns or not.
covenantMissionTutorial							0			Game		Character	Stores information about which covenant mission/adventures tutorials the player has seen
currencyCategoriesCollapsed						0			Game		Character	Internal CVar for tracking collapsed currency categories.
currencyTokensBackpack1							0			Game		Character	Currency token types shown on backpack.
currencyTokensBackpack2							0			Game		Character	Currency token types shown on backpack.
currencyTokensUnused1							0			Game		Character	Currency token types marked as unused.
currencyTokensUnused2							0			Game		Character	Currency token types marked as unused.
CursorCenteredYPos								0.60								-1 vertical position of centered cursor/targeting (0 at bottom)
CursorFreelookCentering							0									Center the cursor when using Mouse freelook
CursorFreelookStartDelta						0.001								Fraction of the screen the cursor must move to start freelook after mouse button goes down
cursorSizePreferred								-1			Graphics				Size of cursor: -1=determine based on system/monitor dpi, 0=32x32, 1=48x48, 2=64x64, 3=96x96, 4=128x128
CursorStickyCentering							0									Make the centered position stick after freelook; Don't restore previous cursor position
CustomDesignEventLog							0
CustomWindowEventLog							0
daltonize										1			Graphics				Attempt to correct for color blindness (set colorblindSimulator to type of colorblindness)
DamageCalculator								0
dangerousShipyardMissionWarningAlreadyShown		0			Game		Character	Boolean indicating whether the shipyard's dangerous mission warning has been shown
debugGameEvents									0			Debug					Show additional information about game events
DebugTorsoTwist									0			Debug					Debug visualization for Torso Twist: 1 = Player, 2 = Target, 3 = All
DepthBasedOpacity								1			Graphics				Enable/Disable Soft Edge Effect
deselectOnClick									0			Game		Account		Clear the target when clicking on terrain
digSites										1			Game		Character	If enabled, the archaeological dig site system will be used.
DisableAdvancedFlyingFullScreenEffects			0			Game		Account		Disable the advanced flying full screen effects
DisableAdvancedFlyingVelocityVFX				0			Game		Account		Disable the advanced flying velocity VFX
disableAELooting								0			Game					Disable AoE Looting
disableAutoRealmSelect							0									Disable automatically selecting a realm on login
disableServerNagle								1			Net						Disable server-side nagle algorithm
displayedRAFFriendInfo							0			Game		Account		Stores whether we already told a recruited person about their new BattleTag friend
displaySpellActivationOverlays					1			Game		Character	Whether to display Spell Activation Overlays (a.k.a. Spell Alerts)
displayWorldPVPObjectives						1			Game		Account		Whether to show world PvP objectives
dnMTUpdate										1			Graphics				Update Daynight in parralel.
doNotFlashLowHealthWarning						0			Game		Account		Do not flash your screen red when you are low on health.
dontShowEquipmentSetsOnItems					0			Game		Account		Don't show which equipment sets an item is associated with
doodadLodScale									100			Graphics				Doodad level of detail scale
DriverVersionCheck								1			Graphics		
dynamicLod										1			Graphics				Dynamic level of detail adjustment
DynamicRenderScale								0			Graphics				Lowers render scale if GPU bound to hit Target FPS. Note this feature is in BETA. Known issues: May cause hitching. May behave poorly with vsync on.
DynamicRenderScaleMin							0.333333	Graphics				Lowest render scale DynamicRenderScale can use
EJDungeonDifficulty								0			Game		Character	Stores the last dungeon difficulty viewed in the encounter journal
EJLootClass										-1			Game		Character	Stores the last class that loot was filtered by in the encounter journal
EJLootSpec										0			Game		Character	Stores the last spec that loot was filtered by in the encounter journal
EJRaidDifficulty								0			Game		Character	Stores the last raid difficulty viewed in the encounter journal
EJSelectedTier									0			Game		Character	Stores the last manually selected journal tier in the encounter journal
EmitterCombatRange								900			Game		Account		Range to stop shoulder/weapon emissions during combat
emphasizeMySpellEffects							1			Game		Account		Whether other player's spell impacts are toned down or not.
EmpowerMinHoldStagePercent						1.000000	Game		Account		Sets a percentage of the first empower stage [0.0,1.0]. Before this point, the spell will be auto-held. After it, releases will be accepted.
empowerTapControls								0			Game		Character	By default, Empower spells use a press-hold-release control scheme. Set this CVar to use a tap-tap scheme instead.
EmpowerTapControlsReleaseThreshold				300			Game		Account		Sets the time in milliseconds after which release/re-hold requests will be registered for press-and-tap empowers. Begins when the cast is sent from the client.
EnableAirlockLogging							0			Game					If 1, enables airlock logging, which will print out the various steps as they happen so that timing can be done.
enableAssetTracking								1			Game					Whether to track which assets are least recently used
enableBGDL										1			Debug					Background Download (on async net thread) Enabled
EnableBlinkApplicationIcon						1			Game					Allows the client to blink the application icon in the taskbar in Windows, or bounce the application icon in the dock on macOS
enableFloatingCombatText						0			Game		Account		Whether to show floating combat text
enableMouseoverCast								0			Game		Character	Whether mouseover casting is enabled (optionally with a modifier key).
enableMouseSpeed								0			Game					Enables setting a custom mouse sensitivity to override the setting from the operating system.
enableMovePad									0			Game		Account		Enables the MovePad accessibility feature in the game
enablePetBattleFloatingCombatText				1			Game		Account		Whether to show floating combat text for pet battles
enablePings										1			Game					Enables ping system.
enablePVPNotifyAFK								1			Game		Account		The ability to shutdown the AFK notification system
enableRuneSpentAnim								1									Adjust the time the rune fades after it flashes when you spend it
enableSourceLocationLookup						1			Debug					Allows addon file name lookup for debugging help
enableTwitter									0			Game		Account		Whether Twitter integration is enabled
enableWowMouse									0									Enable Steelseries World of Warcraft Mouse
engineSurvey									0			Game					Whether to send the engine survey to the servers
engineSurveyPatch								0			Game					Engine Survey Patch
entityLodDist									10			Graphics				Entity level of detail distance
entityLodOffset									10			Graphics				Entity level of detail offset
entityShadowFadeScale							50			Graphics				Entity shadow fade scale
ErrorFilter										all			Debug		
ErrorLevelMax									3			Debug		
ErrorLevelMin									2			Debug		
Errors											0			Debug		
excludedCensorSources							1			Game		Account		Inappropriate message source exemptions. 0 = Exempt nobody, 1 = Exempt Friends, 3 = Exempt Friends and Guildmates, 255 = Exempt All
expandBagBar									1			Game		Account		Expand the main menu bar that shows the bags so you can see all equipped bags instead of just the backpack and reagent bag
expandUpgradePanel								1			Game					Controls whether the upgrade panel is expanded or collapsed.
farclip											1000								Far clip plane distance
ffxAntiAliasingMode								0			Graphics				Anti Aliasing Mode
ffxDeath										1			Graphics				full screen death desat effect
ffxGlow											1			Graphics				full screen glow effect
ffxLingeringVenari								1			Graphics				full screen Lingering Cloak of Ven'ari effect
ffxNether										1			Graphics				full screen nether effect
ffxVenari										1			Graphics				full screen Cloak of Ven'ari effect
findYourselfAnywhere							0			Game		Account		Always Highlight your character
findYourselfAnywhereOnlyInCombat				0			Game		Account		Highlight your character only when in combat
findYourselfInBG								1			Game		Account		Always Highlight your character in Battlegrounds
findYourselfInBGOnlyInCombat					0			Game		Account		Highlight your character in Battlegrounds only when in combat
findYourselfInRaid								1			Game		Account		Always Highlight your character in Raids
findYourselfInRaidOnlyInCombat					1			Game		Account		Highlight your character in Raids only when in combat
findYourselfMode								0			Game		Account		Highlight your character. 0 = circle, 1 = circle & outline, 2 = outline
flaggedTutorials														Account		Internal cvar for saving completed tutorials in order
flashErrorMessageRepeats						1			Game		Account		Flashes the center screen red error text if the same message is fired.
flightAngleLookAhead							0			Game					Enables more dynamic attitude adjustments while flying
floatingCombatTextAllSpellMechanics				0			Game		Account	
floatingCombatTextAuras							0			Game		Account	
floatingCombatTextCombatDamage					1			Game		Account		Display damage numbers over hostile creatures when damaged
floatingCombatTextCombatDamageAllAutos			1			Game		Account		Show all auto-attack numbers, rather than hiding non-event numbers
floatingCombatTextCombatDamageDirectionalOffset	1			Game		Account		Amount to offset directional damage numbers when they start
floatingCombatTextCombatDamageDirectionalScale	1			Game		Account		Directional damage numbers movement scale (0 = no directional numbers)
floatingCombatTextCombatDamageStyle				1			Game		Account		No longer used
floatingCombatTextCombatHealing					1			Game		Account		Display amount of healing you did to the target
floatingCombatTextCombatHealingAbsorbSelf		1			Game		Account		Shows a message when you gain a shield.
floatingCombatTextCombatHealingAbsorbTarget		1			Game		Account		Display amount of shield added to the target.
floatingCombatTextCombatLogPeriodicSpells		1			Game		Account		Display damage caused by periodic effects
floatingCombatTextCombatState					0			Game		Account	
floatingCombatTextComboPoints					0			Game		Account	
floatingCombatTextDamageReduction				0			Game		Account	
floatingCombatTextDodgeParryMiss				0			Game		Account	
floatingCombatTextEnergyGains					0			Game		Account	
floatingCombatTextFloatMode						1			Game		Account		The combat text float mode
floatingCombatTextFriendlyHealers				0			Game		Account	
floatingCombatTextHonorGains					0			Game		Account	
floatingCombatTextLowManaHealth					1			Game		Account	
floatingCombatTextPeriodicEnergyGains			0			Game		Account	
floatingCombatTextPetMeleeDamage				1			Game		Account		Display pet melee damage in the world
floatingCombatTextPetSpellDamage				1			Game		Account		Display pet spell damage in the world
floatingCombatTextReactives						1			Game		Account	
floatingCombatTextRepChanges					0			Game		Account	
floatingCombatTextSpellMechanics				0			Game		Account	
floatingCombatTextSpellMechanicsOther			0			Game		Account	
FootstepSounds									1			Sound					play footstep sounds
ForceAllowAero									0			Graphics				Force Direct X 12 on Windows 7 to not disable Aero theme. You are opting into crashing in some edge cases
forceEnglishNames								0
ForceGenerateSlug								0			Debug					Generate .slug files for all loaded fonts before they are actually used rather than deferred load.
forceLODCheck									0			Graphics				If enabled, we will skip checking DBC for LOD count and every m2 will scan the folder for skin profiles
ForceResolutionDefaultToMaxSize					0			Graphics				Force default resolution to the maximum supported size rather than the auto-detected size
FrameBufferCacheForceNoHeaps					0			Graphics				Disable use of texture heaps and force the fallback path
friendInvitesCollapsed							0			Game		Account		Whether friend invites are hidden in the friends list
friendInvitesCollapsed_WowLabs					0			Game					The info for pending invites has been shown
friendsSmallView								0			Game		Character	Whether to use smaller buttons in the friends list
friendsViewButtons								0			Game		Character	Whether to show the friends list view buttons
frontendMatchingModes_WowLabs					1			Game					0=All,1=DuoOnly,2=TrioOnly,3=DuoAndTrio
fstack_enabled									0			Debug					0: Hide Framestack Tooltip (Default), 1: Show Framestack Tooltip.
fstack_preferParentKeys							0			Debug					0: Prefer Global Names, 1: Prefer ParentKeys (Default).
fstack_showanchors								1			Debug					0: Hide Anchors, 1: Show Anchors (Default).
fstack_showhidden								0			Debug					0: Hide Hidden (Default), 1: Show Hidden.
fstack_showhighlight							1			Debug					0: Hide Highlight, 1: Show Highlight (Default).
fstack_showRaisedFrameLevels					0			Debug					0: Show normal frame levels (default), 1: Show raised frame levels instead
fstack_showregions								1			Debug					0: Hide Regions, 1: Show Regions (Default).
GameDataVisualizer								0
GamePadAnalogMovement							1									Enable analog movement in any direction, rather than just the 8 cardinal directions
GamePadCameraLookMaxPitch						0									Max pitch 'Look' stick can adjust camera angle
GamePadCameraLookMaxYaw							0									Max yaw 'Look' stick can adjust camera angle
GamePadCameraPitchSpeed							1									Pitch speed of GamePad camera moving up/down
GamePadCameraYawSpeed							1									Yaw speed of GamePad camera turning left/right
GamePadCursorAutoDisableJump					1									GamePad cursor control will auto-disable when you jump
GamePadCursorAutoDisableSticks					2									GamePad cursor control will auto-disable on stick input (0=none, 1=movement, 2=movement+cursor)
GamePadCursorAutoEnable							1									Auto enable GamePad cursor control when opening UIs that may need it
GamePadCursorCenteredEmulation					1									When cursor is centered for GamePad movement, also emulate mouse clicks
GamePadCursorCentering							0									When using GamePad, center the cursor
GamePadCursorForTargeting						1									Enable GamePad controlled cursor for spell targeting (1=enable, 2=start-at-target)
GamePadCursorLeftClick							PADRTRIGGER							GamePad button that should emulate mouse Left Click while controlling the mouse cursor
GamePadCursorOnLogin							1									Enable GamePad cursor control on login and character screens
GamePadCursorPushCamera							1									Rate for GamePad controlled cursor to push/turn camera when at edge of window
GamePadCursorRightClick							PADRSHOULDER						GamePad button that should emulate mouse Right Click while controlling the mouse cursor
GamePadCursorSpeedAccel							2									Acceleration of GamePad cursor per second as it continues to move
GamePadCursorSpeedMax							1									Top speed of GamePad cursor movement
GamePadCursorSpeedStart							0.1									Speed of GamePad cursor when it starts moving
GamePadEmulateAlt								none								GamePad button that should emulate the Alt key
GamePadEmulateCtrl								PADLSHOULDER						GamePad button that should emulate the Ctrl key
GamePadEmulateShift								PADLTRIGGER							GamePad button that should emulate the Shift key
GamePadEmulateTapWindowMs						350									GamePad buttons emulating Ctrl/Alt/Shift will be 'tapped' if released withing this time in MS
GamePadEnable									0									Whether GamePad input should be enabled
GamePadFaceMovementMaxAngle						0									Max movement to camera angle to face movement direction instead of camera direction. 0 = always, 180 = never (115 allows using strafe with quick turn around)
GamePadFaceMovementMaxAngleCombat				180									Max movement to camera angle to face movement direction instead of camera direction, in combat. 0 = always, 180 = never (115 allows using strafe with quick turn around)
GamePadFactionColor								1									Enable setting GamePad's led color to match current faction
GamePadOverlapMouseMs							2000								Duration after gamepad+mouse input to switch to just one or the other.
GamePadRunThreshold								0.5									0-1 Amount of stick movement before character transitions from walk to run
GamePadSingleActiveID							0									ID of single GamePad device to use. 0 = Use all devices' combined input
GamePadStickAxisButtons							0									Enables virtual buttons for the GamePad stick cardinal directions
GamePadTankTurnSpeed							0									If non-zero, character turns like a tank from GamePad movement
GamePadTouchCursorEnable						1									Enable cursor control with GamePad's touch pad
GamePadTurnWithCamera							1									Turn character to match when camera facing is changed (1=in-combat, 2=always)
GamePadVibrationStrength						1									GamePad vibration effect strength
GameplayContext									0
gameTip											0
Gamma											1.000000	Graphics				Gamma correction. Range: [0.3 - 2.8]
garrisonCompleteTalent							0			Game		Character	
garrisonCompleteTalentType						0			Game		Character	
graphicsComputeEffects							3
graphicsDepthEffects							3			Graphics				UI value of the graphics setting
graphicsEnvironmentDetail						6			Graphics				UI value of the graphics setting
graphicsGroundClutter							6			Graphics				UI value of the graphics setting
graphicsLiquidDetail							2			Graphics				UI value of the graphics setting
graphicsOutlineMode								2			Graphics				UI value of the graphics setting
graphicsParticleDensity							4			Graphics				UI value of the graphics setting
graphicsProjectedTextures						1			Graphics				UI value of the graphics setting
graphicsQuality									6									save for Graphics Quality Selection
graphicsShadowQuality							3									UI value of the graphics setting
graphicsSpellDensity							4									UI value of the graphics setting
graphicsSSAO									3									UI value of the graphics setting
graphicsTextureResolution						2									UI value of the graphics setting
graphicsViewDistance							6			Graphics				UI value of the graphics setting
groundEffectDensity								16									Ground effect density
groundEffectDist								70									Ground effect dist
groundEffectFade								70			Graphics				Ground effect fade
guildMemberNotify								1			Game					Account	Receive notification when guild members log on/off
guildNewsFilter									0			Game		Character	Stores the guild news filters
guildRewardsCategory							0			Game		Character	Show category of guild rewards
guildRewardsUsable								0			Game		Character	Show usable guild rewards only
guildRosterView												Game		Character	The current guild roster display mode
guildShowOffline								1			Game		Account		Show offline guild members in the guild UI
gxAdapter													Graphics				Set which GPU to use. See GxListGPUs for valid names (empty string to let client choose)
gxAFRDevicesCount								0			Graphics				Force to set number of AFR devices
gxAftermathEnabled								1			Graphics				Enable frame crash debugging
GxAllowCachelessShaderMode						0			Graphics				CPU memory saving mode, if supported by backend. When enabled, shaders are fetched from disk as needed instead of being kept resident. This mode may slightly increase the time objects take to appear the first time they are encountered. Computers without solid state drives may want to disable this feature
gxApi											auto		Graphics				graphics api
gxAspect										1			Graphics				constrain window aspect
GxFrameEndMode									1			Graphics				Allow GxFrameEnd to overlap next frame
gxFullscreenResolution							auto		Graphics				resolution
gxMaxFrameLatency								3			Graphics				maximum number of frames ahead of GPU the CPU can be
gxMaximize										1
gxMonitor										0			Graphics				monitor
gxMTAlphaM2										1			Graphics				Render transparent M2 pass in parallel.
gxMTAlphaPass									1			Graphics				Render Alpha Pass in parallel.
gxMTBeginDraw									1			Graphics				Do BeginDraw multithreaded.
gxMTDecals										1			Graphics				Sort and Render decal passes in parallel
gxMTDisable										0			Graphics				Disable all render multithreading
gxMTMisc										1			Graphics				Render miscelleous passes in parallel
gxMTOpaqueM2									1			Graphics				Render opaque model pass in parallel.
gxMTOpaqueM2NoReflect							1			Graphics				Render opaque model no reflection pass in parallel.
gxMTOpaqueWMO									1			Graphics				Render opaque WMO in parallel.
gxMTOutlines									1			Graphics				Render outline passes in parallel
gxMTPrepass										1			Graphics				Render prepass in parallel.
gxMTRefraction									1			Graphics				Render refraction pass in parallel
gxMTShadow										1			Graphics				Render shadow bands in parallel.
gxMTTerrain										1			Graphics				Render terrain in parallel.
gxMTTriggerOnBeginDrawComplete					1			Graphics				Use Begin Draw Complete Trigger Mechanism
gxMTVolFog										1			Graphics				Render volumetric fog in parallel
gxNewResolution									0x0			Graphics				resolution to be set
GxPrismEnabled									1			Graphics				0: Prism backends Disabled. 1: Default Prism backends Enabled. 2: Experimental Prism backends Enabled.
GxSlowShaderWarnThreshold						30000		Graphics				Max time (in milliseconds) the shader compile can take before warning via a popup message
gxWindowedResolution							1920x1080	Graphics				windowed resolution
hardTrackedQuests											Game		Character	Internal cvar for saving user manually tracked quests in order
hardTrackedWorldQuests										Game		Character	Internal cvar for saving user manually tracked world quests
HardwareCursor									1			Graphics		
HealHandler										0
heirloomCollectedFilters						0			Game		Account		Bitfield for which collected filters are applied in the heirloom journal
heirloomSourceFilters							0			Game		Account		Bitfield for which source filters are applied in the heirloom journal
hideAdventureJournalAlerts						0			Game		Account		Hide alerts shown on the Adventure Journal Microbutton
horizonClip										1600
horizonStart									800									Horizon start distance
HotfixEventLog									0
hotReloadModels									1			Graphics				Allow an active model to be reloaded when a new version is detected in the bin folder. If this is disabled, the model data will only be refreshed after all game objects using the model are deleted
hwDetect										1									do hardware detection
ImpactModelCollisionMelee						1			Game					Enable model collision checks for melee impact effects
ImpactModelCollisionMissile						1			Game					Enable model collision checks for missile impact effects
ImpactModelCollisionRanged						1			Game					Enable model collision checks for ranged attack impact effects
incompleteQuestPriorityThresholdDelta			135			Debug		
initialRealmListTimeout							60									How long to wait for the initial realm list before failing login (in seconds)
interactKeyWarningTutorial						0			Game					Has the player seen the interact key warning tutorial since they have logged in
interactOnLeftClick								1			Game		Account		Test CVar for interacting with NPC's on left click
interactQuestItems								1			Game		Account		Enable Quest Item use as an interaction
KioskCanSessionExpire	
KioskCharacterTemplateSet	
KioskLobbyKickSeconds	
last_matchmaking_party_size						0			Game					0=Solo,1=Duo,2=Trio
lastAddonVersion								0			Game					Addon interface version number from previous build
lastCharacterGuid								0			Game					Last character selected's guid
lastCharacterIndex								0			Game					Last character selected
lastGarrisonMissionTutorial						0			Game		Character	Stores the last garrison mission tutorial the player has accepted
lastRenownForCovenant1							0			Game		Character	Stores the Kyrian renown when Renown UI is closed
lastRenownForCovenant2							0			Game		Character	Stores the Venthyr renown when Renown UI is closed
lastRenownForCovenant3							0			Game		Character	Stores the NightFae renown when Renown UI is closed
lastRenownForCovenant4							0			Game		Character	Stores the Necrolord renown when Renown UI is closed
lastRenownForMajorFaction2503					0			Game		Character	Stores the Maruuk Centaur renown when Renown UI is closed
lastRenownForMajorFaction2507					0			Game		Character	Stores the Dragonscale Expedition renown when Renown UI is closed
lastRenownForMajorFaction2510					0			Game		Character	Stores the Valdrakken Accord renown when Renown UI is closed
lastRenownForMajorFaction2511					0			Game		Character	Stores the Iskaara Tuskarr renown when Renown UI is closed
lastRenownForMajorFaction2564					0			Game		Character	Stores the Loamm Niffen renown when Renown UI is closed
lastRenownForMajorFaction2574					0			Game		Character	Stores the Dream Warden renown when Renown UI is closed
lastRenownForMajorFaction2593					0			Game		Account		Stores the Keg Leg's Crew renown when Renown UI is closed
lastSelectedClubId								0			Game		Character	The last club that was selected by the user. We default to this club when the player opens the communities frame if the player isn't in a guild.
lastTalkedToGM												Game		Account		Stores the last GM someone was talking to in case they reload the UI while the GM chat window is open.
lastTransmogOutfitIDSpec1									Game		Character	SetID of the last applied transmog outfit for the 1st spec
lastTransmogOutfitIDSpec2									Game		Character	SetID of the last applied transmog outfit for the 2nd spec
lastTransmogOutfitIDSpec3									Game		Character	SetID of the last applied transmog outfit for the 3rd spec
lastTransmogOutfitIDSpec4									Game		Character	SetID of the last applied transmog outfit for the 4th spec
lastVoidStorageTutorial							0			Game		Character	Stores the last void storage tutorial the player has accepted
latestSplashScreen								0			Game		Character	The ID of the latest splash screen from the UISPLASHSCREEN table.
latestTransmogSetSource							0			Game		Character	itemModifiedAppearanceID of the latest collected source belonging to a set
launchAgent										1			Game					Set this to have the client start up Agent
lfdCollapsedHeaders											Game		Character	Stores which LFD headers are collapsed.
lfdSelectedDungeons											Game		Character	Stores which LFD dungeons are selected.
lfgAutoFill										0			Game		Account		Whether to automatically add party members while looking for a group
lfgAutoJoin										0			Game		Account		Whether to automatically join a party while looking for a group
lfgListSearchLanguages							0			Game		Account		A simple bitfield for what languages we want to search in.
lfgSelectedRoles								0			Game		Character	Stores what roles the player is willing to take on.
lfGuildComment												Game		Character	Stores the player's Looking For Guild comment
lfGuildSettings									1			Game		Character	Bit field of Looking For Guild player settings
locale																				Set the game locale
locateViewerMaxJobs								32			Graphics				Maximum job threads for LocateViewer
lockActionBars									1			Game		Account		Whether the action bars should be locked, preventing changes
lodObjectCullDist								30			Graphics				Lod object culling dist minimum
lodObjectCullSize								15									Lod object culling size
lodObjectFadeScale								100			Graphics				Lod object fade scale
lodObjectMinSize								20			Graphics				Lod object min size
lodObjectSizeScale								1			Graphics				Scales all objects size for culling
lootUnderMouse									1			Game		Account		Whether the loot window should open under the mouse
lossOfControl									1			Game		Character	Enables loss of control spell banner
lossOfControlDisarm								2			Game		Character	Setting for Loss of Control - Disarm
lossOfControlFull								2			Game		Character	Setting for Loss of Control - Full Loss
lossOfControlInterrupt							2			Game		Character	Setting for Loss of Control - Interrupt
lossOfControlRoot								2			Game		Character	Setting for Loss of Control - Root
lossOfControlSilence							2			Game		Character	Setting for Loss of Control - Silence
LowLatencyMode									0			Graphics				0=None, 1=BuiltIn, 2=Reflex
luaErrorExceptions								1			Game					Enable exceptions for non-tainted lua errors
M2ForceAdditiveParticleSort						0			Graphics				force all particles to sort as though they were additive
M2UseInstancing									1			Graphics				use hardware instancing
M2UseThreads									1			Graphics				multithread model animations
mapAnimDuration									0.12		Game		Account		Duration for the alpha animation
mapAnimMinAlpha									0.35		Game		Account		Alpha value to animate to when player moves with windowed world map open
mapAnimStartDelay								0.0			Game		Account		Start delay for the alpha animation
mapFade											1			Game		Character	Whether to fade out the world map when moving
maxFPS											120			Graphics				Set FPS limit
maxFPSBk										30			Graphics				Set background FPS limit
maxFPSLoading									10			Graphics				Set loading screen max FPS
maxLevelSpecsUsed								0			Game		Character	The specs the player has switched to at max level
maxLightCount												Graphics				Maximum lights to render
maxLightDist									2048		Graphics				Maximum distance to render lights
MaxObservedPetBattles							4									Maximum number of observed pet battles
miniCommunitiesFrame							0			Game		Character	Whether or not the communities frame has been toggled to smaller size
miniDressUpFrame								0			Game		Character	Whether or not the dress up has been toggled to smaller size
minimapAltitudeHintMode							0			Game					Change minimap altitude difference display. 0=none, 1=darken, 2=arrows
minimapInsideZoom								0			Game		Character	The current indoor minimap zoom level
minimapPortalMax								99			Game					Max Number of Portals to traverse for minimap
minimapShapeshiftTracking									Game		Character	Stores shapeshift-specific tracking spells that were active last session.
minimapShowArchBlobs							1			Game		Character	Stores whether to show the quest blobs on the minimap.
minimapShowQuestBlobs							1			Game		Character	Stores whether to show the quest blobs on the minimap.
minimapTrackedInfov2	
minimapTrackedInfov3							1006319		Game		Character	Stores the minimap tracking that was active last session.
minimapTrackingClosestOnly						1			Game					If enabled, show only the closest tracked icon for certain minimap icon types.
minimapTrackingShowAll							0			Game					If enabled, show dropdown for configuring all possible minimap tracking options.
minimapZoom										0			Game		Character	The current outdoor minimap zoom level
miniWorldMap									1			Game		Character	Whether or not the world map has been toggled to smaller size
missingTransmogSourceInItemTooltips				0			Game		Character	Whether to show if you have collected the appearance of an item but not from that item itself
modelLightShaftsColor							0xFFFFFFFF
modelLightShaftsSpread							32.0
motionSicknessFocalCircle						0			Game		Account		Enables a focal circle showing up when mounted
motionSicknessLandscapeDarkening				0			Game		Account		Enables landscape darkening at higher speeds
mountJournalGeneralFilters									Game		Account		Bitfield for which collected filters are applied in the mount journal
mountJournalShowPlayer							0			Game		Account		Show the player on the mount preview.
mountJournalSourcesFilter									Game		Account		Bitfield for which source filters are applied in the mount journal
mountJournalTypeFilter										Game		Account		Bitfield for which type filters are applied in the mount journal
mouseInvertPitch								0			Game		Account	
mouseInvertYaw									0			Game		Account	
MouseNoRepositioning							0			Game					Disables repositioning of mouse cursor during relative movement to keep it in the game's window frame
mouseSpeed										1.0			Game		
MouseUseLazyRepositioning						1			Game					During camera control, only reposition mouse cursor when nearing edge of window, rather than every input event
MoveHistoryEventLog								0
movieSubtitle									1			Game					Show movie subtitles
MSAAAlphaTest									1			Graphics				Enable MSAA for alpha-tested geometry
MSAAQuality										0			Graphics				Multisampling AA quality
NamePlateClassificationScale					1.0			Game		Character	Applied to the classification icon for nameplates.
nameplateClassResourceTopInset					.03			Graphics	Character	The inset from the top (in screen percent) that nameplates are clamped to when class resources are being displayed on them.
nameplateGameObjectMaxDistance					30			Graphics	Character	The max distance to show player nameplates for game objects
nameplateGlobalScale							1.0			Graphics	Character	Applies global scaling to non-self nameplates, this is applied AFTER selected, min, and max scale.
nameplateHideHealthAndPower						0			Game		Character	
NamePlateHorizontalScale						1.0			Game		Character	Applied to horizontal size of all nameplates.
nameplateLargeBottomInset						0.15		Graphics	Character	The inset from the bottom (in screen percent) that large nameplates are clamped to.
nameplateLargerScale							1.2			Graphics	Character	An additional scale modifier for important monsters.
nameplateLargeTopInset							0.1			Graphics	Character	The inset from the top (in screen percent) that large nameplates are clamped to.
nameplateMaxAlpha								1.0			Graphics	Character	The max alpha of nameplates.
nameplateMaxAlphaDistance						40			Graphics	Character	The distance from the camera that nameplates will reach their maximum alpha.
nameplateMaxDistance							60			Graphics	Character	The max distance to show nameplates.
NamePlateMaximumClassificationScale				1.25		Game		Character	This is the maximum effective scale of the classification icon for nameplates.
nameplateMaxScale								1.0			Graphics	Character	The max scale of nameplates.
nameplateMaxScaleDistance						10			Graphics	Character	The distance from the camera that nameplates will reach their maximum scale.
nameplateMinAlpha								0.6			Graphics	Character	The minimum alpha of nameplates.
nameplateMinAlphaDistance						10			Graphics	Character	The distance from the max distance that nameplates will reach their minimum alpha.
nameplateMinScale								0.8			Graphics	Character	The minimum scale of nameplates.
nameplateMinScaleDistance						10			Graphics	Character	The distance from the max distance that nameplates will reach their minimum scale.
nameplateMotion									0			Graphics	Character	Defines the movement/collision model for nameplates
nameplateMotionSpeed							0.025		Graphics	Character	Controls the rate at which nameplate animates into their target locations [0.0-1.0]
nameplateOccludedAlphaMult						0.4			Graphics	Character	Alpha multiplier of nameplates for occluded targets.
nameplateOtherAtBase							0			Game		Account		Position other nameplates at the base, rather than overhead
nameplateOtherBottomInset						0.1			Graphics	Character	The inset from the bottom (in screen percent) that the non-self nameplates are clamped to.
nameplateOtherTopInset							0.08		Graphics	Character	The inset from the top (in screen percent) that the non-self nameplates are clamped to.
nameplateOverlapH								0.8			Graphics	Account		Percentage amount for horizontal overlap of nameplates
nameplateOverlapV								1.1			Graphics	Account		Percentage amount for vertical overlap of nameplates
NameplatePersonalClickThrough					1			Game		Character	When enabled, the personal nameplate is transparent to mouse clicks.
NameplatePersonalHideDelayAlpha					0.45		Game		Character	Determines the alpha of the personal nameplate after no visibility conditions are met (during the period of time specified by NameplatePersonalHideDelaySeconds).
NameplatePersonalHideDelaySeconds				3.0			Game		Character	Determines the length of time in seconds that the personal nameplate will be visible after no visibility conditions are met.
NameplatePersonalShowAlways						0			Game		Character	Determines if the the personal nameplate is always shown.
NameplatePersonalShowInCombat					1			Game		Character	Determines if the the personal nameplate is shown when you enter combat.
NameplatePersonalShowWithTarget					0			Game		Character	Determines if the personal nameplate is shown when selecting a target. 0 = targeting has no effect, 1 = show on hostile target, 2 = show on any target
nameplatePlayerLargerScale						1.8			Graphics	Character	An additional scale modifier for players.
nameplatePlayerMaxDistance						60			Graphics	Character	The max distance to show player nameplates.
nameplateResourceOnTarget						0			Game		Character	Nameplate class resource overlay mode. 0=self, 1=target
nameplateSelectedAlpha							1.0			Graphics	Character	The alpha of the selected nameplate.
nameplateSelectedScale							1.2			Graphics	Character	The scale of the selected nameplate.
nameplateSelfAlpha								0.75		Graphics	Character	The alpha of the self nameplate.
nameplateSelfBottomInset						0.2			Graphics	Character	The inset from the bottom (in screen percent) that the self nameplate is clamped to.
nameplateSelfScale								1.0			Graphics	Character	The scale of the self nameplate.
nameplateSelfTopInset							0.5			Graphics	Character	The inset from the top (in screen percent) that the self nameplate is clamped to.
nameplateShowAll								0			Game		Character	
nameplateShowDebuffsOnFriendly					1			Game		Character	
nameplateShowEnemies							1			Game		Character	
nameplateShowEnemyGuardians						0			Game		Character	
nameplateShowEnemyMinions						0			Game		Character	
nameplateShowEnemyMinus							1			Game		Character	
nameplateShowEnemyPets							0			Game		Character	
nameplateShowEnemyTotems						0			Game		Character	
nameplateShowFriendlyBuffs						0			Game		Character	
nameplateShowFriendlyGuardians					0			Game		Character	
nameplateShowFriendlyMinions					0			Game		Character	
nameplateShowFriendlyNPCs						0			Game		Character	
nameplateShowFriendlyPets						0			Game		Character	
nameplateShowFriendlyTotems						0			Game		Character	
nameplateShowFriends							0			Game		Character	
nameplateShowOnlyNames							0			Game					Whether to hide the nameplate bars
nameplateShowPersonalCooldowns					0			Game		Character	
nameplateShowSelf								1			Game		Character	
nameplateTargetBehindMaxDistance				15			Graphics	Character	The max distance to show the target nameplate when the target is behind the camera.
nameplateTargetRadialPosition					0			Game					Account	When target is off screen, position its nameplate radially around sides and bottom. 1: Target Only. 2: All In Combat
NamePlateVerticalScale							1.0			Game		Character	Applied to vertical size of all nameplates.
nearclip										0.2			Graphics				Near clip plane distance
newMythicPlusSeason								1			Game		Character	Signals a new mythic+ season for the user, so when they open the UI it shows them the info about the season
newPvpSeason									1			Game		Character	Signals a new pvp season for the user, so when they open the UI it shows them the info about the season
noBuffDebuffFilterOnTarget						0			Game		Character	Do not filter buffs or debuffs at all on targets
NonEmitterCombatRange							6400		Game		Account		Range to stop shoulder/weapon emissions outside combat
NotchedDisplayMode								1			Graphics				Do nothing = 0. Shift UI down = 1. Shift everything down = 2.
notifiedOfNewMail								0			Game		Character	Stores whether the player has been previously notified of new mail. Only set to false once everything in their Inbox has been marked as read.
ObjectSelectionCircle							1			Game		
occlusionMaxJobs								5			Graphics				Maximum job threads for occlusion render
orderHallMissionTutorial						0			Game		Character	Stores information about which order hall mission tutorials the player has seen
otherRolesAzeriteEssencesHidden					0			Game		Character	Whether to collapse the Azerite Essences for player's other roles
outdoorMinAltitudeDistance						10			Game					Minimum altitude distance for outdoor objects when you are also outdoors before the altitude difference marker displays
Outline											2			Game		Account		Outline Mode
OutlineEngineMode								0
outlineMouseOverFadeDuration					0.9			Debug		
outlineSelectionFadeDuration					0.32		Debug		
outlineSoftInteractFadeDuration					0.3			Debug		
overrideArchive									0			Game					Whether or not the client loads alternate data
overrideScreenFlash								0			Game		Account		Overrides fade color options so that it always fades to black
particleDensity									100			Graphics				Particle density
particleMTDensity								100			Graphics				Multi-Tex particle density
particulatesEnabled								1			Graphics				Particulates enabled
partyBackgroundOpacity							0.5			Game		Account		The opacity of the party background
partyInvitesCollapsed_Glue						0			Game					The info for pending invites has been shown
Pathing											0
pathSmoothing									1			Game					NPC will round corners on ground paths
pendingInviteInfoShown							0			Game		Account		The info for pending invites has been shown
pendingInviteInfoShown_WowLabs					0			Game					The info for pending invites has been shown
perksActivitiesCurrentMonth						0			Game		Account		Current month for perks activities
perksActivitiesLastPoints						0			Game		Account		Last seen number of influence points in the perks progress bar
perksActivitiesPendingCompletion							Game		Account		List of completed activities that are pending completion animation in the UI
persistMoveLogOnTransfer						0			Debug					Set to 1 to automatically re-enable logging on the current movelog target after a transfer
petJournalFilters											Game		Account		Bitfield for which collected filters are applied in the pet journal
petJournalSort									0			Game		Account		Sorting value for the pet journal
petJournalSourceFilters										Game		Account		Bitfield for which source filters are applied in the pet journal
petJournalTab									1			Game		Account		Stores the last tab the pet journal was opened to
petJournalTypeFilters										Game		Account		Bitfield for which type filters are applied in the pet journal
PhaseHistory									0
physicsLevel									1			Graphics				Level of physics world interaction
pingCategoryTutorialShown						0			Game					Has shown the ping category tutorial dialog
pingMode										0			Game					Determines which mode is used to use the ping system.
PlayerSpawnTracking								0
playerStatLeftDropdown										Game		Character	The player stat selected in the left dropdown
playerStatRightDropdown										Game		Character	The player stat selected in the right dropdown
playIntroMovie									0			Game					Starting expansion movie to play on startup
POIShiftComplete								0.3			Debug		
portal														Net						Name of Battle.net portal to use
PraiseTheSun									0			Game		
predictedHealth									1			Game		Account		Whether or not to use predicted health values in the UI
PreemptiveCastEnable							0									Enable preemptive triggering of cast visuals based on spell release timing
preloadLoadingDistObject						512									Object preload distance when loading
preloadLoadingDistTerrain						1024								Terrain preload distance when loading
preloadPlayerModels								1			Game					Preload all local racial models into memory
preloadStreamingDistObject						64									Object preload distance when streaming
preloadStreamingDistTerrain						256									Terrain preload distance when streaming
PreventOsIdleSleep								0									Enable this to prevent the computer from idle sleeping while the game is running
primaryProfessionsFilter						1			Game		Character	If enabled, primary profession world quests icons will be shown on world maps
ProcDebugEventLog								0
processAffinityMask								0			Debug					Sets which core(s) WoW may execute on - changes require restart to take effect
professionAccessorySlotsExampleShown			0			Game		Character	If the profession gear slots example has been shown
professionsAllocateBestQualityReagents			1			Game		Account		Indicates if best quality reagents should be automatically allocated in the crafting UI.
professionsAllocateBestQualityReagentsCustomer	1			Game		Account		Indicates if best quality reagents should be automatically allocated in the customer crafting order UI.
professionsFlyoutHideUnowned					0			Game		Character	Boolean indicating if unowned items are hidden in the profession slot flyouts
professionsOrderDurationDropdown				2			Game		Account		The previously selected duration index in the professions customer order form dropdown
professionsOrderRecipientDropdown				1			Game		Account		The previously selected order recipient index in the professions customer order form dropdown
professionToolSlotsExampleShown					0			Game		Character	If the profession gear slots example has been shown
projectedTextures								0									Projected Textures
PushToTalkSound									0			Sound		Account		Play a sound when voice recording activates and deactivates
pvpFramesDisplayClassColor						0			Game		Character	Colors pvp frames with the class color
pvpFramesDisplayOnlyHealerPowerBars				0			Game		Character	Whether to display power bars only for healers on Pvp Frames
pvpFramesDisplayPowerBars						0			Game		Character	Whether to display mana, rage, etc. on Pvp Frames
pvpFramesHealthText								none		Game		Character	How to display health text on the pvp frames
pvpOptionDisplayPets							0			Game		Character	Whether to display pets on the pvp frames
pvpSelectedRoles								0			Game		Character	Stores what roles the player will fulfill in a BG.
QuestEventLog									0
questLogOpen									1			Game		Character	Whether the quest log appears the side of the windowed map.
questPOI										1			Game		Character	If enabled, the quest POI system will be used.
questTextContrast								0			Game					Whether to increase text contrast in Quest UIs
RAIDcomponentTextureLevel						0			Graphics				Level of detail for character component textures. 0 means full detail.
RAIDDepthBasedOpacity							1			Graphics				Raid Enable/Disable Soft Edge Effect
RAIDdoodadLodScale								100			Graphics				Raid doodad level of detail scale
RAIDentityLodDist								10			Graphics				Raid Entity level of detail distance
RAIDentityShadowFadeScale						10									Raid Entity shadow fade scale
RAIDfarclip										1000								Raid Far clip plane distance
raidFramesDisplayAggroHighlight					1			Game		Character	Whether to display aggro highlights on Raid Frames
raidFramesDisplayClassColor						0			Game		Character	Colors raid frames with the class color
raidFramesDisplayDebuffs						1			Game		Character	Whether to display debuffs on Raid Frames
raidFramesDisplayIncomingHeals					1			Game		Character	Whether to display incoming heals on Raid Frames
raidFramesDisplayOnlyDispellableDebuffs			0			Game		Character	Whether to display only dispellable debuffs on Raid Frames
raidFramesDisplayOnlyHealerPowerBars			0			Game		Character	Whether to display power bars only for healers on Raid Frames
raidFramesDisplayPowerBars						0			Game		Character	Whether to display mana, rage, etc. on Raid Frames
raidFramesHealthText							none		Game		Character	How to display health text on the raid frames
raidFramesHeight								36			Game		Character	The height of the individual raid frames
raidFramesPosition											Game		Character	Where the raid frames should be placed
raidFramesWidth									72			Game		Character	The width of the individual raid frames
raidGraphicsComputeEffects						3
raidGraphicsDepthEffects						3									UI value of the raidGraphics setting
raidGraphicsEnvironmentDetail					6									UI value of the raidGraphics setting
raidGraphicsGroundClutter						6									UI value of the raidGraphics setting
raidGraphicsLiquidDetail						2									UI value of the raidGraphics setting
raidGraphicsOutlineMode							2									UI value of the raidGraphics setting
raidGraphicsParticleDensity						4									UI value of the raidGraphics setting
raidGraphicsProjectedTextures					1									UI value of the raidGraphics setting
RAIDgraphicsQuality								6									save for Raid Graphics Quality Selection
raidGraphicsShadowQuality						3									UI value of the raidGraphics setting
raidGraphicsSpellDensity						4									UI value of the raidGraphics setting
raidGraphicsSSAO								3									UI value of the raidGraphics setting
raidGraphicsTextureResolution					2									UI value of the raidGraphics setting
raidGraphicsViewDistance						6									UI value of the raidGraphics setting
RAIDgroundEffectDensity							16									Raid Ground effect density
RAIDgroundEffectDist							70									Raid Ground effect dist
RAIDgroundEffectFade							70			Graphics				Raid Ground effect fade
RAIDhorizonClip									1600
RAIDhorizonStart								800									Raid Horizon start distance
RAIDlodObjectCullDist							30			Graphics				Lod object culling dist minimum
RAIDlodObjectCullSize							15									Lod object culling size
RAIDlodObjectFadeScale							100			Graphics				Lod object fade scale
RAIDlodObjectMinSize							20									Lod object min size
raidOptionDisplayMainTankAndAssist				1			Game		Character	Whether to display main tank and main assist units in the raid frames
raidOptionDisplayPets							0			Game		Character	Whether to display pets on the raid frames
raidOptionIsShown								1			Game		Character	Whether the Raid Frames are shown
raidOptionKeepGroupsTogether					0			Game		Character	The way to group raid frames
raidOptionLocked								lock		Game		Character	Whether the raid frames are locked
raidOptionShowBorders							1			Game		Character	Displays borders around the raid frames.
raidOptionSortMode								role		Game		Character	The way to sort raid frames
RAIDOutlineEngineMode							0									Mode for the OutlineBuffer
RAIDparticleDensity								100									Particle density
RAIDparticleMTDensity							100			Graphics				Multi-Tex particle density
RAIDParticulatesEnabled							1			Graphics				Enabling particulates (0-1)
RAIDprojectedTextures							0									Projected Textures
RAIDreflectionMode								3									Reflection mode
RAIDrefraction									0									Refraction
RAIDrippleDetail								2									Ripple surface detail
RAIDsettingsEnabled								0			Graphics				Raid graphic settings are available
RAIDshadowBlendCascades							0			Graphics				Blend between shadow cascades (0/1)
RAIDshadowMode									0									Raid Quality of shadows (0-3)
RAIDshadowRt									0			Graphics				Raid Raytraced shadows (0-2)
RAIDshadowSoft									0			Graphics				Soft shadows (0/1)
RAIDshadowTextureSize							1024		Graphics				Shadow texture size (1024-2048)
RAIDspellClutter								-1			Graphics				Cull unimportant spell effects. -1 means auto based on targetFPS otherwise [0-100], 0 means cull nothing for perf reasons, 100 means cull as much as you can
RAIDSSAO										0									Raid Screen-Space Ambient Occlusion
RAIDsunShafts									0									SunShafts
RAIDterrainLodDist								400			Graphics				Raid Terrain level of detail distance
RAIDTerrainLodDiv								768
RAIDterrainMipLevel								0			Graphics				Terrain blend map mip level
RAIDVolumeFog									0			Graphics				Volume Fog
RAIDVolumeFogLevel								2			Graphics				Volume Fog Level (0-3)
RAIDWaterDetail									0									Raid Water surface detail
RAIDweatherDensity								2
RAIDwmoLodDist									650									Raid Wmo level of detail distance
RAIDworldBaseMip								0			Graphics				World texture base mip
rawMouseAccelerationEnable						1			Game					Enable acceleration for raw mouse input
rawMouseEnable									0			Game					Enable raw mouse input
rawMouseRate									125			Game					Raw mouse update rate
rawMouseResolution								400			Game					Raw mouse resolution
reflectionDownscale								0			Graphics				Reflection downscale
reflectionMode									3			Graphics				Reflection mode
refraction										0
reloadUIOnAspectChange							0			Graphics				Reload the UI on aspect change
remoteTextToSpeech								0			Game		Account		Enables typing into a voice chat window to speak to other players using the text to speech system
remoteTextToSpeechVoice							1			Game		Account		Voice option used with Speak for Me where you can send text to speech to other players in voice chat
removeChatDelay									0			Game		Account		Remove Chat Hover Delay
RenderScale										1.000000	Graphics				Render scale (for supersampling or undersampling)
ReplaceMyPlayerPortrait							0			Game		Account		Replaces local player's unit frame portrait with their class icon
ReplaceOtherPlayerPortraits						0			Game		Account		Replaces other player unit frame portraits with their class icon
reputationsCollapsed										Game		Character	List of reputation categories that have been collapsed in the Reputation tab
ResampleAlwaysSharpen							0			Graphics				Run sharpness pass, even if not using AMD FSR Upscale [0,1]
ResampleQuality									3			Graphics				Resample quality
ResampleSharpness								0.2			Graphics				FSR sharpness strength [0.0-2.0]. 0 is full strength. -1 to disable.
ResolvedSSAOType								0			Graphics		
restrictCalendarInvites							1			Game		Account		Whether to restrict calendar invites to friends and guilds only.
rippleDetail									2			Graphics				Ripple surface detail
rotateMinimap									0			Game		Account		Whether to rotate the entire minimap instead of the player arrow
runeFadeTime									0.2									Adjust the time the rune fades from on CD to ready
runeSpentFadeTime								0.1									Adjust the time the base rune takes to fade out after the rune flash fades out
runeSpentFlashTime								0.15								Adjust the time the rune flash takes to fade out
sceneOcclusionEnable							1			Graphics				Scene software occlusion
screenEdgeFlash									1			Game		Account		Whether to show a red flash while you are in combat with the world map up
screenshotFormat								jpeg		Graphics				Set the format of screenshots
screenshotQuality								3			Graphics				Set the quality of screenshots (1 - 10)
screenshotSizeOverride							0x0			Graphics				Set the size of screenshots to a specific resolution (e.g. 7680x4320). 0x0 means use the window size
scriptErrors									0			Account					Whether or not the UI shows Lua errors
scriptProfile									0									Whether or not script profiling is enabled
scriptWarnings									0			Account					Whether or not the UI shows Lua warnings
secondaryProfessionsFilter						1			Game		Character	If enabled, secondary profession world quests icons will be shown on world maps
secureAbilityToggle								1			Game		Account		Whether you should be protected against accidentally double-clicking an aura
seenAlliedRaceUnlocks							0			Game					Bit array for which allied race unlocks have been seen
seenAsiaCharacterUpgradePopup					0			Game		Account		Seen the free character upgrade popup (Asia)
seenCharacterUpgradePopup						6			Game					Seen the free character upgrade popup
seenConfigurationWarnings						0			Game					A bitfield to track which configuration warnings have been seen
seenExpansionTrialPopup							6			Game					Seen the expansion trial popup
seenLevelSquishPopup							0			Game					Seen the level squish popup
seenRegionalChatDisabled						0			Game		Account		Seen the alert indicating chat has been disabled by default. (UK AADC)
serverAlert										SERVER_ALERT_URL		Net			Get the glue-string tag for the URL
ServerMessageEventLog							0
serviceTypeFilter								6			Game		Account		Which trainer services to show
shadowBlendCascades								0			Graphics				Blend between shadow cascades (0/1)
shadowCull										1									enable shadow frustum culling
shadowInstancing								1									enable instancing when rendering shadowmaps
shadowMode										0									Quality of shadows (0-3)
shadowRt										0			Graphics				Raytraced shadows (0-3)
shadowScissor									1									enable scissoring when rendering shadowmaps
shadowSoft										0			Graphics				Soft shadows (0/1)
shadowTextureSize								1024		Graphics				Shadow texture size (1024-2048)
ShakeStrengthCamera								1.000000	Game		Account		Motion sickness control for how much effects can shake the camera
ShakeStrengthUI									1.000000	Game		Account		Motion sickness control for how much effects can shake in 2D UI
shipyardMissionTutorialAreaBuff					0			Game		Character	Stores whether the player has accepted the first area buff mission tutorial
shipyardMissionTutorialBlockade					0			Game		Character	Stores whether the player has accepted the first blockade mission tutorial
shipyardMissionTutorialFirst					0			Game		Character	Stores whether the player has accepted the first mission tutorial
showArenaEnemyCastbar							1			Game		Character	Show the spell enemies are casting on the Arena Enemy frames
showArenaEnemyFrames							1			Game		Character	Show arena enemy frames while in an Arena
showArenaEnemyPets								1			Game		Character	Show the enemy team's pets on the ArenaEnemy frames
showBattlefieldMinimap							0			Game		Character	Whether or not the battlefield minimap is shown
showBuilderFeedback								1			Game					Show animation when building power for builder/spender bar
showCastableBuffs								0			Game		Character	Show only Buffs the player can cast. Only applies to raids.
ShowClassColorInFriendlyNameplate				1			Game		Character	use this to display the class color in friendly nameplate health bars
ShowClassColorInNameplate						1			Game		Character	use this to display the class color in enemy nameplate health bars
showDispelDebuffs								1			Game		Character	Show only Debuffs that the player can dispel. Only applies to raids.
showDungeonEntrancesOnMap						1			Game		Character	If enabled, dungeon entrances will display on the world map.
showErrors										1			Debug		
showfootprintparticles							1			Graphics				toggles rendering of footprint particles
showHonorAsExperience							0			Game		Character	Show the honor bar as a regular experience bar in place of rep
showInGameNavigation							1			Game		Account		0: Disable IGN, 1: Enable IGN (Default).
showLoadingScreenTips							1			Game					Show loading screen tooltips
ShowNamePlateLoseAggroFlash						1			Game		Character	When enabled, if you are a tank role and lose aggro, the nameplate with briefly flash.
showNPETutorials								1			Game		Account		display NPE tutorials
showOutfitDetails								1			Game		Character	Whether or not to show outfit details when the dressing room is opened in maximized mode, default on
showPartyPets									0			Game		Character	Whether to show pets in the party UI
showPingsInChat									1			Game					Enables ping details being shown in chat.
showQuestObjectivesOnMap						1			Game		Character	Shows quest POIs on the main map.
ShowQuestUnitCircles							1			Game		Account		Determines if units related to a quest display an indicator on the ground.
showSpectatorTeamCircles						1			Game					Determines if the team color circles are visible while spectating or commentating a wargame
showSpenderFeedback								1			Game					Show animation when spending power for builder/spender bar
showTamers										1			Game		Character	If enabled, pet battle icons will be shown on world maps
showTargetCastbar								1			Game		Account		Show the spell your current target is casting
showTargetOfTarget								0			Game		Account		Whether the target of target frame should be shown
showTimestamps									none		Game		Account		The format of timestamps in chat or "none"
showToastBroadcast								0			Game		Account		Whether to show Battle.net message for broadcasts
showToastClubInvitation							1			Game		Account		Whether to show Battle.net message for club invitations
showToastConversation							1			Game		Account		Whether to show Battle.net message for conversations
showToastFriendRequest							1			Game		Account		Whether to show Battle.net message for friend requests
showToastOffline								1			Game		Account		Whether to show Battle.net message for friend going offline
showToastOnline									1			Game		Account		Whether to show Battle.net message for friend coming online
showToastWindow									1			Game		Account		Whether to show Battle.net system messages in a toast window
showTokenFrame									0			Game		Character	The token UI has been shown
showTokenFrameHonor								0			Game		Character	The token UI has shown Honor
showTutorials									1			Game		Account		display tutorials
showVKeyCastbar									1			Game		Account		If the V key display is up for your current target, show the enemy cast bar with the target's health bar in the game field
showVKeyCastbarOnlyOnTarget						0			Game		Character	
showVKeyCastbarSpellName						1			Game		Character	
simd											-1									Enable SIMD features (e.g. SSE)
skipStartGear									0			Game					Whether we should show starter gear on character create
SkyCloudLOD										0			Graphics				Texture resolution for clouds
SlugOpticalWeight								0			Debug					When rendering, coverage values are remapped to increase the optical weight of the glyphs. This can improve the appearance of small text, but usually looks good only for dark text on a light background.
SlugSupersampling								1			Debug					The slug glyph shader performs adaptive supersampling for high-quality rendering at small font sizes
smoothUnitPhasing								1			Game					The client will try to smoothly switch between the same on model different phases.
smoothUnitPhasingActorPurgatoryTimeMs			1500		Game					Time to keep client-actor displays in purgatory before letting go of them, if they were despawned
smoothUnitPhasingAliveTimeoutMs					3500		Game					Time to wait for an alive unit to get it's despawn message
smoothUnitPhasingDestroyedPurgatoryTimeMs		750			Game					Time to keep unit displays in purgatory before letting go of them, if they were destroyed
smoothUnitPhasingDistThreshold					0.25		Game					Distance threshold to active smooth unit phasing.
smoothUnitPhasingEnableAlive					1			Game					Use units that have not despawn yet if they match, in hopes the despawn message will come later.
smoothUnitPhasingUnseenPurgatoryTimeMs			1000		Game					Time to keep unit displays in purgatory before letting go of them, if they were just unseen.
smoothUnitPhasingVehicleExtraTimeoutMs			1000		Game					Extra time to wait before releasing a vehicle, after it has smooth phased. This allows it's passengers to smooth phase as well.
SoftTargetEnemy									1			Game		Character	Sets when enemy soft targeting should be enabled. 0=off, 1=gamepad, 2=KBM, 3=always
SoftTargetEnemyArc								2			Game		Character	0 = No yaw arc allowance, must be directly in front. 1 = Must be in front yaw arc. 2 = Can be anywhere in tab targeting area.
SoftTargetEnemyRange							45.000000	Game		Character	Max range to soft target enemies (limited to tab targeting range)
SoftTargetForce									1			Game					Auto-set target to match soft target. 1 = for enemies, 2 = for friends
SoftTargetFriend								0			Game		Character	Sets when friend soft targeting should be enabled. 0=off, 1=gamepad, 2=KBM, 3=always
SoftTargetFriendArc								2			Game		Character	0 = No yaw arc allowance, must be directly in front. 1 = Must be in front yaw arc. 2 = Can be anywhere in targeting area.
SoftTargetFriendRange							45.000000	Game		Character	Max range to soft target friends (limited to tab targeting range)
SoftTargetIconEnemy								0			Game		Account		Show icon for soft enemy target
SoftTargetIconFriend							0			Game		Account		Show icon for soft friend target
SoftTargetIconGameObject						0			Game		Account		Show icon for sot interact game objects (interactable objects you cannot normally target)
SoftTargetIconInteract							1			Game		Account		Show icon for soft interact target
SoftTargetInteract								1			Game		Account		Sets when soft interact should be enabled. 0=off, 1=gamepad, 2=KBM, 3=always
SoftTargetInteractArc							0			Game		Account		0 = No yaw arc allowance, must be directly in front. 1 = Must be in front yaw arc. 2 = Can be anywhere in targeting area.
softTargetInteractionTutorialTotalInteractions	0			Game					total interactions that the player has used in soft targetting
SoftTargetInteractRange							10.000000	Game		Account		Max range to soft target interacts (limited to tab targeting and individual interact ranges)
SoftTargetInteractRangeIsHard					0			Game		Account		Sets if it should be a hard range cutoff, even for something you can interact with right now.
SoftTargetLowPriorityIcons						0			Game		Account		Show interact icons even when there is other visual indicators, such as quest or loot effects
SoftTargetMatchLocked							1			Game					Match appropriate soft target to locked target. 1 = hard locked target only, 2 = for targets you attack
SoftTargetNameplateEnemy						1			Game		Account		Always show nameplates for soft enemy target
SoftTargetNameplateFriend						0			Game		Account		Always show nameplates for soft friend target
SoftTargetNameplateInteract						0			Game		Account		Always show nameplates for soft interact target
SoftTargetNameplateSize							19			Game		Account		Size of soft target icon on nameplate (0 to disable)
softTargettingInteractKeySound					0			Game		Account		Setting for soft targeting that enables sound cues
SoftTargetTooltipDurationMs						2000		Game		Account	
SoftTargetTooltipEnemy							0			Game		Account	
SoftTargetTooltipFriend							0			Game		Account	
SoftTargetTooltipInteract						0			Game		Account	
SoftTargetTooltipLocked							0			Game		Account	
SoftTargetWithLocked							1			Game					Allows soft target selection while player has a locked target. 2 = always do soft targeting
SoftTargetWorldtextFarDist						40.000000	Game		Account	
SoftTargetWorldtextNearDist						4.000000	Game		Account	
SoftTargetWorldtextNearScale					1.000000	Game		Account	
SoftTargetWorldtextSize							32.000000	Game		Account	
sortDiskReads									0			Debug					Sort async disk reads to minimize seeks (requires restart)
soulbindsActivatedTutorial									Game		Character	Bitfield for tutorializing activating soulbinds
soulbindsLandingPageTutorial								Game		Character	Boolean indicating if the landing page tutorial has been completed.
soulbindsViewedTutorial										Game		Character	Bitfield for tutorializing viewing soulbinds trees
Sound_AllyPlayerHighpassDSPCutoff							Sound					The cutoff value to use for the Highpass filter on the Ally Player bus (default 80 Hz)
Sound_AlternateListener							1			Sound					When enabled, calculates listener forward by simply using the camera's yaw value, instead of a vector from camera position to listener position
Sound_AmbienceHighpassDSPCutoff								Sound					The cutoff value to use for the Highpass filter on the Ambience bus (default 100 Hz)
Sound_AmbienceVolume							0.6			Sound					Ambience Volume (0.0 to 1.0)
Sound_DialogVolume								1.0			Sound					Dialog Volume (0.0 to 1.0)
Sound_DSPBufferSize								0			Sound					sound buffer size, default 0
Sound_EnableAllSound							1			Sound		
Sound_EnableAmbience							1			Sound					Enable Ambience
Sound_EnableArmorFoleySoundForOthers			1			Sound		
Sound_EnableArmorFoleySoundForSelf				1			Sound		
Sound_EnableDialog								1			Sound					all dialog
Sound_EnableDSPEffects							1			Sound		
Sound_EnableEmoteSounds							1			Sound		
Sound_EnableErrorSpeech							1			Sound					error speech
Sound_EnableMixMode2							0			Sound					test
Sound_EnableMusic								1			Sound					Enables music
Sound_EnablePetBattleMusic						1			Sound					Enables music in pet battles
Sound_EnablePetSounds							1			Sound					Enables pet sounds
Sound_EnablePingSounds							1			Sound					Enable Ping Sounds
Sound_EnablePositionalLowPassFilter				1			Sound					Environmental effect to make sounds duller behind you or far away
Sound_EnableReverb								1			Sound		
Sound_EnableSFX									1			Sound		
Sound_EnableSoundWhenGameIsInBG					0			Sound					Enable Sound When Game Is In Background
Sound_EnemyPlayerHighpassDSPCutoff							Sound					The cutoff value to use for the Highpass filter on the Enemy Player bus (default 80 Hz)
Sound_ListenerAtCharacter						1			Sound					lock listener at character
Sound_MasterVolume								1.0			Sound					master volume (0.0 to 1.0)
Sound_MaxCacheableSizeInBytes					174762		Sound					Max sound size that will be cached, larger files will be streamed instead
Sound_MaxCacheSizeInBytes						134217728	Sound					Max cache size in bytes
Sound_MusicVolume								0.4			Sound					music volume (0.0 to 1.0)
Sound_NPCHighpassDSPCutoff									Sound					The cutoff value to use for the Highpass filter on the NPC bus (default 80 Hz)
Sound_NumChannels								64			Sound					number of sound channels
Sound_OutputDriverIndex							0			Sound		
Sound_OutputDriverName							Primary Sound Driver	Sound		
Sound_OutputSampleRate							44100		Sound					output sample rate
Sound_PingVolume								1.0			Sound					Ping Volume (0.0 to 1.0)
Sound_SFXVolume									1.0			Sound					sound volume (0.0 to 1.0)
Sound_VoiceChatInputDriverIndex					0			Sound		
Sound_VoiceChatInputDriverName					Primary	Sound Capture Driver Sound		
Sound_VoiceChatOutputDriverIndex				0			Sound		
Sound_VoiceChatOutputDriverName					Primary Sound Driver	Sound		
Sound_ZoneMusicNoDelay							0			Sound		
SoundPerf_VariationCap							32			Sound					Limit sound kit variations to cut down on memory usage and disk thrashing on 32-bit machines
SpawnRegion										0
specular										1			Graphics				Specular lighting multiplier (0-1)
speechToText									0			Game		Account		Allows enabling transcription on a voice channel in order to see written text based on the words spoken by other players
spellActivationOverlayOpacity					0.65		Game		Account		The opacity of the Spell Activation Overlays (a.k.a. Spell Alerts)
spellBookSort									1			Game		Account	
spellClutter									-1			Graphics				Cull unimportant spell effects. -1 means auto based on targetFPS otherwise [0-100], 0 means cull nothing for perf reasons, 100 means cull as much as you can
SpellCooldownDebugger							0
SpellEventLog									0
SpellOverrides									0
SpellQueueWindow								400			Game		Account		Sets how early you can pre-activate/queue a spell/ability. (In Milliseconds)
SpellScriptEventLog								0
SpellTargeting									0
SpellVisuals									0
splashScreenBoost								0			Game		Character	Show boost splash screen id
splashScreenNormal								0			Game		Character	Show normal splash screen id
splashScreenSeason								1			Game		Character	Show season splash screen id
SplineOpt										1			Debug					toggles use of spline coll optimization
SSAO											0									Screen-Space Ambient Occlusion
ssaoMagicNormals								1			Graphics				SSAO Use combined GBuffer and face normals; attempts to get the best compromise for architecture, foliage, and characters
ssaoMagicThresholdHigh							50			Graphics				SSAO High threshold for transitioning from gbuffer to face normal (degrees)
ssaoMagicThresholdLow							25			Graphics				SSAO Low threshold for transitioning from gbuffer to face normal (degrees)
SSAOType										0			Graphics				Screen-Space Ambient Occlusion Type
statusText										0			Game		Account		Whether the status bars show numeric health/mana values
statusTextDisplay								NONE		Game		Account		Whether numeric health/mana values are shown as raw values or percentages, or both
stopAutoAttackOnTargetChange					0			Game		Character	Whether to stop attacking when changing targets
streamingCameraLookAheadTime					2000		Graphics				Look ahead time for streaming.
streamingCameraMaxRadius						250			Graphics				Max radius of the streaming camera.
streamingCameraRadius							100			Graphics				Base radius of the streaming camera.
streamStatusMessage								1			Game		Account		Whether to display status messages while streaming content
sunShafts										0									SunShafts
superTrackerDist								0.75		Game		Account	
synchronizeBindings								1
synchronizeChatFrames							1
synchronizeConfig								1
taintLog										0									Whether taint logging is enabled
talentFrameShown								0			Game		Account		The talent UI has been shown
talentPointsSpent								0			Game		Character	The player has spent a talent point
TargetAutoEnemy									1			Game		Character	Auto-Target from your single target helpful spells
TargetAutoFriend								1			Game		Character	Auto-Target from your single target helpful spells
TargetAutoLock									0			Game		Character	Lock targets auto-set by the game
TargetEnemyAttacker								1			Game		Character	Auto-Target Enemy when they attack you
targetFPS										60			Graphics				Set target FPS. Dynamic actions will be taken if you fall below the FPS target
TargetNearestUseNew								1			Game					Use new 7.2 'nearest target' functionality (Set to 0 for 6.x style tab targeting)
TargetPriorityCombatLock						1			Game					1=Lock to in-combat targets when starting from an in-combat target. 2=Further restrict to in-combat with player.
TargetPriorityCombatLockContextualRelaxation	1			Game					1=Enables relaxation of combat lock based on context (eg. no in-combat target infront)
TargetPriorityCombatLockHighlight				0			Game					1=Lock to in-combat targets when starting from an in-combat target. 2=Further restrict to in-combat with player. (while doing hold-to-target)
TargetPriorityPvp								1			Game					When in pvp, give higher priority to players and important pvp targets (1 = players & npc bosses, 2 = all pvp targets, 3 = players only)
telemetryWowlabsPackage							Blizzard.Telemetry.Wow_Labs			The secondary package we want to send telemetry to e.g. Wow_Wowlabs
telemetryWowPackage								Blizzard.Telemetry.Wow_Mainline		The primary package we want to send telemetry to e.g. Wow_Mainline or Wow_Classic
teleportMaxNoLoadDist							200			Graphics				Max teleport distanace without preload
terrainLodDist									400			Graphics				Terrain level of detail distance
TerrainLodDiv									768			Graphics				Terrain lod divisor
terrainMipLevel									0			Graphics				Terrain blend map mip level
test_cameraDynamicPitch							0.000000	Game					Adjust camera pitch according to zoom distance for a more cinematic view
test_cameraDynamicPitchBaseFovPad				0.400000	Game					Fraction of screen height to keep feet below
test_cameraDynamicPitchBaseFovPadDownScale		0.250000	Game					Strength of dynamic pitch when looking down
test_cameraDynamicPitchBaseFovPadFlying			0.750000	Game					Fraction of screen height to keep character below when able to fly
test_cameraDynamicPitchSmartPivotCutoffDist		10.000000	Game					Dynamic pitch disables Smart Pivot within this camera distance
test_cameraHeadMovementDeadZone					0.015000	Game		
test_cameraHeadMovementFirstPersonDampRate		20.000000	Game		
test_cameraHeadMovementMovingDampRate			10.000000	Game		
test_cameraHeadMovementMovingStrength			0.500000	Game		
test_cameraHeadMovementRangeScale				5.000000	Game		
test_cameraHeadMovementStandingDampRate			10.000000	Game		
test_cameraHeadMovementStandingStrength			0.300000	Game		
test_cameraHeadMovementStrength					0.000000	Game		
test_cameraOverShoulder							0.000000	Game		
test_cameraTargetFocusEnemyEnable				0			Game		
test_cameraTargetFocusEnemyStrengthPitch		0.400000	Game		
test_cameraTargetFocusEnemyStrengthYaw			0.500000	Game		
test_cameraTargetFocusInteractEnable			0			Game		
test_cameraTargetFocusInteractStrengthPitch		0.750000	Game		
test_cameraTargetFocusInteractStrengthYaw		1.000000	Game		
textLocale													Game					Set the game locale for text
textToSpeech									0			Game		Account		Reads chat text out loud using the voice text to speech system based on the selected options
textureErrorColors								1			Graphics				If enabled, replaceable textures that aren't specified will be purple
textureFilteringMode							5			Graphics				Texture filtering mode
ThreadPoolLimitHP								6			Graphics				Limit number of threads allowed to be used for [Low|Mid|High] priority job scheduling
ThreadPoolLimitLP								6			Graphics				Limit number of threads allowed to be used for [Low|Mid|High] priority job scheduling
ThreadPoolLimitMP								6			Graphics				Limit number of threads allowed to be used for [Low|Mid|High] priority job scheduling
threatPlaySounds								1			Game		Account		Whether or not to sounds when certain threat transitions occur
threatShowNumeric								0			Game		Account		Whether or not to show numeric threat on the target and focus frames
threatWarning									3			Game		Character	Whether or not to show threat warning UI (0 = off, 1 = in dungeons, 2 = in party/raid, 3 = always)
threatWorldText									1			Game		Account		Whether or not to show threat floaters in combat
timeMgrAlarmEnabled								0			Game		Account		Toggles whether or not the time manager's alarm will go off
timeMgrAlarmMessage											Game		Account		The time manager's alarm message
timeMgrAlarmTime								0			Game		Account		The time manager's alarm time in minutes
timeMgrUseLocalTime								0			Game		Account		Toggles the use of either the realm time or your system time
timeMgrUseMilitaryTime							0			Game		Account		Toggles the display of either 12 or 24 hour time
timingMethod									0									Desired method for game timing
timingTestError									0									Error reported by the timing validation system
toastDuration									4			Game		Account		How long to display Battle.net toast windows, in seconds
toyBoxCollectedFilters							0			Game		Account		Bitfield for which collected filters are applied in the toybox
toyBoxExpansionFilters							0			Game		Account		Bitfield for which expansion filters are applied in the toybox
toyBoxSourceFilters								0			Game		Account		Bitfield for which source filters are applied in the toybox
trackedAchievements											Game		Character	Internal cvar for saving tracked achievements in order
trackedPerksActivities										Game		Character	Internal cvar for saving tracked perks activities in order
trackedProfessionRecipes									Game		Character	Internal cvar for saving tracked recipes in order
trackedProfessionRecraftRecipes								Game		Character	Internal cvar for saving tracked recraft recipes in order
trackedQuests												Game		Character	Internal cvar for saving automatically tracked quests in order
trackedWorldQuests											Game		Character	Internal cvar for saving automatically tracked world quests
trackQuestSorting								top			Game		Account		Whether to sort the last tracked quest to the top of the quest tracker or use proximity sorting
transmogCurrentSpecOnly							0			Game		Character	Stores whether transmogs apply to current spec instead of all specs
transmogrifyShowCollected						1			Game		Account		Whether to show collected transmogs in the at the transmogrifier
transmogrifyShowUncollected						0			Game		Account		Whether to show uncollected transmogs in the at the transmogrifier
transmogrifySourceFilters						0			Game		Account		Bitfield for which source filters are applied in the wardrobe at the transmogrifier
TTSUseCharacterSettings							1			Character				If character-specific TTS settings are being used.
TurnSpeed										180									Set the keyboard turn rate in degrees per second; capped by the server
twitterGetConfigTime							0			Game					Last time that we got Twitter configuration data successfully
twitterShortUrlLength							23			Game					Number of characters that non-https URLS get shortened to
twitterShortUrlLengthHttps						23			Game					Number of characters that https URLS get shortened to
UberTooltips									1			Game		Account		Show verbose tooltips
uiScale											1.0			Game					The current UI scale
uiScaleMultiplier								-1			Game					A multiplier for the default UI scale. -1=determine based on system/monitor DPI, 0.5-2.0=multiplier to use when calculating UI scale. Only applied when useUIScale is 0.
unitClutter										1			Game					Enables/Disables unit clutter
unitClutterInstancesOnly						1			Game					Whether or not to use unit clutter in instances only (0 or 1)
unitClutterPlayerThreshold						10			Game					The number of players that have to be nearby to trigger unit clutter
UnitEnterCombatLog								0
unitFacingPlayerDeadZoneDeg						60			Game					Degrees outside a unit's default facing a player has to be for the unit to face them on interact
UnitNameEnemyGuardianName						1			Game		Account	
UnitNameEnemyMinionName							1			Game		Account	
UnitNameEnemyPetName							1			Game		Account	
UnitNameEnemyPlayerName							1			Game		Account	
UnitNameEnemyTotemName							1			Game		Account	
UnitNameForceHideMinus							0			Game		Account	
UnitNameFriendlyGuardianName					1			Game		Account	
UnitNameFriendlyMinionName						1			Game		Account	
UnitNameFriendlyPetName							1			Game		Account	
UnitNameFriendlyPlayerName						1			Game		Account	
UnitNameFriendlySpecialNPCName					1			Game		Account	
UnitNameFriendlyTotemName						1			Game		Account	
UnitNameGuildTitle								1			Game		Account	
UnitNameHostleNPC								1			Game		Account	
UnitNameInteractiveNPC							1			Game		Account	
UnitNameNonCombatCreatureName					0			Game		Account	
UnitNameNPC										0			Game		Account	
UnitNameOwn										0			Game		Account	
UnitNamePlayerGuild								1			Game		Account	
UnitNamePlayerPVPTitle							1			Game		Account	
unitsLookAtPlayers								1			Game					Enables units turning their head to look at players
UnitVisibility									0
unlockedExpansionLandingPages								Game		Character	Bitfield for which expansion landing pages have been unlocked/seen by the user
unlockedMajorFactions										Game		Character	Internal cvar for tracking unlocked Major Factions. Used to play a toast when a new faction has been unlocked.
useCommentatorSelectionCircles					1			Game					Determines whether to use the commentator selection circles or the default selection circles while spectating or commentating a wargame
useHighResolutionUITextures						0			Game					Whether to use high resolution UI Textures
useIPv6											0			Net						Enable the usage of IPv6 sockets
UseKeyHeldSpellErrorPollTime					500			Game		Account		(Internal only) Time between a failed cast and when it should attempt to cast again in ms. (Clamped to 100 and 10000)
useMaxFPS										0			Graphics				Enables or disables FPS limit
useMaxFPSBk										1			Graphics				Enables or disables background FPS limit
UseSlug											1			Debug					Render with slug text
useTargetFPS									1			Graphics				Enables or disables background FPS limit
useUiScale										0			Game					Whether or not the UI scale should be used
validateFrameXML								1									Display warning when FrameXML detects unparsed elements
VerboseSpellScriptEventLog						0
videoOptionsVersion								0									Video options version
videoOptionsVersionDefault						0			Graphics		
violenceLevel									2			Game		Account		Sets the violence level of the game
VoiceChatMasterVolumeScale						1			Sound					Voice Chat audio ducking, applied as a scale to the game's master volume when somebody is speaking in voice chat
VoiceCommunicationMode							0			Sound		Account		Which communication mode to use for voice chat: push-to-talk, open mic, etc...
VoiceEnableWhenGameIsInBG						1			Sound					Enable Voice Chat when game is in background
VoiceInputDevice											Sound					Which deviceID you would like to use to pick up the sound of your wonderful voice, usually a microphone of some kind, empty string is system default
VoiceInputVolume								50			Sound					The gain applied to your microphone, helps change your speaking volume from other users' perspectives, larger values are louder.
VoiceOutputDevice											Sound					Which deviceID you would like to use to transmit the sound of other users' wonderful voices, usually a speakers of some kind, empty string is system default
VoiceOutputVolume								50			Sound					The volume of incoming voice chat, how loud other users' voices sound
VoicePushToTalkKeybind							`			Sound		Account		Push to talk key
VoiceSelfDeafened								0			Sound					Voice Chat Self Deafened
VoiceSelfMuted									0			Sound					Voice Chat Self Muted
VoiceVADSensitivity								43			Sound					How sensitive voice activity detection is. Value ranges from 0 to 100, smaller values will transmit at a lower noise threshold.
volumeFog										0			Graphics				Volume Fog
volumeFogInterior								1			Graphics				Volume Fog Interiors
volumeFogLevel									2			Graphics				Volume Fog Level (0-3)
vrsParticles									1x1			Graphics				Render scale like effect for particles. Only used if lots of particles are on screen
vrsValar										0			Graphics				Generate a shading rate mask based on velocity and luminance. Requires VRS Tier 2.
vrsValarEnvLuma									0.05		Graphics				Env. Luma for VALAR
vrsValarK										2.13		Graphics				Quarter Rate Sensitivity (K) for VALAR
vrsValarSensitivityThreshold					0.31		Graphics				Sensitivity Threshold for VALAR
vrsValarUseAsyncCompute							0			Graphics				Use async compute for VALAR
vrsValarUseMotionVectors						0			Graphics				Use motion vectors for VALAR
vrsValarUseWeberFechner							0			Graphics				Use Weber-Fechner Algo for VALAR
vrsValarWeberFechnerConstant					1.0			Graphics				Weber-Fechner Constant for VALAR
vrsWorldGeo										1x1			Graphics				Render scale like effect for terrain, buildings and liquids
vsync											1			Graphics				vsync on or off
WalkableSurfacesValidationLog					0
wardrobeSetsFilters								0			Game		Account		Bitfield for which transmog sets filters are applied in the wardrobe in the collection journal
wardrobeShowCollected							1			Game		Account		Whether to show collected transmogs in the wardrobe
wardrobeShowUncollected							1			Game		Account		Whether to show uncollected transmogs in the wardrobe
wardrobeSourceFilters							0			Game		Account		Bitfield for which source filters are applied in the wardrobe in the collection journal
watchFrameBaseAlpha								0			Game		Account		Objectives frame opacity.
watchFrameIgnoreCursor							0			Game		Account		Disables Objectives frame mouseover and title dropdown.
watchFrameState									0			Game		Account		Stores Objectives frame locked and collapsed states
waterDetail										0									Water surface detail
weatherDensity									2
webChallengeURLTimeout							60									How long to wait for the web challenge URL (in seconds). 0 means wait forever.
whisperMode										popout		Game		Account		The action new whispers take by default: "popout", "inline", "popout_and_inline"
wholeChatWindowClickable						1			Game		Account		Whether the user may click anywhere on a chat window to change EditBox focus (only works in IM style)
windowResizeLock								0			Graphics				prevent resizing in windowed mode
wmoDoodadDist									2000		Graphics				Wmo doodad load distance
wmoLodDist										300									Wmo level of detail distance
wmoLodDistScale									1.0			Graphics				Wmo level of detail distance scale
wmoPortalFadeScale								1000		Graphics				Wmo portal fade scale
wmoPortalInteriorFade							0			Graphics				Wmo portal interior fade
WorldActionsLog									0
worldBaseMip									0			Graphics				World texture base mip
worldIntersectMaxJobs							32			Graphics				Maximum job threads for culling
worldLoadSort									1			Graphics				Sort objects by distance when loading
worldMaxMipLevel								12			Graphics				World maximum texture mip level
worldPreloadHighResTextures						1			Graphics				Require high res textures to be loaded in streaming non critical radius when preloading
worldPreloadNonCritical							2			Graphics				Require objects to be loaded in streaming non critical radius when preloading
worldPreloadNonCriticalTimeout					45			Graphics				World preload time (in seconds) when non-critical items are automatically ignored
worldPreloadSort								1			Graphics				Sort objects by distance when preloading
worldQuestFilterAnima							1			Game		Character	If enabled, world quests with anima rewards will be shown on the map
worldQuestFilterArtifactPower					1			Game		Character	If enabled, world quests with artifact power rewards will be shown on the map
worldQuestFilterEquipment						1			Game		Character	If enabled, world quests with equipment rewards will be shown on the map
worldQuestFilterGold							1			Game		Character	If enabled, world quests with gold rewards will be shown on the map
worldQuestFilterProfessionMaterials				1			Game		Character	If enabled, world quests with profession material rewards will be shown on the map
worldQuestFilterReputation						1			Game		Character	If enabled, world quests with reputation rewards will be shown on the map
worldQuestFilterResources						1			Game		Character	If enabled, world quests with order resource rewards or war resource rewards will be shown on the map
WorldTextCritScreenY							0.0275		Game		Account	
WorldTextGravity								0.5			Game		Account	
WorldTextMinAlpha								0.5			Game		Account	
WorldTextMinSize								0			Game		Account	
WorldTextNonRandomZ								2.5			Game		Account	
WorldTextRampDuration							1.0			Game		Account	
WorldTextRampPow								1.9			Game		Account	
WorldTextRampPowCrit							8.0			Game		Account	
WorldTextRandomXY								0.0			Game		Account	
WorldTextRandomZMax								1.5			Game		Account	
WorldTextRandomZMin								0.8			Game		Account	
WorldTextScale									1.0			Game		Account	
WorldTextScreenY								0.015		Game		Account	
WorldTextStartPosRandomness						1.0			Game		Account	
worldViewCullMaxJobs							32			Graphics				Maximum job threads for culling
wowLabsClosedTutorials										Game		Character	Bitfield for which help frames have been acknowledged by the user, specifically for WoW Labs
xpBarText										0			Game		Account		Whether the XP bar shows the numeric experience value
PTR client.png agentLogLevel					1			Debug					Logging level for agent (0, 1, 2)
PTR client.png debugAllocSingleBlade												At startup only, choose a single blade such as a CSI peer to have debug allocators
PTR client.png debugAllocTrackStacktrace		0									Whether to track the stacktrace for each debug allocation
PTR client.png debugLog0						0
PTR client.png debugLog1						0
PTR client.png debugLog2						0			Game					CVar for debugging
PTR client.png enableRefHistory					1			Debug					Whether ref history tracking is enabled. Disabling may slightly improve performance, but at the cost of less information when leaks occur.
PTR client.png ErrorFileLog						0			Debug		
PTR client.png useDebugAllocators				0									Should we use debug allocators (level: 0, 1, 2)

List of Console Commands
Name								Category		Description
ActionCam							Game	
clear								Console		Clears the console buffer
clearSeenCustomizationChoices		Game	
closeconsole						Console		Closes the Console window
cvar_default									Set the value of a CVar to its coded default value
cvar_reset										Set the value of a CVar to its startup value
cvarlist										List CVars
D3D11								Graphics	
D3D11_LEGACY						Graphics	
D3D12								Graphics	
DefragmentGPU						Graphics	Defragment suballocated GPU resources
enable								Console		Enable the console with "/console enable" in the chat window. This is the same as launching the client with -console
fontcolor							Console		[ColorClassName] [Red 0-255] [Green 0-255] [Blue 0-255]
fontsize							Console		[10-50] arbitrary font size
FrameBufferCacheGpuFootprint		Graphics	
GamePadListDevices					Game		List all connected GamePad devices in the console
GetSwapChainSize					Graphics	
GetWindowSize						Graphics	
GxCurrentAPI						Graphics	
GxCurrentGPU						Graphics	
GxFrameStats						Graphics	Get Engine Frame Stats
GxGetVideoMemory					Graphics	
GxIsPrism							Graphics	
GxListGPUs							Graphics	
GxLogFlush							Graphics	
GxLogFullGPUInfo					Graphics	
GxRestart							Graphics	
help								Console		Provides help information about a command.
LogFps								Graphics	Log FPS data to file. Optionally pass in polling freq in seconds, default 1 second. Call again to end logging.
logout		
ObjUsage							Game	
physCreateForceField				Debug	
physCulling							Debug	
physCullingDist						Debug	
physEnable							Debug	
physEnableVegOverrides				Debug		Toggles physics vegetation cvars for tuning vegetation physics simulation etc.
physReset							Debug	
physVegMinPushDist					Debug		Squared distance the unit must be within from the bone to begin pushing it.
physVegPosMaxPush					Debug		Maximum distance in yards a bone can be pushed from its base position before being clamped.
physVegPosPushAmt					Debug		Distance per frame in yards the bone is pushed while a unit moves along the push direction, scaled by delta time.
physVegPosRelaxSpeed				Debug		Speed at which the bone will return to rest once the unit leaves the volume, or crosses the max push threshold.
physVegVelMaxPush					Debug		Max distance the bone can be pushed additionally when a unit has velocity while moving in the veg, pushed along the units vel direction.
physVegVelSpeed						Debug		Speed at which the bone moves along the velocity direction when a unit has move while within the veg.
pitchLimit							Game
quit		
reloadUI							Graphics	Reloads the user interface
repeat								Console		Repeats a command [repeat <count> <command> <args ...>]
ResetChallengeMode		
set												Set the value of a CVar
SetDifficulty		
SetGraphicsQuality					Graphics	
SetGraphicsQualityRAID				Graphics	
ShowObjUsage						Game	
showPlayer							Graphics	
spectate							Game		Spectate <CharName-Realm> - Begin commentator view of specified player's instance party. Exclude name to exit spectator mode
TakeScreenshot						Graphics	
testOutput							Console		Tests that all output paths work.
timingInfo							Debug	
ToggleWindowMode					Graphics	
UpdatePOI							Game		Updates Quest POI from User Server
UpdateWindow						Graphics	
ver		
whois								Debug		Ask the server to do an account/real name lookup on a character name
WriteCustomizationOptions			Game	
PTR client.png HeapUsage			Game	
PTR client.png HeapUsage2			Game	
PTR client.png HeapUsage3			Game	
PTR client.png logWowConnections	Net	
PTR client.png MemTimings			Game	
PTR client.png memTypeUsage			Console		Shows memory usage by category
PTR client.png MemUsage				Game	
PTR client.png MemUsageDetailed		Game
]]--