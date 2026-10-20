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
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
local PixelDelta = require("org.allbinary.media.image.comparison.pixel.PixelDelta")
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

local ImageComparisonResult = {}
ImageComparisonResult.__index = ImageComparisonResult
ImageComparisonResult.className = "ImageComparisonResult"

function ImageComparisonResult:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.bufferedImages = java_new_array(nil, 2)
    self.name = nil
    self.isSameHeight = false
    self.isSameWidth = false
    self.imageHeight = nil
    self.imageWidth = nil
    self.nonMatchingPixelVector = nil
    self.frameOne = nil
    self.frameTwo = nil
    self.pixelsThatMatch = 0
    self.pixelsIgnored = 0
    self.tolerance = 0
    self.matchingPercent = (-1 + 0.0)
end


function ImageComparisonResult.new(name, bufferedImage, bufferedImage2, frameOne, frameTwo, tolerance)
    local self = setmetatable({}, ImageComparisonResult)
    self:_init_fields()
        self.name = name
        self.nonMatchingPixelVector = BasicArrayListD.new()
        self.bufferedImages[1] = bufferedImage
        self.bufferedImages[2] = bufferedImage2
        self.frameOne = frameOne
        self.frameTwo = frameTwo
        self:setTolerance(0)
        local imageHeight = bufferedImage:getHeight()
        local imageWidth = bufferedImage:getWidth()
        if bufferedImage:getHeight() ~= bufferedImage2:getHeight() then
            self.isSameHeight = false
            if imageHeight > bufferedImage2:getHeight() then
                imageHeight = bufferedImage2:getHeight()
            end
        else
            self.isSameHeight = true
        end
        if bufferedImage:getWidth() ~= bufferedImage2:getWidth() then
            self.isSameWidth = false
            if imageWidth > bufferedImage2:getWidth() then
                imageWidth = bufferedImage2:getWidth()
            end
        else
            self.isSameWidth = true
        end
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        if not self.isSameWidth or not self.isSameHeight then
            local imageUtil = ImageUtil.getInstance()
            self.logUtil:putF("Images were not the same size? Most likely a resolution change.", self, self.commonStrings.CONSTRUCTOR)
            self.logUtil:putF("1: " .. imageUtil:toString(bufferedImage), self, self.commonStrings.CONSTRUCTOR)
            self.logUtil:putF("2: " .. imageUtil:toString(bufferedImage2), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function ImageComparisonResult:getMatchingPercent()
        if self.matchingPercent == (-1 + 0.0) then
            self.matchingPercent = (self.pixelsThatMatch + 0.0) / ((self.imageWidth * self.imageHeight) + 0.0)
        end
        return self.matchingPercent
end


function ImageComparisonResult:add(pixel)
        self.nonMatchingPixelVector:add(pixel)
end


function ImageComparisonResult:getNonMatchingPixelVector()
        return self.nonMatchingPixelVector
end


function ImageComparisonResult:toString()
        return tostring(StringMaker.new():append("ImageComparisonInfo: "):append(self.name):append(" Number Of Matching Pixels: "):appendint(self.pixelsThatMatch):append("\nNumber Of Non-Matching Pixels: "):appendint(self:getNonMatchingPixelVector():size()):append("\nNumber Of Pixels Ignored: "):appendint(self.pixelsIgnored):append("\nMatching Percentage: "):appendfloat(self:getMatchingPercent()))
end
ImageComparisonResult.__tostring = function(self) return self:toString() end


function ImageComparisonResult:getBufferedImages()
        return self.bufferedImages
end


function ImageComparisonResult:getTolerance()
        return self.tolerance
end


function ImageComparisonResult:setTolerance(tolerance)
        self.tolerance = tolerance
end


function ImageComparisonResult:getFrameOne()
        return self.frameOne
end


function ImageComparisonResult:getFrameTwo()
        return self.frameTwo
end

return ImageComparisonResult

