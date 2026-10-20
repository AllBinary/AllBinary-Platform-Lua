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
-- package org.allbinary.game.rts.technology.event

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

local TechEventHandler = {}
TechEventHandler.__index = TechEventHandler
TechEventHandler.className = "TechEventHandler"
setmetatable(TechEventHandler, {__index = BasicEventHandler})


function TechEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), TechEventHandler)
    return self
end


function TechEventHandler.getInstance()
        return TechEventHandler.eventHandler
end


-- throws Exception
function TechEventHandler:process(eventObject, eventListenerInterface)
        local techEventListenerInterface = (eventListenerInterface)
        techEventListenerInterface:onTechEvent(eventObject)
end

TechEventHandler.eventHandler = TechEventHandler.new()

return TechEventHandler

