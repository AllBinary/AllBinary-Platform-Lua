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
-- package org.allbinary.image

-- local InputStream = require("java.io.InputStream")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local TsUtil = require("org.allbinary.TsUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local GDResources = require("org.allbinary.game.gd.resource.GDResources")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Memory = require("org.allbinary.system.Memory")
local ImageCacheBase = require("org.allbinary.image.ImageCacheBase")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local ImageCache = {}
ImageCache.__index = ImageCache
ImageCache.className = "ImageCache"
setmetatable(ImageCache, {__index = ImageCacheBase})

function ImageCache:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.systemWrapper = ABSystemWrapper.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function ImageCache.new()
    local self = setmetatable(ImageCacheBase.new(), ImageCache)
    self:_init_fields()
    return self
end


function ImageCache:addListener(renderer)
end


function ImageCache:getIndex(key)
        local gdResources = GDResources.getInstance()
        local resourceStringArray = gdResources.resourceStringArray
        local size = (resourceStringArray.n or #resourceStringArray)
        for index = 0, size - 1 do
            if resourceStringArray[index + 1] == key then
                return index
            end
        end
        self.logUtil:putF(tostring(StringMaker.new():append("unable to find key: "):append(StringUtil.getInstance():toString(key))), self, self.commonStrings.RUN)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function ImageCache:get(caller, width, height)
        local foundIndex = self:getIndexWH(width, height)
        local image = self:getFromAvailable(foundIndex, width, height)
        if image == NullImage.NULL_IMAGE then
            self.volume = self.volume + (width * height)
            if self.volume > 32000 then
                self.tsUtil:gc()
                self.volume = 0
            end
            image = self:createImage(caller, width, height)
            if foundIndex == -1 then
                foundIndex = self.nextIndex
                self.widths[self.nextIndex + 1] = width
                self.heights[self.nextIndex + 1] = height
                self.nextIndex = self.nextIndex + 1
            end
            self.listOfList[foundIndex + 1]:add(image)
        end
        return image
end


-- throws Exception
function ImageCache:getWithKey(key)
        local resourceUtil = ResourceUtil.getInstance()
        local resourceId = resourceUtil:getResourceId(key)
        local image = self:getImage(resourceId)
        if image == NullImage.NULL_IMAGE then
            local inputStream = resourceUtil:getResourceAsStream(key)
            local try_ok, try_error = pcall(function()
                self.logUtil:putF(Memory.getInfo(), self, self.commonStrings.GET)
                image = self:createImageFromInputStream(key, inputStream)
            end)
            if not try_ok then
                local e = try_error
                self.logUtil:put("Exception: Trying Again After GC", self, self.commonStrings.GET, e)
                self.logUtil:putF(tostring(StringMaker.new():append("InputStream: "):append(StringUtil.getInstance():toString(inputStream))), self, self.commonStrings.GET)
                self.tsUtil:gc()
                self.tsUtil:gc()
                self.logUtil:putF(Memory.getInfo(), self, self.commonStrings.GET)
                java_sleep(100)
                image = self:createImageFromInputStream(key, inputStream)
            end
            inputStream:close()
            self.hashtable:put(resourceId, image)
        end
        return image
end


function ImageCache:runTask()
end


function ImageCache:isLazy()
        return false
end

ImageCache.NULL_IMAGE_CACHE = ImageCache.new()

return ImageCache

