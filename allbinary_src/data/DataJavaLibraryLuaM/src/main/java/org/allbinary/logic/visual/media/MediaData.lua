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

-- local HashMap = require("java.util.HashMap")
local StdUtil = require("org.allbinary.logic.StdUtil")

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

local MediaData = {}
MediaData.__index = MediaData
MediaData.className = "MediaData"

function MediaData:_init_fields()
    self.name = nil
    self.type = nil
    self.extension = nil
end


function MediaData.new(a_Name)
    local self = setmetatable({}, MediaData)
    self:_init_fields()
        self.name = a_Name
        self.extension = "." .. self.name
        self.type = MediaTypeData.getInstance().NOT_RESIZABLE_MEDIA
        MediaData.hashMap:put(a_Name, self)
    return self
end


function MediaData:getName()
        return self.name
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
            error(java_exception("Exception", "No Such MediaData"), 0)
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

