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

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

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

local ImagesRatioUtil = {}
ImagesRatioUtil.__index = ImagesRatioUtil
ImagesRatioUtil.className = "ImagesRatioUtil"

function ImagesRatioUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
end


function ImagesRatioUtil.getInstance()
        return ImagesRatioUtil.instance
end


function ImagesRatioUtil.new()
    local self = setmetatable({}, ImagesRatioUtil)
    self:_init_fields()
    return self
end


function ImagesRatioUtil:isEqual(bufferedImageArray, totalImages)
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        local ratio = ((bufferedImageArray[1]:getWidth() + 0.0) / bufferedImageArray[1]:getHeight())
        for index = 1, end_ - 1 do
            if ratio ~= ((bufferedImageArray[index + 1]:getWidth() + 0.0) / bufferedImageArray[index + 1]:getHeight()) then
                return false
            end
        end
        return true
end


function ImagesRatioUtil:getAverage(bufferedImageArray, totalImages)
        local ratio = 0.0
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        for index = 0, end_ - 1 do
            ratio = ratio + (((bufferedImageArray[index + 1]:getWidth() + 0.0) / bufferedImageArray[index + 1]:getHeight()))
        end
        return (ratio / (end_ + 0.0))
end


-- throws Exception
function ImagesRatioUtil:fudge(bufferedImage, ratio)
        local imageRatio = ((bufferedImage:getWidth() + 0.0) / bufferedImage:getHeight())
        local point = Point.new()
        local newHeight = bufferedImage:getHeight()
        local newWidth = bufferedImage:getWidth()
        if ratio > imageRatio then
            newWidth = java_int(((bufferedImage:getHeight() + 0.0) * ratio))
            point.x = (newWidth - bufferedImage:getWidth()) / 2
        else
            newHeight = java_int(((bufferedImage:getWidth() + 0.0) / ratio))
            point.y = (newHeight - bufferedImage:getHeight()) / 2
        end
        local commonLabels = CommonLabels.getInstance()
        self.logUtil:putF(tostring(commonLabels.WIDTH_LABEL + bufferedImage:getWidth()) .. " newWidth: " .. tostring(newWidth) .. tostring(commonLabels.HEIGHT_LABEL) .. tostring(bufferedImage:getHeight()) .. " newHeight: " .. tostring(newHeight) .. " needed ratio: " .. tostring(((newWidth + 0.0) / (newHeight + 0.0))), self, "fudge")
        local newBufferedImage = self.imageUtil:create(newWidth, newHeight)
        local g = newBufferedImage:createGraphics()
        if point.x > 0 then
            local firstColumnBufferedImage = bufferedImage:getSubimage(0, 0, 1, bufferedImage:getHeight())
            local lastColumnBufferedImage = bufferedImage:getSubimage(bufferedImage:getWidth() - 1, 0, 1, bufferedImage:getHeight())
            self.logUtil:putF("Draw some columns to fill in gap", self, "fudge")
            for index = 0, point.x - 1 do
                g:drawImage(firstColumnBufferedImage, index, 0, nil)
                g:drawImage(lastColumnBufferedImage, newWidth - index, 0, nil)
            end
        end
        if point.y > 0 then
            local firstRowBufferedImage = bufferedImage:getSubimage(0, 0, bufferedImage:getWidth(), 1)
            local lastRowBufferedImage = bufferedImage:getSubimage(0, bufferedImage:getHeight() - 1, bufferedImage:getWidth(), 1)
            self.logUtil:putF("Draw some rows to fill in gap", self, "fudge")
            for index = 0, point.y - 1 do
                g:drawImage(firstRowBufferedImage, 0, index, nil)
                g:drawImage(lastRowBufferedImage, 0, newHeight - index, nil)
            end
        end
        g:drawImage(bufferedImage, point.x, point.y, bufferedImage:getWidth(), bufferedImage:getHeight(), nil)
        return newBufferedImage
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ImagesRatioUtil:fudge(bufferedImageArray, totalImages, ratio)
        local end_ = totalImages
        if (bufferedImageArray.n or #bufferedImageArray) < totalImages then
            end_ = (bufferedImageArray.n or #bufferedImageArray)
        end
        local fudgedBufferedImageArray = java_new_array(nil, end_)
        for index = 0, end_ - 1 do
            fudgedBufferedImageArray[index + 1] = self:fudge(bufferedImageArray[index + 1], ratio)
        end
        return fudgedBufferedImageArray
end

ImagesRatioUtil.instance = ImagesRatioUtil.new()

return ImagesRatioUtil

