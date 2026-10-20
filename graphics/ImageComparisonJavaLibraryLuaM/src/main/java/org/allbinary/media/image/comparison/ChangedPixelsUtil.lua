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
-- package org.allbinary.media.image.comparison

-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PoolInterface = require("org.allbinary.logic.util.cache.PoolInterface")
local BufferedImageCacheable = require("org.allbinary.media.image.cache.BufferedImageCacheable")
local BufferedImageInfo = require("org.allbinary.media.image.cache.BufferedImageInfo")
local BufferedImageInfoFactory = require("org.allbinary.media.image.cache.BufferedImageInfoFactory")
local BufferedImagePoolSingleton = require("org.allbinary.media.image.cache.BufferedImagePoolSingleton")
local PixelDelta = require("org.allbinary.media.image.comparison.pixel.PixelDelta")

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

local ChangedPixelsUtil = {}
ChangedPixelsUtil.__index = ChangedPixelsUtil
ChangedPixelsUtil.className = "ChangedPixelsUtil"


function ChangedPixelsUtil.new()
    local self = setmetatable({}, ChangedPixelsUtil)
    return self
end


-- throws Exception
function ChangedPixelsUtil.generateBufferedImageChacheables(imageComparisonInfo)
        local bufferedImageCacheables = nil
        local originalBufferedImage = imageComparisonInfo:getBufferedImages()[1]
        bufferedImageCacheables = java_new_array(nil, 2)
        local bufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage:getType())
        local poolInterface = BufferedImagePoolSingleton.getInstance()
        for index = 0, (bufferedImageCacheables.n or #bufferedImageCacheables) - 1 do
            local bufferedImageCacheable = poolInterface:remove(bufferedImageInfo)
            bufferedImageCacheables[index + 1] = bufferedImageCacheable
            bufferedImageCacheables[index + 1]:getBufferedImage():setRGB(ChangedPixelsUtil.START_X, ChangedPixelsUtil.START_Y, bufferedImageInfo:getWidth(), bufferedImageInfo:getHeight(), ChangedPixelsUtil.CLEAR_INT_ARRAY, ChangedPixelsUtil.OFFSET, ChangedPixelsUtil.SCAN_SIZE)
        end
        local vector = imageComparisonInfo:getNonMatchingPixelVector()
        local size = vector:size()
        for index = 0, size - 1 do
            local pixelDelta = vector:get(index)
            if pixelDelta:getColorDelta() == nil then
                io.write(tostring("ColorDelta"))
                os.exit(0)
            end
            bufferedImageCacheables[1]:getBufferedImage():setRGB(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), pixelDelta:getColorDelta():getRgb1())
            bufferedImageCacheables[2]:getBufferedImage():setRGB(pixelDelta:getPoint():getX(), pixelDelta:getPoint():getY(), pixelDelta:getColorDelta():getRgb2())
        end
        return bufferedImageCacheables
end

ChangedPixelsUtil.START_X = 0
ChangedPixelsUtil.START_Y = 0
ChangedPixelsUtil.OFFSET = 0
ChangedPixelsUtil.SCAN_SIZE = 0
ChangedPixelsUtil.CLEAR_INT_ARRAY = java_new_array(0, 1800 * 1600)

return ChangedPixelsUtil

