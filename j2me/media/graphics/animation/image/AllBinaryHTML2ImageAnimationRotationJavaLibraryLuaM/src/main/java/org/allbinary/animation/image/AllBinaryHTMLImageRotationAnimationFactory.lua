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

local AllBinaryHTMLImageRotationAnimationFactory = {}
AllBinaryHTMLImageRotationAnimationFactory.__index = AllBinaryHTMLImageRotationAnimationFactory
AllBinaryHTMLImageRotationAnimationFactory.className = "AllBinaryHTMLImageRotationAnimationFactory"
setmetatable(AllBinaryHTMLImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryHTMLImageRotationAnimationFactory:_init_fields()
    self.angleIncrement = nil
end


-- throws Exception
function AllBinaryHTMLImageRotationAnimationFactory.createFactoryADXY(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory)
        local htmlImageRotationAnimationFactory = AllBinaryHTMLImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory)
        htmlImageRotationAnimationFactory:init(dx, dy)
        return htmlImageRotationAnimationFactory
end


function AllBinaryHTMLImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), AllBinaryHTMLImageRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.angleIncrement = angleIncrement
    return self
end


function AllBinaryHTMLImageRotationAnimationFactory:init(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
        self.animationFactoryInitializationVisitor.originalDx = dx
        self.animationFactoryInitializationVisitor.originalDy = dy
end


-- throws Exception
function AllBinaryHTMLImageRotationAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local copyOfScaledImage = ImageCopyUtil.getInstance():createImage(scaledImage)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AllBinaryAdjustedHTMLImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self:getAngleIncrement()), AngleFactory.getInstance().TOTAL_ANGLE, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AllBinaryHTMLImageRotationAnimation.new(scaledImage, copyOfScaledImage, AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
        end
end


function AllBinaryHTMLImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end

return AllBinaryHTMLImageRotationAnimationFactory

