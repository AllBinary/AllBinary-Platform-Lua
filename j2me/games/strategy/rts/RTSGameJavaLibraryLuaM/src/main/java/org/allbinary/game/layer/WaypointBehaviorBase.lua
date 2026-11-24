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

local WaypointBehaviorBase = {}
package.loaded["org.allbinary.game.layer.WaypointBehaviorBase"] = WaypointBehaviorBase

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

local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local WaypointBase = java_lazy("org.allbinary.game.layer.waypoint.WaypointBase")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TickableInterface = java_lazy("org.allbinary.game.tick.TickableInterface")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local GeographicMapCellHistory = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellHistory")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")

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

-- class table WaypointBehaviorBase is declared before the requires
WaypointBehaviorBase.__index = WaypointBehaviorBase
WaypointBehaviorBase.className = "WaypointBehaviorBase"
WaypointBehaviorBase.javaClassName = "org.allbinary.game.layer.WaypointBehaviorBase"
WaypointBehaviorBase.java_implements = " TickableInterface "
WaypointBehaviorBase.java_interfaces = function() return {TickableInterface} end

function WaypointBehaviorBase:_init_fields()
    if self.ownedWaypointList == nil then self.ownedWaypointList = nil end
    self.waypointOverridesAttacking = true
    self.waypoint = WaypointBase.NULL_WAYPOINT_BASE
    self.steeringVisitorList = BasicArrayListD.new()
end


function WaypointBehaviorBase._jinit(self)
    WaypointBehaviorBase._init_fields(self)
        self.ownedWaypointList = BasicArrayListS.new(1)
    return self
end

function WaypointBehaviorBase.new(...)
    local self = setmetatable({}, WaypointBehaviorBase)
    WaypointBehaviorBase._jinit(self, ...)
    return self
end


function WaypointBehaviorBase:getName()
        return (getmetatable(self).javaClassName or getmetatable(self).className)
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
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:isWaypointListEmptyOrOnlyTargets()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:isInSensorRange(layerInterface, targetDistance)
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:getCurrentTargetLayerInterface()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:getCurrentTargetingStateString()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:isTrackingWaypoint()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:getCurrentPathGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:getCurrentGeographicMapCellHistory()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:isWaypointOverridesAttacking()
        return self.waypointOverridesAttacking
end


function WaypointBehaviorBase:getNextUnvisitedPathGeographicMapCellPosition()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:needToMove()
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:setWaypointPathsList(waypointPathsList)
        error(require("java.lang.RuntimeException").new(), 0)
end


function WaypointBehaviorBase:getWaypointPathsList()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBehaviorBase:setTarget(layerInterface)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBehaviorBase:setTargetWithDistance(layerInterface, anotherTargetDistance)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBehaviorBase:clearTarget()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBehaviorBase:updatePathOnTargetMove(reason)
end

return WaypointBehaviorBase

