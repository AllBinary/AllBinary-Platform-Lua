-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot  
-- Generated Code Do Not Modify
-- package org.allbinary.game.layer.waypoint.event

local RTSLayerEvent = require("org.allbinary.game.layer.RTSLayerEvent")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")
local BasicEventHandler = require("org.allbinary.logic.util.event.handler.BasicEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WaypointEventHandler = {}
WaypointEventHandler.__index = WaypointEventHandler
WaypointEventHandler.className = "WaypointEventHandler"
setmetatable(WaypointEventHandler, {__index = BasicEventHandler})


function WaypointEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), WaypointEventHandler)
    return self
end


-- throws Exception
function WaypointEventHandler:process(eventObject, eventListenerInterface)
        local waypointEventListenerInterface = (eventListenerInterface)
        waypointEventListenerInterface:onWaypointEvent(eventObject)
end

return WaypointEventHandler

