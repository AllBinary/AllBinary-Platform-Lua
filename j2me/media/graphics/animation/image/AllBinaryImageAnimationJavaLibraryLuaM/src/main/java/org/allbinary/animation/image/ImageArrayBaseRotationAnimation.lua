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
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageModifierUtil = require("org.allbinary.media.image.ImageModifierUtil")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArrayBaseRotationAnimation = {}
ImageArrayBaseRotationAnimation.__index = ImageArrayBaseRotationAnimation
ImageArrayBaseRotationAnimation.className = "ImageArrayBaseRotationAnimation"
setmetatable(ImageArrayBaseRotationAnimation, {__index = RotationAnimation})

function ImageArrayBaseRotationAnimation:_init_fields()
    self.imageModifierUtil = ImageModifierUtil.getInstanceOrCreate()
    self.originalImageArray = nil
    self.imageArray = NullImage.NULL_IMAGE_ARRAY
    self.currentImage = nil
    self.totalFrames = 0
    self.anchor = Anchor.TOP_LEFT
end


function ImageArrayBaseRotationAnimation.new(originalImageArray, angleInfo, animationBehavior)
    local self = setmetatable(RotationAnimation.new(angleInfo, CircularIndexUtil.createInstance(360 / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior), ImageArrayBaseRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.originalImageArray = originalImageArray
        self:setImageArray(self.imageModifierUtil:getImageArray(originalImageArray))
        self.currentImage = self.imageArray[self.circularIndexUtil:getIndex() + 1]
    return self
end


-- throws Exception
function ImageArrayBaseRotationAnimation:getAnimationSize()
        return self:getSize()
end


function ImageArrayBaseRotationAnimation:setAlpha(alpha)
        if self.alphaP ~= alpha then
            RotationAnimation.setAlpha(self, alpha)
            self.imageModifierUtil:reset()
            local index = self.circularIndexUtil:getIndex()
            self.imageModifierUtil:setAlpha(self.originalImageArray[index + 1], self.imageArray[index + 1], index, self.alphaP)
        end
end


function ImageArrayBaseRotationAnimation:nextRotation()
        RotationAnimation.nextRotation(self)
        local index = self.circularIndexUtil:getIndex()
        self.imageModifierUtil:setAlpha(self.originalImageArray[index + 1], self.imageArray[index + 1], index, self.alphaP)
        self.currentImage = self.imageArray[index + 1]
end


function ImageArrayBaseRotationAnimation:previousRotation()
        RotationAnimation.previousRotation(self)
        local index = self.circularIndexUtil:getIndex()
        self.imageModifierUtil:setAlpha(self.originalImageArray[index + 1], self.imageArray[index + 1], index, self.alphaP)
        self.currentImage = self.imageArray[index + 1]
end


function ImageArrayBaseRotationAnimation:setFrame(index2)
        RotationAnimation.setFrame(self, index2)
        local index = self.circularIndexUtil:getIndex()
        self.imageModifierUtil:setAlpha(self.originalImageArray[index + 1], self.imageArray[index + 1], index, self.alphaP)
        self.currentImage = self.imageArray[index + 1]
end


function ImageArrayBaseRotationAnimation:setSequence(sequence)
end


function ImageArrayBaseRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function ImageArrayBaseRotationAnimation:setImageArray(imageArray)
        self.imageArray = imageArray
        self.totalFrames = (imageArray.n or #imageArray)
        self.circularIndexUtil = CircularIndexUtil.createInstance(self.totalFrames)
end


function ImageArrayBaseRotationAnimation:paintXY(graphics, x, y)
        graphics:drawImage(self.currentImage, x, y, self.anchor)
end


-- throws Exception
function ImageArrayBaseRotationAnimation:close()
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.imageArray.n or #self.imageArray)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.imageArray[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.currentImage)
end


-- throws Throwable
function ImageArrayBaseRotationAnimation:finalize()
        local disposalUtil = DisposalUtil.getInstance()
        local size2 = (self.imageArray.n or #self.imageArray)
        for index = 0, size2 - 1 do
            disposalUtil:disposeImage(self.imageArray[index + 1])
        end
        local size = (self.originalImageArray.n or #self.originalImageArray)
        for index = 0, size - 1 do
            disposalUtil:disposeImage(self.originalImageArray[index + 1])
        end
        disposalUtil:disposeImage(self.currentImage)
end

return ImageArrayBaseRotationAnimation

