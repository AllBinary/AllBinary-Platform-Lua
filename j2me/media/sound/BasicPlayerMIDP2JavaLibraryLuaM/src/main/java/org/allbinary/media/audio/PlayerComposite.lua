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

-- local Control = require("javax.microedition.media.Control")
-- local Controllable = require("javax.microedition.media.Controllable")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
-- local TimeBase = require("javax.microedition.media.TimeBase")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

--BasicPlayerMIDP2
local PlayerComposite = {}
PlayerComposite.__index = PlayerComposite
PlayerComposite.className = "PlayerComposite"

function PlayerComposite:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.player = nil
    self.timeElapsedHelper = TimeDelayHelper.new(0)
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
end


function PlayerComposite.new(player, repeatTime)
    local self = setmetatable({}, PlayerComposite)
    self:_init_fields()
        self.player = player
        self.timeElapsedHelper.delay = repeatTime
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
        (self.player):setTimeBase(timeBase)
end


function PlayerComposite:prefetch()
        local try_ok, try_error = pcall(function()
            self.player:prefetch()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "prefetch", e)
        end
end


function PlayerComposite:realize()
        local try_ok, try_error = pcall(function()
            self.player:realize()
        end)
        if not try_ok then
            local e = try_error
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
        local try_ok, try_error = pcall(function()
            return self.player:setMediaTime(now)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "setMediaTime", e)
            return -1
        end
end


function PlayerComposite:start()
        local try_ok, try_error = pcall(function()
            if self.timeElapsedHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
                self.player:start()
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end


function PlayerComposite:stop()
        local try_ok, try_error = pcall(function()
            self.player:stop()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "stop", e)
        end
end


function PlayerComposite:getControl(controlType)
        return self.player:getControl(controlType)
end


function PlayerComposite:getControls()
        error(java_exception("RuntimeException"), 0)
end


function PlayerComposite:setVolume(leftVolume, rightVolume)
        local controllable2 = (self.player)
        controllable2:setVolume(leftVolume, rightVolume)
end


function PlayerComposite:getPlayerP()
        return self.player
end

return PlayerComposite

