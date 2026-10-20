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

local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")
local PathFindingLayerInterface = require("org.allbinary.game.layer.PathFindingLayerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local EventStrings = require("org.allbinary.logic.util.event.EventStrings")
local NoSound = require("org.allbinary.media.audio.NoSound")
local Sound = require("org.allbinary.media.audio.Sound")
local GeographicMapCellPosition = require("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local MultipassState = require("org.allbinary.media.graphics.geography.pathfinding.MultipassState")
local PathFindingInfo = require("org.allbinary.media.graphics.geography.pathfinding.PathFindingInfo")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local WaypointBase = {}
WaypointBase.__index = WaypointBase
WaypointBase.className = "WaypointBase"

function WaypointBase:_init_fields()
    self.connectedWaypointList = BasicArrayListD.new()
    self.sound = nil
    self.allBinaryGameLayerManagerP = AllBinaryGameLayerManager.getNullInstance()
end


function WaypointBase.new(sound)
    local self = setmetatable({}, WaypointBase)
    self:_init_fields()
        self.sound = sound
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
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBase:getPathsList(geographicMapCellPosition, pathFindingInfo, multipassState)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBase:getPathsListRunnable(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function WaypointBase:getPathsListFromCacheOnly(geographicMapCellPosition)
        error(java_exception("RuntimeException"), 0)
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

