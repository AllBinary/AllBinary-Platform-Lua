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
-- package org.allbinary.logic.util.event.handler

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventListenerInterface = require("org.allbinary.logic.util.event.EventListenerInterface")

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
local BasicEventHandlerInterface = {}
BasicEventHandlerInterface.__index = BasicEventHandlerInterface
BasicEventHandlerInterface.className = "BasicEventHandlerInterface"


function BasicEventHandlerInterface:addListenerInterface(eventListenerInterface)
    error("abstract method addListenerInterface")
end


-- throws Exception
function BasicEventHandlerInterface:fireEvent(eventObject)
    error("abstract method fireEvent")
end


function BasicEventHandlerInterface:removeAllListeners()
    error("abstract method removeAllListeners")
end


function BasicEventHandlerInterface:removeListener(eventListenerInterface)
    error("abstract method removeListener")
end

return BasicEventHandlerInterface

