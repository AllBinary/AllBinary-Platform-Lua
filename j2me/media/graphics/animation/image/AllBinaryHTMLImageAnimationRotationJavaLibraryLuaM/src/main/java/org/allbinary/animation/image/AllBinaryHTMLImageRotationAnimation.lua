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
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local ImageCopyUtil = require("org.allbinary.media.image.ImageCopyUtil")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local ImageRotationUtil = require("org.allbinary.media.image.ImageRotationUtil")
local PlaynMutableImage = require("org.microemu.device.playn.PlaynMutableImage")
local CanvasImage = require("playn.core.CanvasImage")
local CanvasSurface = require("playn.core.CanvasSurface")
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

local AllBinaryHTMLImageRotationAnimation = {}
AllBinaryHTMLImageRotationAnimation.__index = AllBinaryHTMLImageRotationAnimation
AllBinaryHTMLImageRotationAnimation.className = "AllBinaryHTMLImageRotationAnimation"
setmetatable(AllBinaryHTMLImageRotationAnimation, {__index = ImageBaseRotationAnimation})

function AllBinaryHTMLImageRotationAnimation:_init_fields()
    self.imageRotationUtil = ImageRotationUtil.getInstance()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.originalImage = nil
    self.twoImages = java_new_array(nil, 2)
    self.canvasSurfaceArray = java_new_array(nil, 2)
    self.imageToShow = nil
    self.bufferedImageIndex = 0
    self.alphaProcessor = AlphaBaseProcessor.getInstance()
end


function AllBinaryHTMLImageRotationAnimation.new(originalImage, image, angleInfo, totalAngle, animationBehavior)
    local self = setmetatable(ImageBaseRotationAnimation.new(image, angleInfo, totalAngle, animationBehavior), AllBinaryHTMLImageRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.originalImage = originalImage
        self.imageToShow = image
        self.twoImages[1] = image
        self.twoImages[2] = ImageCopyUtil.getInstance():createImage(image)
        self.canvasSurfaceArray[1] = self:getCanvasSurface(self.twoImages[1])
        self.canvasSurfaceArray[2] = self:getCanvasSurface(self.twoImages[2])
    return self
end


function AllBinaryHTMLImageRotationAnimation:getCanvasSurface(image)
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local canvasSurface = htmlImage:getCanvasSurface(canvasImage)
        canvasSurface:translate(self.originalImage:getWidth() / 2, self.originalImage:getHeight() / 2)
        return canvasSurface
end


function AllBinaryHTMLImageRotationAnimation:setBasicColorP(basicColor)
        local changed = false
        if self:getBasicColorP() == nil or math.tointeger(self:getBasicColorP() // 1) ~= math.tointeger(basicColor // 1) then
            changed = true
        end
        ImageBaseRotationAnimation.setBasicColorP(self, basicColor)
        if changed then
            self:updateImage()
        end
end


function AllBinaryHTMLImageRotationAnimation:setAlpha(alpha)
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


function AllBinaryHTMLImageRotationAnimation:nextRotation()
        ImageBaseRotationAnimation.nextRotation(self)
        self:updateImage()
end


function AllBinaryHTMLImageRotationAnimation:previousRotation()
        ImageBaseRotationAnimation.previousRotation(self)
        self:updateImage()
end


function AllBinaryHTMLImageRotationAnimation:updateImage()
        local canvasSurface = self.canvasSurfaceArray[self.bufferedImageIndex + 1]
        canvasSurface:save()
        self.imageRotationUtil:rotateImageCanvasSurfaceClear(self.originalImage, self.twoImages[self.bufferedImageIndex + 1], canvasSurface, self.angleInfo:getAngle() + 90)
        self.alphaProcessor:setAlpha(self.imageModifierUtil, self.originalImage, self.twoImages[self.bufferedImageIndex + 1], self.alphaP)
        self.imageRotationUtil:drawImage(self.originalImage, self.imageToShow, canvasSurface)
        canvasSurface:restore()
        self:swap()
end


function AllBinaryHTMLImageRotationAnimation:setFrame(index)
        ImageBaseRotationAnimation.setFrame(self, index)
        self:updateImage()
end


function AllBinaryHTMLImageRotationAnimation:swap()
        self.imageToShow = self.twoImages[self.bufferedImageIndex + 1]
        if self.bufferedImageIndex == 0 then
            self.bufferedImageIndex = 1
        else
            self.bufferedImageIndex = 0
        end
end


function AllBinaryHTMLImageRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.imageToShow, x, y, self.anchor)
end

return AllBinaryHTMLImageRotationAnimation

