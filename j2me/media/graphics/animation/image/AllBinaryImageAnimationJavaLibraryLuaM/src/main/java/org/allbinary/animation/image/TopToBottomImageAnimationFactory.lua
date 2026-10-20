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

local TopToBottomImageAnimationFactory = {}
TopToBottomImageAnimationFactory.__index = TopToBottomImageAnimationFactory
TopToBottomImageAnimationFactory.className = "TopToBottomImageAnimationFactory"
setmetatable(TopToBottomImageAnimationFactory, {__index = BaseImageAnimationFactory})


function TopToBottomImageAnimationFactory.new(image, sequenceArray, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, sequenceArray, image:getWidth(), image:getHeight(), 0, 0, animationBehaviorFactory), TopToBottomImageAnimationFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function TopToBottomImageAnimationFactory:getInstance(instanceId)
        local scaledImage = self.animationFactoryImageScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        return TopToBottomImageAnimation.new(scaledImage, self:getSequenceArray(), self.animationBehaviorFactory:getOrCreateInstance())
end

return TopToBottomImageAnimationFactory

