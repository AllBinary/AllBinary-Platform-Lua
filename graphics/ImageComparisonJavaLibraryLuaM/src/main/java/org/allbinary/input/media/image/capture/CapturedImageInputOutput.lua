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
-- package org.allbinary.input.media.image.capture

-- local BufferedImage = require("java.awt.image.BufferedImage")
local ImageOutputData = require("org.allbinary.input.automation.ImageOutputData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LongUtil = require("org.allbinary.logic.java.number.LongUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local MediaDataFactory = require("org.allbinary.logic.visual.media.MediaDataFactory")
local ImagePersistanceUtil = require("org.allbinary.media.image.ImagePersistanceUtil")
local ImageUtil = require("org.allbinary.media.image.ImageUtil")
local BufferedImageFrameCacheable = require("org.allbinary.media.image.cache.BufferedImageFrameCacheable")
local ImageIOInterface = require("org.allbinary.media.image.io.ImageIOInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CapturedImageInputOutput = {}
CapturedImageInputOutput.__index = CapturedImageInputOutput
CapturedImageInputOutput.className = "CapturedImageInputOutput"

function CapturedImageInputOutput:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CapturedImageInputOutput.new()
    local self = setmetatable({}, CapturedImageInputOutput)
    self:_init_fields()
    return self
end


-- throws Exception
function CapturedImageInputOutput:save(frame)
        local commonStrings = CommonStrings.getInstance()
        local capturedBufferedImageCacheable = ((CapturedBufferedImagesCacheSingleton.getInstance()):get(frame))
        self.logUtil:putF(("Saving: " .. tostring(capturedBufferedImageCacheable)), self, commonStrings.SAVE)
        self:save(capturedBufferedImageCacheable:getBufferedImage(), frame)
end


-- Java overloaded method: Lua keeps the last definition
function CapturedImageInputOutput:save(bufferedImage, frame)
        local commonStrings = CommonStrings.getInstance()
        local imageUtil = ImageUtil.getInstance()
        local filePathStringBuffer = StringMaker.new()
        filePathStringBuffer:append(ImageOutputData.SAVE_PATH)
        filePathStringBuffer:append(LongUtil.fillIn(tostring(frame)))
        filePathStringBuffer:append(MediaDataFactory.getInstance().JPG:getExtension())
        local filePath = tostring(filePathStringBuffer)
        self.logUtil:putF(("Image File Path: " .. filePath .. imageUtil:toString(bufferedImage)), self, commonStrings.SAVE)
        local imagePersistanceUtil = ImagePersistanceUtil.getInstance()
        imagePersistanceUtil:saveWithImageIO(filePath, bufferedImage)
end

return CapturedImageInputOutput

