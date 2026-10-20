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
-- package org.allbinary.graphics.color

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

local ColorChangeEventHandler = {}
ColorChangeEventHandler.__index = ColorChangeEventHandler
ColorChangeEventHandler.className = "ColorChangeEventHandler"
setmetatable(ColorChangeEventHandler, {__index = BasicEventHandler})


function ColorChangeEventHandler.new()
    local self = setmetatable(BasicEventHandler.new(), ColorChangeEventHandler)
    return self
end


function ColorChangeEventHandler.getInstance()
        return ColorChangeEventHandler.eventHandler
end

ColorChangeEventHandler.eventHandler = ColorChangeEventHandler.new()

return ColorChangeEventHandler

