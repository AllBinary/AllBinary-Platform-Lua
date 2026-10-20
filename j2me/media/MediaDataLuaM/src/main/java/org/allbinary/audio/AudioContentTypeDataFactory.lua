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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AudioContentTypeDataFactory = {}
AudioContentTypeDataFactory.__index = AudioContentTypeDataFactory
AudioContentTypeDataFactory.className = "AudioContentTypeDataFactory"

function AudioContentTypeDataFactory:_init_fields()
    self.MIME_AUDIO_TONE = AudioContentTypeData.new("audio/x-tone-seq")
    self.MIME_AUDIO_AMR = AudioContentTypeData.new("audio/amr")
    self.MIME_AUDIO_AMR_WB = AudioContentTypeData.new("audio/amr-wb")
    self.MIME_AUDIO_WAV = AudioContentTypeData.new("audio/x-wav")
    self.MIME_AUDIO_MIDI = AudioContentTypeData.new("audio/midi")
    self.MIME_AUDIO_SP_MIDI = AudioContentTypeData.new("audio/sp-midi")
end


function AudioContentTypeDataFactory.getInstance()
        return AudioContentTypeDataFactory.instance
end


function AudioContentTypeDataFactory.new()
    local self = setmetatable({}, AudioContentTypeDataFactory)
    self:_init_fields()
    return self
end

AudioContentTypeDataFactory.instance = AudioContentTypeDataFactory.new()

return AudioContentTypeDataFactory

