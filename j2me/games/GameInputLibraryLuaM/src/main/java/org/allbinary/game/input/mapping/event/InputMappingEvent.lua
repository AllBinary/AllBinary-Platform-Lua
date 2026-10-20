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
-- package org.allbinary.game.input.mapping.event

local InputToGameKeyMapping = require("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputMappingEvent = {}
InputMappingEvent.__index = InputMappingEvent
InputMappingEvent.className = "InputMappingEvent"
setmetatable(InputMappingEvent, {__index = AllBinaryEventObject})

function InputMappingEvent:_init_fields()
    self.inputToGameKeyMapping = InputToGameKeyMapping.getNullInstance()
end


function InputMappingEvent.new(anyType)
    local self = setmetatable(AllBinaryEventObject.new(anyType), InputMappingEvent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function InputMappingEvent:setInputToGameKeyMapping(inputToGameKeyMapping)
        self.inputToGameKeyMapping = inputToGameKeyMapping
end


function InputMappingEvent:getInputToGameKeyMapping()
        return self.inputToGameKeyMapping
end

return InputMappingEvent

