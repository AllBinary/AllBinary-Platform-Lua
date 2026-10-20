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
-- package org.allbinary.media.audio

local ARunnable = require("org.allbinary.thread.ARunnable")
-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local InputStream = require("java.io.InputStream")
-- local Control = require("javax.microedition.media.Control")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
-- local AudioInputStream = require("javax.sound.sampled.AudioInputStream")
-- local AudioSystem = require("javax.sound.sampled.AudioSystem")
-- local Clip = require("javax.sound.sampled.Clip")
-- local FloatControl = require("javax.sound.sampled.FloatControl")
-- local LineEvent = require("javax.sound.sampled.LineEvent")
-- local LineListener = require("javax.sound.sampled.LineListener")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local MusicThreadPool = require("org.allbinary.thread.MusicThreadPool")
local BasicPlayer = require("org.allbinary.media.audio.BasicPlayer")

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

local PCClipWavPlayer = {}
PCClipWavPlayer.__index = PCClipWavPlayer
PCClipWavPlayer.className = "PCClipWavPlayer"
setmetatable(PCClipWavPlayer, {__index = BasicPlayer})

function PCClipWavPlayer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.audioInputStream = nil
    self.clip = nil
end


function PCClipWavPlayer.new(inputStream)
    local self = setmetatable(BasicPlayer.new(), PCClipWavPlayer)
    self:_init_fields()
        local audioInputStream = AudioInputStream.new(ByteArrayInputStream.new(NullUtil.getInstance().NULL_BYTE_ARRAY), NullAudioFormat.NULL_AUDIO_FORMAT, 0)
        local clip = NullClip.new()
        local try_ok, try_error = pcall(function()
            audioInputStream = AudioSystem.getAudioInputStream(inputStream)
            clip = self:create(audioInputStream)
            if clip == nil then
                self.logUtil:put("Clip was null", self, self.commonStrings.CONSTRUCTOR, java_exception("Exception"))
                error(java_exception("RuntimeException"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
        self.audioInputStream = audioInputStream
        self.clip = clip
    return self
end


function PCClipWavPlayer:close()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error = pcall(function()
                    self:close2()
                end)
                if not try_ok then
                    local e = try_error
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            return o
        end)())
end


-- throws Exception
function PCClipWavPlayer:close2()
        self.clip:drain()
        self.clip:flush()
        self.clip:close()
end


function PCClipWavPlayer:getContentType()
        return StringUtil.getInstance().EMPTY_STRING
end


-- throws MediaException
function PCClipWavPlayer:start()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error = pcall(function()
                    self:start2()
                end)
                if not try_ok then
                    local e = try_error
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            return o
        end)())
end


-- throws Exception
function PCClipWavPlayer:start2()
        self.clip:setFramePosition(0)
        self.clip:loop(self:getLoopCount())
        self.clip:start()
        BasicPlayer.start(self)
end


-- throws Exception
function PCClipWavPlayer:create(audioInputStream)
        local clip = AudioSystem.getClip()
        clip:addLineListener(self)
        clip:open(audioInputStream)
        return clip
end


-- throws MediaException
function PCClipWavPlayer:stop()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error = pcall(function()
                    self:stop2()
                end)
                if not try_ok then
                    local e = try_error
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            return o
        end)())
end


-- throws Exception
function PCClipWavPlayer:stop2()
        self.clip:stop()
        BasicPlayer.stop(self)
end


function PCClipWavPlayer:getControl(controlType)
        return NullControl.new()
end


function PCClipWavPlayer:getControls()
        return java_new_array(nil, 0)
end


function PCClipWavPlayer:setVolume(leftVolume, rightVolume)
        self:setVolumeF(((leftVolume + 0.0)) / 100.0)
end


function PCClipWavPlayer:getVolume()
        local masterGainFloatControl = self.clip:getControl(FloatControl.Type.MASTER_GAIN)
        return (((10.0) ^ (masterGainFloatControl:getValue() / 20.0)) + 0.0)
end


function PCClipWavPlayer:setVolumeF(volume)
        if volume < 0.0 or volume > 1.0 then
            error(java_exception("IllegalArgumentException", "Volume: " .. tostring(volume)), 0)
        end
        local masterGainFloatControl = self.clip:getControl(FloatControl.Type.MASTER_GAIN)
        masterGainFloatControl:setValue(20.0 * (Math.log10(volume) + 0.0))
end


function PCClipWavPlayer:getDuration()
        return self.clip:getMicrosecondLength() / 1000
end


function PCClipWavPlayer:update(event)
        if event:getType():equals(LineEvent.Type.STOP) then
            local size = self.listenersList:size()
            for index = 0, size - 1 do
                local listener = self.listenersList:get(size)
                listener:playerUpdate(self, PlayerListener.END_OF_MEDIA, nil)
            end
        end
end

return PCClipWavPlayer

