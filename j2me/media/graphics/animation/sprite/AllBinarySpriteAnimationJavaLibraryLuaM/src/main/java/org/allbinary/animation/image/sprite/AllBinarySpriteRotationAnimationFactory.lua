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
local AnimationFactorySpriteScaleUtil = require("org.allbinary.image.sprite.AnimationFactorySpriteScaleUtil")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
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

local AllBinarySpriteRotationAnimationFactory = {}
AllBinarySpriteRotationAnimationFactory.__index = AllBinarySpriteRotationAnimationFactory
AllBinarySpriteRotationAnimationFactory.className = "AllBinarySpriteRotationAnimationFactory"
setmetatable(AllBinarySpriteRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinarySpriteRotationAnimationFactory:_init_fields()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createWHDY(image, dx, dy, animationBehaviorFactory)
        local spriteRotationAnimationFactory = AllBinarySpriteRotationAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), (((image:getHeight()) // (1 << (2)))), (((image:getHeight()) // (1 << (2)))), 0, 0, animationBehaviorFactory)
        spriteRotationAnimationFactory:initWH(dx, dy)
        return spriteRotationAnimationFactory
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createWH(image, animationBehaviorFactory)
        return AllBinarySpriteRotationAnimationFactory.createWHDY(image, 0, 0, animationBehaviorFactory)
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createDXY(image, dx, dy, animationBehaviorFactory)
        local spriteRotationAnimationFactory = AllBinarySpriteRotationAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), image:getHeight(), image:getHeight(), 0, 0, animationBehaviorFactory)
        spriteRotationAnimationFactory:init(dx, dy)
        return spriteRotationAnimationFactory
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createDXYQ(image, dx, dy, animationBehaviorFactory)
        local spriteRotationAnimationFactory = AllBinarySpriteRotationAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), (((image:getHeight()) // (1 << (2)))), (((image:getHeight()) // (1 << (2)))), 0, 0, animationBehaviorFactory)
        spriteRotationAnimationFactory:init(dx, dy)
        return spriteRotationAnimationFactory
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createQ(image, animationBehaviorFactory)
        return AllBinarySpriteRotationAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), (((image:getHeight()) // (1 << (2)))), (((image:getHeight()) // (1 << (2)))), 0, 0, animationBehaviorFactory)
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory.createWHF(image, animationBehaviorFactory)
        return AllBinarySpriteRotationAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), image:getHeight(), image:getHeight(), 0, 0, animationBehaviorFactory)
end


function AllBinarySpriteRotationAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory), AllBinarySpriteRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        if animationBehaviorFactory == AnimationBehaviorFactory.getInstance() then
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", self)
        end
    return self
end


function AllBinarySpriteRotationAnimationFactory:init(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
end


function AllBinarySpriteRotationAnimationFactory:initWH(dx, dy)
        self:init(dx, dy)
        self.animationFactoryInitializationVisitor.dx = self.animationFactoryInitializationVisitor.dx + (-self.animationFactoryInitializationVisitor.width / 5)
        self.animationFactoryInitializationVisitor.dy = self.animationFactoryInitializationVisitor.dy + (-self.animationFactoryInitializationVisitor.height / 5)
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory:getInstance(instanceId)
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            return AllBinaryAdjustedSpriteRotationAnimation.new(sprite, self:getImage(), self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return AllBinarySpriteRotationAnimation.new(sprite, self:getImage(), self.animationBehaviorFactory:getOrCreateInstance())
        end
end


-- throws Exception
function AllBinarySpriteRotationAnimationFactory:getInstanceAnimation(animationInterface)
        return self:getInstance(0)
end

return AllBinarySpriteRotationAnimationFactory

