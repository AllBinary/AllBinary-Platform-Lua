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
-- package org.allbinary.game.midlet

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

local DemoGameMidletEventHandler = {}
DemoGameMidletEventHandler.__index = DemoGameMidletEventHandler
DemoGameMidletEventHandler.className = "DemoGameMidletEventHandler"
setmetatable(DemoGameMidletEventHandler, {__index = BasicEventHandler})


function DemoGameMidletEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), DemoGameMidletEventHandler)
    return self
end


function DemoGameMidletEventHandler.getInstance()
        return DemoGameMidletEventHandler.gameKeyEventHandler
end


-- throws Exception
function DemoGameMidletEventHandler:process(eventObject, eventListenerInterface)
        local demoGameMidletEventListener = eventListenerInterface
        demoGameMidletEventListener:onDemoGameMidletEvent(eventObject)
end

DemoGameMidletEventHandler.gameKeyEventHandler = DemoGameMidletEventHandler.new()

return DemoGameMidletEventHandler

