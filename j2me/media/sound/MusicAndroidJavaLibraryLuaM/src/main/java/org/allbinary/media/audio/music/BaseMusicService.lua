-- Generated Code Do Not Modify
-- package org.allbinary.media.audio.music

local Service = require("android.app.Service")
local Intent = require("android.content.Intent")
local MediaPlayer = require("android.media.MediaPlayer")
local IBinder = require("android.os.IBinder")
local NullAndroidCanvas = require("org.allbinary.android.NullAndroidCanvas")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStateStrings = require("org.allbinary.string.CommonStateStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ARunnable = require("org.allbinary.thread.ARunnable")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local BaseMusicService = {}
BaseMusicService.__index = BaseMusicService
BaseMusicService.className = "BaseMusicService"
setmetatable(BaseMusicService, {__index = Service})

function BaseMusicService:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonStateStrings = CommonStateStrings.getInstance()
    self.ALREADY_PLAYING = "This is one song per music service"
    self.WAITING_FOR_MUSIC_TO_END = "Waiting for music to end"
    self.player = NullAndroidCanvas.NULL_MEDIA_PLAYER
    self.songId = -1
    self.leftVolume = -1
    self.rightVolume = -1
end

function BaseMusicService.new()
    local self = setmetatable(Service.new(), BaseMusicService)
    self:_init_fields()
    return self
end


function BaseMusicService:onBind(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.BIND)
        return nil
end


function BaseMusicService:onCreate()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.CREATE)
end


function BaseMusicService:onDestroy()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.DESTROY)
        if self.player ~= NullAndroidCanvas.NULL_MEDIA_PLAYER then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.PAUSE)
            self.player:stop()
            self.player:reset()
            self.player:release()
        end
end


function BaseMusicService:pause()
        if self.player ~= NullAndroidCanvas.NULL_MEDIA_PLAYER then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.PAUSE)
            self.player:pause()
        end
end


function BaseMusicService:resume()
        if self.player ~= NullAndroidCanvas.NULL_MEDIA_PLAYER and not self.player:isPlaying() then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.RESUME)
            self.player:start()
        end
end


function BaseMusicService:start()
        self.player = MediaPlayer.create(self, self.songId)
        self.player:setVolume(((self.leftVolume + 0.0)) / 100.0, ((self.rightVolume + 0.0)) / 100.0)
        self.player:setLooping(false)
        self.player:start()
end


function BaseMusicService:onStart(intent, startid)
        self:onStartCommandIntent(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.START)
end


function BaseMusicService:onStartCommand(intent, flags, startId)
        self:onStartCommandIntent(intent)
        return Service.START_STICKY
end


function BaseMusicService:onStartCommandIntent(intent)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStateStrings.ON_START_COMMAND)
        local musicStrings = MusicStrings.getInstance()
        if intent ~= nil then
            local command = intent:getIntExtra(self.commonStateStrings.ON_START_COMMAND, -1)
            self.logUtil:putF(CommonLabels.getInstance().COMMAND_LABEL + command, self, self.commonStateStrings.ON_START_COMMAND)
            if command == 1 then
                self:pause()
                return
            elseif command == 2 then
                self:resume()
                return
            else
                self.songId = intent:getIntExtra(musicStrings.SONG_EXTRA, -1)
                self.leftVolume = intent:getIntExtra(musicStrings.LEFT_VOLUME, -1)
                self.rightVolume = intent:getIntExtra(musicStrings.RIGHT_VOLUME, -1)
            end
        else
            error(java_exception("RuntimeException", "Started service without intent"), 0)
        end
        if self.songId ~= -1 then
            collectgarbage()
            if self.player ~= NullAndroidCanvas.NULL_MEDIA_PLAYER and self.player:isPlaying() then
                local player = self.player
                self.logUtil:putF(self.ALREADY_PLAYING, self, self.commonStateStrings.ON_START_COMMAND)
                local MusicRunnable = {}
                MusicRunnable.__index = MusicRunnable
                MusicRunnable.className = "MusicRunnable"
                setmetatable(MusicRunnable, {__index = ARunnable})

                function MusicRunnable:_init_fields()
                    self.baseMusicService = nil
                end
                

                function BaseMusicService.new(baseMusicService)
                    local self = setmetatable(ARunnable.new(), BaseMusicService)
                    self:_init_fields()
                        self.baseMusicService = baseMusicService
                    return self
                end
                

                function BaseMusicService:run()
                        local logUtil = LogUtil.getInstance()
                        local commonStrings = CommonStrings.getInstance()
                        local commonStateStrings = CommonStateStrings.getInstance()
                        local try_ok, try_error = pcall(function()
                            while self.player:isPlaying() do
                                logUtil:putF(self.baseMusicService.WAITING_FOR_MUSIC_TO_END, self, commonStateStrings.ON_START_COMMAND)
                                java_sleep(1200)
                            end
                            self.baseMusicService:onStartCommandIntent(self.intent)
                        end)
                        if not try_ok then
                            local e = try_error
                            logUtil:put(commonStrings.EXCEPTION, self, commonStateStrings.ON_START_COMMAND, e)
                        end
                end

                local runnable = MusicRunnable.new(self)
                local thread = Thread.new(runnable)
                thread:start()
                return
            end
            self:start()
        end
end

return BaseMusicService

