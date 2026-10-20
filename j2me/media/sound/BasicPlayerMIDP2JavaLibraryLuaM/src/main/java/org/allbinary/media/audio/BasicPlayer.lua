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
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
-- local TimeBase = require("javax.microedition.media.TimeBase")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TimeBaseInterface = require("org.allbinary.media.audio.TimeBaseInterface")
local Controllable2 = require("org.allbinary.media.audio.Controllable2")

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

--BasicPlayerMIDP2JavaLibrary
local BasicPlayer = {}
BasicPlayer.__index = BasicPlayer
BasicPlayer.className = "BasicPlayer"

function BasicPlayer:_init_fields()
    self.listenersList = BasicArrayListD.new()
    self.timeBase = nil
    self.stateP = 0
    self.loopCountP = 0
end


function BasicPlayer.new()
    local self = setmetatable({}, BasicPlayer)
    self:_init_fields()
        self:setLoopCount(0)
        self:setState(Player.UNREALIZED)
    return self
end


function BasicPlayer:getContentType()
        return StringUtil.getInstance().EMPTY_STRING
end


function BasicPlayer:getControl(controlType)
        return NullControl.new()
end


function BasicPlayer:getControls()
        return java_new_array(nil, 0)
end


function BasicPlayer:close()
end


function BasicPlayer:addPlayerListener(playerListener)
        if not self.listenersList:contains(playerListener) then
            self.listenersList:add(playerListener)
        end
end


function BasicPlayer:removePlayerListener(playerListener)
        self.listenersList:remove(playerListener)
end


function BasicPlayer:getState()
        return self.stateP
end


function BasicPlayer:setState(state)
        self.stateP = state
end


function BasicPlayer:getDuration()
        return 0
end


function BasicPlayer:getMediaTime()
        return 0
end


function BasicPlayer:getTimeBase()
        return self.timeBase
end


function BasicPlayer:setTimeBase(timeBase)
        self.timeBase = timeBase
end


function BasicPlayer:deallocate()
end


-- throws MediaException
function BasicPlayer:prefetch()
end


-- throws MediaException
function BasicPlayer:realize()
end


function BasicPlayer:setLoopCount(count)
        self.loopCountP = count
end


function BasicPlayer:getLoopCount()
        return self.loopCountP
end


-- throws MediaException
function BasicPlayer:setMediaTime(now)
        return 0
end


-- throws MediaException
function BasicPlayer:start()
        self:setState(Player.STARTED)
end


-- throws MediaException
function BasicPlayer:stop()
        self:setState(Player.PREFETCHED)
end


function BasicPlayer:setVolume(leftVolume, rightVolume)
end

BasicPlayer.CONTROL_TYPE = "ToneControl"

return BasicPlayer

