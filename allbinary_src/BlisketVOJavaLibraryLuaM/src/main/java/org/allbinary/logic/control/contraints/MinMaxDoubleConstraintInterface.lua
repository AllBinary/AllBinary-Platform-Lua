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
-- package org.allbinary.logic.control.contraints


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local MinMaxDoubleConstraintInterface = {}
MinMaxDoubleConstraintInterface.__index = MinMaxDoubleConstraintInterface
MinMaxDoubleConstraintInterface.className = "MinMaxDoubleConstraintInterface"


function MinMaxDoubleConstraintInterface:getMax()
    error("abstract method getMax")
end


function MinMaxDoubleConstraintInterface:getMin()
    error("abstract method getMin")
end


function MinMaxDoubleConstraintInterface:setMax(max)
    error("abstract method setMax")
end


function MinMaxDoubleConstraintInterface:setMin(min)
    error("abstract method setMin")
end

return MinMaxDoubleConstraintInterface

