-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.waypoint

local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointLogHelper = {}
WaypointLogHelper.__index = WaypointLogHelper
WaypointLogHelper.className = "WaypointLogHelper"

function WaypointLogHelper.new()
    local self = setmetatable({}, WaypointLogHelper)
    return self
end


function WaypointLogHelper.getInstance()
        return WaypointLogHelper.instance
end


function WaypointLogHelper:onWaypointEvent(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
end


function WaypointLogHelper:addWaypointFromBuilding(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
end


function WaypointLogHelper:addWaypointFromBuildingList(associatedAdvancedRTSGameLayer, advancedRTSGameLayer, list)
end


function WaypointLogHelper:insertWaypoint(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName)
end


function WaypointLogHelper:insertWaypointList(associatedAdvancedRTSGameLayer, index, rtsLayer, waypointName, list)
end


function WaypointLogHelper:setRandomGeographicMapCellHistoryList(associatedAdvancedRTSGameLayer, pathsList)
end


function WaypointLogHelper:moveAwayFromBuilding(associatedAdvancedRTSGameLayer)
end


function WaypointLogHelper:needToMove(associatedAdvancedRTSGameLayer, unitWaypointBehavior)
end


function WaypointLogHelper:setRandomGeographicMapCellHistory(associatedAdvancedRTSGameLayer)
end


function WaypointLogHelper:setCurrentPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingCurrentPathGeographicMapCellPosition, currentPathGeographicMapCellPosition)
end


function WaypointLogHelper:setNextUnvisitedPathGeographicMapCellPosition(associatedAdvancedRTSGameLayer, existingNextUnvisitedPathGeographicMapCellPosition, nextUnvisitedPathGeographicMapCellPosition)
end

WaypointLogHelper.instance = WaypointLogHelper.new()

return WaypointLogHelper

