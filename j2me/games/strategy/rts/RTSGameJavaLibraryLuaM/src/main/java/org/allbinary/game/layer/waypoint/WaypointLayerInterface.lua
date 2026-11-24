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

local WaypointLayerInterface = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointLayerInterface"] = WaypointLayerInterface

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

local CaptionAnimationHelperBase = java_lazy("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local Waypoint2LogHelper = java_lazy("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local WaypointLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")

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

-- Java interface
-- class table WaypointLayerInterface is declared before the requires
WaypointLayerInterface.__index = WaypointLayerInterface
WaypointLayerInterface.className = "WaypointLayerInterface"
WaypointLayerInterface.javaClassName = "org.allbinary.game.layer.waypoint.WaypointLayerInterface"


-- throws Exception
function WaypointLayerInterface:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
    error("abstract method init")
end


function WaypointLayerInterface:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
    error("abstract method getMoveOutOfBuildAreaPath")
end


-- throws Exception
function WaypointLayerInterface:setClosestGeographicMapCellHistory(pathsList)
    error("abstract method setClosestGeographicMapCellHistory")
end


function WaypointLayerInterface:teleportTo(geographicMapCellPosition)
    error("abstract method teleportTo")
end


-- throws Exception
function WaypointLayerInterface:setLoad(resource)
    error("abstract method setLoad")
end


-- throws Exception
function WaypointLayerInterface:getSurroundingGeographicMapCellPositionList()
    error("abstract method getSurroundingGeographicMapCellPositionList")
end


function WaypointLayerInterface:isSelected()
    error("abstract method isSelected")
end


function WaypointLayerInterface:shouldAddWaypointFromBuilding()
    error("abstract method shouldAddWaypointFromBuilding")
end


function WaypointLayerInterface:isShowMoreCaptionStates()
    error("abstract method isShowMoreCaptionStates")
end


-- throws Exception
function WaypointLayerInterface:trackTo(reason)
    error("abstract method trackTo")
end


-- throws Exception
function WaypointLayerInterface:trackToDXY(dx, dy)
    error("abstract method trackToDXY")
end


-- throws Exception
function WaypointLayerInterface:buildingChase(allbinaryLayer, cellPosition)
    error("abstract method buildingChase")
end


function WaypointLayerInterface:getTrackingEvent()
    error("abstract method getTrackingEvent")
end


function WaypointLayerInterface:allStop()
    error("abstract method allStop")
end


function WaypointLayerInterface:isWaypointListEmptyOrOnlyTargets()
    error("abstract method isWaypointListEmptyOrOnlyTargets")
end


-- throws Exception
function WaypointLayerInterface:getCurrentGeographicMapCellPosition()
    error("abstract method getCurrentGeographicMapCellPosition")
end


-- throws Exception
function WaypointLayerInterface:getTopLeftGeographicMapCellPosition()
    error("abstract method getTopLeftGeographicMapCellPosition")
end


function WaypointLayerInterface:getCaptionAnimationHelper()
    error("abstract method getCaptionAnimationHelper")
end


function WaypointLayerInterface:getWaypointBehavior()
    error("abstract method getWaypointBehavior")
end


function WaypointLayerInterface:getWaypointLogHelper()
    error("abstract method getWaypointLogHelper")
end


function WaypointLayerInterface:getWaypoint2LogHelper()
    error("abstract method getWaypoint2LogHelper")
end


function WaypointLayerInterface:getWaypointRunnableLogHelper()
    error("abstract method getWaypointRunnableLogHelper")
end

return WaypointLayerInterface

