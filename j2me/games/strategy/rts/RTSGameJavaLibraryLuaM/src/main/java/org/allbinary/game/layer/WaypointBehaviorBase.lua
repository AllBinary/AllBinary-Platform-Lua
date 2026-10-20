-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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

local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointBase = require("org.allbinary.game.layer.waypoint.WaypointBase")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TickableInterface = require("org.allbinary.game.tick.TickableInterface")
local AllBinaryLayerManager = require("org.allbinary.layer.AllBinaryLayerManager")
local GeographicMapCellHistory = require("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayListS = require("org.allbinary.util.BasicArrayListS")

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

local WaypointBehaviorBase = {}
WaypointBehaviorBase.__index = WaypointBehaviorBase
WaypointBehaviorBase.className = "WaypointBehaviorBase"

function WaypointBehaviorBase:_init_fields()
    self.ownedWaypointList = nil
    self.waypointOverridesAttacking = true
    self.waypoint = WaypointBase.NULL_WAYPOINT_BASE
    self.steeringVisitorList = BasicArrayListD.new()
end


function WaypointBehaviorBase.new()
    local self = setmetatable({}, WaypointBehaviorBase)
    self:_init_fields()
        self.ownedWaypointList = BasicArrayListS.new(1)
    return self
end


function WaypointBehaviorBase:getName()
        return getmetatable(self).className
end


function WaypointBehaviorBase:isRunning()
        return false
end


-- throws Exception
function WaypointBehaviorBase:processTick(allBinaryLayerManager)
end


function WaypointBehaviorBase:getOwnedWaypointList()
        return self.ownedWaypointList
end


function WaypointBehaviorBase:getWaypoint()
        return self.waypoint
end


function WaypointBehaviorBase:setWaypoint(waypoint)
        self.waypoint = waypoint
end


function WaypointBehaviorBase:getSteeringVisitorList()
        return self.steeringVisitorList
end


function WaypointBehaviorBase:getMovementLogicAsString()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:isWaypointListEmptyOrOnlyTargets()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:isInSensorRange(layerInterface, targetDistance)
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:getCurrentTargetLayerInterface()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:getCurrentTargetingStateString()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:isTrackingWaypoint()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:getCurrentPathGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:getCurrentGeographicMapCellHistory()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:isWaypointOverridesAttacking()
        return self.waypointOverridesAttacking
end


function WaypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:needToMove()
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:setWaypointPathsList(waypointPathsList)
        error(java_exception("RuntimeException"), 0)
end


function WaypointBehaviorBase:getWaypointPathsList()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBehaviorBase:setTarget(layerInterface)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBehaviorBase:setTargetWithDistance(layerInterface, anotherTargetDistance)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBehaviorBase:clearTarget()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBehaviorBase:updatePathOnTargetMove(reason)
end

return WaypointBehaviorBase

