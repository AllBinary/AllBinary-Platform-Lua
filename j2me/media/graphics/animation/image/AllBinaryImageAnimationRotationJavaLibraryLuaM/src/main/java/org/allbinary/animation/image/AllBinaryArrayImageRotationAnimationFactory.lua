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
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageToRotationImageArrayUtil = require("org.allbinary.media.image.ImageToRotationImageArrayUtil")
local BaseImageAnimationFactory = require("org.allbinary.animation.image.BaseImageAnimationFactory")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryArrayImageRotationAnimationFactory = {}
AllBinaryArrayImageRotationAnimationFactory.__index = AllBinaryArrayImageRotationAnimationFactory
AllBinaryArrayImageRotationAnimationFactory.className = "AllBinaryArrayImageRotationAnimationFactory"
setmetatable(AllBinaryArrayImageRotationAnimationFactory, {__index = BaseImageAnimationFactory})

function AllBinaryArrayImageRotationAnimationFactory:_init_fields()
    self.imageArray = NullImage.NULL_IMAGE_ARRAY
    self.angleIncrement = nil
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory.createFactory(image, dx, dy)
        local arrayImageRotationAnimationFactory = AllBinaryArrayImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), AngleFactory.getInstance().TOTAL_ANGLE / GameConfigurationCentral.getInstance():getGameControlFidelity(), AnimationBehaviorFactory.getInstance())
        arrayImageRotationAnimationFactory:initDXY(dx, dy)
        return arrayImageRotationAnimationFactory
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory.createFactoryA(image, dx, dy, angleIncrement)
        local arrayImageRotationAnimationFactory = AllBinaryArrayImageRotationAnimationFactory.new(image, image:getWidth(), image:getHeight(), angleIncrement, AnimationBehaviorFactory.getInstance())
        arrayImageRotationAnimationFactory:initDXY(dx, dy)
        return arrayImageRotationAnimationFactory
end


function AllBinaryArrayImageRotationAnimationFactory.new(image, width, height, angleIncrement, animationBehaviorFactory)
    local self = setmetatable(BaseImageAnimationFactory.new(image, PrimitiveIntUtil.getArrayInstance(), width, height, 0, 0, animationBehaviorFactory), AllBinaryArrayImageRotationAnimationFactory)
    self:_init_fields()
        -- super(...) made self above
        self.angleIncrement = angleIncrement
        self:init()
    return self
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory:init()
        self:setImageArray(ImageToRotationImageArrayUtil.getInstance():generate(self:getImage(), self:getAngleIncrement(), java_int(AngleFactory.getInstance().TOTAL_ANGLE)))
end


function AllBinaryArrayImageRotationAnimationFactory:initDXY(dx, dy)
        self.animationFactoryInitializationVisitor.dx = dx
        self.animationFactoryInitializationVisitor.dy = dy
        self.animationFactoryInitializationVisitor.originalDx = dx
        self.animationFactoryInitializationVisitor.originalDy = dy
end


-- throws Exception
function AllBinaryArrayImageRotationAnimationFactory:getInstance(instanceId)
        local scaledImageArray = java_new_array(nil, (self.imageArray.n or #self.imageArray))
        local size = (scaledImageArray.n or #scaledImageArray)
        local image = self:getImage()
        for index = 0, size - 1 do
            scaledImageArray[index + 1] = self.animationFactoryImageScaleUtil:createImage(image, image:getWidth(), image:getHeight(), self.scaleProperties.scaleWidth, self.scaleProperties.scaleHeight)
        end
        if self.animationFactoryInitializationVisitor.dx ~= 0 or self.animationFactoryInitializationVisitor.dy ~= 0 then
            self.animationFactoryImageScaleUtil:processAdjust(self)
            return AdjustedImageArrayRotationAnimation.new(scaledImageArray, AngleInfo.getInstance(self:getAngleIncrement()), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationFactoryInitializationVisitor.dx, self.animationFactoryInitializationVisitor.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageArrayRotationAnimation.new(scaledImageArray, AngleInfo.getInstance(self:getAngleIncrement()), java_int(AngleFactory.getInstance().TOTAL_ANGLE), self.animationBehaviorFactory:getOrCreateInstance())
        end
end


function AllBinaryArrayImageRotationAnimationFactory:setImageArray(imageArray)
        self.imageArray = imageArray
end


function AllBinaryArrayImageRotationAnimationFactory:getAngleIncrement()
        return self.angleIncrement
end

return AllBinaryArrayImageRotationAnimationFactory

