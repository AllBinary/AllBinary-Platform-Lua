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

local Matrix = require("android.graphics.Matrix")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local AndroidImageUtil = require("org.allbinary.media.image.AndroidImageUtil")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryFlickerAndroidImageRotationAnimation = {}
AllBinaryFlickerAndroidImageRotationAnimation.__index = AllBinaryFlickerAndroidImageRotationAnimation
AllBinaryFlickerAndroidImageRotationAnimation.className = "AllBinaryFlickerAndroidImageRotationAnimation"
setmetatable(AllBinaryFlickerAndroidImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryFlickerAndroidImageRotationAnimation:_init_fields()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.androidImageUtil = AndroidImageUtil.getInstance()
    self.matrix = Matrix.new()
    self.halfWidth = nil
    self.halfHeight = nil
    self.increment = nil
    self.originalImage = nil
end


function AllBinaryFlickerAndroidImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior), AllBinaryFlickerAndroidImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.originalImage = originalImage
        self.halfWidth = (((image:getWidth()) // (1 << (1))))
        self.halfHeight = (((image:getHeight()) // (1 << (1))))
        self.increment = java_int((self.angleInfo:getAngleIncrementInfo():getAngleIncrement()))
    return self
end


function AllBinaryFlickerAndroidImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            self.imageModifierUtil:setColor(self.originalImage, self:getImage(), 0, basicColor)
            changed = true
        end
        ImageBaseRotationAnimation.setBasicColorP(self, basicColor)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end


function AllBinaryFlickerAndroidImageRotationAnimation:changeBasicColor(basicColor)
        self:setBasicColorP(basicColor)
end


function AllBinaryFlickerAndroidImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        ImageBaseRotationAnimation.setAlpha(self, alpha)
        self.imageModifierUtil:setAlpha(self.originalImage, self:getImage(), 0, self.alphaP)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end


function AllBinaryFlickerAndroidImageRotationAnimation:nextRotation()
        ImageBaseRotationAnimation.nextRotation(self)
        self.matrix:setRotate((self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end


function AllBinaryFlickerAndroidImageRotationAnimation:previousRotation()
        ImageBaseRotationAnimation.previousRotation(self)
        self.matrix:setRotate((-self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end


function AllBinaryFlickerAndroidImageRotationAnimation:updateImage()
        self.androidImageUtil:rotate(self:getImage(), self.originalImage, self.matrix, self.imageModifierUtil.paint)
end


function AllBinaryFlickerAndroidImageRotationAnimation:setFrame(index)
        local currentFrame = self.circularIndexUtil:getIndex()
        self.circularIndexUtil:setIndex(index)
        local newFrame = self.circularIndexUtil:getIndex()
        self.angleInfo:adjustAngle(newFrame)
        self.matrix:setRotate(((newFrame - currentFrame) + 0.0) * (self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end

return AllBinaryFlickerAndroidImageRotationAnimation

