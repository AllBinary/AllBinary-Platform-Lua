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

local BasicDecimal = {}
package.loaded["org.allbinary.logic.math.BasicDecimal"] = BasicDecimal

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local ScaleFactorFactory = java_lazy("org.allbinary.logic.math.ScaleFactorFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicDecimal is declared before the requires
BasicDecimal.__index = BasicDecimal
BasicDecimal.className = "BasicDecimal"
BasicDecimal.javaClassName = "org.allbinary.logic.math.BasicDecimal"

function BasicDecimal:_init_fields()
    if self.units == nil then self.units = 0 end
    if self.scaled == nil then self.scaled = 0 end
    self.factor = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR
    self.factorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE
end


function BasicDecimal.createBigDecimal(bigDecimal)
        return BasicDecimal.new(bigDecimal:getUnscaled())
end


function BasicDecimal._jinit(self, units)
    BasicDecimal._init_fields(self)
        self.units = units
        self:updateScaled()
    return self
end

function BasicDecimal.new(...)
    local self = setmetatable({}, BasicDecimal)
    BasicDecimal._jinit(self, ...)
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

