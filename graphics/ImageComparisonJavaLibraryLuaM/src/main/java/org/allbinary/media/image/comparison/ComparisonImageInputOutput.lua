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
local ImageOutputData = require("org.allbinary.input.automation.ImageOutputData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = require("org.allbinary.logic.java.number.LongUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local MediaDataFactory = require("org.allbinary.logic.visual.media.MediaDataFactory")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local BufferedImageCacheable = require("org.allbinary.media.image.cache.BufferedImageCacheable")
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

local ComparisonImageInputOutput = {}
ComparisonImageInputOutput.__index = ComparisonImageInputOutput
ComparisonImageInputOutput.className = "ComparisonImageInputOutput"

function ComparisonImageInputOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ComparisonImageInputOutput.new()
    local self = setmetatable({}, ComparisonImageInputOutput)
    self:_init_fields()
    return self
end


-- throws Exception
function ComparisonImageInputOutput:save(frame)
        local commonStrings = CommonStrings.getInstance()
        if frame > 0 then
            local imageComparisonResultFrameCacheable = (ImageComparisonResultCacheSingleton.getInstance()):get(frame)
            if imageComparisonResultFrameCacheable ~= nil then
                local imageComparisonResult = imageComparisonResultFrameCacheable:getImageComparisonResult()
                self:save(imageComparisonResult, imageComparisonResultFrameCacheable:getFrame())
            else
                self.logUtil:putF("Comparison Results Not Available for Output: " .. tostring(frame), self, commonStrings.SAVE)
            end
        else
            self.logUtil:putF("No Comparison Results: for first frame: " .. tostring(frame), self, commonStrings.SAVE)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ComparisonImageInputOutput:save(imageComparisonResult, frame)
        local commonStrings = CommonStrings.getInstance()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
        filePathStringBuffer:append(ComparisonImageInputOutput.ROOT_NAME)
        local filePathStringBuffer1 = StringMaker.new()
        filePathStringBuffer1:append(tostring(filePathStringBuffer))
        filePathStringBuffer1:append("_1")
        filePathStringBuffer1:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePath1 = tostring(filePathStringBuffer1)
        local filePathStringBuffer2 = StringMaker.new()
        filePathStringBuffer2:append(tostring(filePathStringBuffer))
        filePathStringBuffer2:append("_2")
        filePathStringBuffer2:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePath2 = tostring(filePathStringBuffer2)
        local bufferedImageCacheables = ChangedPixelsUtil.generateBufferedImageChacheables(imageComparisonResult)
        self.logUtil:putF("Comparison Image File Path 1: " .. filePath1, self, commonStrings.SAVE)
        self.logUtil:putF("Comparison Image File Path 2: " .. filePath2, self, commonStrings.SAVE)
        local bufferedImageArray = java_new_array(nil, 2)
        bufferedImageArray[1] = bufferedImageCacheables[1]:getBufferedImage()
        bufferedImageArray[2] = bufferedImageCacheables[2]:getBufferedImage()
        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
        imagePersistanceUtil:saveWithImageIO(filePath1, bufferedImageArray[1])
        imagePersistanceUtil:saveWithImageIO(filePath2, bufferedImageArray[2])
end

ComparisonImageInputOutput.ROOT_NAME = "_Changed_"

return ComparisonImageInputOutput

