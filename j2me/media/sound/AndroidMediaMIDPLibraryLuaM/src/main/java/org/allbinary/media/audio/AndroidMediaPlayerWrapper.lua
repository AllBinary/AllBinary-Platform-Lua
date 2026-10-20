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

-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
local MediaPlayer = require("android.media.MediaPlayer")
local NullAndroidCanvas = require("org.allbinary.android.NullAndroidCanvas")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidMediaPlayerWrapper = {}
AndroidMediaPlayerWrapper.__index = AndroidMediaPlayerWrapper
AndroidMediaPlayerWrapper.className = "AndroidMediaPlayerWrapper"
setmetatable(AndroidMediaPlayerWrapper, {__index = BasicPlayer})

function AndroidMediaPlayerWrapper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.mediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER
end


function AndroidMediaPlayerWrapper.createPlayerWrapper()
        local try_ok, try_error = pcall(function()
            return AndroidMediaPlayerWrapper.new(StringUtil.getInstance().EMPTY_STRING)
        end)
        if not try_ok then
            local e = try_error
            error(java_exception("RuntimeException"), 0)
        end
end


function AndroidMediaPlayerWrapper.new(resource)
    local self = setmetatable(BasicPlayer.new(), AndroidMediaPlayerWrapper)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            if resource == StringUtil.getInstance().EMPTY_STRING then
            else
                local resourceUtil = ResourceUtil.getInstance()
                local mediaPlayer = MediaPlayer.create(resourceUtil:getContext(), math.tointeger(resourceUtil:getResourceId(resource) // 1))
                if mediaPlayer == nil then
                    error(java_exception("Exception", tostring(StringMaker.new():append("Failed to create media player for: "):append(resource):append(" with id: "):append(tostring(resourceUtil:getResourceId(resource))))), 0)
                end
                self:setMediaPlayer(mediaPlayer)
                self.mediaPlayer:setLooping(false)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(tostring(self.commonStrings.EXCEPTION_LABEL) .. resource, self, self.commonStrings.CONSTRUCTOR, e)
            error(e, 0)
        end
    return self
end


function AndroidMediaPlayerWrapper:setLoopCount(count)
        BasicPlayer.setLoopCount(self, count)
        if self.mediaPlayer ~= NullAndroidCanvas.NULL_MEDIA_PLAYER and self.mediaPlayer ~= nil then
            if count == 0 then
                self.mediaPlayer:setLooping(false)
            else
            end
        end
end


function AndroidMediaPlayerWrapper:addPlayerListener(playerListener)
        BasicPlayer.addPlayerListener(self, playerListener)
end


function AndroidMediaPlayerWrapper:removePlayerListener(playerListener)
        BasicPlayer.removePlayerListener(self, playerListener)
end


function AndroidMediaPlayerWrapper:getState()
        if self.mediaPlayer:isPlaying() then
            return Player.STARTED
        else
            return Player.PREFETCHED
        end
end


function AndroidMediaPlayerWrapper:close()
        local try_ok, try_error = pcall(function()
            self.mediaPlayer:release()
            self.mediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CLOSE, e)
        end
end


-- throws MediaException
function AndroidMediaPlayerWrapper:start()
        local try_ok, try_error = pcall(function()
            if self.mediaPlayer:isPlaying() then
                self.mediaPlayer:pause()
                self.mediaPlayer:seekTo(0)
            end
            self.mediaPlayer:start()
            BasicPlayer.start(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end


-- throws MediaException
function AndroidMediaPlayerWrapper:stop()
        local try_ok, try_error = pcall(function()
            self.mediaPlayer:stop()
            self.mediaPlayer:prepare()
            BasicPlayer.stop(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "stop", e)
        end
end


function AndroidMediaPlayerWrapper:update(event)
        self.logUtil:putF("LineEvent: " .. event, self, self.commonStrings.UPDATE)
        local size = self.listenersList:size()
        for index = 0, size - 1 do
            local listener = self.listenersList.objectArray[index + 1]
            listener:playerUpdate(self, event, NullUtil.getInstance().NULL_OBJECT)
        end
end


function AndroidMediaPlayerWrapper:setVolume(leftVolume, rightVolume)
        self.mediaPlayer:setVolume(((leftVolume + 0.0)) / 100.0, ((rightVolume + 0.0)) / 100.0)
end


function AndroidMediaPlayerWrapper:getDuration()
        return java_int(self.mediaPlayer:getDuration())
end


function AndroidMediaPlayerWrapper:setMediaPlayer(mediaPlayer)
        self.mediaPlayer = mediaPlayer
end


function AndroidMediaPlayerWrapper:getMediaPlayer()
        return self.mediaPlayer
end

AndroidMediaPlayerWrapper.NULL_ANDROID_MEDIA_PLAYER_WRAPPER = AndroidMediaPlayerWrapper.createPlayerWrapper()

return AndroidMediaPlayerWrapper

