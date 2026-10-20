-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local ModifierOpenGLESImageProcessor = require("org.allbinary.image.opengles.ModifierOpenGLESImageProcessor")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local ImageData = require("org.eclipse.swt.graphics.ImageData")
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

local ImageModifierUtil = {}
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"

function ImageModifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageCopyUtil = ImageCopyUtil.getInstance()
    self.features = Features.getInstance()
end

function ImageModifierUtil.new()
    local self = setmetatable({}, ImageModifierUtil)
    self:_init_fields()
    return self
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.instance
end


function ImageModifierUtil:setBasicColorP(basicColor)
end


function ImageModifierUtil:setColor(unusedOriginalImage, image, imageIndex, basicColor)
        local newBufferedImage = nil
        if image:isMutable() then
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        else
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        end
        local r = basicColor.red
        local g = basicColor.green
        local b = basicColor.blue
        local width = image:getWidth()
        local height = image:getHeight()
        local imageData = newBufferedImage:getImageData()
        if imageData.depth == 24 then
            local rx = 0
            local gx = 0
            local bx = 0
            local index3 = 0
            for index = 0, width - 1 do
                for index2 = 0, height - 1 do
                    index3 = (index2 * imageData.bytesPerLine) + (index * 4)
                    rx = (imageData.data[index3 + 1] & 0xFF) << 16
                    gx = (imageData.data[index3 + 1 + 1] & 0xFF) << 8
                    bx = (imageData.data[index3 + 2 + 1] & 0xFF)
                    if rx ~= 0 or gx ~= 0 or bx ~= 0 then
                        imageData.data[index3 + 1] = r
                        imageData.data[index3 + 1 + 1] = g
                        imageData.data[index3 + 2 + 1] = b
                    end
                end
            end
        end
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
        if self.features:isFeature(OpenGLFeatureFactory.getInstance().OPENGL) then
            if image:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (image)
                openGLESImage.imageProcessor = ModifierOpenGLESImageProcessor.getInstance()
                openGLESImage.openGLESImageProperties.redf = basicColor:getRedComponent()
                openGLESImage.openGLESImageProperties.greenf = basicColor:getGreenComponent()
                openGLESImage.openGLESImageProperties.bluef = basicColor:getBlueComponent()
                return
            end
        end
        local newBufferedImage = nil
        if image:isMutable() then
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        else
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        end
        local MAX = 255.0
        local r = ((basicColor.red + 0.0)) / MAX
        local g = ((basicColor.green + 0.0)) / MAX
        local b = ((basicColor.blue + 0.0)) / MAX
        local rx = 0
        local gx = 0
        local bx = 0
        local imageData = newBufferedImage:getImageData()
        if imageData.depth == 24 then
            local size = (imageData.data.n or #imageData.data)
            for index = 0, size - 1, 4 do
                rx = (imageData.data[index + 1] & 0xFF) << 16
                gx = (imageData.data[index + 1 + 1] & 0xFF) << 8
                bx = (imageData.data[index + 2 + 1] & 0xFF)
                rx = java_int(rx * r)
                gx = java_int(gx * g)
                bx = java_int(bx * b)
                imageData.data[index + 1] = rx
                imageData.data[index + 1 + 1] = gx
                imageData.data[index + 2 + 1] = bx
            end
        end
end


function ImageModifierUtil:setAlpha(unusedOriginalImage, image, imageIndex, alphaInt)
        if self.features:isFeature(OpenGLFeatureFactory.getInstance().OPENGL) then
            if image:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (image)
                openGLESImage.imageProcessor = ModifierOpenGLESImageProcessor.getInstance()
                openGLESImage.openGLESImageProperties.alphaf = ((alphaInt + 0.0)) / 255.0
                return
            end
        end
        self:setAlphaSWT(image, alphaInt)
end


function ImageModifierUtil:setAlphaSWT(image, alphaInt)
        local alpha = alphaInt
        local newBufferedImage = nil
        if image:isMutable() then
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        else
            local swtImage = image
            newBufferedImage = swtImage:getImage()
        end
        newBufferedImage:getImageData().alpha = alpha
end


function ImageModifierUtil:getImageArray(originalImageArray)
        local try_ok, try_error = pcall(function()
            local newImageArray = java_new_array(nil, (originalImageArray.n or #originalImageArray))
            local size = (newImageArray.n or #newImageArray)
            local originalImage = nil
            for index = 0, size - 1 do
                originalImage = originalImageArray[index + 1]
                local image = self.imageCopyUtil:createImage(originalImage)
                newImageArray[index + 1] = image
            end
            return newImageArray
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "getImageArray", e)
            return originalImageArray
        end
end


function ImageModifierUtil:handleImage(imageArray, index, image)
end


function ImageModifierUtil:reset()
end

ImageModifierUtil.instance = ImageModifierUtil.new()

return ImageModifierUtil

