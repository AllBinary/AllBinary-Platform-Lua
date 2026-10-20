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
-- package org.allbinary.android.input.motion.event

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
local AnalogControllerConfigurationEventListenerInterface = {}
AnalogControllerConfigurationEventListenerInterface.__index = AnalogControllerConfigurationEventListenerInterface
AnalogControllerConfigurationEventListenerInterface.className = "AnalogControllerConfigurationEventListenerInterface"
setmetatable(AnalogControllerConfigurationEventListenerInterface, {__index = EventListenerInterface})


-- throws Exception
function AnalogControllerConfigurationEventListenerInterface:onAnalogControllerConfigurationEvent(analogControllerConfigurationEvent)
    error("abstract method onAnalogControllerConfigurationEvent")
end

return AnalogControllerConfigurationEventListenerInterface

