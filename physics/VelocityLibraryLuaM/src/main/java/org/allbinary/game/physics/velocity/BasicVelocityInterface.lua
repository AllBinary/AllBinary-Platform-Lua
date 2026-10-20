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
-- package org.allbinary.game.physics.velocity

local Direction = require("org.allbinary.direction.Direction")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
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
local BasicVelocityInterface = {}
BasicVelocityInterface.__index = BasicVelocityInterface
BasicVelocityInterface.className = "BasicVelocityInterface"


function BasicVelocityInterface:getVelocityXBasicDecimalP()
    error("abstract method getVelocityXBasicDecimalP")
end


function BasicVelocityInterface:getVelocityYBasicDecimalP()
    error("abstract method getVelocityYBasicDecimalP")
end


function BasicVelocityInterface:zero()
    error("abstract method zero")
end


function BasicVelocityInterface:setVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
    error("abstract method setVelocityWithBigDecimalAndDirection")
end


function BasicVelocityInterface:addVelocityWithBigDecimalAndDirection(magnitudeBasicDecimal, direction, otherDirection)
    error("abstract method addVelocityWithBigDecimalAndDirection")
end


function BasicVelocityInterface:setVelocityWithDirection(magnitude, direction, otherDirection)
    error("abstract method setVelocityWithDirection")
end


function BasicVelocityInterface:addVelocityWithDirection(magnitude, direction, otherDirection)
    error("abstract method addVelocityWithDirection")
end


function BasicVelocityInterface:setVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
    error("abstract method setVelocityWithBigDecimal")
end


function BasicVelocityInterface:addVelocityWithBigDecimal(magnitudeBasicDecimal, angle, otherAngle)
    error("abstract method addVelocityWithBigDecimal")
end


function BasicVelocityInterface:setVelocity(magnitude, angle, otherAngle)
    error("abstract method setVelocity")
end


function BasicVelocityInterface:addVelocity(magnitude, angle, otherAngle)
    error("abstract method addVelocity")
end


function BasicVelocityInterface:addVelocityi(magnitude, angle, otherAngle)
    error("abstract method addVelocityi")
end

return BasicVelocityInterface

