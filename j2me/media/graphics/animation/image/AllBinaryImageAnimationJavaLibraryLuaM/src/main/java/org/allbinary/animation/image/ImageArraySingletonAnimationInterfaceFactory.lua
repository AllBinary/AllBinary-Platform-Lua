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

-- local Image = require("javax.microedition.lcdui.Image")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local SingletonAnimationInterfaceFactory = require("org.allbinary.animation.SingletonAnimationInterfaceFactory")
local IndexedAnimationToImageArrayUtil = require("org.allbinary.image.IndexedAnimationToImageArrayUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArraySingletonAnimationInterfaceFactory = {}
ImageArraySingletonAnimationInterfaceFactory.__index = ImageArraySingletonAnimationInterfaceFactory
ImageArraySingletonAnimationInterfaceFactory.className = "ImageArraySingletonAnimationInterfaceFactory"
setmetatable(ImageArraySingletonAnimationInterfaceFactory, {__index = SingletonAnimationInterfaceFactory})


function ImageArraySingletonAnimationInterfaceFactory.new(imageArray)
    local self = setmetatable(SingletonAnimationInterfaceFactory.new(ImageArrayAnimation.new(imageArray, AnimationBehavior.getInstance())), ImageArraySingletonAnimationInterfaceFactory)
        -- super(...) made self above
    return self
end

return ImageArraySingletonAnimationInterfaceFactory

