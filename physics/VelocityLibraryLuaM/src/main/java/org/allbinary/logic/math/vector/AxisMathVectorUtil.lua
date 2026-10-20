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
-- package org.allbinary.logic.math.vector

local NoDecimalTrigTable = require("org.allbinary.math.NoDecimalTrigTable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AxisMathVectorUtil = {}
AxisMathVectorUtil.__index = AxisMathVectorUtil
AxisMathVectorUtil.className = "AxisMathVectorUtil"

function AxisMathVectorUtil:_init_fields()
    self.noDecimalTrigTable = NoDecimalTrigTable.getInstance()
end

function AxisMathVectorUtil.new()
    local self = setmetatable({}, AxisMathVectorUtil)
    self:_init_fields()
    return self
end


function AxisMathVectorUtil.getInstance()
        return AxisMathVectorUtil.instance
end


function AxisMathVectorUtil:calculateX(magnitude, angle)
        return magnitude * self.noDecimalTrigTable:cos(angle) / 10
end


function AxisMathVectorUtil:calculateY(magnitude, angle)
        return magnitude * self.noDecimalTrigTable:sin(angle) / 10
end


function AxisMathVectorUtil:calculateZ(magnitude, otherAngle)
        return magnitude * self.noDecimalTrigTable:sin(otherAngle) / 10
end

AxisMathVectorUtil.instance = AxisMathVectorUtil.new()

return AxisMathVectorUtil

