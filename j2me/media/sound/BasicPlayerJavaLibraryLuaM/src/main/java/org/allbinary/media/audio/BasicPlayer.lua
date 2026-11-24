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

local BasicPlayer = {}
package.loaded["org.allbinary.media.audio.BasicPlayer"] = BasicPlayer

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
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Controllable2 = require("org.allbinary.media.audio.Controllable2")
local NullControl = java_lazy("org.allbinary.media.audio.NullControl")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

--BasicPlayerJavaLibrary
-- class table BasicPlayer is declared before the requires
BasicPlayer.__index = BasicPlayer
BasicPlayer.className = "BasicPlayer"
BasicPlayer.javaClassName = "org.allbinary.media.audio.BasicPlayer"
BasicPlayer.java_implements = " Player Controllable2 "
BasicPlayer.java_interfaces = function() return {Player, Controllable2} end

function BasicPlayer:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.listenersList = BasicArrayListD.new()
    if self.stateP == nil then self.stateP = 0 end
    if self.loopCountP == nil then self.loopCountP = 0 end
end


function BasicPlayer._jinit(self)
    BasicPlayer._init_fields(self)
        self:setLoopCount(0)
        self:setState(Player.UNREALIZED)
    return self
end

function BasicPlayer.new(...)
    local self = setmetatable({}, BasicPlayer)
    BasicPlayer._jinit(self, ...)
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

