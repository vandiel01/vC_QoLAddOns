-- Completed 03/18/2024 - Updated 03/28/24
local vC_AppName, vC_App = ...
if ( not vC_Run_MiniMap ) then return end
-------------------------------------------------------
-- Declaration
-------------------------------------------------------
local GetBestMapForUnit						= C_Map.GetBestMapForUnit
local GetMapInfo							= C_Map.GetMapInfo
local GetPlayerMapPosition					= C_Map.GetPlayerMapPosition
local STRLEN_CL								= 4.3
-------------------------------------------------------
-- Announce Location, X & Y to Guild or Party (using SuperTrack, WoW Build-in)
-------------------------------------------------------
function vC_AnnounceLocation(e)
	local tA = GetBestMapForUnit("player") or 0
	if ( GetMapInfo(tA) == nil or not (e == "LeftButton" or e == "RightButton") ) then return end
	C_Map.ClearUserWaypoint()
	
	local tB = GetMapInfo(tA).name
	local tC = GetPlayerMapPosition(tA, "player")
	local tE = GetMapInfo(tA).parentMapID
	local tF = GetMapInfo(GetMapInfo(tA).parentMapID).name
	local tX = tC ~= nil and format(" %.3f", select(1, tC:GetXY()) )* 100 or 0 -- X
	local tY = tC ~= nil and format(" %.3f", select(2, tC:GetXY()) )* 100 or 0 -- Y
	local tG = (GetSubZoneText() ~= "" and GetSubZoneText() or tB)

	local vC_tAnnounce = (e == "LeftButton" and "GUILD" or "PARTY")
	local name, realm = UnitName("target")
	local vC_Name = (name == nil and "{star} I'm at " or "{skull} "..name.." is located approx @ ")
		
	C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(tA,tC.x,tC.y))
	local GUWLink = (C_Map.GetUserWaypointHyperlink() == nil and "[Cannot Make Pin]" or C_Map.GetUserWaypointHyperlink())
	SendChatMessage(vC_Name..tG..", "..tB.." #"..tA.." @ "..tX..", "..tY.." "..GUWLink,vC_tAnnounce)
	C_Map.ClearUserWaypoint()
end
-------------------------------------------------------
-- Create Zone, SubZone, X & Y of your Location
-------------------------------------------------------
function vC_GetZoneInfo(a1, a2)
	local tA = GetBestMapForUnit("player") or 0
	local vC_C_tVal, vC_pVal =  nil, "|cFF"
	if GetMapInfo(tA) == nil then return end
	
	
	local vC_pvpType = GetZonePVPInfo() or 0
	if (vC_pvpType == "sanctuary") then vC_tVal = vC_pVal.."19FFFF"
	elseif (vC_pvpType == "arena") then vC_tVal = vC_pVal.."FF1919"
	elseif (vC_pvpType == "friendly") then vC_tVal = vC_pVal.."19FF19"
	elseif (vC_pvpType == "hostile") then vC_tVal = vC_pVal.."FF1919"
	elseif (vC_pvpType == "contested") then vC_tVal = vC_pVal.."FF9B19"
	else vC_tVal = vC_pVal.."FFFAE1"
	end
	local pType = (vC_pvpType ~= 0 and "("..vC_pvpType:upper(vC_pvpType):sub(1,1)..vC_pvpType:lower(vC_pvpType):sub(2).." Zone)" or "")
	
	if ( a1 == 1 or a1 == 3 ) then
		local tB = GetMapInfo(tA).name
		local tD = tonumber(GetMapInfo(tA).mapType)+1 or 0
		local tE = GetMapInfo(tA).parentMapID
		local tF = (tE == 0 and "Cosmics" or GetMapInfo(tE).name)
		local tG = (GetSubZoneText() ~= "" and GetSubZoneText() or tB)
		
		if (a2 == 5) then		-- SubZone,Zone[ZoneID],World[WorldID],[mapType]
			vC_C_tVal = vC_tVal..tG..", "..tB.."|r  [|cFFFFFF19"..tA.."|r] @ "..tF.." [|cFFFFFF19"..tE.."|r]["..vC_GetMapInfo_mapType[tD].."]"
		elseif (a2 == 4) then	-- SubZone,Zone[ZoneID],World[WorldID]
			vC_C_tVal = vC_tVal..tG..", "..tB.."|r  [|cFFFFFF19"..tA.."|r] @ "..tF.." [|cFFFFFF19"..tE.."|r]"
		elseif (a2 == 3) then	-- SubZone,Zone,World
			vC_C_tVal = vC_tVal..tG..", "..tB.."|r  @ "..tF
		elseif (a2 == 2) then	-- SubZone,Zone
			vC_C_tVal = vC_tVal..tG..", "..tB.."|r"
		else					-- SubZone
			vC_C_tVal = vC_tVal..tG.."|r"
		end
		
		vC_CoordLocText:SetText(vC_C_tVal)
		vC_CoordLocText:SetScript("OnEnter", function(s) vC_cToolTips(s,8,1,pType,0) end)
		vC_CoordLocFrame:SetWidth((strlen(vC_CoordLocText:GetText()) <= 15 and Minimap:GetWidth()+13 or strlen(vC_CoordLocText:GetText())*STRLEN_CL))
	end
	
	if ( a1 == 2 or a1 == 3 ) then
		local tC = GetPlayerMapPosition(tA, "player")
		local tX = tC ~= nil and format(" %.3f", select(1, tC:GetXY()) )* 100 or 0 -- X
		local tY = tC ~= nil and format(" %.3f", select(2, tC:GetXY()) )* 100 or 0 -- Y
		vC_CoordXYText:SetText(tX..", "..tY)
	end
