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

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local ColorCacheFactory = require("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = require("org.allbinary.graphics.color.ColorCacheable")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local PixelDeltaFactory = require("org.allbinary.media.image.comparison.pixel.PixelDeltaFactory")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local ImageComparator = {}
ImageComparator.__index = ImageComparator
ImageComparator.className = "ImageComparator"

function ImageComparator:_init_fields()
    self.imageComparatorConstraintsInterface = nil
end


function ImageComparator.new(imageComparatorConstraintsInterface)
    local self = setmetatable({}, ImageComparator)
    self:_init_fields()
        self.imageComparatorConstraintsInterface = imageComparatorConstraintsInterface
    return self
end


-- throws Exception
function ImageComparator:process(imageComparisonInfo, point)
        local isCollsionWithAvoidRectangles = self.imageComparatorConstraintsInterface:isCollisionWithAvoidRectangles(point)
        if not isCollsionWithAvoidRectangles then
            local rgb1 = imageComparisonInfo:getBufferedImages()[1]:getRGB(point:getX(), point:getY())
            local rgb2 = imageComparisonInfo:getBufferedImages()[2]:getRGB(point:getX(), point:getY())
            local automaticCacheInterface = ColorCacheFactory.getInstance()
            local colorInteger = tostring(rgb1)
            local colorCacheable = automaticCacheInterface:get(colorInteger)
            local color = colorCacheable:getColor()
            local colorInteger2 = tostring(rgb2)
            local colorCacheable2 = automaticCacheInterface:get(colorInteger)
            local color2 = colorCacheable:getColor()
            if self.imageComparatorConstraintsInterface:isColorAllowed(0, point, color) or self.imageComparatorConstraintsInterface:isColorAllowed(1, point, color2) then
                if math.abs(rgb1 - rgb2) <= imageComparisonInfo:getTolerance() then
                    imageComparisonInfo.pixelsThatMatch = imageComparisonInfo.pixelsThatMatch + 1
                else
                    imageComparisonInfo:add(PixelDeltaFactory.getInstance(point:getX(), point:getY(), rgb1, rgb2))
                end
            end
        else
            imageComparisonInfo.pixelsIgnored = imageComparisonInfo.pixelsIgnored + 1
        end
end


-- throws Exception
function ImageComparator:compare(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance)
        return self:compare(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance, StringUtil.getInstance().EMPTY_STRING)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ImageComparator:compare(bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance, name)
        if bufferedImage1 == nil or bufferedImage2 == nil then
            error(java_exception("Exception", "Input images must not be null."), 0)
        end
        local imageComparisonInfo = ImageComparisonResult.new(name, bufferedImage1, bufferedImage2, frameOne, frameTwo, tolerance)
        for indexY = 0, imageComparisonInfo.imageHeight - 1 do
            for indexX = 0, imageComparisonInfo.imageWidth - 1 do
                self:process(imageComparisonInfo, PointFactory.getInstance():createXY(indexX, indexY))
                if imageComparisonInfo:getNonMatchingPixelVector():size() > self.imageComparatorConstraintsInterface:getMaxNonMatchingPixelDeltas() then
                    break
                end
            end
        end
        return imageComparisonInfo
end

return ImageComparator

