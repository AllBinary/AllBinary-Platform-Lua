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

local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local MathVector = require("org.allbinary.logic.math.vector.MathVector")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local XAxisMathVector = {}
XAxisMathVector.__index = XAxisMathVector
XAxisMathVector.className = "XAxisMathVector"
setmetatable(XAxisMathVector, {__index = MathVector})


function XAxisMathVector.new(magnitudeBasicDecimal, direction)
    local self = setmetatable(MathVector.new(magnitudeBasicDecimal, direction), XAxisMathVector)
        -- super(...) made self above
        self:calculate()
    return self
end


function XAxisMathVector:calculate()
        local result = YAxisMathVectorUtil.calculate(self:getMagnitude():getUnscaled(), self:getDirection())
        self.resultBasicDecimal = BasicDecimal.new(result)
end

return XAxisMathVector

