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
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLUtil = require("org.allbinary.graphics.opengles.OpenGLUtil")
local OpenGLESDeviceImageTranslate = require("org.allbinary.image.opengles.OpenGLESDeviceImageTranslate")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local OpenGLESImageExclusionUtil = require("org.allbinary.image.opengles.OpenGLESImageExclusionUtil")
local OpenGLESImageProperties = require("org.allbinary.image.opengles.OpenGLESImageProperties")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ImageData = require("org.eclipse.swt.graphics.ImageData")
local SwtDeviceComponent = require("org.microemu.app.ui.swt.SwtDeviceComponent")
local PostLoadSwtImmutableImageProcessor = require("org.microemu.device.swt.PostLoadSwtImmutableImageProcessor")
local PostLoadSwtMutableImageProcessor = require("org.microemu.device.swt.PostLoadSwtMutableImageProcessor")
local SwtImmutableImage = require("org.microemu.device.swt.SwtImmutableImage")
local SwtMutableImage = require("org.microemu.device.swt.SwtMutableImage")

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

local ImageCopyUtil = {}
ImageCopyUtil.__index = ImageCopyUtil
ImageCopyUtil.className = "ImageCopyUtil"

function ImageCopyUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.gameFeatureFactory = GameFeatureFactory.getInstance()
    self.features = Features.getInstance()
    self.openGLFeatureFactory = OpenGLFeatureFactory.getInstance()
    self.openGLUtil = OpenGLUtil.getInstance()
    self.openGLESImageExclusionUtil = OpenGLESImageExclusionUtil.getInstance()
    self.NO_COPY = "SWT should not copy images after initial loading as the alpha is not honored"
    self.UNABLE = "Unable to scale image without dimensions"
    self.INFORMATION = "about_"
    self.LEADERBOARD = "leaderboard"
end


function ImageCopyUtil.getInstance()
        return ImageCopyUtil.instance
end


