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

local ImageRotationAnimationFactory = {}
ImageRotationAnimationFactory.__index = ImageRotationAnimationFactory
ImageRotationAnimationFactory.className = "ImageRotationAnimationFactory"
setmetatable(ImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function ImageRotationAnimationFactory:_init_fields()
    self.angleIncrement = nil
end


function ImageRotationAnimationFactory.new(image, width, height, dx, dy, angleIncrement, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), ImageRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.angleIncrement = angleIncrement
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
    return self
end


-- throws Exception
function ImageRotationAnimationFactory:getInstance(instanceId)
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AdjustedImageBaseRotationAnimation.new(self:getImage(), AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageBaseRotationAnimation.new(self:getImage(), AngleInfo.getInstance(self.angleIncrement), AngleFactory.getInstance().TOTAL_ANGLE, self.animationBehaviorFactory:getOrCreateInstance())
        end
end


function ImageRotationAnimationFactory:getAngleIncrementP()
        return self.angleIncrement
end

return ImageRotationAnimationFactory

