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
local AndroidUtil = require("org.allbinary.AndroidUtil")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorUtil = require("org.allbinary.graphics.color.BasicColorUtil")
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

local SpriteIndexedAnimationFactory = {}
SpriteIndexedAnimationFactory.__index = SpriteIndexedAnimationFactory
SpriteIndexedAnimationFactory.className = "SpriteIndexedAnimationFactory"
setmetatable(SpriteIndexedAnimationFactory, {__index = BaseImageAnimationFactory})

function SpriteIndexedAnimationFactory:_init_fields()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
    self.basicColorArray = BasicColorUtil.getInstance().ZERO_ARRAY
end


-- throws Exception
function SpriteIndexedAnimationFactory.createCWHDXY(image, basicColorArray, width, height, dx, dy, animationBehaviorFactory)
        return SpriteIndexedAnimationFactory.new(image, basicColorArray, PrimitiveIntUtil.getArrayInstance(), width, height, dx, dy, animationBehaviorFactory)
end


-- throws Exception
function SpriteIndexedAnimationFactory.createCWH(image, basicColorArray, width, height, animationBehaviorFactory)
        local spriteIndexedAnimationFactory = SpriteIndexedAnimationFactory.new(image, basicColorArray, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
        spriteIndexedAnimationFactory:initHWH()
        return spriteIndexedAnimationFactory
end


-- throws Exception
function SpriteIndexedAnimationFactory.createWH(image, width, height, animationBehaviorFactory)
        return SpriteIndexedAnimationFactory.new(image, BasicColorUtil.getInstance().ZERO_ARRAY, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
end


function SpriteIndexedAnimationFactory.new(image, basicColorArray, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory), SpriteIndexedAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.basicColorArray = basicColorArray
    return self
end


function SpriteIndexedAnimationFactory:initHWH()
        self.animationFactoryInitializationVisitor.dx = -(((self.animationFactoryInitializationVisitor.width) // (1 << (2))))
        self.animationFactoryInitializationVisitor.dy = -(((self.animationFactoryInitializationVisitor.height) // (1 << (2))))
        if AndroidUtil.isAndroid() then
            self.animationFactoryInitializationVisitor.dx = self.animationFactoryInitializationVisitor.dx + (3)
        end
end


-- throws Exception
function SpriteIndexedAnimationFactory:getInstance(instanceId)
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            return AdjustedSpriteIndexedAnimation.new(sprite, self:getImage(), self.basicColorArray, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return SpriteIndexedAnimation.new(sprite, self:getImage(), self.basicColorArray, self.animationBehaviorFactory:getOrCreateInstance())
        end
end


-- throws Exception
function SpriteIndexedAnimationFactory:getInstanceAnimation(animationInterface)
        return self:getInstance(0)
end

return SpriteIndexedAnimationFactory

