-- Generated Code Do Not Modify
-- package org.allbinary.media.audio

-- local PlayerListener = require("javax.microedition.media.PlayerListener")
local MediaPlayer = require("android.media.MediaPlayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local AndroidMediaPlayerWrapperListener = {}
AndroidMediaPlayerWrapperListener.__index = AndroidMediaPlayerWrapperListener
AndroidMediaPlayerWrapperListener.className = "AndroidMediaPlayerWrapperListener"
local MediaPlayerOnBufferingUpdateListener = {}
    MediaPlayerOnBufferingUpdateListener.__index = MediaPlayerOnBufferingUpdateListener
    MediaPlayerOnBufferingUpdateListener.className = "MediaPlayerOnBufferingUpdateListener"
    AndroidMediaPlayerWrapperListener.MediaPlayerOnBufferingUpdateListener = MediaPlayerOnBufferingUpdateListener

    function MediaPlayerOnBufferingUpdateListener.new()
        local self = setmetatable({}, MediaPlayerOnBufferingUpdateListener)
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onBufferingUpdate(mediaPlayer, i)
    end

local MediaPlayerOnPreparedListener = {}
    MediaPlayerOnPreparedListener.__index = MediaPlayerOnPreparedListener
    MediaPlayerOnPreparedListener.className = "MediaPlayerOnPreparedListener"
    AndroidMediaPlayerWrapperListener.MediaPlayerOnPreparedListener = MediaPlayerOnPreparedListener

    function MediaPlayerOnPreparedListener.new()
        local self = setmetatable({}, MediaPlayerOnPreparedListener)
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onPrepared(mp)
    end

local MediaPlayerOnErrorListener = {}
    MediaPlayerOnErrorListener.__index = MediaPlayerOnErrorListener
    MediaPlayerOnErrorListener.className = "MediaPlayerOnErrorListener"
    AndroidMediaPlayerWrapperListener.MediaPlayerOnErrorListener = MediaPlayerOnErrorListener

    function MediaPlayerOnErrorListener.new()
        local self = setmetatable({}, MediaPlayerOnErrorListener)
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onError(mp, what, extra)
            return false
    end

local MediaPlayerOnCompletionListener = {}
    MediaPlayerOnCompletionListener.__index = MediaPlayerOnCompletionListener
    MediaPlayerOnCompletionListener.className = "MediaPlayerOnCompletionListener"
    AndroidMediaPlayerWrapperListener.MediaPlayerOnCompletionListener = MediaPlayerOnCompletionListener

    function MediaPlayerOnCompletionListener.new()
        local self = setmetatable({}, MediaPlayerOnCompletionListener)
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onCompletion(mp)
    end

local AndroidMediaPlayerOnBufferingUpdateListener = {}
    AndroidMediaPlayerOnBufferingUpdateListener.__index = AndroidMediaPlayerOnBufferingUpdateListener
    AndroidMediaPlayerOnBufferingUpdateListener.className = "AndroidMediaPlayerOnBufferingUpdateListener"
    setmetatable(AndroidMediaPlayerOnBufferingUpdateListener, {__index = MediaPlayerOnBufferingUpdateListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnBufferingUpdateListener = AndroidMediaPlayerOnBufferingUpdateListener

    function AndroidMediaPlayerOnBufferingUpdateListener:_init_fields()
        self.ON_BUFFERING_UPDATE = "onBufferingUpdate()"
        self.androidMediaPlayerWrapperListener = nil
    end
    

    function AndroidMediaPlayerWrapperListener.new(androidMediaPlayerWrapperListener)
        local self = setmetatable(MediaPlayerOnBufferingUpdateListener.new(), AndroidMediaPlayerWrapperListener)
        self:_init_fields()
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onBufferingUpdate(mediaPlayer, i)
            local logUtil = LogUtil.getInstance()
            logUtil:putF(tostring(StringMaker.new():append("Update buffer: "):appendint(i):append("%")), self, self.ON_BUFFERING_UPDATE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.DEVICE_UNAVAILABLE)
    end

local AndroidMediaPlayerOnPreparedListener = {}
    AndroidMediaPlayerOnPreparedListener.__index = AndroidMediaPlayerOnPreparedListener
    AndroidMediaPlayerOnPreparedListener.className = "AndroidMediaPlayerOnPreparedListener"
    setmetatable(AndroidMediaPlayerOnPreparedListener, {__index = MediaPlayerOnPreparedListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnPreparedListener = AndroidMediaPlayerOnPreparedListener

    function AndroidMediaPlayerOnPreparedListener:_init_fields()
        self.ON_PREPARE = "onPrepare()"
        self.androidMediaPlayerWrapperListener = nil
    end
    

    function AndroidMediaPlayerWrapperListener.new(androidMediaPlayerWrapperListener)
        local self = setmetatable(MediaPlayerOnPreparedListener.new(), AndroidMediaPlayerWrapperListener)
        self:_init_fields()
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onPrepared(mp)
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:putF(commonStrings.START, self, self.ON_PREPARE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.DEVICE_AVAILABLE)
    end

local AndroidMediaPlayerOnErrorListener = {}
    AndroidMediaPlayerOnErrorListener.__index = AndroidMediaPlayerOnErrorListener
    AndroidMediaPlayerOnErrorListener.className = "AndroidMediaPlayerOnErrorListener"
    setmetatable(AndroidMediaPlayerOnErrorListener, {__index = MediaPlayerOnErrorListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnErrorListener = AndroidMediaPlayerOnErrorListener

    function AndroidMediaPlayerOnErrorListener:_init_fields()
        self.ON_ERROR = "onError()"
        self.androidMediaPlayerWrapperListener = nil
    end
    

    function AndroidMediaPlayerWrapperListener.new(androidMediaPlayerWrapperListener)
        local self = setmetatable(MediaPlayerOnErrorListener.new(), AndroidMediaPlayerWrapperListener)
        self:_init_fields()
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onError(mp, what, extra)
            local logUtil = LogUtil.getInstance()
            logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append("What: "):appendint(what):append(" Extra: "):appendint(extra)), self, self.ON_ERROR)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.ERROR)
            return true
    end

local AndroidMediaPlayerOnCompletionListener = {}
    AndroidMediaPlayerOnCompletionListener.__index = AndroidMediaPlayerOnCompletionListener
    AndroidMediaPlayerOnCompletionListener.className = "AndroidMediaPlayerOnCompletionListener"
    setmetatable(AndroidMediaPlayerOnCompletionListener, {__index = MediaPlayerOnCompletionListener})
    AndroidMediaPlayerWrapperListener.AndroidMediaPlayerOnCompletionListener = AndroidMediaPlayerOnCompletionListener

    function AndroidMediaPlayerOnCompletionListener:_init_fields()
        self.ON_COMPLETE = "onComplete()"
        self.androidMediaPlayerWrapperListener = nil
    end
    

    function AndroidMediaPlayerWrapperListener.new(androidMediaPlayerWrapperListener)
        local self = setmetatable(MediaPlayerOnCompletionListener.new(), AndroidMediaPlayerWrapperListener)
        self:_init_fields()
            self.androidMediaPlayerWrapperListener = androidMediaPlayerWrapperListener
        return self
    end
    

    function AndroidMediaPlayerWrapperListener:onCompletion(mp)
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:putF(commonStrings.START, self, self.ON_COMPLETE)
            self.androidMediaPlayerWrapperListener.androidMediaPlayerWrapper:update(PlayerListener.END_OF_MEDIA)
    end


function AndroidMediaPlayerWrapperListener:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.androidMediaPlayerWrapper = AndroidMediaPlayerWrapper.NULL_ANDROID_MEDIA_PLAYER_WRAPPER
    self.mOnBufferingUpdateListener = AndroidMediaPlayerOnBufferingUpdateListener.new(self)
    self.mOnPreparedListener = AndroidMediaPlayerOnPreparedListener.new(self)
    self.mOnErrorListener = AndroidMediaPlayerOnErrorListener.new(self)
    self.mOnCompletionListener = AndroidMediaPlayerOnCompletionListener.new(self)
end


function AndroidMediaPlayerWrapperListener.new(androidMediaPlayerWrapper)
    local self = setmetatable({}, AndroidMediaPlayerWrapperListener)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
            self.androidMediaPlayerWrapper = androidMediaPlayerWrapper
            local mediaPlayer = androidMediaPlayerWrapper:getMediaPlayer()
            mediaPlayer:setOnCompletionListener(self.mOnCompletionListener)
            mediaPlayer:setOnBufferingUpdateListener(self.mOnBufferingUpdateListener)
            mediaPlayer:setOnPreparedListener(self.mOnPreparedListener)
            mediaPlayer:setOnErrorListener(self.mOnErrorListener)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end

return AndroidMediaPlayerWrapperListener