end
-------------------------------------------------------
-- Create Location & Coord X, Y Frames
-------------------------------------------------------
if ( vC_CoordLocFrame == nil ) then
	local vC_CoordLocFrame = CreateFrame("Frame", "vC_CoordLocFrame", UIParent, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_CoordLocFrame, 50, 1)
		vC_CoordLocFrame:SetSize(0, 26) -- Auto adjust based on strlen
		vC_CoordLocFrame:EnableMouse(true)
		vC_CoordLocFrame:SetMovable(true)
		vC_CoordLocFrame:SetClampedToScreen(true)
		vC_CoordLocFrame:RegisterForDrag("LeftButton")
		vC_CoordLocFrame:SetScript("OnDragStart", function() vC_CoordLocFrame:StartMoving() end)
		vC_CoordLocFrame:SetScript("OnDragStop", function() vC_CoordLocFrame:StopMovingOrSizing() end)
		
		local vC_CoordLocText = vC_CoordLocFrame:CreateFontString("vC_CoordLocText", "ARTWORK", vC_Font[216])
			vC_CoordLocText:SetPoint("CENTER", vC_CoordLocFrame, "CENTER", 0, 0)
			vC_CoordLocText:SetText("Am I in a Dream World?")
			vC_CoordLocText:SetScript("OnEnter", function(s)
				vC_cToolTips(s,8,1,"",0)
			end)
			vC_CoordLocText:SetScript("OnLeave", function(s) vC_cToolTips(0) end)
			
		local vC_CoordLocAnnc = CreateFrame("Button", "vC_CoordLocAnnc", vC_CoordLocFrame, "BackdropTemplate")
			vC_CoordLocAnnc:SetSize(32, 32)
			vC_CoordLocAnnc:SetPoint("LEFT", vC_CoordLocFrame, "RIGHT", -20, 0)
			vC_CoordLocAnnc:SetNormalTexture(516776)
			vC_CoordLocAnnc:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			vC_CoordLocAnnc:SetScript("OnClick", function(s, e) vC_AnnounceLocation(e) end)
			vC_CoordLocAnnc:SetScript("OnEnter", function(s)
				vC_cToolTips(s,8,1,"Announce your location:\n\nLeft Click for |cFF32CD32Guild|r\nRight Click for |cFF03A9F4Party|r",0)
			end)
			vC_CoordLocAnnc:SetScript("OnLeave", function(s) vC_cToolTips(0) end)

		vC_CoordLocFrame:SetPoint("TOPRIGHT", (C_AddOns.IsAddOnLoaded("SexyMap") and SexyMapCustomBackdrop or Minimap), "TOPRIGHT", -1, (C_AddOns.IsAddOnLoaded("SexyMap") and 25 or 23))
end

if ( vC_CoordXYFrame == nil ) then
	local vC_CoordXYFrame = CreateFrame("Frame", "vC_CoordXYFrame", UIParent, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_CoordXYFrame, 50, 1)
		vC_CoordXYFrame:SetSize(90, 26)
		vC_CoordXYFrame:EnableMouse(true)
		vC_CoordXYFrame:SetMovable(true)
		vC_CoordXYFrame:SetClampedToScreen(true)
		vC_CoordXYFrame:RegisterForDrag("LeftButton")
		vC_CoordXYFrame:SetScript("OnDragStart", function() vC_CoordXYFrame:StartMoving() end)
		vC_CoordXYFrame:SetScript("OnDragStop", function() vC_CoordXYFrame:StopMovingOrSizing() end)
		
		local vC_CoordXYText = vC_CoordXYFrame:CreateFontString("vC_CoordXYText", "ARTWORK", vC_Font[216])
			vC_CoordXYText:SetPoint("CENTER", vC_CoordXYFrame, "CENTER", 0, 0)
			vC_CoordXYText:SetText("00.0, 00.0")

		vC_CoordXYFrame:SetPoint("CENTER", (C_AddOns.IsAddOnLoaded("SexyMap") and SexyMapCustomBackdrop or Minimap), "BOTTOM", 0, (C_AddOns.IsAddOnLoaded("SexyMap") and -11 or -10))
end