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

local Waypoint2LogHelper = {}
Waypoint2LogHelper.__index = Waypoint2LogHelper
Waypoint2LogHelper.className = "Waypoint2LogHelper"

function Waypoint2LogHelper.new()
    local self = setmetatable({}, Waypoint2LogHelper)
    return self
end


function Waypoint2LogHelper.getInstance()
        return Waypoint2LogHelper.instance
end


function Waypoint2LogHelper:initRange(associatedAdvancedRTSGameLayer, closeRange, sensorRange)
end


function Waypoint2LogHelper:processPossibleTarget(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, layerInterface, anotherTargetDistance, isShorterThanCurrentTargetDistance, isCurrentTargetDestroyed)
end


function Waypoint2LogHelper:processSetTarget(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, layerInterface, anotherTargetDistance)
end


function Waypoint2LogHelper:processPossibleTargetCloser(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, layerInterface, anotherTargetDistance)
end


function Waypoint2LogHelper:setTarget(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, layerInterface, anotherTargetDistance)
end


function Waypoint2LogHelper:setTargetPath(associatedAdvancedRTSGameLayer)
end


function Waypoint2LogHelper:setTargetPathIgnoreNewPath(associatedAdvancedRTSGameLayer, unitWaypointBehavior2)
end


function Waypoint2LogHelper:processWaypoint(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, targetLayer, size)
end


function Waypoint2LogHelper:processWaypointTracked(associatedAdvancedRTSGameLayer, unitWaypointBehavior2)
end


function Waypoint2LogHelper:processWaypointTrackedVisit(associatedAdvancedRTSGameLayer, geographicMapCellPosition)
end


function Waypoint2LogHelper:processWaypointTrackedWithoutProgress(associatedAdvancedRTSGameLayer, reason)
end


function Waypoint2LogHelper:wander(associatedAdvancedRTSGameLayer)
end


function Waypoint2LogHelper:targetDestroyed(associatedAdvancedRTSGameLayer)
end


function Waypoint2LogHelper:processTargeting(associatedAdvancedRTSGameLayer, dx, dy)
end


function Waypoint2LogHelper:processTargetingNonWayPoint(associatedAdvancedRTSGameLayer, dx, dy)
end


function Waypoint2LogHelper:removeWaypoint(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, waypointLayer, reason)
end


function Waypoint2LogHelper:removeWaypointList(associatedAdvancedRTSGameLayer, unitWaypointBehavior2, list)
end


function Waypoint2LogHelper:removeWaypointClear(associatedAdvancedRTSGameLayer)
end


function Waypoint2LogHelper:clearTarget(associatedAdvancedRTSGameLayer)
end


function Waypoint2LogHelper:addWaypointFromUser(associatedAdvancedRTSGameLayer, advancedRTSGameLayer)
end


function Waypoint2LogHelper:targetMovedSoRetarget(associatedAdvancedRTSGameLayer)
end

Waypoint2LogHelper.instance = Waypoint2LogHelper.new()

return Waypoint2LogHelper

