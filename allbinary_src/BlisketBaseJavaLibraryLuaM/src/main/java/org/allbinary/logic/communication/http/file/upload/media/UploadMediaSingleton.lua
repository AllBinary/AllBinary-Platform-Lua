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
-- package org.allbinary.logic.communication.http.file.upload.media

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local MediaData = require("org.allbinary.logic.visual.media.MediaData")
local MediaIOUtil = require("org.allbinary.logic.visual.media.MediaIOUtil")
local MediaTypeData = require("org.allbinary.logic.visual.media.MediaTypeData")
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

local UploadMediaSingleton = {}
UploadMediaSingleton.__index = UploadMediaSingleton
UploadMediaSingleton.className = "UploadMediaSingleton"

function UploadMediaSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.readerFileTypesHashMap = nil
    self.writerFileTypesHashMap = nil
end


function UploadMediaSingleton.new()
    local self = setmetatable({}, UploadMediaSingleton)
    self:_init_fields()
        self.readerFileTypesHashMap = StdUtil.getInstance():createHashMap()
        self.writerFileTypesHashMap = StdUtil.getInstance():createHashMap()
        local hashMap = MediaData.toHashMap()
        local set = hashMap:keySet()
        local mediaDataNameArray = set:toArray()
        local size = (mediaDataNameArray.n or #mediaDataNameArray)
        for index = 0, size - 1 do
            local mediaDataName = mediaDataNameArray[index + 1]
            local mediaData = hashMap:get(mediaDataName)
            self.readerFileTypesHashMap:put(mediaData:getName(), mediaData:getType())
        end
        local mediaIOUtil = MediaIOUtil.getInstance()
        local RESIZABLE_MEDIA = MediaTypeData.getInstance().RESIZABLE_MEDIA
        local readerFileTypes = mediaIOUtil:getReaderFormatNames()
        for index = 0, (readerFileTypes.n or #readerFileTypes) - 1 do
            self.readerFileTypesHashMap:put(readerFileTypes[index + 1], RESIZABLE_MEDIA)
        end
        local writerFileTypes = mediaIOUtil:getWriterFormatNames()
        for index = 0, (writerFileTypes.n or #writerFileTypes) - 1 do
            self.writerFileTypesHashMap:put(writerFileTypes[index + 1], RESIZABLE_MEDIA)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Supported Media Readers: ")
            stringBuffer:append(tostring(self.readerFileTypesHashMap))
            stringBuffer:append(" Writers: ")
            stringBuffer:append(tostring(self.writerFileTypesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function UploadMediaSingleton.getInstance()
        if UploadMediaSingleton.uploadMedia == nil then
            UploadMediaSingleton.uploadMedia = UploadMediaSingleton.new()
        end
        return UploadMediaSingleton.uploadMedia
end


function UploadMediaSingleton:isReaderSupported(mediaFileType)
        return self.readerFileTypesHashMap:containsKey(mediaFileType)
end


function UploadMediaSingleton:isWriterSupported(mediaFileType)
        return self.readerFileTypesHashMap:containsKey(mediaFileType)
end


function UploadMediaSingleton:isSupported(mediaFileType)
        return self:isReaderSupported(mediaFileType) and self:isWriterSupported(mediaFileType)
end


function UploadMediaSingleton:isMedia(mediaFileType, aMediaType)
        return self:isReaderMedia(mediaFileType, aMediaType) and self:isWriterMedia(mediaFileType, aMediaType)
end


function UploadMediaSingleton:isReaderMedia(mediaFileType, aMediaType)
        return self:isMedia(mediaFileType, aMediaType, self.readerFileTypesHashMap)
end


function UploadMediaSingleton:isWriterMedia(mediaFileType, aMediaType)
        return self:isMedia(mediaFileType, aMediaType, self.writerFileTypesHashMap)
end


-- Java overloaded method: Lua keeps the last definition
function UploadMediaSingleton:isMedia(mediaFileType, aMediaType, hashMap)
        if hashMap:containsKey(mediaFileType) then
            local mediaType = hashMap:get(mediaFileType)
            if ((mediaType < aMediaType and -1) or (mediaType > aMediaType and 1) or 0) == 0 then
                return true
            else
                return false
            end
        else
            return false
        end
end

UploadMediaSingleton.uploadMedia = nil

return UploadMediaSingleton

