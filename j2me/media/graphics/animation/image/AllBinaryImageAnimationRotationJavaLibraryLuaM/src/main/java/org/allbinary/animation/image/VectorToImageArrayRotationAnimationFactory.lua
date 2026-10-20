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
local VectorAnimation = require("org.allbinary.animation.VectorAnimation")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local AnimationFrameToImageUtil = require("org.allbinary.image.AnimationFrameToImageUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local ImageToRotationImageArrayUtil = require("org.allbinary.media.image.ImageToRotationImageArrayUtil")
local VectorInfo = require("org.allbinary.vector.VectorInfo")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorToImageArrayRotationAnimationFactory = {}
VectorToImageArrayRotationAnimationFactory.__index = VectorToImageArrayRotationAnimationFactory
VectorToImageArrayRotationAnimationFactory.className = "VectorToImageArrayRotationAnimationFactory"
setmetatable(VectorToImageArrayRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function VectorToImageArrayRotationAnimationFactory:_init_fields()
    self.imageArray = NullImage.NULL_IMAGE_ARRAY
    self.angleIncrement = 0
end


function VectorToImageArrayRotationAnimationFactory.new(vectorInfo, basicColor, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(AnimationFrameToImageUtil.getInstance():getInstanceTranslate(vectorInfo:getWidth(), vectorInfo:getHeight(), VectorAnimation.createVectorAnimation(vectorInfo:getPoints(), basicColor, animationBehaviorFactory:getOrCreateInstance())), PrimitiveIntUtil.getArrayInstance(), 0, 0, 0, 0, animationBehaviorFactory), VectorToImageArrayRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self:init()
    return self
end


-- throws Exception
function VectorToImageArrayRotationAnimationFactory:init()
        local angleFactory = AngleFactory.getInstance()
        self.angleIncrement = angleFactory.TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity()
        self.imageArray = ImageToRotationImageArrayUtil.getInstance():generate(self:getImage(), self:getAngleIncrement(), java_int(angleFactory.TOTAL_ANGLE))
end


-- throws Exception
function VectorToImageArrayRotationAnimationFactory:getInstance(instanceId)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            return AdjustedImageArrayRotationAnimation.new(self.imageArray, AngleInfo.getInstance(self:getAngleIncrement()), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AdjustedImageArrayRotationAnimation.createAnimation(self.imageArray, AngleInfo.getInstance(self.angleIncrement), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationBehaviorFactory:getOrCreateInstance())
        end
end


function VectorToImageArrayRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end


function VectorToImageArrayRotationAnimationFactory:setInitialScale(scaleProperties)
end

return VectorToImageArrayRotationAnimationFactory

