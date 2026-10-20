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
-- package org.allbinary.media.image.comparison.motion

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ImageOutputData = require("org.allbinary.input.automation.ImageOutputData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = require("org.allbinary.logic.java.number.LongUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local PoolInterface = require("org.allbinary.logic.util.cache.PoolInterface")
local MediaDataFactory = require("org.allbinary.logic.visual.media.MediaDataFactory")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local BufferedImageCacheable = require("org.allbinary.media.image.cache.BufferedImageCacheable")
local BufferedImageInfo = require("org.allbinary.media.image.cache.BufferedImageInfo")
local BufferedImageInfoFactory = require("org.allbinary.media.image.cache.BufferedImageInfoFactory")
local BufferedImagePoolSingleton = require("org.allbinary.media.image.cache.BufferedImagePoolSingleton")
local ImageComparisonResult = require("org.allbinary.media.image.comparison.ImageComparisonResult")
local ImageIOInterface = require("org.allbinary.media.image.io.ImageIOInterface")
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

local MotionRectanglesImageInputOutput = {}
MotionRectanglesImageInputOutput.__index = MotionRectanglesImageInputOutput
MotionRectanglesImageInputOutput.className = "MotionRectanglesImageInputOutput"

function MotionRectanglesImageInputOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NUMBER_OF_IMAGES = 1
end


function MotionRectanglesImageInputOutput.new()
    local self = setmetatable({}, MotionRectanglesImageInputOutput)
    self:_init_fields()
    return self
end


-- throws Exception
function MotionRectanglesImageInputOutput:save(frame)
        local commonStrings = CommonStrings.getInstance()
        local motionRectanglesResultsFrameCacheable = (AllMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
        if motionRectanglesResultsFrameCacheable ~= nil then
            local motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
            motionRectanglesResultsFrameCacheable = (ConsolidatedMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
            motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
            motionRectanglesResultsFrameCacheable = (ConstrainedMotionRectanglesResultsCacheSingleton.getInstance()):get(frame)
            motionRectangles = motionRectanglesResultsFrameCacheable:getMotionRectangles()
            self:save(motionRectangles, frame)
        else
            self.logUtil:putF("No Motion Rectangle Results for Frame: " .. tostring(frame), self, commonStrings.SAVE)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function MotionRectanglesImageInputOutput:save(motionRectangles, frame)
        local commonStrings = CommonStrings.getInstance()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
        filePathStringBuffer:append("_")
        filePathStringBuffer:append(motionRectangles:getName())
        local filePathStringBuffer1 = StringMaker.new()
        filePathStringBuffer1:append(tostring(filePathStringBuffer))
        filePathStringBuffer1:append("_1")
        filePathStringBuffer1:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePathStringBuffer2 = StringMaker.new()
        filePathStringBuffer2:append(tostring(filePathStringBuffer))
        filePathStringBuffer2:append("_2")
        filePathStringBuffer2:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePathStringBuffer3 = StringMaker.new()
        filePathStringBuffer3:append(tostring(filePathStringBuffer))
        filePathStringBuffer3:append(MediaDataFactory.getInstance().JPG:getExtension())
        self.logUtil:putF("Motion Image File Path 1: " .. tostring(filePathStringBuffer1), self, commonStrings.SAVE)
        self.logUtil:putF("Motion Image File Path 2: " .. tostring(filePathStringBuffer2), self, commonStrings.SAVE)
        self.logUtil:putF("Motion Image File Path 2: " .. tostring(filePathStringBuffer3), self, commonStrings.SAVE)
        local bufferedImageCacheables = java_new_array(nil, self.NUMBER_OF_IMAGES)
        local imageComparisonInfo = motionRectangles:getImageComparisonResult()
        local originalBufferedImage = imageComparisonInfo:getBufferedImages()[1]
        local bufferedImageInfo = BufferedImageInfoFactory.getInstance(imageComparisonInfo.imageWidth, imageComparisonInfo.imageHeight, originalBufferedImage:getType())
        local poolInterface = BufferedImagePoolSingleton.getInstance()
        for index = 0, self.NUMBER_OF_IMAGES - 1 do
            bufferedImageCacheables[index + 1] = poolInterface:remove(bufferedImageInfo)
        end
        bufferedImageCacheables[1]:getBufferedImage():setData(imageComparisonInfo:getBufferedImages()[2]:getData())
        if self.NUMBER_OF_IMAGES > 1 then
            bufferedImageCacheables[2]:getBufferedImage():setData(imageComparisonInfo:getBufferedImages()[2]:getData())
        end
        local bufferedImageGraphicsArray = nil
        bufferedImageGraphicsArray = java_new_array(nil, self.NUMBER_OF_IMAGES)
        for index = 0, self.NUMBER_OF_IMAGES - 1 do
            bufferedImageGraphicsArray[index + 1] = bufferedImageCacheables[index + 1]:getBufferedImage():getGraphics()
        end
        local rectangelList = motionRectangles:getVector()
        local size = rectangelList:size()
        for index2 = 0, size - 1 do
            local motionRectangle = rectangelList:get(index2)
            local rectangle = motionRectangle:getRectangle()
            for index = 0, self.NUMBER_OF_IMAGES - 1 do
                bufferedImageGraphicsArray[index + 1]:setColor(Color.ORANGE)
                bufferedImageGraphicsArray[index + 1]:drawRect(rectangle.x, rectangle.y, rectangle.width, rectangle.height)
            end
        end
        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
        if self.NUMBER_OF_IMAGES > 1 then
            imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer1), bufferedImageCacheables[2]:getBufferedImage())
        end
        imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer2), bufferedImageCacheables[1]:getBufferedImage())
        if self.NUMBER_OF_IMAGES > 2 then
            imagePersistanceUtil:saveWithImageIO(tostring(filePathStringBuffer3), bufferedImageCacheables[3]:getBufferedImage())
        end
end

return MotionRectanglesImageInputOutput

