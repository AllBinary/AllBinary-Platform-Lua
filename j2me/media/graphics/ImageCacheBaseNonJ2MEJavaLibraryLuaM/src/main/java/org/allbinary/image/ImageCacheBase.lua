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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

local ImageCacheBase = {}
ImageCacheBase.__index = ImageCacheBase
ImageCacheBase.className = "ImageCacheBase"

function ImageCacheBase:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageFactory = ImageFactory.getInstance()
    self.hashtable = StdUtil.getInstance():createHashtable()
    self.SIZE = 128
    self.widths = java_new_array(0, self.SIZE)
    self.heights = java_new_array(0, self.SIZE)
    self.listOfList = java_new_array(nil, self.SIZE)
    self.availableListOfList = java_new_array(nil, self.SIZE)
    self.volume = 0
    self.nextIndex = 0
end


function ImageCacheBase.new()
    local self = setmetatable({}, ImageCacheBase)
    self:_init_fields()
        for index = (self.listOfList.n or #self.listOfList) - 1, 0, -1 do
            self.listOfList[index + 1] = BasicArrayListD.new()
        end
        for index = (self.availableListOfList.n or #self.availableListOfList) - 1, 0, -1 do
            self.availableListOfList[index + 1] = BasicArrayListD.new()
        end
    return self
end


function ImageCacheBase:getImage(resourceId)
        local imageCanBeNull = self.hashtable:get(resourceId)
        if imageCanBeNull == nil then
            return NullImage.NULL_IMAGE
        end
        return imageCanBeNull
end


function ImageCacheBase:releaseAll()
        for index = (self.listOfList.n or #self.listOfList) - 1, 0, -1 do
            self.availableListOfList[index + 1]:clear()
            self.availableListOfList[index + 1]:addAllList(self.listOfList[index + 1])
        end
        self.logUtil:putF(tostring(StringMaker.new():append("ImageCache: "):append(tostring(self))), self, "releaseAll")
end


function ImageCacheBase:getIndexWH(width, height)
        local foundIndex = -1
        local size = (self.widths.n or #self.widths)
        for index = 0, size - 1 do
            if self.widths[index + 1] == width and self.heights[index + 1] == height then
                foundIndex = index
                return foundIndex
            end
        end
        return foundIndex
end


function ImageCacheBase:getFromAvailable(foundIndex, width, height)
        if foundIndex ~= -1 then
            if self.availableListOfList[foundIndex + 1]:size() > 0 then
                local list = self.availableListOfList[foundIndex + 1]
                return list:removeAt(list:size() - 1)
            end
        end
        return NullImage.NULL_IMAGE
end


-- throws Exception
function ImageCacheBase:get(caller, width, height)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function ImageCacheBase:getWithKey(key)
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function ImageCacheBase:createImage(caller, width, height)
        return self.imageFactory:createImage(caller, width, height)
end


-- throws Exception
function ImageCacheBase:createImageFromInputStream(key, inputStream)
        return self.imageFactory:createImageFromInputStream(key, inputStream)
end


function ImageCacheBase:toString()
        local stringBuffer = StringMaker.new()
        for index = self.nextIndex - 1, 0, -1 do
            local width = self.widths[index + 1]
            local height = self.heights[index + 1]
            local total = self.listOfList[index + 1]:size()
            local totalAvailable = self.availableListOfList[index + 1]:size()
            stringBuffer:append(" w: ")
            stringBuffer:appendint(width)
            stringBuffer:append(" h: ")
            stringBuffer:appendint(height)
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            stringBuffer:append(CommonLabels.getInstance().TOTAL_LABEL)
            stringBuffer:appendint(total)
            stringBuffer:append(" available: ")
            stringBuffer:appendint(totalAvailable)
        end
        return tostring(stringBuffer)
end
ImageCacheBase.__tostring = function(self) return self:toString() end


function ImageCacheBase:getHashtableP()
        return self.hashtable
end


function ImageCacheBase:init(image)
end


function ImageCacheBase:initProgress()
end

return ImageCacheBase

