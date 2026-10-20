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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local ColorModel = require("java.awt.image.ColorModel")
-- local WritableRaster = require("java.awt.image.WritableRaster")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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
    self.imageUtil = ImageUtil.getInstance()
    self.colorArray = java_new_array(0, 1)
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
        local newBufferedImage = self.imageUtil:getBufferedImage(image)
        local r = basicColor.red
        local g = basicColor.green
        local b = basicColor.blue
        local width = image:getWidth()
        local height = image:getHeight()
        local colorModel = nil
        local dataElements = nil
        local ax = 0
        local rx = 0
        local gx = 0
        local bx = 0
        for index = 0, width - 1 do
            for index2 = 0, height - 1 do
                colorModel = newBufferedImage:getColorModel()
                dataElements = newBufferedImage:getRaster():getDataElements(index, index2, nil)
                ax = colorModel:getAlpha(dataElements)
                rx = colorModel:getRed(dataElements)
                gx = colorModel:getGreen(dataElements)
                bx = colorModel:getBlue(dataElements)
                if rx ~= 0 or gx ~= 0 or bx ~= 0 then
                    newBufferedImage:setRGB(index, index2, (ax << 24) | (r << 16) | (g << 8) | (b))
                end
            end
        end
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
        local newBufferedImage = self.imageUtil:getBufferedImage(image)
        local MAX = 255.0
        local r = ((basicColor.red + 0.0)) / MAX
        local g = ((basicColor.green + 0.0)) / MAX
        local b = ((basicColor.blue + 0.0)) / MAX
        local width = image:getWidth()
        local height = image:getHeight()
        local colorModel = nil
        local dataElements = nil
        local ax = 0
        local rx = 0
        local gx = 0
        local bx = 0
        for index = 0, width - 1 do
            for index2 = 0, height - 1 do
                colorModel = newBufferedImage:getColorModel()
                dataElements = newBufferedImage:getRaster():getDataElements(index, index2, nil)
                ax = colorModel:getAlpha(dataElements)
                rx = colorModel:getRed(dataElements)
                gx = colorModel:getGreen(dataElements)
                bx = colorModel:getBlue(dataElements)
                rx = java_int(rx * r)
                gx = java_int(gx * g)
                bx = java_int(bx * b)
                newBufferedImage:setRGB(index, index2, (ax << 24) | (rx << 16) | (gx << 8) | (bx))
            end
        end
end


function ImageModifierUtil:setAlpha(unusedOriginalImage, image, imageIndex, alphaInt)
        local alpha = alphaInt
        local newBufferedImage = self.imageUtil:getBufferedImage(image)
        local width = image:getWidth()
        local height = image:getHeight()
        local raster = newBufferedImage:getAlphaRaster()
        for index = 0, width - 1 do
            for index2 = 0, height - 1 do
                raster:getPixel(index, index2, self.colorArray)
                self.colorArray[1] = alpha & self.colorArray[1]
                raster:setPixel(index, index2, self.colorArray)
            end
        end
end


function ImageModifierUtil:getImageArray(originalImageArray)
        local try_ok, try_error = pcall(function()
            local newImageArray = java_new_array(nil, (originalImageArray.n or #originalImageArray))
            local size = (newImageArray.n or #newImageArray)
            local originalImage = nil
            for index = 0, size - 1 do
                originalImage = originalImageArray[index + 1]
                local image = ImageCreationUtil.getInstance():createImageWH(originalImage:getWidth(), originalImage:getHeight())
                image:getGraphics():drawImage(originalImage, 0, 0, Anchor.TOP_LEFT)
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

