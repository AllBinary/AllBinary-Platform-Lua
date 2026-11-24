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
-- package org.allbinary.audio

local AudioContentTypeDataFactory = {}
package.loaded["org.allbinary.audio.AudioContentTypeDataFactory"] = AudioContentTypeDataFactory

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

local AudioContentTypeData = java_lazy("org.allbinary.audio.AudioContentTypeData")

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

-- class table AudioContentTypeDataFactory is declared before the requires
AudioContentTypeDataFactory.__index = AudioContentTypeDataFactory
AudioContentTypeDataFactory.className = "AudioContentTypeDataFactory"
AudioContentTypeDataFactory.javaClassName = "org.allbinary.audio.AudioContentTypeDataFactory"

function AudioContentTypeDataFactory:_init_fields()
    self.MIME_AUDIO_TONE = AudioContentTypeData.new("audio/x-tone-seq")
    self.MIME_AUDIO_AMR = AudioContentTypeData.new("audio/amr")
    self.MIME_AUDIO_AMR_WB = AudioContentTypeData.new("audio/amr-wb")
    self.MIME_AUDIO_WAV = AudioContentTypeData.new("audio/x-wav")
    self.MIME_AUDIO_MIDI = AudioContentTypeData.new("audio/midi")
    self.MIME_AUDIO_SP_MIDI = AudioContentTypeData.new("audio/sp-midi")
end


function AudioContentTypeDataFactory.getInstance()
        return AudioContentTypeDataFactory.instance_f
end


function AudioContentTypeDataFactory._jinit(self)
    AudioContentTypeDataFactory._init_fields(self)
    return self
end

function AudioContentTypeDataFactory.new(...)
    local self = setmetatable({}, AudioContentTypeDataFactory)
    AudioContentTypeDataFactory._jinit(self, ...)
    return self
end

AudioContentTypeDataFactory.instance_f = AudioContentTypeDataFactory.new()

return AudioContentTypeDataFactory

