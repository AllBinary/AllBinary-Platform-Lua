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

-- local Image = require("javax.microedition.lcdui.Image")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local PlaynImage = require("org.microemu.device.playn.PlaynImage")
local ImageCompleteUtil = require("org.allbinary.media.image.ImageCompleteUtil")

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

local ImageWaitCompleteUtil = {}
ImageWaitCompleteUtil.__index = ImageWaitCompleteUtil
ImageWaitCompleteUtil.className = "ImageWaitCompleteUtil"
setmetatable(ImageWaitCompleteUtil, {__index = ImageCompleteUtil})

function ImageWaitCompleteUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(18000)
    self.allTimeDelayHelper = TimeDelayHelper.new(120000)
end


function ImageWaitCompleteUtil.new()
    local self = setmetatable(ImageCompleteUtil.new(), ImageWaitCompleteUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageWaitCompleteUtil:waitForImage(image, name)
        self.timeDelayHelper:setStartTimeTNT()
        self:waitForATime(image, name, self.timeDelayHelper)
end


-- throws Exception
function ImageWaitCompleteUtil:handleTimeout(name)
        if self.timeDelayHelper:isTimeTNT() then
            error(java_exception("Exception", "isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " .. name), 0)
        end
end


-- throws Exception
function ImageWaitCompleteUtil:waitForATime(image, name, timeDelayHelper)
        local playnImage = image
        local playnCoreImage = playnImage:getImage()
        while not playnCoreImage:isReady() or playnCoreImage:width() + playnCoreImage:height() <= 0 do
            if timeDelayHelper:isTimeTNT() then
                error(java_exception("Exception", "waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " .. name), 0)
            end
        end
        if not image:isReady() then
            image:init(image:getImage())
        end
end


-- throws Exception
function ImageWaitCompleteUtil:waitForAll()
        self.allTimeDelayHelper:setStartTimeTNT()
        local hashtable = GameFeatureImageCacheFactory.getInstance():getHashtableP()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local size = (objectArray.n or #objectArray)
        PreLogUtil.put("Image Total: " .. tostring(size), self, "waitForAll")
        for index = 0, size - 1 do
            self:waitForATime(hashtable:get(objectArray[index + 1]), objectArray[index + 1], self.allTimeDelayHelper)
        end
end

return ImageWaitCompleteUtil

