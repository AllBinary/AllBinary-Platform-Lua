--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.game.tracking

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

local TrackingEventHandler = {}
TrackingEventHandler.__index = TrackingEventHandler
TrackingEventHandler.className = "TrackingEventHandler"
setmetatable(TrackingEventHandler, {__index = BasicEventHandler})


function TrackingEventHandler.getInstance()
        return TrackingEventHandler.instance
end


function TrackingEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), TrackingEventHandler)
    return self
end


-- throws Exception
function TrackingEventHandler:process(eventObject, eventListenerInterface)
        local trackingEventListenerInterface = eventListenerInterface
        trackingEventListenerInterface:onMovement(eventObject)
end

TrackingEventHandler.instance = TrackingEventHandler.new()

return TrackingEventHandler

