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

local UploadMediaSingleton = {}
package.loaded["org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton"] = UploadMediaSingleton

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local MediaData = java_lazy("org.allbinary.logic.visual.media.MediaData")
local MediaIOUtil = java_lazy("org.allbinary.logic.visual.media.MediaIOUtil")
local MediaTypeData = java_lazy("org.allbinary.logic.visual.media.MediaTypeData")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table UploadMediaSingleton is declared before the requires
UploadMediaSingleton.__index = UploadMediaSingleton
UploadMediaSingleton.className = "UploadMediaSingleton"
UploadMediaSingleton.javaClassName = "org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton"

function UploadMediaSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.readerFileTypesHashMap == nil then self.readerFileTypesHashMap = nil end
    if self.writerFileTypesHashMap == nil then self.writerFileTypesHashMap = nil end
end


function UploadMediaSingleton._jinit(self)
    UploadMediaSingleton._init_fields(self)
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Supported Media Readers: ")
            stringBuffer:append(tostring(self.readerFileTypesHashMap))
            stringBuffer:append(" Writers: ")
            stringBuffer:append(tostring(self.writerFileTypesHashMap))
            self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end

function UploadMediaSingleton.new(...)
    local self = setmetatable({}, UploadMediaSingleton)
    UploadMediaSingleton._jinit(self, ...)
    return self
end


function UploadMediaSingleton.getInstance()
        if rawequal(UploadMediaSingleton.uploadMedia, nil) then
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


function UploadMediaSingleton:isMedia_j2(mediaFileType, aMediaType)
        return self:isReaderMedia(mediaFileType, aMediaType) and self:isWriterMedia(mediaFileType, aMediaType)
end


function UploadMediaSingleton:isReaderMedia(mediaFileType, aMediaType)
        return self:isMedia(mediaFileType, aMediaType, self.readerFileTypesHashMap)
end


function UploadMediaSingleton:isWriterMedia(mediaFileType, aMediaType)
        return self:isMedia(mediaFileType, aMediaType, self.writerFileTypesHashMap)
end


function UploadMediaSingleton:isMedia_j3(mediaFileType, aMediaType, hashMap)
        if hashMap:containsKey(mediaFileType) then
            local mediaType = hashMap:get(mediaFileType)
            if rawequal(((mediaType < aMediaType and -1) or (mediaType > aMediaType and 1) or 0), 0) then
                return true
            else
                return false
            end
        else
            return false
        end
end
function UploadMediaSingleton:isMedia(...)
    local count = select("#", ...)
    if count == 2 then return self:isMedia_j2(...) end
    if count == 3 then return self:isMedia_j3(...) end
    error("No method isMedia takes " .. count .. " arguments")
end
UploadMediaSingleton.isMedia__jdispatcher = UploadMediaSingleton.isMedia

UploadMediaSingleton.uploadMedia = nil

return UploadMediaSingleton

