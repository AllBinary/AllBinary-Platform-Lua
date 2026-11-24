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
-- package org.allbinary.logic.visual.media

local MediaData = {}
package.loaded["org.allbinary.logic.visual.media.MediaData"] = MediaData

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
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local MediaDataFactory = java_lazy("org.allbinary.logic.visual.media.MediaDataFactory")
local MediaTypeData = java_lazy("org.allbinary.logic.visual.media.MediaTypeData")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table MediaData is declared before the requires
MediaData.__index = MediaData
MediaData.className = "MediaData"
MediaData.javaClassName = "org.allbinary.logic.visual.media.MediaData"

function MediaData:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.type == nil then self.type = nil end
    if self.extension == nil then self.extension = nil end
end


function MediaData._jinit(self, a_Name)
    MediaData._init_fields(self)
        self.name_f = a_Name
        self.extension = "." .. self.name_f
        self.type = MediaTypeData.getInstance().NOT_RESIZABLE_MEDIA
        MediaData.hashMap:put(a_Name, self)
    return self
end

function MediaData.new(...)
    local self = setmetatable({}, MediaData)
    MediaData._jinit(self, ...)
    return self
end


function MediaData:getName()
        return self.name_f
end


function MediaData:getType()
        return self.type
end


function MediaData:getExtension()
        return self.extension
end


function MediaData:isConvertableTo(mediaData)
        if self == MediaDataFactory.getInstance().GIF and mediaData == MediaDataFactory.getInstance().JPG then
            return true
        end
        return false
end


function MediaData:toString()
        return self:getName()
end
MediaData.__tostring = function(self) return self:toString() end


-- throws Exception
function MediaData.get(a_Name)
        local mediaData = MediaData.hashMap:get(a_Name)
        if mediaData ~= nil then
            return mediaData
        else
            error(require("java.lang.Exception").new("No Such MediaData"), 0)
        end
end


function MediaData.getDefault()
        return MediaDataFactory.getInstance().JPG
end


function MediaData.toHashMap()
        return MediaData.hashMap
end

MediaData.hashMap = StdUtil.getInstance():createHashMap()

return MediaData

