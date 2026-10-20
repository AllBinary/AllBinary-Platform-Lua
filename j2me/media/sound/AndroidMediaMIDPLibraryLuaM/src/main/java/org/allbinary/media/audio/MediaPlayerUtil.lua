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

local MediaPlayer = require("android.media.MediaPlayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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

local MediaPlayerUtil = {}
MediaPlayerUtil.__index = MediaPlayerUtil
MediaPlayerUtil.className = "MediaPlayerUtil"

function MediaPlayerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function MediaPlayerUtil.new()
    local self = setmetatable({}, MediaPlayerUtil)
    self:_init_fields()
    return self
end


function MediaPlayerUtil.getInstance()
        return MediaPlayerUtil.instance
end


-- throws Exception
function MediaPlayerUtil:waitForMediaPlayer(mediaPlayer)
        local MESSAGE = "Not Stopped Waiting"
        local METHOD_NAME = "wait"
        local index = 0
        while mediaPlayer:isPlaying() and index < 50 do
            self.logUtil:putF(MESSAGE, self, METHOD_NAME)
            java_sleep(100)
            index = index + 1
        end
end

MediaPlayerUtil.instance = MediaPlayerUtil.new()

return MediaPlayerUtil

