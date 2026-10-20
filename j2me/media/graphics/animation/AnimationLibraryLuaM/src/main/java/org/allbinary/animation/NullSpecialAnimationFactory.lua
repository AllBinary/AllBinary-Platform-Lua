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
-- package org.allbinary.animation

local SpecialAnimation = require("org.allbinary.animation.special.SpecialAnimation")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullSpecialAnimationFactory = {}
NullSpecialAnimationFactory.__index = NullSpecialAnimationFactory
NullSpecialAnimationFactory.className = "NullSpecialAnimationFactory"


function NullSpecialAnimationFactory.new()
    local self = setmetatable({}, NullSpecialAnimationFactory)
    return self
end


function NullSpecialAnimationFactory.getFactoryInstance()
        return NullSpecialAnimationFactory.NULL_SPECIAL_ANIMATION_FACTORY
end


-- throws Exception
function NullSpecialAnimationFactory:getInstance(instanceId)
        return SpecialAnimation.getInstance()
end


-- throws Exception
function NullSpecialAnimationFactory:getInstanceAnimation(animationInterface)
        return SpecialAnimation.getInstance()
end


function NullSpecialAnimationFactory:setInitialScale(scaleProperties)
end

NullSpecialAnimationFactory.NULL_SPECIAL_ANIMATION_FACTORY = NullSpecialAnimationFactory.new()

return NullSpecialAnimationFactory

