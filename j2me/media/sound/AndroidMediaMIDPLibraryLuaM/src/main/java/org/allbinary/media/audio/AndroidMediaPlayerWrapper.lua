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

local AndroidMediaPlayerWrapper = {}
package.loaded["org.allbinary.media.audio.AndroidMediaPlayerWrapper"] = AndroidMediaPlayerWrapper

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

local MediaException = java_lazy("javax.microedition.media.MediaException")
local Player = java_lazy("javax.microedition.media.Player")
local PlayerListener = java_lazy("javax.microedition.media.PlayerListener")
local MediaPlayer = java_lazy("android.media.MediaPlayer")
local NullAndroidCanvas = java_lazy("org.allbinary.android.NullAndroidCanvas")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BasicPlayer = require("org.allbinary.media.audio.BasicPlayer")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AndroidMediaPlayerWrapper is declared before the requires
AndroidMediaPlayerWrapper.__index = AndroidMediaPlayerWrapper
AndroidMediaPlayerWrapper.className = "AndroidMediaPlayerWrapper"
AndroidMediaPlayerWrapper.javaClassName = "org.allbinary.media.audio.AndroidMediaPlayerWrapper"
setmetatable(AndroidMediaPlayerWrapper, {__index = BasicPlayer})

function AndroidMediaPlayerWrapper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.mediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER
end


function AndroidMediaPlayerWrapper.createPlayerWrapper()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", AndroidMediaPlayerWrapper.new(StringUtil.getInstance().EMPTY_STRING) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(require("java.lang.RuntimeException").new(), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AndroidMediaPlayerWrapper._jinit(self, resource)
    java_super_init(BasicPlayer, self)
    AndroidMediaPlayerWrapper._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(resource, StringUtil.getInstance().EMPTY_STRING) then
            else
                local resourceUtil = ResourceUtil.getInstance()
                local mediaPlayer = MediaPlayer.create(resourceUtil:getContext(), require("allbinary_java").number_value(resourceUtil:getResourceId(resource), "intValue"))
                if rawequal(mediaPlayer, nil) then
                    error(require("java.lang.Exception").new(tostring(StringMaker.new():append("Failed to create media player for: "):append(resource):append(" with id: "):append(tostring(resourceUtil:getResourceId(resource))))), 0)
                end
                self:setMediaPlayer(mediaPlayer)
                self.mediaPlayer:setLooping(false)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(require("allbinary_java").to_string(self.commonStrings.EXCEPTION_LABEL) .. require("allbinary_java").to_string(resource), self, self.commonStrings.CONSTRUCTOR, e)
            error(e, 0)
        end
    return self
end

function AndroidMediaPlayerWrapper.new(...)
    local self = setmetatable({}, AndroidMediaPlayerWrapper)
    AndroidMediaPlayerWrapper._jinit(self, ...)
    return self
end


function AndroidMediaPlayerWrapper:setLoopCount(count)
        java_super(BasicPlayer, "setLoopCount", 1)(self, count)
        if not rawequal(self.mediaPlayer, NullAndroidCanvas.NULL_MEDIA_PLAYER) and not rawequal(self.mediaPlayer, nil) then
            if rawequal(count, 0) then
                self.mediaPlayer:setLooping(false)
            else
            end
        end
end
java_overload(AndroidMediaPlayerWrapper, "setLoopCount", 1, function(java_a1) return true and type(java_a1) == "number" end)


function AndroidMediaPlayerWrapper:addPlayerListener(playerListener)
        java_super(BasicPlayer, "addPlayerListener", 1)(self, playerListener)
end
java_overload(AndroidMediaPlayerWrapper, "addPlayerListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerListener")) end)


function AndroidMediaPlayerWrapper:removePlayerListener(playerListener)
        java_super(BasicPlayer, "removePlayerListener", 1)(self, playerListener)
end
java_overload(AndroidMediaPlayerWrapper, "removePlayerListener", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "PlayerListener")) end)


function AndroidMediaPlayerWrapper:getState()
        if self.mediaPlayer:isPlaying() then
            return Player.STARTED
        else
            return Player.PREFETCHED
        end
end
java_overload(AndroidMediaPlayerWrapper, "getState", 0)


function AndroidMediaPlayerWrapper:close()
        local try_ok, try_error, try_value = pcall(function()
            self.mediaPlayer:release()
            self.mediaPlayer = NullAndroidCanvas.NULL_MEDIA_PLAYER
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CLOSE, e)
        end
end
java_overload(AndroidMediaPlayerWrapper, "close", 0)


-- throws MediaException
function AndroidMediaPlayerWrapper:start()
        local try_ok, try_error, try_value = pcall(function()
            if self.mediaPlayer:isPlaying() then
                self.mediaPlayer:pause()
                self.mediaPlayer:seekTo(0)
            end
            self.mediaPlayer:start()
            java_super(BasicPlayer, "start", 0)(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START_METHOD_NAME, e)
        end
end
java_overload(AndroidMediaPlayerWrapper, "start", 0)


-- throws MediaException
function AndroidMediaPlayerWrapper:stop()
        local try_ok, try_error, try_value = pcall(function()
            self.mediaPlayer:stop()
            self.mediaPlayer:prepare()
            java_super(BasicPlayer, "stop", 0)(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "stop", e)
        end
end
java_overload(AndroidMediaPlayerWrapper, "stop", 0)


function AndroidMediaPlayerWrapper:update(event)
        self.logUtil:putF(require("allbinary_java").to_string("LineEvent: ") .. require("allbinary_java").to_string(event), self, self.commonStrings.UPDATE)
        local size = self.listenersList:size()
        for index = 0, size - 1 do
            local listener = self.listenersList.objectArray[index + 1]
            listener:playerUpdate(self, event, NullUtil.getInstance().NULL_OBJECT)
        end
end
java_overload(AndroidMediaPlayerWrapper, "update", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function AndroidMediaPlayerWrapper:setVolume(leftVolume, rightVolume)
        self.mediaPlayer:setVolume(((leftVolume + 0.0)) / 100.0, ((rightVolume + 0.0)) / 100.0)
end
java_overload(AndroidMediaPlayerWrapper, "setVolume", 2, function(java_a1, java_a2) return true and type(java_a1) == "number" and type(java_a2) == "number" end)


function AndroidMediaPlayerWrapper:getDuration()
        return java_int(self.mediaPlayer:getDuration())
end
java_overload(AndroidMediaPlayerWrapper, "getDuration", 0)


function AndroidMediaPlayerWrapper:setMediaPlayer(mediaPlayer)
        self.mediaPlayer = mediaPlayer
end
java_overload(AndroidMediaPlayerWrapper, "setMediaPlayer", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "MediaPlayer")) end)


function AndroidMediaPlayerWrapper:getMediaPlayer()
        return self.mediaPlayer
end
java_overload(AndroidMediaPlayerWrapper, "getMediaPlayer", 0)

AndroidMediaPlayerWrapper.NULL_ANDROID_MEDIA_PLAYER_WRAPPER = AndroidMediaPlayerWrapper.createPlayerWrapper()

return AndroidMediaPlayerWrapper

