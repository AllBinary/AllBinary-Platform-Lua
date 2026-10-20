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
-- package org.allbinary.media.image

-- local Image = require("javax.microedition.lcdui.Image")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ImageCache = require("org.allbinary.image.ImageCache")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageScaleUtil = {}
ImageScaleUtil.__index = ImageScaleUtil
ImageScaleUtil.className = "ImageScaleUtil"

function ImageScaleUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageCopyUtil = ImageCopyUtil.getInstance()
    self.gameFeatureFactory = GameFeatureFactory.getInstance()
    self.features = Features.getInstance()
    self.NO_COPY = "SWT should not copy images after initial loading as the alpha is not honored"
end


function ImageScaleUtil.getInstance()
        return ImageScaleUtil.instance
end


function ImageScaleUtil.new()
    local self = setmetatable({}, ImageScaleUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageScaleUtil:createImage2(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached)
        return self:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true)
end


-- throws Exception
function ImageScaleUtil:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, mutable)
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local width = originalImage:getWidth()
        local height = originalImage:getHeight()
        local scaleX = scaleNominatorX / scaleDenominatorX
        local scaleY = scaleNominatorY / scaleDenominatorY
        local scaledImage = self.imageCopyUtil:createImageWH(originalImage, java_int((scaleX * (width + 0.0))), java_int((scaleY * (height + 0.0))), mutable)
        return scaledImage
end


-- throws Exception
function ImageScaleUtil:scale2(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY)
        self:scale(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY, true)
end


-- throws Exception
function ImageScaleUtil:scale(originalImage, originalImageArray, ximageToShowArray, unused, scaleX, scaleY, maxScaleX, maxScaleY, mutable)
        local width = originalImage:getWidth()
        local height = originalImage:getHeight()
        local scaledImage = self.imageCopyUtil:createImageWH(originalImage, java_int((scaleX * (width + 0.0))), java_int((scaleY * (height + 0.0))), mutable)
        originalImageArray[1] = scaledImage
end

ImageScaleUtil.instance = ImageScaleUtil.new()

return ImageScaleUtil

