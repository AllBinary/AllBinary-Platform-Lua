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

local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local SWT = require("org.eclipse.swt.SWT")
local GC = require("org.eclipse.swt.graphics.GC")
local ImageData = require("org.eclipse.swt.graphics.ImageData")

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

local ImageSwtRotationUtil = {}
ImageSwtRotationUtil.__index = ImageSwtRotationUtil
ImageSwtRotationUtil.className = "ImageSwtRotationUtil"

function ImageSwtRotationUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.imageUtil = ImageUtil.getInstance()
    self.gameFeatureFactory = GameFeatureFactory.getInstance()
    self.features = Features.getInstance()
    self.NO_COPY = "SWT should not copy images after initial loading as the alpha is not honored"
end


function ImageSwtRotationUtil.getInstance()
        return ImageSwtRotationUtil.instance
end


function ImageSwtRotationUtil.new()
    local self = setmetatable({}, ImageSwtRotationUtil)
    self:_init_fields()
    return self
end


function ImageSwtRotationUtil:getRotatedImage(bufferedImage, totalAngle)
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return bufferedImage
        end
        return bufferedImage
end


function ImageSwtRotationUtil:getRotatedImage2(bufferedImage, newBufferedImage, gc, angle)
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return bufferedImage
        end
        return bufferedImage
end


function ImageSwtRotationUtil:rotateImage(originalSwtImage, newSwtImage, gc, totalAngle)
        return self:getRotatedImage2(originalSwtImage, newSwtImage, gc, totalAngle)
end


function ImageSwtRotationUtil:getRotatedImageSWT(bufferedImage, newSwtImage, gc, totalAngle)
        return self:getRotatedImage2(bufferedImage, newSwtImage, gc, totalAngle)
end


function ImageSwtRotationUtil:getRotatedImages(bufferedImage, numberOfFrames, totalAngle)
        local bufferedImageArray = java_new_array(nil, numberOfFrames)
        local angle = 0
        local size = (bufferedImageArray.n or #bufferedImageArray)
        for index = 0, size - 1 do
            angle = (java_idiv(totalAngle, size)) * index
            bufferedImageArray[index + 1] = self:getRotatedImage(bufferedImage, angle)
        end
        return bufferedImageArray
end


function ImageSwtRotationUtil:createSpriteImage(bufferedImageArray)
        local columns = 9
        local rows = 0
        local size = (bufferedImageArray.n or #bufferedImageArray)
        if size < columns then
            columns = size
        end
        rows = (java_idiv(size, columns))
        if math.fmod(size, columns) ~= 0 then
            rows = rows + 1
        end
        local firstBufferedImage = bufferedImageArray[1]
        local imageData = firstBufferedImage:getImageData()
        local bufferedImage = self.imageUtil:create(imageData.width * columns, imageData.height * rows)
        local gc = GC.new(bufferedImage)
        gc:setAntialias(SWT.ON)
        gc:setInterpolation(SWT.HIGH)
        local columnIndex = 0
        local rowIndex = 0
        local nextBufferedImage = nil
        for index = 0, size - 1 do
            if java_idiv(index, 9) ~= 0 and math.fmod(index, 9) == 0 then
                rowIndex = rowIndex + 1
                columnIndex = 0
            end
            nextBufferedImage = bufferedImageArray[index + 1]
            imageData = nextBufferedImage:getImageData()
            gc:drawImage(bufferedImage, 0, 0, bufferedImage:getBounds().width, bufferedImage:getBounds().height, imageData.width * columnIndex, imageData.height * rowIndex, imageData.width, imageData.height)
            columnIndex = columnIndex + 1
        end
        gc:dispose()
        return bufferedImage
end

ImageSwtRotationUtil.instance = ImageSwtRotationUtil.new()

return ImageSwtRotationUtil

