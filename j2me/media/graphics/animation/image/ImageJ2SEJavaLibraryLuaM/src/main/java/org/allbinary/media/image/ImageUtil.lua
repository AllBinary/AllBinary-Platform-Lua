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

-- local Graphics2D = require("java.awt.Graphics2D")
-- local GraphicsConfiguration = require("java.awt.GraphicsConfiguration")
-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local GraphicsEnvironment = require("java.awt.GraphicsEnvironment")
-- local Transparency = require("java.awt.Transparency")
-- local AffineTransform = require("java.awt.geom.AffineTransform")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local Image = require("javax.microedition.lcdui.Image")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local J2SEImmutableImage = require("org.microemu.device.j2se.J2SEImmutableImage")
local J2SEMutableImage = require("org.microemu.device.j2se.J2SEMutableImage")

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

local ImageUtil = {}
ImageUtil.__index = ImageUtil
ImageUtil.className = "ImageUtil"

function ImageUtil:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.IIOIMAGE_POOL_NAME = "IIOIMAGE_POOL_NAME"
    self.CREATE_BUFFERED_IMAGE = "createBufferedImage"
end


function ImageUtil.getInstance()
        return ImageUtil.instance
end


function ImageUtil.new()
    local self = setmetatable({}, ImageUtil)
    self:_init_fields()
    return self
end


function ImageUtil:getDefaultConfiguration()
        local ge = GraphicsEnvironment.getLocalGraphicsEnvironment()
        local gd = ge:getDefaultScreenDevice()
        return gd:getDefaultConfiguration()
end


function ImageUtil:create(width, height)
        local graphicsConfiguration = self:getDefaultConfiguration()
        return graphicsConfiguration:createCompatibleImage(width, height, Transparency.TRANSLUCENT)
end


-- throws Exception
function ImageUtil:createBufferedImageForResize(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            local newWidth = java_int((bufferedImage:getWidth() * percent / 100))
            local newHeight = java_int((bufferedImage:getHeight() * percent / 100))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage2(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            local newWidth = java_int((bufferedImage:getWidth() * percent))
            local newHeight = java_int((bufferedImage:getHeight() * percent))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage3(bufferedImageArray, width, height, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            scaledBufferedImageArray[index + 1] = self:createBufferedImage(bufferedImageArray[index + 1], width, height, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImageForSave(bufferedImage, newWidth, newHeight)
        return self:createBufferedImage(bufferedImage, newWidth, newHeight, true)
end


-- throws Exception
function ImageUtil:createBufferedImage(bufferedImage, newWidth, newHeight, scale)
        return self:createBufferedImageAllowTranslate(bufferedImage, newWidth, newHeight, scale, false)
end


-- throws Exception
function ImageUtil:createBufferedImageAllowTranslate(bufferedImage, newWidth, newHeight, scale, allowTranslate)
        local width = bufferedImage:getWidth()
        local height = bufferedImage:getHeight()
        local d_newWidth = (newWidth + 0.0)
        local d_newHeight = (newHeight + 0.0)
        local widthRatio = d_newWidth / width
        local heightRatio = d_newHeight / height
        local ratioX = 1.0
        local ratioY = 1.0
        if scale then
            ratioX = widthRatio
            ratioY = heightRatio
        end
        local affineTransform = AffineTransform.getScaleInstance(ratioX, ratioY)
        if not scale and allowTranslate then
            local dx = ((newWidth + 0.0) - width) / 2.0
            local dy = ((newHeight + 0.0) - height) / 2.0
            affineTransform:translate(dx, dy)
        end
        local newBufferedImage = BufferedImage.new(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB_PRE)
        local graphics = newBufferedImage:createGraphics()
        graphics:drawRenderedImage(bufferedImage, affineTransform)
        return newBufferedImage
end


-- throws Exception
function ImageUtil:createBufferedImageWithLargerCanvas(bufferedImage, newWidth, newHeight)
        local width = bufferedImage:getWidth()
        local height = bufferedImage:getHeight()
        local d_newWidth = (newWidth + 0.0)
        local d_newHeight = (newHeight + 0.0)
        local widthRatio = d_newWidth / width
        local heightRatio = d_newHeight / height
        local dx2 = java_int(((newWidth + 0.0) - width))
        local dy2 = java_int(((newHeight + 0.0) - height))
        local dx = java_idiv(dx2, 2)
        local dy = java_idiv(dy2, 2)
        local dx4 = java_idiv(dx2, 4)
        local dy4 = java_idiv(dy2, 4)
        local newBufferedImage = BufferedImage.new(newWidth, newHeight, BufferedImage.TYPE_INT_ARGB_PRE)
        local graphics = newBufferedImage:createGraphics()
        graphics:drawImage(bufferedImage, dx4, dy4, nil)
        return newBufferedImage
end


function ImageUtil:convertToBufferedImage(toolkitImage)
        if toolkitImage == nil then
            return nil
        end
        local bufferedImage = BufferedImage.new(toolkitImage:getWidth(nil), toolkitImage:getHeight(nil), BufferedImage.TYPE_INT_ARGB)
        local g2d = bufferedImage:createGraphics()
        g2d:drawImage(toolkitImage, 0, 0, nil)
        g2d:dispose()
        return bufferedImage
end


function ImageUtil:getBufferedImage(image)
        local bufferedImage = nil
        if image:isMutable() then
            local j2seImage = image
            bufferedImage = j2seImage:getImage()
        else
            local j2seImage = image
            bufferedImage = j2seImage:getImage()
        end
        return bufferedImage
end


function ImageUtil:toString(bufferedImage)
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(" BufferedImage -")
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(java_int(bufferedImage:getWidth()))
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(bufferedImage:getHeight()))
        stringBuffer:append(" Type: ")
        stringBuffer:appendint(java_int(bufferedImage:getType()))
        return tostring(stringBuffer)
end

ImageUtil.instance = ImageUtil.new()

return ImageUtil

