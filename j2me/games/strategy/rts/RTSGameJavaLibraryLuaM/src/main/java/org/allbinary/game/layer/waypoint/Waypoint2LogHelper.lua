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

local Waypoint2LogHelper = {}
package.loaded["org.allbinary.game.layer.waypoint.Waypoint2LogHelper"] = Waypoint2LogHelper

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table Waypoint2LogHelper is declared before the requires
Waypoint2LogHelper.__index = Waypoint2LogHelper
Waypoint2LogHelper.className = "Waypoint2LogHelper"
Waypoint2LogHelper.javaClassName = "org.allbinary.game.layer.waypoint.Waypoint2LogHelper"

function Waypoint2LogHelper._jinit(self)
    return self
end

function Waypoint2LogHelper.new()
    return Waypoint2LogHelper._jinit(setmetatable({}, Waypoint2LogHelper))
end


function Waypoint2LogHelper.getInstance()
        return Waypoint2LogHelper.instance_f
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

Waypoint2LogHelper.instance_f = Waypoint2LogHelper.new()

return Waypoint2LogHelper

