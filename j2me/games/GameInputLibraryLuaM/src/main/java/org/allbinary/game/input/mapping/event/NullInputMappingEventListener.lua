-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.game.input.mapping.event

local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local InputMappingEventListenerInterface = require("org.allbinary.game.input.mapping.event.InputMappingEventListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullInputMappingEventListener = {}
NullInputMappingEventListener.__index = NullInputMappingEventListener
NullInputMappingEventListener.className = "NullInputMappingEventListener"

function NullInputMappingEventListener.new()
    local self = setmetatable({}, NullInputMappingEventListener)
    return self
end


-- throws Exception
function NullInputMappingEventListener:onInputMappingEvent(inputMappingEvent)
end


function NullInputMappingEventListener:onEvent(eventObject)
end

NullInputMappingEventListener.NULL_INPUT_MAPPING_EVENT_LISTENER = NullInputMappingEventListener.new()

return NullInputMappingEventListener

