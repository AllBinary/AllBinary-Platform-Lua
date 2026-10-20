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
-- package org.allbinary.logic.java.bool


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BooleanFactory = {}
BooleanFactory.__index = BooleanFactory
BooleanFactory.className = "BooleanFactory"

function BooleanFactory:_init_fields()
    self.TRUE = true
    self.FALSE = false
    self.TRUE_STRING = tostring(self.TRUE)
    self.FALSE_STRING = tostring(self.FALSE)
    self.YES = "yes"
    self.NO = "no"
end

function BooleanFactory.new()
    local self = setmetatable({}, BooleanFactory)
    self:_init_fields()
    return self
end


function BooleanFactory.getInstance()
        return BooleanFactory.instance
end


function BooleanFactory:toStringb(bool)
        if bool then
            return self.TRUE_STRING
        else
            return self.FALSE_STRING
        end
end

BooleanFactory.instance = BooleanFactory.new()

return BooleanFactory

