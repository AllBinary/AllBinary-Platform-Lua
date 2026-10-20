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
-- package org.allbinary.logic.math


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicDecimal = {}
BasicDecimal.__index = BasicDecimal
BasicDecimal.className = "BasicDecimal"

function BasicDecimal:_init_fields()
    self.units = nil
    self.scaled = 0
    self.factor = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR
    self.factorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE
end


function BasicDecimal.createBigDecimal(bigDecimal)
        return BasicDecimal.new(bigDecimal:getUnscaled())
end


function BasicDecimal.new(units)
    local self = setmetatable({}, BasicDecimal)
    self:_init_fields()
        self.units = units
        self:updateScaled()
    return self
end


function BasicDecimal:setint(value)
        self.units = value
        self:updateScaled()
end


function BasicDecimal:setlong(value)
        self.units = value
        self:updateScaled()
end


function BasicDecimal:set(bigDecimal)
        self.units = bigDecimal:getUnscaled()
        self:updateScaled()
end


function BasicDecimal:addint(value)
        self.units = self.units + value
        self:updateScaled()
end


function BasicDecimal:addlong(value)
        self.units = self.units + value
        self:updateScaled()
end


function BasicDecimal:add(bigDecimal)
        self.units = self.units + bigDecimal:getUnscaled()
        self:updateScaled()
end


function BasicDecimal:subtractint(value)
        self.units = self.units - value
        self:updateScaled()
end


function BasicDecimal:subtractlong(value)
        self.units = self.units - value
        self:updateScaled()
end


function BasicDecimal:subtract(bigDecimal)
        self.units = self.units - bigDecimal:getUnscaled()
        self:updateScaled()
end


function BasicDecimal:multiplyint(value)
        self.units = self.units * value
        self:updateScaled()
end


function BasicDecimal:multiplylong(value)
        self.units = self.units * value
        self:updateScaled()
end


function BasicDecimal:multiply(bigDecimal)
        self.units = self.units * bigDecimal:getUnscaled()
        self:updateScaled()
end


function BasicDecimal:divideint(value)
        self.units = java_idiv(self.units, value)
        self:updateScaled()
end


function BasicDecimal:dividelong(value)
        self.units = java_idiv(self.units, value)
        self:updateScaled()
end


function BasicDecimal:divide(bigDecimal)
        self.units = self.units / bigDecimal:getUnscaled()
        self:updateScaled()
end


function BasicDecimal:getUnscaled()
        return self.units
end


function BasicDecimal:updateScaled()
        self.scaled = (java_idiv(self.units, self.factorValue))
end


function BasicDecimal:getScaled()
        return self.scaled
end


function BasicDecimal:toString()
        return tostring(self.units)
end
BasicDecimal.__tostring = function(self) return self:toString() end


function BasicDecimal:getScaledFactor()
        return self.factor
end


function BasicDecimal:getScaledFactorValue()
        return self.factorValue
end

BasicDecimal.ZERO_BIGDECIMAL = BasicDecimal.new(0)

return BasicDecimal

