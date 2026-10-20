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

local BasicVelocityInterface = require("org.allbinary.game.physics.velocity.BasicVelocityInterface")

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
local VelocityInterface = {}
VelocityInterface.__index = VelocityInterface
VelocityInterface.className = "VelocityInterface"
setmetatable(VelocityInterface, {__index = BasicVelocityInterface})


function VelocityInterface:getMaxForwardVelocity()
    error("abstract method getMaxForwardVelocity")
end


function VelocityInterface:getMaxReverseVelocity()
    error("abstract method getMaxReverseVelocity")
end


function VelocityInterface:limitMaxXYForwardVelocity()
    error("abstract method limitMaxXYForwardVelocity")
end


function VelocityInterface:limitMaxXYReverseVelocity()
    error("abstract method limitMaxXYReverseVelocity")
end


function VelocityInterface:limitXYToForwardAndReverseMaxVelocity()
    error("abstract method limitXYToForwardAndReverseMaxVelocity")
end


function VelocityInterface:limitMaxXYVelocity(maxVelocity)
    error("abstract method limitMaxXYVelocity")
end


function VelocityInterface:setMaxForwardVelocity(maxForwardVelocity)
    error("abstract method setMaxForwardVelocity")
end


function VelocityInterface:setMaxReverseVelocity(maxReverseVelocity)
    error("abstract method setMaxReverseVelocity")
end

return VelocityInterface

