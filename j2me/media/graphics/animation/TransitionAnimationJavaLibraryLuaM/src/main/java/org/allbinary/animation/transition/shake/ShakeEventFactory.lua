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
-- package org.allbinary.animation.transition.shake


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShakeEventFactory = {}
ShakeEventFactory.__index = ShakeEventFactory
ShakeEventFactory.className = "ShakeEventFactory"

function ShakeEventFactory:_init_fields()
    self.MICRO = ShakeEvent.new()
    self.SMALL = ShakeEvent.new()
    self.MEDIUM = ShakeEvent.new()
    self.LARGE = ShakeEvent.new()
end

function ShakeEventFactory.new()
    local self = setmetatable({}, ShakeEventFactory)
    self:_init_fields()
    return self
end


function ShakeEventFactory.getInstance()
        return ShakeEventFactory.instance
end


function ShakeEventFactory:init()
end

ShakeEventFactory.instance = ShakeEventFactory.new()

return ShakeEventFactory

