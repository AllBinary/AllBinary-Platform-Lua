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

local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local CompoundAnimationInterfaceFactory = require("org.allbinary.animation.compound.CompoundAnimationInterfaceFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompoundRotationAnimationInterfaceFactory = {}
CompoundRotationAnimationInterfaceFactory.__index = CompoundRotationAnimationInterfaceFactory
CompoundRotationAnimationInterfaceFactory.className = "CompoundRotationAnimationInterfaceFactory"
setmetatable(CompoundRotationAnimationInterfaceFactory, {__index = CompoundAnimationInterfaceFactory})


function CompoundRotationAnimationInterfaceFactory.new(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory)
    local self = setmetatable(CompoundAnimationInterfaceFactory.new(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory), CompoundRotationAnimationInterfaceFactory)
        -- super(...) made self above
        if animationBehaviorFactory == AnimationBehaviorFactory.getInstance() then
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", self)
        end
    return self
end


function CompoundRotationAnimationInterfaceFactory:createArray(size)
        return java_new_array(nil, size)
end


function CompoundRotationAnimationInterfaceFactory:createAnimation(animationInterfaceArray)
        return CompoundRotationAnimation.new(animationInterfaceArray, self.animationBehaviorFactory:getOrCreateInstance())
end

return CompoundRotationAnimationInterfaceFactory

