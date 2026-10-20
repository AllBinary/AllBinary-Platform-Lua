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
-- package org.allbinary.animation.compound

local AnimationInterface = require("org.allbinary.animation.AnimationInterface")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")

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
local CompoundAnimationInterface = {}
CompoundAnimationInterface.__index = CompoundAnimationInterface
CompoundAnimationInterface.className = "CompoundAnimationInterface"
setmetatable(CompoundAnimationInterface, {__index = AnimationInterface})


function CompoundAnimationInterface:nextAnimation()
    error("abstract method nextAnimation")
end


function CompoundAnimationInterface:previousAnimation()
    error("abstract method previousAnimation")
end


function CompoundAnimationInterface:setAnimation(index)
    error("abstract method setAnimation")
end


function CompoundAnimationInterface:getCurrentAnimation()
    error("abstract method getCurrentAnimation")
end

return CompoundAnimationInterface

