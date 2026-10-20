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
-- package org.allbinary.animation.image

local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local SingletonAnimationInterfaceFactory = require("org.allbinary.animation.SingletonAnimationInterfaceFactory")
local AnimationFrameToImageUtil = require("org.allbinary.image.AnimationFrameToImageUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageAnimationSingletonInterfaceFactory = {}
ImageAnimationSingletonInterfaceFactory.__index = ImageAnimationSingletonInterfaceFactory
ImageAnimationSingletonInterfaceFactory.className = "ImageAnimationSingletonInterfaceFactory"
setmetatable(ImageAnimationSingletonInterfaceFactory, {__index = SingletonAnimationInterfaceFactory})


function ImageAnimationSingletonInterfaceFactory.new(animationInterface, width, height)
    local self = setmetatable(SingletonAnimationInterfaceFactory.new(ImageAnimation.new(AnimationFrameToImageUtil.getInstance():getInstanceWH(width, height, animationInterface), AnimationBehavior.getInstance())), ImageAnimationSingletonInterfaceFactory)
        -- super(...) made self above
    return self
end

return ImageAnimationSingletonInterfaceFactory

