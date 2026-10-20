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
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local NullUtil = require("org.allbinary.logic.NullUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local ImageToRotationImageArrayUtil = require("org.allbinary.media.image.ImageToRotationImageArrayUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--TWB - Adjustments should be done in the resource creation and not at the animation level
local PooledImageArrayRotationAnimationFactory = {}
PooledImageArrayRotationAnimationFactory.__index = PooledImageArrayRotationAnimationFactory
PooledImageArrayRotationAnimationFactory.className = "PooledImageArrayRotationAnimationFactory"

function PooledImageArrayRotationAnimationFactory:_init_fields()
    self.allBinaryImageRotationAnimationInfo = NullUtil.getInstance().NULL_OBJECT
    self.animationBehaviorFactory = nil
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory.createFactory(image, animationBehaviorFactory)
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local angleIncrement = (totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())
        return PooledImageArrayRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), -(((image:getWidth()) // (1 << (2)))), -(((image:getHeight()) // (1 << (2)))), angleIncrement, animationBehaviorFactory)
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory.createDXY(image, dx, dy, animationBehaviorFactory)
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local angleIncrement = (totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())
        return PooledImageArrayRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), dx, dy, angleIncrement, animationBehaviorFactory)
end


function PooledImageArrayRotationAnimationFactory.new(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory)
    local self = setmetatable({}, PooledImageArrayRotationAnimationFactory)
    self:_init_fields()
        self.animationBehaviorFactory = animationBehaviorFactory
        local totalAngle = java_int(AngleFactory.getInstance().TOTAL_ANGLE)
        local imageArray = ImageToRotationImageArrayUtil.getInstance():generate(image, angleIncrement, totalAngle)
        self.allBinaryImageRotationAnimationInfo = ImageArrayRotationAnimationInfo.new(imageArray, angleIncrement, totalAngle, dx, dy)
    return self
end


-- throws Exception
function PooledImageArrayRotationAnimationFactory:getInstance(instanceId)
        return AdjustedImageArrayRotationAnimation.createAdjustedImageArrayRotationAnimationInfo(self.allBinaryImageRotationAnimationInfo, self.animationBehaviorFactory:getOrCreateInstance())
end


function PooledImageArrayRotationAnimationFactory:setInitialScale(scaleProperties)
end

return PooledImageArrayRotationAnimationFactory

