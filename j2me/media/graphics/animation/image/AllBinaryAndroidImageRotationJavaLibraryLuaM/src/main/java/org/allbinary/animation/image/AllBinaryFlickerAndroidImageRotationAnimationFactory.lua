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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryFlickerAndroidImageRotationAnimationFactory = {}
AllBinaryFlickerAndroidImageRotationAnimationFactory.__index = AllBinaryFlickerAndroidImageRotationAnimationFactory
AllBinaryFlickerAndroidImageRotationAnimationFactory.className = "AllBinaryFlickerAndroidImageRotationAnimationFactory"

function AllBinaryFlickerAndroidImageRotationAnimationFactory:_init_fields()
    self.image = NullImage.NULL_IMAGE
    self.angleIncrement = nil
    self.animationBehaviorFactory = nil
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory)
    local self = setmetatable({}, AllBinaryFlickerAndroidImageRotationAnimationFactory)
    self:_init_fields()
        self:setImage(image)
        self.angleIncrement = angleIncrement
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function AllBinaryFlickerAndroidImageRotationAnimationFactory:getInstance(instanceId)
        local image = ImageCopyUtil.getInstance():createImage(self:getImage())
        return AllBinaryFlickerAndroidImageRotationAnimation.new(self:getImage(), image, AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:setImage(image)
        self.image = image
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:getImage()
        return self.image
end


function AllBinaryFlickerAndroidImageRotationAnimationFactory:setInitialScale(scaleProperties)
end

return AllBinaryFlickerAndroidImageRotationAnimationFactory

