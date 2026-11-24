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

local ImageModifierUtil = {}
package.loaded["org.allbinary.media.image.ImageModifierUtil"] = ImageModifierUtil

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local ColorModel = require("java.awt.image.ColorModel")
-- local WritableRaster = require("java.awt.image.WritableRaster")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ImageCreationUtil = java_lazy("org.allbinary.media.image.ImageCreationUtil")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")

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

-- class table ImageModifierUtil is declared before the requires
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"
ImageModifierUtil.javaClassName = "org.allbinary.media.image.ImageModifierUtil"

function ImageModifierUtil:_init_fields()
    self.imageUtil = ImageUtil.getInstance()
    self.colorArray = java_typed_array("I", java_new_array(0, 1))
end

function ImageModifierUtil._jinit(self)
    ImageModifierUtil._init_fields(self)
    return self
end

function ImageModifierUtil.new()
    return ImageModifierUtil._jinit(setmetatable({}, ImageModifierUtil))
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.instance_f
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
        local try_ok, try_error, try_value = pcall(function()
            local newImageArray = java_new_array(nil, (originalImageArray.n or #originalImageArray))
            local size = (newImageArray.n or #newImageArray)
            local originalImage = nil
            for index = 0, size - 1 do
                originalImage = originalImageArray[index + 1]
                local image = ImageCreationUtil.getInstance():createImageWH(originalImage:getWidth(), originalImage:getHeight())
                image:getGraphics():drawImage(originalImage, 0, 0, Anchor.TOP_LEFT)
                newImageArray[index + 1] = image
            end
            do return "__jreturn", newImageArray end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "getImageArray", e)
            return originalImageArray
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function ImageModifierUtil:handleImage(imageArray, index, image)
end


function ImageModifierUtil:reset()
end

ImageModifierUtil.instance_f = ImageModifierUtil.new()

return ImageModifierUtil

