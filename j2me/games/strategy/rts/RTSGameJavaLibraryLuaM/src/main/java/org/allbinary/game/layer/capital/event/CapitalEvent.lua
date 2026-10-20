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
-- package org.allbinary.game.layer.capital.event

local StringMaker = require("org.allbinary.logic.string.StringMaker")
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

local CapitalEvent = {}
CapitalEvent.__index = CapitalEvent
CapitalEvent.className = "CapitalEvent"
setmetatable(CapitalEvent, {__index = AllBinaryEventObject})

function CapitalEvent:_init_fields()
    self.value = 0
end


function CapitalEvent.new(anyType)
    local self = setmetatable(AllBinaryEventObject.new(anyType), CapitalEvent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CapitalEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CapitalEvent: Value: \n")
        stringBuffer:appendint(self:getValue())
        return tostring(stringBuffer)
end
CapitalEvent.__tostring = function(self) return self:toString() end


function CapitalEvent:getValue()
        return self.value
end


function CapitalEvent:setValue(value)
        self.value = value
end

return CapitalEvent

