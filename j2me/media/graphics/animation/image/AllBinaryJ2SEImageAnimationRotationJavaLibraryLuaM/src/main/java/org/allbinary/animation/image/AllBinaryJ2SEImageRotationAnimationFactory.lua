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
local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLUtil = require("org.allbinary.graphics.opengles.OpenGLUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
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

local AllBinaryJ2SEImageRotationAnimationFactory = {}
AllBinaryJ2SEImageRotationAnimationFactory.__index = AllBinaryJ2SEImageRotationAnimationFactory
AllBinaryJ2SEImageRotationAnimationFactory.className = "AllBinaryJ2SEImageRotationAnimationFactory"
setmetatable(AllBinaryJ2SEImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryJ2SEImageRotationAnimationFactory:_init_fields()
    self.angleIncrementP = nil
    self.resizeCanvasForRotation = nil
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory.createDXY(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        local imageRotationAnimationFactory = AllBinaryJ2SEImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dx = dx
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.dy = dy
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDx = dx
        imageRotationAnimationFactory.animationFactoryInitializationVisitor.originalDy = dy
        return imageRotationAnimationFactory
end


function AllBinaryJ2SEImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory, resizeCanvasForRotation)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), AllBinaryJ2SEImageRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.angleIncrementP = angleIncrement
        self.resizeCanvasForRotation = resizeCanvasForRotation
    return self
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory:getCanvasImage()
        local features = Features.getInstance()
        if self.resizeCanvasForRotation and not features:isDefault(OpenGLFeatureFactory.getInstance().OPENGL) then
            return ImageCopyUtil.getInstance():createImageScale(self:getImage(), 1.44, false)
        else
            return self:getImage()
        end
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimationFactory:getInstance(instanceId)
        local imageCopyUtil = ImageCopyUtil.getInstance()
        local canvasImage = self:getCanvasImage()
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(canvasImage, self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local openGLUtil = OpenGLUtil.getInstance()
        scaledImage = openGLUtil:addImage(scaledImage)
        local copyOfScaledImage = imageCopyUtil:createImageForRotation(scaledImage)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AllBinaryAdjustedJ2SEImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AllBinaryJ2SEImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrementP), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
        end
end


function AllBinaryJ2SEImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrementP
end

return AllBinaryJ2SEImageRotationAnimationFactory

