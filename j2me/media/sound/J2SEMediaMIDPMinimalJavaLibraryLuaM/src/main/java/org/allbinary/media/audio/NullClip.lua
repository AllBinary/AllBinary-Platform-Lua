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

-- local IOException = require("java.io.IOException")
-- local AudioFormat = require("javax.sound.sampled.AudioFormat")
-- local AudioInputStream = require("javax.sound.sampled.AudioInputStream")
-- local BooleanControl = require("javax.sound.sampled.BooleanControl")
-- local Clip = require("javax.sound.sampled.Clip")
-- local Control = require("javax.sound.sampled.Control")
-- local Type = require("javax.sound.sampled.Control.Type")
-- local Info = require("javax.sound.sampled.Line.Info")
-- local LineListener = require("javax.sound.sampled.LineListener")
-- local LineUnavailableException = require("javax.sound.sampled.LineUnavailableException")

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

local NullClip = {}
NullClip.__index = NullClip
NullClip.className = "NullClip"

function NullClip.new()
    local self = setmetatable({}, NullClip)
    return self
end


-- throws LineUnavailableException
function NullClip:open(format, data, offset, bufferSize)
end


-- throws LineUnavailableException, IOException
-- Java overloaded method: Lua keeps the last definition
function NullClip:open(stream)
end


function NullClip:getFrameLength()
        return 0
end


function NullClip:getMicrosecondLength()
        return 0
end


function NullClip:setFramePosition(frames)
end


function NullClip:setMicrosecondPosition(microseconds)
end


function NullClip:setLoopPoints(start, end_)
end


function NullClip:loop(count)
end


function NullClip:drain()
end


function NullClip:flush()
end


function NullClip:start()
end


function NullClip:stop()
end


function NullClip:isRunning()
        return false
end


function NullClip:isActive()
        return false
end


function NullClip:getFormat()
        return NullAudioFormat.NULL_AUDIO_FORMAT
end


function NullClip:getBufferSize()
        return 0
end


function NullClip:available()
        return 0
end


function NullClip:getFramePosition()
        return 0
end


function NullClip:getLongFramePosition()
        return 0
end


function NullClip:getMicrosecondPosition()
        return 0
end


function NullClip:getLevel()
        return 0.0
end


function NullClip:getLineInfo()
        return Info.new(getmetatable(self), NullAudioFormat.NULL_AUDIO_FORMAT)
end


-- throws LineUnavailableException
-- Java overloaded method: Lua keeps the last definition
function NullClip:open()
end


function NullClip:close()
end


function NullClip:isOpen()
        return false
end


function NullClip:getControls()
        return java_new_array(nil, 0)
end


function NullClip:isControlSupported(control)
        return false
end


function NullClip:getControl(control)
        return NullClip.NULL_CONTROL
end


function NullClip:addLineListener(listener)
end


function NullClip:removeLineListener(listener)
end

NullClip.NULL_CONTROL = NullJ2SEControl.new(BooleanControl.Type.MUTE)

return NullClip

