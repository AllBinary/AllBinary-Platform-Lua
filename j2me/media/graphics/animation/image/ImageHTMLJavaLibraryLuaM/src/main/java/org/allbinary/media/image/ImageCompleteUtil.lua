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

-- local Image = require("javax.microedition.lcdui.Image")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local PlaynImage = require("org.microemu.device.playn.PlaynImage")

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

local ImageCompleteUtil = {}
ImageCompleteUtil.__index = ImageCompleteUtil
ImageCompleteUtil.className = "ImageCompleteUtil"

function ImageCompleteUtil:_init_fields()
    self.timeDelayHelper = TimeDelayHelper.new(18000)
    self.allTimeDelayHelper = TimeDelayHelper.new(120000)
end

function ImageCompleteUtil.new()
    local self = setmetatable({}, ImageCompleteUtil)
    self:_init_fields()
    return self
end


function ImageCompleteUtil.getInstance()
        return ImageCompleteUtil.instance
end


-- throws Exception
function ImageCompleteUtil:waitForImage(image, name)
        self.timeDelayHelper:setStartTime()
        self:waitForATime(image, name, self.timeDelayHelper)
end


-- throws Exception
function ImageCompleteUtil:isReady(image, name, timeDelayHelper)
        local playnImage = image
        if not playnImage:getImage():isReady() and playnImage:getImage():width() + playnImage:getImage():height() == 0 then
            if timeDelayHelper:isTime() then
                error(java_exception("Exception", "isReady: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " .. name), 0)
            end
            return false
        end
        return true
end


-- throws Exception
function ImageCompleteUtil:waitForATime(image, name, timeDelayHelper)
        local playnImage = image
        while not playnImage:getImage():isReady() and playnImage:getImage():width() + playnImage:getImage():height() == 0 do
            if timeDelayHelper:isTime() then
                error(java_exception("Exception", "waitFor: Timeout Waiting or GameHtmlHasLoadedResourcesProcessor does not have this Image: " .. name), 0)
            end
        end
end


-- throws Exception
function ImageCompleteUtil:waitForAll()
        self.allTimeDelayHelper:setStartTime()
        local hashtable = GameFeatureImageCacheFactory.getInstance():getHashtable()
        local objectArray = HashtableUtil.getInstance():getKeysAsArray(hashtable)
        local size = (objectArray.n or #objectArray)
        PreLogUtil.put("Total: " .. tostring(size), self, "waitForAll")
        for index = 0, size - 1 do
            self:waitForATime(hashtable:get(objectArray[index + 1]), objectArray[index + 1], self.allTimeDelayHelper)
        end
end

ImageCompleteUtil.instance = ImageCompleteUtil.new()

return ImageCompleteUtil

