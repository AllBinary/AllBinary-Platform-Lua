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
-- package org.allbinary.direction

local Angle = require("org.allbinary.math.Angle")

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
local DirectionalInterface = {}
DirectionalInterface.__index = DirectionalInterface
DirectionalInterface.className = "DirectionalInterface"


function DirectionalInterface:setFrameByDirection(direction)
    error("abstract method setFrameByDirection")
end


function DirectionalInterface:setFrameToAngle(angle)
    error("abstract method setFrameToAngle")
end


function DirectionalInterface:adjustFrameToAngle(newAngle)
    error("abstract method adjustFrameToAngle")
end


function DirectionalInterface:adjustFrame(angle)
    error("abstract method adjustFrame")
end

return DirectionalInterface

