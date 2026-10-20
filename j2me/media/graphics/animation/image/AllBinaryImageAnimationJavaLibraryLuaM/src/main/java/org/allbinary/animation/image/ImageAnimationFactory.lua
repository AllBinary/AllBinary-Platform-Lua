-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
local OpenGLUtil = require("org.allbinary.graphics.opengles.OpenGLUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
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

local ImageAnimationFactory = {}
ImageAnimationFactory.__index = ImageAnimationFactory
ImageAnimationFactory.className = "ImageAnimationFactory"
setmetatable(ImageAnimationFactory, {__index = BaseImageAnimationFactory})


-- throws Exception
function ImageAnimationFactory.createFactory(image)
        return ImageAnimationFactory.new(image, image:getWidth(), image:getHeight(), 0, 0, AnimationBehaviorFactory.getInstance())
end


function ImageAnimationFactory.new(image, width, height, dx, dy, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, dx, dy, animationBehaviorFactory), ImageAnimationFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function ImageAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        local openGLUtil = OpenGLUtil.getInstance()
        scaledImage = openGLUtil:addImage(scaledImage)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AdjustedImageAnimation.new(scaledImage, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageAnimation.new(scaledImage, self.animationBehaviorFactory:getOrCreateInstance())
        end
end

return ImageAnimationFactory

