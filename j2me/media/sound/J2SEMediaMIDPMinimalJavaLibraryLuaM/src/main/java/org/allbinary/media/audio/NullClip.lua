-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local NullClip = {}
package.loaded["org.allbinary.media.audio.NullClip"] = NullClip

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

-- local IOException = require("java.io.IOException")
-- local AudioFormat = require("javax.sound.sampled.AudioFormat")
-- local AudioInputStream = require("javax.sound.sampled.AudioInputStream")
-- local BooleanControl = require("javax.sound.sampled.BooleanControl")
-- local Clip = require("javax.sound.sampled.Clip")
-- local Control = require("javax.sound.sampled.Control")
-- local Type = require("javax.sound.sampled.Control.Type")
-- local Info = require("javax.sound.sampled.DataLine.Info")
-- local LineListener = require("javax.sound.sampled.LineListener")
-- local LineUnavailableException = require("javax.sound.sampled.LineUnavailableException")
local NullAudioFormat = java_lazy("org.allbinary.media.audio.NullAudioFormat")
local NullJ2SEControl = java_lazy("org.allbinary.media.audio.NullJ2SEControl")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table NullClip is declared before the requires
NullClip.__index = NullClip
NullClip.className = "NullClip"
NullClip.javaClassName = "org.allbinary.media.audio.NullClip"
NullClip.java_implements = " Clip "
NullClip.java_interfaces = function() return {Clip} end

function NullClip._jinit(self)
    return self
end

function NullClip.new()
    return NullClip._jinit(setmetatable({}, NullClip))
end


-- throws LineUnavailableException
function NullClip:open_j4(format, data, offset, bufferSize)
end


-- throws LineUnavailableException, IOException
function NullClip:open_j1(stream)
end


function NullClip:getFrameLength()
        return 0
end


function NullClip:getMicrosecondLength()
        return 0
end


function NullClip:setFramePosition(frames)
end


function NullClip:setMicrosecondPosition(microseconds)
end


function NullClip:setLoopPoints(start, end_)
end


function NullClip:loop(count)
end


function NullClip:drain()
end


function NullClip:flush()
end


function NullClip:start()
end


function NullClip:stop()
end


function NullClip:isRunning()
        return false
end


function NullClip:isActive()
        return false
end


function NullClip:getFormat()
        return NullAudioFormat.NULL_AUDIO_FORMAT
end


function NullClip:getBufferSize()
        return 0
end


function NullClip:available()
        return 0
end


function NullClip:getFramePosition()
        return 0
end


function NullClip:getLongFramePosition()
        return 0
end


function NullClip:getMicrosecondPosition()
        return 0
end


function NullClip:getLevel()
        return 0.0
end


function NullClip:getLineInfo()
        return Info.new(getmetatable(self), NullAudioFormat.NULL_AUDIO_FORMAT)
end


-- throws LineUnavailableException
function NullClip:open_j0()
end
function NullClip:open(...)
    local count = select("#", ...)
    if count == 4 then return self:open_j4(...) end
    if count == 1 then return self:open_j1(...) end
    if count == 0 then return self:open_j0(...) end
    error("No method open takes " .. count .. " arguments")
end
NullClip.open__jdispatcher = NullClip.open


function NullClip:close()
end


function NullClip:isOpen()
        return false
end


function NullClip:getControls()
        return java_new_array(nil, 0)
end


function NullClip:isControlSupported(control)
        return false
end


function NullClip:getControl(control)
        return NullClip.NULL_CONTROL
end


function NullClip:addLineListener(listener)
end


function NullClip:removeLineListener(listener)
end

NullClip.NULL_CONTROL = NullJ2SEControl.new(BooleanControl.Type.MUTE)

return NullClip

