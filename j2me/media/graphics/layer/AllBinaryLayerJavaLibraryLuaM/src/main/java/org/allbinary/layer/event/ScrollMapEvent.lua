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
-- package org.allbinary.layer.event

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

local ScrollMapEvent = {}
ScrollMapEvent.__index = ScrollMapEvent
ScrollMapEvent.className = "ScrollMapEvent"
setmetatable(ScrollMapEvent, {__index = AllBinaryEventObject})

function ScrollMapEvent:_init_fields()
    self.dx = 0
    self.dy = 0
end


function ScrollMapEvent.new(anyType)
    local self = setmetatable(AllBinaryEventObject.new(anyType), ScrollMapEvent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ScrollMapEvent:setDx(dx)
        self.dx = dx
end


function ScrollMapEvent:getDx()
        return self.dx
end


function ScrollMapEvent:setDy(dy)
        self.dy = dy
end


function ScrollMapEvent:getDy()
        return self.dy
end


function ScrollMapEvent:setDxDy(dx, dy)
        self.dx = dx
        self.dy = dy
end

return ScrollMapEvent

