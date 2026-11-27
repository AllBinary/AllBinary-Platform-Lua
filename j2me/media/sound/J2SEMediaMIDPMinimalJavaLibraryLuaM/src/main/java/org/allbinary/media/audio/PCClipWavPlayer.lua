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

local PCClipWavPlayer = {}
package.loaded["org.allbinary.media.audio.PCClipWavPlayer"] = PCClipWavPlayer

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

local ARunnable = java_lazy("org.allbinary.thread.ARunnable")
-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local InputStream = require("java.io.InputStream")
-- local Control = require("javax.microedition.media.Control")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local PlayerListener = require("javax.microedition.media.PlayerListener")
-- local AudioInputStream = require("javax.sound.sampled.AudioInputStream")
-- local AudioSystem = require("javax.sound.sampled.AudioSystem")
-- local Clip = require("javax.sound.sampled.Clip")
-- local FloatControl = require("javax.sound.sampled.FloatControl")
-- local LineEvent = require("javax.sound.sampled.LineEvent")
-- local LineListener = require("javax.sound.sampled.LineListener")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local MusicThreadPool = java_lazy("org.allbinary.thread.MusicThreadPool")
local BasicPlayer = require("org.allbinary.media.audio.BasicPlayer")
local NullAudioFormat = java_lazy("org.allbinary.media.audio.NullAudioFormat")
local NullClip = java_lazy("org.allbinary.media.audio.NullClip")
local NullControl = java_lazy("org.allbinary.media.audio.NullControl")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table PCClipWavPlayer is declared before the requires
PCClipWavPlayer.__index = PCClipWavPlayer
PCClipWavPlayer.className = "PCClipWavPlayer"
PCClipWavPlayer.javaClassName = "org.allbinary.media.audio.PCClipWavPlayer"
setmetatable(PCClipWavPlayer, {__index = BasicPlayer})
PCClipWavPlayer.java_implements = " LineListener "
PCClipWavPlayer.java_interfaces = function() return {LineListener} end

function PCClipWavPlayer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.audioInputStream == nil then self.audioInputStream = nil end
    if self.clip == nil then self.clip = nil end
end


function PCClipWavPlayer._jinit(self, inputStream)
    java_super_init(BasicPlayer, self)
    PCClipWavPlayer._init_fields(self)
        local audioInputStream = AudioInputStream.new(ByteArrayInputStream.new(NullUtil.getInstance().NULL_BYTE_ARRAY), NullAudioFormat.NULL_AUDIO_FORMAT, 0)
        local clip = NullClip.new()
        local try_ok, try_error, try_value = pcall(function()
            audioInputStream = AudioSystem.getAudioInputStream(inputStream)
            clip = self:create(audioInputStream)
            if clip == nil then
                self.logUtil:put("Clip was null", self, self.commonStrings.CONSTRUCTOR, require("java.lang.Exception").new())
                error(require("java.lang.RuntimeException").new(), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
        self.audioInputStream = audioInputStream
        self.clip = clip
    return self
end

function PCClipWavPlayer.new(...)
    local self = setmetatable({}, PCClipWavPlayer)
    PCClipWavPlayer._jinit(self, ...)
    return self
end


function PCClipWavPlayer:close()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error, try_value = pcall(function()
                    self:close2()
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)())
end
java_overload(PCClipWavPlayer, "close", 0)


-- throws Exception
function PCClipWavPlayer:close2()
        self.clip:drain()
        self.clip:flush()
        self.clip:close()
end
java_overload(PCClipWavPlayer, "close2", 0)


function PCClipWavPlayer:getContentType()
        return StringUtil.getInstance().EMPTY_STRING
end
java_overload(PCClipWavPlayer, "getContentType", 0)


-- throws MediaException
function PCClipWavPlayer:start()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error, try_value = pcall(function()
                    self:start2()
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)())
end
java_overload(PCClipWavPlayer, "start", 0)


-- throws Exception
function PCClipWavPlayer:start2()
        self.clip:setFramePosition(0)
        self.clip:loop(self:getLoopCount())
        self.clip:start()
        java_super(BasicPlayer, "start", 0)(self)
end
java_overload(PCClipWavPlayer, "start2", 0)


-- throws Exception
function PCClipWavPlayer:create(audioInputStream)
        local clip = AudioSystem.getClip()
        clip:addLineListener(self)
        clip:open(audioInputStream)
        return clip
end
java_overload(PCClipWavPlayer, "create", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AudioInputStream")) end)


-- throws MediaException
function PCClipWavPlayer:stop()
        MusicThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local try_ok, try_error, try_value = pcall(function()
                    self:stop2()
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    PreLogUtil.putOE(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
                end
            end
            java_overload(o, "run", 0)
            return o
        end)())
end
java_overload(PCClipWavPlayer, "stop", 0)


-- throws Exception
function PCClipWavPlayer:stop2()
        self.clip:stop()
        java_super(BasicPlayer, "stop", 0)(self)
end
java_overload(PCClipWavPlayer, "stop2", 0)


function PCClipWavPlayer:getControl(controlType)
        return NullControl.new()
end
java_overload(PCClipWavPlayer, "getControl", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function PCClipWavPlayer:getControls()
        return java_new_array(nil, 0)
end
java_overload(PCClipWavPlayer, "getControls", 0)


function PCClipWavPlayer:setVolume(leftVolume, rightVolume)
        self:setVolumeF(((leftVolume + 0.0)) / 100.0)
end
java_overload(PCClipWavPlayer, "setVolume", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function PCClipWavPlayer:getVolume()
        local masterGainFloatControl = self.clip:getControl(FloatControl.Type.MASTER_GAIN)
        return (((10.0) ^ (masterGainFloatControl:getValue() / 20.0)) + 0.0)
end
java_overload(PCClipWavPlayer, "getVolume", 0)


function PCClipWavPlayer:setVolumeF(volume)
        if volume < 0.0 or volume > 1.0 then
            error(require("java.lang.IllegalArgumentException").new("Volume: " .. tostring(volume)), 0)
        end
        local masterGainFloatControl = self.clip:getControl(FloatControl.Type.MASTER_GAIN)
        masterGainFloatControl:setValue(20.0 * (require("java.lang.Math").log10(volume) + 0.0))
end
java_overload(PCClipWavPlayer, "setVolumeF", 1, function(java_a1) return true and type(java_a1) == "number" end)


function PCClipWavPlayer:getDuration()
        return self.clip:getMicrosecondLength() / 1000
end
java_overload(PCClipWavPlayer, "getDuration", 0)


function PCClipWavPlayer:update(event)
        if event:getType():equals(LineEvent.Type.STOP) then
            local size = self.listenersList:size()
            for index = 0, size - 1 do
                local listener = self.listenersList:get(size)
                listener:playerUpdate(self, PlayerListener.END_OF_MEDIA, nil)
            end
        end
end
java_overload(PCClipWavPlayer, "update", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "LineEvent")) end)

return PCClipWavPlayer

