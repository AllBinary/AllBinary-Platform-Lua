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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local DisposalUtil = require("org.allbinary.DisposalUtil")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local ImageRotationUtil = require("org.allbinary.media.image.ImageRotationUtil")
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

local AllBinaryJ2SEImageRotationAnimation = {}
AllBinaryJ2SEImageRotationAnimation.__index = AllBinaryJ2SEImageRotationAnimation
AllBinaryJ2SEImageRotationAnimation.className = "AllBinaryJ2SEImageRotationAnimation"
setmetatable(AllBinaryJ2SEImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryJ2SEImageRotationAnimation:_init_fields()
    self.imageRotationUtil = ImageRotationUtil.getInstance()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.realOriginalImage = nil
    self.originalImageArray = java_new_array(nil, 1)
    self.twoImages = java_new_array(nil, 2)
    self.imageToShow = nil
    self.bufferedImageIndex = 0
    self.lastScaleX = 1.0
    self.lastScaleY = 1.0
    self.scaleX = 1.0
    self.scaleY = 1.0
    self.maxScaleX = 0.0
    self.maxScaleY = 0.0
    self.alphaProcessor = ModifierBaseProcessor.getInstance()
    self.setColorProcessor = ModifierBaseProcessor.getInstance()
    self.changeColorProcessor = ModifierBaseProcessor.getInstance()
    self.scaleProcessor = ScaleProcessor.getInstance()
end


function AllBinaryJ2SEImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior), AllBinaryJ2SEImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.realOriginalImage = originalImage
        self.originalImageArray[1] = originalImage
        self.imageToShow = image
        self.twoImages[1] = image
        self.twoImages[2] = ImageCopyUtil.getInstance():createImageForRotation(image)
    return self
end


function AllBinaryJ2SEImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        ImageBaseRotationAnimation.setBasicColorP(self, basicColor)
        if changed then
            self.setColorProcessor = SetColorProcessor.getInstance()
            self:updateImage()
        end
end


function AllBinaryJ2SEImageRotationAnimation:changeBasicColor(basicColor)
        local changed = false
        if self:getChangeBasicColor() == nil or math.tointeger(self:getChangeBasicColor() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        ImageBaseRotationAnimation.changeBasicColor(self, basicColor)
        if changed then
            self.changeColorProcessor = ChangeColorProcessor.getInstance()
            self:updateImage()
        end
end


function AllBinaryJ2SEImageRotationAnimation:setAlpha(alpha)
        local changed = false
        if self.alphaP ~= alpha then
            changed = true
        end
        ImageBaseRotationAnimation.setAlpha(self, alpha)
        if changed then
            self.alphaProcessor = AlphaProcessor.getInstance()
            self:updateImage()
        end
end


function AllBinaryJ2SEImageRotationAnimation:setScale(scaleX, scaleY)
        self.scaleX = scaleX
        self.scaleY = scaleY
        if self.scaleX ~= self.lastScaleX or self.scaleY ~= self.lastScaleY then
            self.scaleProcessor:update(self.realOriginalImage, self.originalImageArray, self.twoImages, self.bufferedImageIndex, self.scaleX, self.scaleY, self.maxScaleX, self.maxScaleY)
            self:updateImage()
        end
        self.lastScaleX = self.scaleX
        self.lastScaleY = self.scaleY
end


function AllBinaryJ2SEImageRotationAnimation:setMaxScale(maxScaleX, maxScaleY)
        self.maxScaleX = maxScaleX
        self.maxScaleY = maxScaleY
        self.scaleProcessor:update(self.realOriginalImage, self.originalImageArray, self.twoImages, self.bufferedImageIndex, self.scaleX, self.scaleY, self.maxScaleX, self.maxScaleY)
        self:updateImage()
end


function AllBinaryJ2SEImageRotationAnimation:nextRotation()
        ImageBaseRotationAnimation.nextRotation(self)
        self:updateImage()
end


function AllBinaryJ2SEImageRotationAnimation:previousRotation()
        ImageBaseRotationAnimation.previousRotation(self)
        self:updateImage()
end


function AllBinaryJ2SEImageRotationAnimation:updateImage()
        self.imageRotationUtil:rotateImage(self.originalImageArray[1], self.twoImages[self.bufferedImageIndex + 1], self.angleInfo:getAngle() + 90)
        self.alphaProcessor:updateAlpha(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.alphaP)
        self.setColorProcessor:updateColor(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.basicColor)
        self.changeColorProcessor:updateColor(self.imageModifierUtil, NullImage.NULL_IMAGE, self.twoImages[self.bufferedImageIndex + 1], 0, self.changeBasicColorP)
        self:swap()
end


function AllBinaryJ2SEImageRotationAnimation:setFrame(index)
        ImageBaseRotationAnimation.setFrame(self, index)
        self:updateImage()
end


function AllBinaryJ2SEImageRotationAnimation:swap()
        self.imageToShow = self.twoImages[self.bufferedImageIndex + 1]
        if self.bufferedImageIndex == 0 then
            self.bufferedImageIndex = 1
        else
            self.bufferedImageIndex = 0
        end
end


function AllBinaryJ2SEImageRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageToShow, x, y, self.anchor)
end


-- throws Exception
function AllBinaryJ2SEImageRotationAnimation:close()
        ImageBaseRotationAnimation.close(self)
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.twoImages.n or #self.twoImages)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.twoImages[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.realOriginalImage)
        disposalUtil:disposeImage(self.imageToShow)
end


-- throws Throwable
function AllBinaryJ2SEImageRotationAnimation:finalize()
        ImageBaseRotationAnimation.finalize(self)
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.twoImages.n or #self.twoImages)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.twoImages[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.realOriginalImage)
        disposalUtil:disposeImage(self.imageToShow)
end

return AllBinaryJ2SEImageRotationAnimation

