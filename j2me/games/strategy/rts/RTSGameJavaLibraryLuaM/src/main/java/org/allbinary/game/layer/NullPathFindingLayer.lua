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

local CaptionAnimationHelperBase = require("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local Group = require("org.allbinary.game.identification.Group")
local Waypoint2LogHelper = require("org.allbinary.game.layer.waypoint.Waypoint2LogHelper")
local WaypointLogHelper = require("org.allbinary.game.layer.waypoint.WaypointLogHelper")
local WaypointRunnableLogHelper = require("org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullPathFindingLayer = {}
NullPathFindingLayer.__index = NullPathFindingLayer
NullPathFindingLayer.className = "NullPathFindingLayer"

function NullPathFindingLayer.new()
    local self = setmetatable({}, NullPathFindingLayer)
    return self
end


function NullPathFindingLayer:getName()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:getEndGeographicMapCellPositionList()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:shouldHandleStartSameAsEnd()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getGeographicMapCellPositionArea()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getHudPaintable()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:handleCost(ownerLayer)
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getParentLayer()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getRTSLayer2LogHelper()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:setTarget(targetGameLayer)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:init(geographicMapCellHistory, geographicMapCellPositionBasicArrayList)
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getMoveOutOfBuildAreaPath(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:setClosestGeographicMapCellHistory(pathsList)
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:teleportTo(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:setLoad(resource)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:getSurroundingGeographicMapCellPositionList()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:isSelected()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:shouldAddWaypointFromBuilding()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:isShowMoreCaptionStates()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:trackTo(reason)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:trackToDXY(dx, dy)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:buildingChase(allbinaryLayer, cellPosition)
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getTrackingEvent()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:allStop()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:isWaypointListEmptyOrOnlyTargets()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:getCurrentGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:getTopLeftGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getCaptionAnimationHelper()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getWaypointBehavior()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getWaypointLogHelper()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getWaypoint2LogHelper()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getWaypointRunnableLogHelper()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getGroupInterface()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function NullPathFindingLayer:isDestroyed()
        error(java_exception("RuntimeException"), 0)
end


function NullPathFindingLayer:getSourceId()
        error(java_exception("RuntimeException"), 0)
end

NullPathFindingLayer.NULL_PATH_FINDING_LAYER = NullPathFindingLayer.new()

return NullPathFindingLayer

