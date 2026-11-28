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

local ImageCopyUtil = {}
package.loaded["org.allbinary.media.image.ImageCopyUtil"] = ImageCopyUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local Image = java_lazy("javax.microedition.lcdui.Image")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local OpenGLFeatureFactory = java_lazy("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLUtil = java_lazy("org.allbinary.graphics.opengles.OpenGLUtil")
local OpenGLESDeviceImageTranslate = java_lazy("org.allbinary.image.opengles.OpenGLESDeviceImageTranslate")
local OpenGLESImage = java_lazy("org.allbinary.image.opengles.OpenGLESImage")
local OpenGLESImageExclusionUtil = java_lazy("org.allbinary.image.opengles.OpenGLESImageExclusionUtil")
local OpenGLESImageProperties = java_lazy("org.allbinary.image.opengles.OpenGLESImageProperties")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ImageData = java_lazy("org.eclipse.swt.graphics.ImageData")
local SwtDeviceComponent = java_lazy("org.microemu.app.ui.swt.SwtDeviceComponent")
local PostLoadSwtImmutableImageProcessor = java_lazy("org.microemu.device.swt.PostLoadSwtImmutableImageProcessor")
local PostLoadSwtMutableImageProcessor = java_lazy("org.microemu.device.swt.PostLoadSwtMutableImageProcessor")
local SwtImmutableImage = java_lazy("org.microemu.device.swt.SwtImmutableImage")
local SwtMutableImage = java_lazy("org.microemu.device.swt.SwtMutableImage")
local SwtOpenGLESImageBridge = java_lazy("org.allbinary.media.image.SwtOpenGLESImageBridge")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ImageCopyUtil is declared before the requires
ImageCopyUtil.__index = ImageCopyUtil
ImageCopyUtil.className = "ImageCopyUtil"
ImageCopyUtil.javaClassName = "org.allbinary.media.image.ImageCopyUtil"

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
        return ImageCopyUtil.instance_f
end


function ImageCopyUtil._jinit(self)
    ImageCopyUtil._init_fields(self)
    return self
end

function ImageCopyUtil.new(...)
    local self = setmetatable({}, ImageCopyUtil)
    ImageCopyUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ImageCopyUtil:createImageForRotation(originalImage)
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            local image = originalImage
            image = SwtOpenGLESImageBridge.addImage(self.openGLUtil, image)
            return image
        else
            return self:createImage(originalImage)
        end
end


-- throws Exception
function ImageCopyUtil:createImage(originalImage)
        if not (self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local originalImage2 = originalImage
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = SwtOpenGLESImageBridge.getOpenGLESImage(originalImage)
                originalImage2 = SwtOpenGLESImageBridge.getBitmapImage(openGLESImage)
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
        image = SwtOpenGLESImageBridge.addImage(self.openGLUtil, image)
        return image
end


-- throws Exception
function ImageCopyUtil:createImageWH(originalImage, width, height, mutable)
        local originalImage2 = originalImage
        if not (self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            if SwtOpenGLESImageBridge.isCustomScaling(self.openGLESImageExclusionUtil, originalImage) then
                return self:createImage2(originalImage, width, height, mutable)
            end
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = SwtOpenGLESImageBridge.getOpenGLESImage(originalImage)
                originalImage2 = SwtOpenGLESImageBridge.getBitmapImage(openGLESImage)
            end
        end
        local image = nil
        if originalImage2:isMutable() and mutable then
            local originalMutableImage = originalImage2
            if not rawequal(originalMutableImage:getImage(), nil) then
                local imageData2 = originalMutableImage.image:getImageData()
                local imageData = imageData2:scaledTo(width, height)
                image = SwtMutableImage.new(SwtDeviceComponent.createImage(imageData))
            else
                image = SwtMutableImage.new(originalMutableImage:getName(), PostLoadSwtMutableImageProcessor.new(originalMutableImage))
            end
        else
            local originalImmutableImage = originalImage2
            if not rawequal(originalImmutableImage:getImage(), nil) then
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
        image = SwtOpenGLESImageBridge.addImage(self.openGLUtil, image)
        return image
end


-- throws Exception
function ImageCopyUtil:createImage2(originalImage, width, height, mutable)
        local originalImage2 = originalImage
        if not (self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) then
            self.logUtil:putF(self.NO_COPY, self, self.commonStrings.CONSTRUCTOR)
            return originalImage
        end
        local image = nil
        if self.features:isFeature(self.openGLFeatureFactory.OPENGL) then
            local displayInfoSingleton = DisplayInfoSingleton.getInstance()
            if originalImage:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = SwtOpenGLESImageBridge.getOpenGLESImage(originalImage)
                local openGLESImageProperties = openGLESImage.openGLESImageProperties
                local openGLWidth = openGLESImage.openGLBitmap:getWidth()
                local openGLHeight = openGLESImage.openGLBitmap:getHeight()
                openGLESImageProperties.scaleX2 = (((width + 0.0)) / (openGLWidth + 0.0))
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX2
                openGLESImageProperties.scaleY2 = (((height + 0.0)) / (openGLHeight + 0.0))
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY2
                openGLESImageProperties.scaleX = openGLESImageProperties.scaleX * 0.75
                openGLESImageProperties.scaleY = openGLESImageProperties.scaleY * 0.75
                if not rawequal(originalImage:getHeight() % 2, 0) then
                    openGLESImageProperties.scaleX2 = openGLESImageProperties.scaleX2 + (1.0 / (openGLWidth + 0.0))
                    openGLESImageProperties.scaleY2 = openGLESImageProperties.scaleY2 + (1.0 / (openGLHeight + 0.0))
                end
                image = SwtOpenGLESImageBridge.asImage(openGLESImage)
            else
                image = originalImage
                local openGLESImage = SwtOpenGLESImageBridge.getOpenGLESImage(SwtOpenGLESImageBridge.addImage(self.openGLUtil, image))
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
                image = SwtOpenGLESImageBridge.asImage(openGLESImage)
            end
        else
            if originalImage2:isMutable() and mutable then
                local originalMutableImage = originalImage2
                if not rawequal(originalMutableImage:getImage(), nil) then
                    local imageData2 = originalMutableImage.image:getImageData()
                    local imageData = imageData2:scaledTo(width, height)
                    image = SwtMutableImage.new(SwtDeviceComponent.createImage(imageData))
                else
                    image = SwtMutableImage.new(originalMutableImage:getName(), PostLoadSwtMutableImageProcessor.new(originalMutableImage))
                end
            else
                local originalImmutableImage = originalImage2
                if not rawequal(originalImmutableImage:getImage(), nil) then
                    local imageData2 = originalImmutableImage.image:getImageData()
                    local imageData = imageData2:scaledTo(width, height)
                    image = SwtImmutableImage.new(originalImage:getName(), SwtDeviceComponent.createImage(imageData))
                else
                    image = SwtImmutableImage.new(originalImmutableImage:getName(), PostLoadSwtImmutableImageProcessor.new(originalImmutableImage))
                end
            end
            image = SwtOpenGLESImageBridge.addImage(self.openGLUtil, image)
        end
        return image
end


-- throws Exception
function ImageCopyUtil:createImageScale(originalImage, canvasScale, resize)
        if not (self.features:isFeature(self.gameFeatureFactory.POST_IMAGE_LOADING_MODIFICATION)) then
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
            local originalPixelArray = java_typed_array("I", java_new_array(0, originalImage:getWidth() * originalImage:getHeight()))
            local newPixelArray = java_typed_array("I", java_new_array(0, image:getWidth() * image:getHeight()))
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
            ;(mutableImage2:getImage()):getImageData():setPixels(0, 0, image:getWidth(), newPixelArray, 0)
            return image
        else
            local originalImmutableImage = image
            local originalImageData = (originalImage:getImage()):getImageData()
            local halfWidthDelta = (newWidth - originalImage:getWidth()) / 2
            local halfHeightDelta = (newHeight - originalImage:getHeight()) / 2
            local originalPixelArray = java_typed_array("I", java_new_array(0, originalImage:getWidth() * originalImage:getHeight()))
            local newPixelArray = java_typed_array("I", java_new_array(0, image:getWidth() * image:getHeight()))
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
            ;(originalImmutableImage:getImage()):getImageData():setPixels(0, 0, image:getWidth(), newPixelArray, 0)
            return image
        end
end

ImageCopyUtil.instance_f = ImageCopyUtil.new()

return ImageCopyUtil

