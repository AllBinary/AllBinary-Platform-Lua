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
-- package org.allbinary.input.motion.button


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TouchScreenFactory = {}
TouchScreenFactory.__index = TouchScreenFactory
TouchScreenFactory.className = "TouchScreenFactory"

function TouchScreenFactory:_init_fields()
    self.multiTouch = false
    self.touch = false
    self.touchScreenType = TouchScreenTypesFactory.getInstance().NOTOUCH
end


function TouchScreenFactory.new()
    local self = setmetatable({}, TouchScreenFactory)
    self:_init_fields()
    return self
end


function TouchScreenFactory.getInstance()
        return TouchScreenFactory.SINGLETON
end


function TouchScreenFactory:isMultiTouch()
        return self.multiTouch
end


function TouchScreenFactory:setTouch(touch)
end


function TouchScreenFactory:isTouch()
        return self.touch
end


function TouchScreenFactory:getTouchScreenType()
        return self.touchScreenType
end

TouchScreenFactory.SINGLETON = TouchScreenFactory.new()

return TouchScreenFactory

