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
local MathVectorInterface = require("org.allbinary.logic.math.vector.MathVectorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MathVector = {}
MathVector.__index = MathVector
MathVector.className = "MathVector"

function MathVector:_init_fields()
    self.magnitudeBasicDecimal = nil
    self.direction = nil
    self.resultBasicDecimal = nil
end


function MathVector.new(magnitudeBasicDecimal, direction)
    local self = setmetatable({}, MathVector)
    self:_init_fields()
        self.magnitudeBasicDecimal = magnitudeBasicDecimal
        self.direction = direction
    return self
end


function MathVector:getMagnitude()
        return self.magnitudeBasicDecimal
end


function MathVector:getDirection()
        return self.direction
end


function MathVector:getResult()
        return self.resultBasicDecimal
end

return MathVector

