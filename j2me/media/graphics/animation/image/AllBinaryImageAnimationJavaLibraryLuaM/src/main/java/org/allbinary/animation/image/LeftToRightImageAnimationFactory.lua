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

local LeftToRightImageAnimationFactory = {}
LeftToRightImageAnimationFactory.__index = LeftToRightImageAnimationFactory
LeftToRightImageAnimationFactory.className = "LeftToRightImageAnimationFactory"
setmetatable(LeftToRightImageAnimationFactory, {__index = BaseImageAnimationFactory})


function LeftToRightImageAnimationFactory.new(image, sequenceArray, dx, dy, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, sequenceArray, image:getWidth(), image:getHeight(), dx, dy, animationBehaviorFactory), LeftToRightImageAnimationFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function LeftToRightImageAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AdjustedLeftToRightImageAnimation.new(scaledImage, self:getSequenceArray(), self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return LeftToRightImageAnimation.new(scaledImage, self:getSequenceArray(), self.animationBehaviorFactory:getOrCreateInstance())
        end
end

return LeftToRightImageAnimationFactory

