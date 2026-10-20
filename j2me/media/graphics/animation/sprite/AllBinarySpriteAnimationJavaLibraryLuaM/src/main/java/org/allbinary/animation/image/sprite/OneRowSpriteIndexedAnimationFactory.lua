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
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")
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

local OneRowSpriteIndexedAnimationFactory = {}
OneRowSpriteIndexedAnimationFactory.__index = OneRowSpriteIndexedAnimationFactory
OneRowSpriteIndexedAnimationFactory.className = "OneRowSpriteIndexedAnimationFactory"
setmetatable(OneRowSpriteIndexedAnimationFactory, {__index = BaseImageAnimationFactory})

function OneRowSpriteIndexedAnimationFactory:_init_fields()
    self.animationFactorySpriteScaleUtil = AnimationFactorySpriteScaleUtil.getInstance()
end


-- throws Exception
function OneRowSpriteIndexedAnimationFactory.createFactoryDX(image, dx, animationBehaviorFactory)
        local oneRowSpriteIndexedAnimationFactory = OneRowSpriteIndexedAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), image:getHeight(), image:getHeight(), 0, 0, animationBehaviorFactory)
        oneRowSpriteIndexedAnimationFactory:initW(dx)
        return oneRowSpriteIndexedAnimationFactory
end


-- throws Exception
function OneRowSpriteIndexedAnimationFactory.createFactoryDXY(image, dx, dy, animationBehaviorFactory)
        local oneRowSpriteIndexedAnimationFactory = OneRowSpriteIndexedAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), image:getHeight(), image:getHeight(), 0, 0, animationBehaviorFactory)
        oneRowSpriteIndexedAnimationFactory:init(dx, dy)
        return oneRowSpriteIndexedAnimationFactory
end


-- throws Exception
function OneRowSpriteIndexedAnimationFactory.createFactoryWH(image, width, height, animationBehaviorFactory)
        return OneRowSpriteIndexedAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory)
end


-- throws Exception
function OneRowSpriteIndexedAnimationFactory.createFactory(image, animationBehaviorFactory)
        return OneRowSpriteIndexedAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), image:getHeight(), image:getHeight(), 0, 0, animationBehaviorFactory)
end


function OneRowSpriteIndexedAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, sequenceArray, width, height, dx, dy, animationBehaviorFactory), OneRowSpriteIndexedAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function OneRowSpriteIndexedAnimationFactory:init(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
end


function OneRowSpriteIndexedAnimationFactory:initW(dx)
        self:init(dx, 0)
        self.animationFactoryInitializationVisitor.dx = self.animationFactoryInitializationVisitor.dx + (-(((self.animationFactoryInitializationVisitor.width) // (1 << (2)))))
end


-- throws Exception
function OneRowSpriteIndexedAnimationFactory:getInstance(instanceId)
        local sprite = self.animationFactorySpriteScaleUtil:createImage(self:getImage(), self.animationFactoryInitializationVisitor.width, self.animationFactoryInitializationVisitor.height, self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            return AdjustedSpriteIndexedAnimation.new(sprite, self:getImage(), BasicColorUtil.getInstance().ZERO_ARRAY, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return SpriteIndexedAnimation.new(sprite, self:getImage(), BasicColorUtil.getInstance().ZERO_ARRAY, self.animationBehaviorFactory:getOrCreateInstance())
        end
end

return OneRowSpriteIndexedAnimationFactory

