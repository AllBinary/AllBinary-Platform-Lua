-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local J2SEMath = {}
J2SEMath.__index = J2SEMath
J2SEMath.className = "J2SEMath"

function J2SEMath.new()
    local self = setmetatable({}, J2SEMath)
    return self
end


function J2SEMath.getInstance()
        return J2SEMath.instance
end


function J2SEMath:round(value)
        return math.floor(value + 0.5)
end


function J2SEMath:abs(value)
        return (function() if (value < 0.0) then return -value else return value end end)()
end


function J2SEMath:absdouble(value)
        return (function() if (value < 0.0) then return -value else return value end end)()
end

J2SEMath.instance = J2SEMath.new()

return J2SEMath

