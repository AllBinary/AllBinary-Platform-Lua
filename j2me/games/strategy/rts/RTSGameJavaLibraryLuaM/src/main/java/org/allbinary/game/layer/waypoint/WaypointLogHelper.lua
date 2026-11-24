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

local WaypointLogHelper = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointLogHelper"] = WaypointLogHelper

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
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
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

-- class table WaypointLogHelper is declared before the requires
WaypointLogHelper.__index = WaypointLogHelper
WaypointLogHelper.className = "WaypointLogHelper"
WaypointLogHelper.javaClassName = "org.allbinary.game.layer.waypoint.WaypointLogHelper"

function WaypointLogHelper._jinit(self)
    return self
end

function WaypointLogHelper.new()
    return WaypointLogHelper._jinit(setmetatable({}, WaypointLogHelper))
end


function WaypointLogHelper.getInstance()
        return WaypointLogHelper.instance_f
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

WaypointLogHelper.instance_f = WaypointLogHelper.new()

return WaypointLogHelper

