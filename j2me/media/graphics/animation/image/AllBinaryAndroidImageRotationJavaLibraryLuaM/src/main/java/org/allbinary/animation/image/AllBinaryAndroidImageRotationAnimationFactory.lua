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
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
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

local AllBinaryAndroidImageRotationAnimationFactory = {}
AllBinaryAndroidImageRotationAnimationFactory.__index = AllBinaryAndroidImageRotationAnimationFactory
AllBinaryAndroidImageRotationAnimationFactory.className = "AllBinaryAndroidImageRotationAnimationFactory"
setmetatable(AllBinaryAndroidImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryAndroidImageRotationAnimationFactory:_init_fields()
    self.angleIncrement = nil
    self.resizeCanvasForRotation = nil
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory.createFactory(image, width, height, animationBehaviorFactory)
        return AllBinaryAndroidImageRotationAnimationFactory.new(image, width, height, java_int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity())), animationBehaviorFactory, false)
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory.createFactoryA(image, width, height, angleIncrement, animationBehaviorFactory)
        return AllBinaryAndroidImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, false)
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory.createFactoryU(image, animationBehaviorFactory)
        local androidImageRotationAnimationFactory = AllBinaryAndroidImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), java_int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity())), animationBehaviorFactory, false)
        androidImageRotationAnimationFactory:init(-(((image:getWidth()) // (1 << (2)))), -(((image:getHeight()) // (1 << (2)))))
        return androidImageRotationAnimationFactory
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory.createFactoryDXYU(image, dx, dy, animationBehaviorFactory)
        local androidImageRotationAnimationFactory = AllBinaryAndroidImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), java_int((AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity())), animationBehaviorFactory, false)
        androidImageRotationAnimationFactory:init(dx, dy)
        return androidImageRotationAnimationFactory
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory.createFactoryADXY(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        local androidImageRotationAnimationFactory = AllBinaryAndroidImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        androidImageRotationAnimationFactory:init(dx, dy)
        return androidImageRotationAnimationFactory
end


function AllBinaryAndroidImageRotationAnimationFactory:init(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
        self.animationFactoryInitializationVisitor.originalDx = dx
        self.animationFactoryInitializationVisitor.originalDy = dy
end


function AllBinaryAndroidImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), AllBinaryAndroidImageRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.angleIncrement = angleIncrement
        self.resizeCanvasForRotation = resizeCanvasForRotation
    return self
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory:getCanvasImage()
        local features = Features.getInstance()
        if self.resizeCanvasForRotation and not features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            return ImageCopyUtil.getInstance():createImageScale(self:getImage(), 1.44, false)
        else
            return self:getImage()
        end
end


-- throws Exception
function AllBinaryAndroidImageRotationAnimationFactory:getInstance(instanceId)
        local canvasImage = self:getCanvasImage()
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(canvasImage, self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local copyOfScaledImage = ImageCopyUtil.getInstance():createImage(scaledImage)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AllBinaryAdjustedAndroidImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AllBinaryFlickerAndroidImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
        end
end

return AllBinaryAndroidImageRotationAnimationFactory

