-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.layer

local NullPathFindingLayer = {}
package.loaded["org.allbinary.game.layer.NullPathFindingLayer"] = NullPathFindingLayer

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
local Group = java_lazy("org.allbinary.game.identification.Group")
local Waypoint2LogHelper = java_lazy("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local WaypointLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = java_lazy("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local GeographicMapCellPositionAreaBase = java_lazy("org.allbinary.game.layer.GeographicMapCellPositionAreaBase")
local RTSLayer2LogHelper = java_lazy("org.allbinary.game.layer.RTSLayer2LogHelper")
local SelectionHudPaintable = java_lazy("org.allbinary.game.layer.SelectionHudPaintable")
local WaypointBehaviorBase = java_lazy("org.allbinary.game.layer.WaypointBehaviorBase")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

-- class table NullPathFindingLayer is declared before the requires
NullPathFindingLayer.__index = NullPathFindingLayer
NullPathFindingLayer.className = "NullPathFindingLayer"
NullPathFindingLayer.javaClassName = "org.allbinary.game.layer.NullPathFindingLayer"
NullPathFindingLayer.java_implements = " PathFindingLayerInterface "
NullPathFindingLayer.java_interfaces = function() return {PathFindingLayerInterface} end

function NullPathFindingLayer._jinit(self)
    return self
end

function NullPathFindingLayer.new()
    return NullPathFindingLayer._jinit(setmetatable({}, NullPathFindingLayer))
end


function NullPathFindingLayer:getName()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:getEndGeographicMapCellPositionList()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:shouldHandleStartSameAsEnd()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getGeographicMapCellPositionArea()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getHudPaintable()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:handleCost(ownerLayer)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getParentLayer()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getRTSLayer2LogHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:setTarget(targetGameLayer)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:setClosestGeographicMapCellHistory(pathsList)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:teleportTo(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:setLoad(resource)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:getSurroundingGeographicMapCellPositionList()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:isSelected()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:shouldAddWaypointFromBuilding()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:isShowMoreCaptionStates()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:trackTo(reason)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:trackToDXY(dx, dy)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:buildingChase(allbinaryLayer, cellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getTrackingEvent()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:allStop()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:isWaypointListEmptyOrOnlyTargets()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:getCurrentGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:getTopLeftGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getCaptionAnimationHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getWaypointBehavior()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getWaypointLogHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getWaypoint2LogHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getWaypointRunnableLogHelper()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getGroupInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function NullPathFindingLayer:isDestroyed()
        error(require("java.lang.RuntimeException").new(), 0)
end


function NullPathFindingLayer:getSourceId()
        error(require("java.lang.RuntimeException").new(), 0)
end

NullPathFindingLayer.NULL_PATH_FINDING_LAYER = NullPathFindingLayer.new()

return NullPathFindingLayer

