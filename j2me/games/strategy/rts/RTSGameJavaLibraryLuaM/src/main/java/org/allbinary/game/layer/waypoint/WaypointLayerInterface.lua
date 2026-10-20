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

local CaptionAnimationHelperBase = require("org.allbinary.animation.caption.CaptionAnimationHelperBase")
local WaypointBehaviorBase = require("org.allbinary.game.layer.WaypointBehaviorBase")
local TrackingEvent = require("org.allbinary.game.tracking.TrackingEvent")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
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

-- Java interface
local WaypointLayerInterface = {}
WaypointLayerInterface.__index = WaypointLayerInterface
WaypointLayerInterface.className = "WaypointLayerInterface"


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

