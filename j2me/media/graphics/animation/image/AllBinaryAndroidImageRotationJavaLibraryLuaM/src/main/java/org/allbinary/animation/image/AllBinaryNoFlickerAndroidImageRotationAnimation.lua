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
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local AndroidImageUtil = require("org.allbinary.media.image.AndroidImageUtil")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local ImageBaseRotationAnimation = require("org.allbinary.animation.image.ImageBaseRotationAnimation")

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

local AllBinaryNoFlickerAndroidImageRotationAnimation = {}
AllBinaryNoFlickerAndroidImageRotationAnimation.__index = AllBinaryNoFlickerAndroidImageRotationAnimation
AllBinaryNoFlickerAndroidImageRotationAnimation.className = "AllBinaryNoFlickerAndroidImageRotationAnimation"
setmetatable(AllBinaryNoFlickerAndroidImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryNoFlickerAndroidImageRotationAnimation:_init_fields()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.androidImageUtil = AndroidImageUtil.getInstance()
    self.matrix = Matrix.new()
    self.halfWidth = nil
    self.halfHeight = nil
    self.increment = nil
    self.originalImage = nil
    self.twoImages = java_new_array(nil, 2)
    self.imageToShow = nil
    self.bufferedImageIndex = 0
end


function AllBinaryNoFlickerAndroidImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior), AllBinaryNoFlickerAndroidImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.originalImage = originalImage
        self.halfWidth = (((image:getWidth()) // (1 << (1))))
        self.halfHeight = (((image:getHeight()) // (1 << (1))))
        self.increment = java_int((self.angleInfo:getAngleIncrementInfo():getAngleIncrement()))
        self.imageToShow = image
        self.twoImages[1] = image
        self.twoImages[2] = ImageCopyUtil.getInstance():createImage(image)
    return self
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            self.imageModifierUtil:setColor(self.originalImage, self.imageToShow, 0, basicColor)
            changed = true
        end
        ImageBaseRotationAnimation.setBasicColorP(self, basicColor)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:changeBasicColor(basicColor)
        self:setBasicColorP(basicColor)
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        ImageBaseRotationAnimation.setAlpha(self, alpha)
        self.imageModifierUtil:setAlpha(self.originalImage, self.imageToShow, 0, self.alphaP)
        if changed then
            self.matrix:setRotate(0.0, (self.halfWidth + 0.0), (self.halfHeight + 0.0))
            self:updateImage()
        end
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:nextRotation()
        ImageBaseRotationAnimation.nextRotation(self)
        self.matrix:setRotate((self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:previousRotation()
        ImageBaseRotationAnimation.previousRotation(self)
        self.matrix:setRotate((-self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:updateImage()
        self.androidImageUtil:rotate(self.twoImages[self.bufferedImageIndex + 1], self.originalImage, self.matrix, self.imageModifierUtil.paint)
        self:swap()
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:setFrame(index)
        local currentFrame = self.circularIndexUtil:getIndex()
        self.circularIndexUtil:setIndex(index)
        local newFrame = self.circularIndexUtil:getIndex()
        self.angleInfo:adjustAngle(newFrame)
        self.matrix:setRotate(((newFrame - currentFrame) + 0.0) * (self.increment + 0.0), (self.halfWidth + 0.0), (self.halfHeight + 0.0))
        self:updateImage()
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:swap()
        self.imageToShow = self.twoImages[self.bufferedImageIndex + 1]
        if self.bufferedImageIndex == 0 then
            self.bufferedImageIndex = 1
        else
            self.bufferedImageIndex = 0
        end
end


function AllBinaryNoFlickerAndroidImageRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageToShow, x, y, self.anchor)
end

return AllBinaryNoFlickerAndroidImageRotationAnimation

