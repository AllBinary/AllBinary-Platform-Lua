-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.media.audio

-- local AudioFormat = require("javax.sound.sampled.AudioFormat")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullAudioFormat = {}
NullAudioFormat.__index = NullAudioFormat
NullAudioFormat.className = "NullAudioFormat"

function NullAudioFormat.new()
    local self = setmetatable({}, NullAudioFormat)
    return self
end

NullAudioFormat.NULL_AUDIO_FORMAT = AudioFormat.new(AudioFormat.Encoding.PCM_UNSIGNED, 0.0, 0, 0, 0, 0.0, false)

return NullAudioFormat

