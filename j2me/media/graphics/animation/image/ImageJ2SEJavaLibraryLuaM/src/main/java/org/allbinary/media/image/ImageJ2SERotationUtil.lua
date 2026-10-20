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
-- local Image = require("java.awt.Image")
-- local BufferedImage = require("java.awt.image.BufferedImage")

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

local ImageJ2SERotationUtil = {}
ImageJ2SERotationUtil.__index = ImageJ2SERotationUtil
ImageJ2SERotationUtil.className = "ImageJ2SERotationUtil"

function ImageJ2SERotationUtil:_init_fields()
    self.imageUtil = ImageUtil.getInstance()
    self.imageJ2SEUtil = ImageJ2SEUtil.getInstance()
    self.TWO_PIE = 2 * Math.PI
end


function ImageJ2SERotationUtil.getInstance()
        return ImageJ2SERotationUtil.instance
end


function ImageJ2SERotationUtil.new()
    local self = setmetatable({}, ImageJ2SERotationUtil)
    self:_init_fields()
    return self
end


function ImageJ2SERotationUtil:getRotatedImage(bufferedImage, totalAngle)
        return self:getRotatedImageRadians(bufferedImage, self.TWO_PIE * (totalAngle + 0.0) / 360.0)
end


function ImageJ2SERotationUtil:getRotatedImageRadians(bufferedImage, radians)
        local newBufferedImage = self.imageUtil:create(bufferedImage:getWidth(nil), bufferedImage:getHeight(nil))
        return self:drawRotatedImageRadians(bufferedImage, newBufferedImage, newBufferedImage:createGraphics(), radians)
end


function ImageJ2SERotationUtil:drawRotatedImageRadians(bufferedImage, newBufferedImage, g, radians)
        g:rotate(radians, newBufferedImage:getWidth(nil) / 2, newBufferedImage:getHeight(nil) / 2)
        g:drawImage(bufferedImage, 0, 0, bufferedImage:getWidth(nil), bufferedImage:getHeight(nil), nil)
        g:dispose()
        return newBufferedImage
end


function ImageJ2SERotationUtil:rotateImage(bufferedImage, newBufferedImage, totalAngle)
        local g = newBufferedImage:createGraphics()
        g:setBackground(self.imageJ2SEUtil.TRANSPARENT_COLOR)
        g:clearRect(0, 0, newBufferedImage:getWidth(), newBufferedImage:getHeight())
        return self:drawRotatedImageRadians(bufferedImage, newBufferedImage, g, self.TWO_PIE * (totalAngle + 0.0) / 360.0)
end


function ImageJ2SERotationUtil:createRotatedImage(bufferedImage, newBufferedImage, totalAngle)
        local g = newBufferedImage:createGraphics()
        return self:drawRotatedImageRadians(bufferedImage, newBufferedImage, g, self.TWO_PIE * (totalAngle + 0.0) / 360.0)
end


function ImageJ2SERotationUtil:getRotatedImages(bufferedImage, numberOfFrames, totalAngle)
        local bufferedImageArray = java_new_array(nil, numberOfFrames)
        local arc = (self.TWO_PIE) * (totalAngle + 0.0) / 360.0
        local size = (bufferedImageArray.n or #bufferedImageArray)
        for index = 0, size - 1 do
            local radians = (arc / (size + 0.0)) * (index + 0.0)
            bufferedImageArray[index + 1] = self:getRotatedImageRadians(bufferedImage, radians)
        end
        return bufferedImageArray
end


function ImageJ2SERotationUtil:createSpriteImage(bufferedImageArray)
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
        local bufferedImage = self.imageUtil:create(firstBufferedImage:getWidth(nil) * columns, firstBufferedImage:getHeight(nil) * rows)
        local g = bufferedImage:createGraphics()
        local columnIndex = 0
        local rowIndex = 0
        local nextBufferedImage = nil
        for index = 0, size - 1 do
            if java_idiv(index, 9) ~= 0 and math.fmod(index, 9) == 0 then
                rowIndex = rowIndex + 1
                columnIndex = 0
            end
            nextBufferedImage = bufferedImageArray[index + 1]
            g:drawImage(nextBufferedImage, nextBufferedImage:getWidth(nil) * columnIndex, nextBufferedImage:getHeight(nil) * rowIndex, nextBufferedImage:getWidth(nil), nextBufferedImage:getHeight(nil), nil)
            columnIndex = columnIndex + 1
        end
        g:dispose()
        return bufferedImage
end

ImageJ2SERotationUtil.instance = ImageJ2SERotationUtil.new()

return ImageJ2SERotationUtil

