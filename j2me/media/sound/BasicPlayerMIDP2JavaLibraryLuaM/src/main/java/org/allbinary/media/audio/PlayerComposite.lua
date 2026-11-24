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

local PlayerComposite = {}
package.loaded["org.allbinary.media.audio.PlayerComposite"] = PlayerComposite

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

-- local Control = require("javax.microedition.media.Control")
-- local Controllable = require("javax.microedition.media.Controllable")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
-- local TimeBase = require("javax.microedition.media.TimeBase")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local Controllable2 = java_lazy("org.allbinary.media.audio.Controllable2")
local TimeBaseInterface = java_lazy("org.allbinary.media.audio.TimeBaseInterface")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--BasicPlayerMIDP2
-- class table PlayerComposite is declared before the requires
PlayerComposite.__index = PlayerComposite
PlayerComposite.className = "PlayerComposite"
PlayerComposite.javaClassName = "org.allbinary.media.audio.PlayerComposite"
PlayerComposite.java_implements = " Controllable Player "
PlayerComposite.java_interfaces = function() return {Controllable, Player} end

function PlayerComposite:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.player == nil then self.player = nil end
    self.timeElapsedHelper = TimeDelayHelper.new(0)
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function PlayerComposite._jinit(self, player, repeatTime)
    PlayerComposite._init_fields(self)
        self.player = player
        self.timeElapsedHelper.delay = repeatTime
    return self
end

function PlayerComposite.new(...)
    local self = setmetatable({}, PlayerComposite)
    PlayerComposite._jinit(self, ...)
    return self
end


function PlayerComposite:addPlayerListener(playerListener)
        self.player:addPlayerListener(playerListener)
end


function PlayerComposite:removePlayerListener(playerListener)
        self.player:removePlayerListener(playerListener)
end


function PlayerComposite:close()
        self.player:close()
end


function PlayerComposite:deallocate()
        self.player:deallocate()
end


function PlayerComposite:getContentType()
        return self.player:getContentType()
end


function PlayerComposite:getDuration()
        return self.player:getDuration()
end


function PlayerComposite:getMediaTime()
        return self.player:getMediaTime()
end


function PlayerComposite:getTimeBase()
        return (self.player):getTimeBase()
end


-- throws MediaException
function PlayerComposite:setTimeBase(timeBase)
        ;(self.player):setTimeBase(timeBase)
end


function PlayerComposite:prefetch()
        local try_ok, try_error, try_value = pcall(function()
            self.player:prefetch()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "prefetch", e)
        end
end


function PlayerComposite:realize()
        local try_ok, try_error, try_value = pcall(function()
            self.player:realize()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "realize", e)
        end
end


function PlayerComposite:getState()
        return self.player:getState()
end


function PlayerComposite:setLoopCount(count)
        self.player:setLoopCount(count)
end


function PlayerComposite:setMediaTime(now)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", self.player:setMediaTime(now) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setMediaTime", e)
            return -1
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function PlayerComposite:start()
        local try_ok, try_error, try_value = pcall(function()
            if self.timeElapsedHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
                self.player:start()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end


function PlayerComposite:stop()
        local try_ok, try_error, try_value = pcall(function()
            self.player:stop()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "stop", e)
        end
end


function PlayerComposite:getControl(controlType)
        return self.player:getControl(controlType)
end


function PlayerComposite:getControls()
        error(require("java.lang.RuntimeException").new(), 0)
end


function PlayerComposite:setVolume(leftVolume, rightVolume)
        local controllable2 = (self.player)
        controllable2:setVolume(leftVolume, rightVolume)
end


function PlayerComposite:getPlayerP()
        return self.player
end

return PlayerComposite

