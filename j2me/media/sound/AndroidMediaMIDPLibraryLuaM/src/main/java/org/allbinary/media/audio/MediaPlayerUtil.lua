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

local MediaPlayerUtil = {}
package.loaded["org.allbinary.media.audio.MediaPlayerUtil"] = MediaPlayerUtil

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

local MediaPlayer = java_lazy("android.media.MediaPlayer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table MediaPlayerUtil is declared before the requires
MediaPlayerUtil.__index = MediaPlayerUtil
MediaPlayerUtil.className = "MediaPlayerUtil"
MediaPlayerUtil.javaClassName = "org.allbinary.media.audio.MediaPlayerUtil"

function MediaPlayerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function MediaPlayerUtil._jinit(self)
    MediaPlayerUtil._init_fields(self)
    return self
end

function MediaPlayerUtil.new()
    return MediaPlayerUtil._jinit(setmetatable({}, MediaPlayerUtil))
end


function MediaPlayerUtil.getInstance()
        return MediaPlayerUtil.instance_f
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

MediaPlayerUtil.instance_f = MediaPlayerUtil.new()

return MediaPlayerUtil

