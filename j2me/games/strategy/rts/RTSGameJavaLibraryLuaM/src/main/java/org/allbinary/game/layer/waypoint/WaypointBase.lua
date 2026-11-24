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

local WaypointBase = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointBase"] = WaypointBase

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

local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local PathFindingLayerInterface = java_lazy("org.allbinary.game.layer.PathFindingLayerInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = java_lazy("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local NoSound = java_lazy("org.allbinary.media.audio.NoSound")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local MultipassState = java_lazy("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = java_lazy("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table WaypointBase is declared before the requires
WaypointBase.__index = WaypointBase
WaypointBase.className = "WaypointBase"
WaypointBase.javaClassName = "org.allbinary.game.layer.waypoint.WaypointBase"
WaypointBase.java_implements = " EventListenerInterface "
WaypointBase.java_interfaces = function() return {EventListenerInterface} end

function WaypointBase:_init_fields()
    self.connectedWaypointList = BasicArrayListD.new()
    if self.sound == nil then self.sound = nil end
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
end


function WaypointBase._jinit(self, sound)
    WaypointBase._init_fields(self)
        self.sound = sound
    return self
end

function WaypointBase.new(...)
    local self = setmetatable({}, WaypointBase)
    WaypointBase._jinit(self, ...)
    return self
end


function WaypointBase:getSound()
        return self.sound
end


-- throws Exception
function WaypointBase:setAllBinaryGameLayerManager(allBinaryGameLayerManager)
        self.allBinaryGameLayerManagerP = allBinaryGameLayerManager
end


function WaypointBase:getConnectedWaypointList()
        return self.connectedWaypointList
end


function WaypointBase:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function WaypointBase:getPathFindingInfo(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBase:getPathsList(geographicMapCellPosition, pathFindingInfo, multipassState)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBase:getPathsListRunnable(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBase:getPathsListFromCacheOnly(geographicMapCellPosition)
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function WaypointBase:visit(unitLayer)
end


function WaypointBase:reset()
end


function WaypointBase:getType()
        return 0
end

WaypointBase.NULL_WAYPOINT_BASE = WaypointBase.new(NoSound.getInstance())

return WaypointBase

