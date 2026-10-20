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
-- package org.allbinary.animation.image.sprite

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local AnimationFactorySpriteScaleUtil = require("org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorCompositeSpriteIndexedAnimationFactory = {}
ColorCompositeSpriteIndexedAnimationFactory.__index = ColorCompositeSpriteIndexedAnimationFactory
ColorCompositeSpriteIndexedAnimationFactory.className = "ColorCompositeSpriteIndexedAnimationFactory"
setmetatable(ColorCompositeSpriteIndexedAnimationFactory, {__index = BaseImageAnimationFactory})

function ColorCompositeSpriteIndexedAnimationFactory:_init_fields()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
    self.basicColorArray = nil
end


function ColorCompositeSpriteIndexedAnimationFactory.new(image, basicColorArray, width, height, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), ColorCompositeSpriteIndexedAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.basicColorArray = basicColorArray
    return self
end


-- throws Exception
function ColorCompositeSpriteIndexedAnimationFactory:getInstance(instanceId)
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        return SpriteIndexedAnimation.new(sprite, self:getImage(), self.basicColorArray, self.animationBehaviorFactory:getOrCreateInstance())
end


-- throws Exception
function ColorCompositeSpriteIndexedAnimationFactory:getInstanceAnimation(animationInterface)
        return self:getInstance(0)
end

return ColorCompositeSpriteIndexedAnimationFactory