function ImageCopyUtil.new()
    local self = setmetatable({}, ImageCopyUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageCopyUtil:createImageForRotation(originalImage)
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            local image = originalImage
            image = self.openGLUtil:addImage(image)
            return image
        else
            return self:createImage(originalImage)
        end
end


-- throws Exception
function ImageCopyUtil:createImage(originalImage)
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local originalImage2 = originalImage
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (originalImage)
                originalImage2 = openGLESImage.openGLBitmap:getImage()
            end
        end
        local image = nil
        if originalImage2:isMutable() then
            local originalMutableImage = originalImage2
            image = SwtMutableImage.new(SwtDeviceComponent.createImage(originalMutableImage.image:getImageData()))
        else
            local originalImmutableImage = originalImage2
            image = SwtMutableImage.new(SwtDeviceComponent.createImage(originalImmutableImage.image:getImageData()))
        end
        image = self.openGLUtil:addImage(image)
        return image
end


-- throws Exception
function ImageCopyUtil:createImageWH(originalImage, width, height, mutable)
        local originalImage2 = originalImage
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            if self.openGLESImageExclusionUtil:isCustomScaling(originalImage) then
                return self:createImage2(originalImage, width, height, mutable)
            end
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (originalImage)
                originalImage2 = openGLESImage.openGLBitmap:getImage()
            end
        end
        local image = nil
        if originalImage2:isMutable() and mutable then
            local originalMutableImage = originalImage2
            if originalMutableImage:getImage() ~= nil then
                local imageData2 = originalMutableImage.image:getImageData()
                local imageData = imageData2:scaledTo(width, height)
                image = SwtMutableImage.new(SwtDeviceComponent.createImage(imageData))
            else
                image = SwtMutableImage.new(originalMutableImage:getName(), PostLoadSwtMutableImageProcessor.new(originalMutableImage))
            end
        else
            local originalImmutableImage = originalImage2
            if originalImmutableImage:getImage() ~= nil then
                local imageData2 = originalImmutableImage.image:getImageData()
                if width > 0 and height > 0 then
                    local imageData = imageData2:scaledTo(width, height)
                    image = SwtImmutableImage.new(originalImage:getName(), SwtDeviceComponent.createImage(imageData))
                else
                    self.logUtil:putF(self.UNABLE, self, self.commonStrings.CONSTRUCTOR)
                    image = SwtImmutableImage.new(originalImmutableImage:getName(), PostLoadSwtImmutableImageProcessor.new(originalImmutableImage))
                end
            else
                image = SwtImmutableImage.new(originalImmutableImage:getName(), PostLoadSwtImmutableImageProcessor.new(originalImmutableImage))
            end
        end
        image = self.openGLUtil:addImage(image)
        return image
end


-- throws Exception
function ImageCopyUtil:createImage2(originalImage, width, height, mutable)
        local originalImage2 = originalImage
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local image = nil
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            local displayInfoSingleton = DisplayInfoSingleton.getInstance()
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (originalImage)
                local openGLESImageProperties = openGLESImage.openGLESImageProperties
                local openGLWidth = openGLESImage.openGLBitmap:getWidth()
                local openGLHeight = openGLESImage.openGLBitmap:getHeight()
                openGLESImageProperties.scaleX2 = (((width + 0.0)) / (openGLWidth + 0.0))
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX2
                openGLESImageProperties.scaleY2 = (((height + 0.0)) / (openGLHeight + 0.0))
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY2
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.75
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.75
                if originalImage:getHeight() % 2 ~= 0 then
                    openGLESImageProperties.scaleX2 = openGLESImageProperties.scaleX2 + (1.0 / (openGLWidth + 0.0))
                    openGLESImageProperties.scaleY2 = openGLESImageProperties.scaleY2 + (1.0 / (openGLHeight + 0.0))
                end
                image = openGLESImage
            else
                image = originalImage
                local openGLESImage = self.openGLUtil:addImage(image)
                local openGLESImageProperties = openGLESImage.openGLESImageProperties
                openGLESImageProperties.scaleX2 = ((((width + 0.0)) / openGLESImage:getWidth()) + 0.0)
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX2
                openGLESImageProperties.scaleY2 = ((((height + 0.0)) / openGLESImage:getHeight()) + 0.0)
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY2
                if image:getName():startsWith(self.INFORMATION) then
                    openGLESImage.openGLESImageTranslate = OpenGLESDeviceImageTranslate.new()
                    local openGLESDeviceImageTranslate = openGLESImage.openGLESImageTranslate
                    openGLESDeviceImageTranslate.translateX = displayInfoSingleton:getLastWidth() / 1.4 / openGLESImageProperties.scaleX
                    openGLESDeviceImageTranslate.translateY = displayInfoSingleton:getLastHeight() / 4 / openGLESImageProperties.scaleY
                    openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.25
                    openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.25
                else
                    openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.75
                    openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.75
                    if image:getName():startsWith(self.LEADERBOARD) then
                        openGLESImage.openGLESImageTranslate = OpenGLESDeviceImageTranslate.new()
                        local openGLESDeviceImageTranslate = openGLESImage.openGLESImageTranslate
                        openGLESDeviceImageTranslate.translateX = -displayInfoSingleton:getLastWidth() / 40 / openGLESImageProperties.scaleX
                    end
                    if image:getName():startsWith(self.LEADERBOARD) then
                    else
                        openGLESImageProperties.scaleX = 1.0
                        openGLESImageProperties.scaleY = 1.0
                    end
                end
                image = openGLESImage
            end
        else
            if originalImage2:isMutable() and mutable then
                local originalMutableImage = originalImage2
                if originalMutableImage:getImage() ~= nil then
                    local imageData2 = originalMutableImage.image:getImageData()
                    local imageData = imageData2:scaledTo(width, height)
                    image = SwtMutableImage.new(SwtDeviceComponent.createImage(imageData))
                else
                    image = SwtMutableImage.new(originalMutableImage:getName(), PostLoadSwtMutableImageProcessor.new(originalMutableImage))
                end
            else
                local originalImmutableImage = originalImage2
                if originalImmutableImage:getImage() ~= nil then
                    local imageData2 = originalImmutableImage.image:getImageData()
                    local imageData = imageData2:scaledTo(width, height)
                    image = SwtImmutableImage.new(originalImage:getName(), SwtDeviceComponent.createImage(imageData))
                else
                    image = SwtImmutableImage.new(originalImmutableImage:getName(), PostLoadSwtImmutableImageProcessor.new(originalImmutableImage))
                end
            end
            image = self.openGLUtil:addImage(image)
        end
        return image
end


-- throws Exception
function ImageCopyUtil:createImageScale(originalImage, canvasScale, resize)
        if not self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local newWidth = java_int((originalImage:getWidth() * canvasScale))
        local newHeight = java_int((originalImage:getHeight() * canvasScale))
        if resize then
            if newWidth < newHeight then
                newWidth = newHeight
            end
            if newHeight < newWidth then
                newHeight = newWidth
            end
        end
        local image = self:createImageWH(originalImage, newWidth, newHeight, true)
        if image:isMutable() then
            local originalImageData = (originalImage:getImage()):getImageData()
            local mutableImage2 = image
            local halfWidthDelta = (newWidth - originalImage:getWidth()) / 2
            local halfHeightDelta = (newHeight - originalImage:getHeight()) / 2
            local originalPixelArray = java_new_array(0, originalImage:getWidth() * originalImage:getHeight())
            local newPixelArray = java_new_array(0, image:getWidth() * image:getHeight())
            local width = originalImage:getWidth()
            local height = originalImage:getHeight()
            for i = 0, height - 1 do
                originalImageData:getPixels(0, i, width, originalPixelArray, (i * width))
            end
            for index = halfWidthDelta, width - 1 do
                for index2 = halfHeightDelta, height - 1 do
                    newPixelArray[index + (index2 * width) + 1] = originalPixelArray[(index - halfWidthDelta) + ((index2 - halfHeightDelta) * width) + 1]
                end
            end
            (mutableImage2:getImage()):getImageData():setPixels(0, 0, image:getWidth(), newPixelArray, 0)
            return image
        else
            local originalImmutableImage = image
            local originalImageData = (originalImage:getImage()):getImageData()
            local halfWidthDelta = (newWidth - originalImage:getWidth()) / 2
            local halfHeightDelta = (newHeight - originalImage:getHeight()) / 2
            local originalPixelArray = java_new_array(0, originalImage:getWidth() * originalImage:getHeight())
            local newPixelArray = java_new_array(0, image:getWidth() * image:getHeight())
            local width = originalImage:getWidth()
            local height = originalImage:getHeight()
            for i = 0, height - 1 do
                originalImageData:getPixels(0, i, width, originalPixelArray, (i * width))
            end
            for index = halfWidthDelta, width - 1 do
                for index2 = halfHeightDelta, height - 1 do
                    newPixelArray[index + (index2 * width) + 1] = originalPixelArray[(index - halfWidthDelta) + ((index2 - halfHeightDelta) * width) + 1]
                end
            end
            (originalImmutableImage:getImage()):getImageData():setPixels(0, 0, image:getWidth(), newPixelArray, 0)
            return image
        end
end

ImageCopyUtil.instance = ImageCopyUtil.new()

return ImageCopyUtil

