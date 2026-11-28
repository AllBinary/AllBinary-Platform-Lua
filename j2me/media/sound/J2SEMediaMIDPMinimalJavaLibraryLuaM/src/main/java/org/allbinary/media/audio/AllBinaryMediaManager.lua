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

local AllBinaryMediaManager = {}
package.loaded["org.allbinary.media.audio.AllBinaryMediaManager"] = AllBinaryMediaManager

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

local BufferedInputStream = java_lazy("java.io.BufferedInputStream")
local ByteArrayInputStream = java_lazy("java.io.ByteArrayInputStream")
-- local IOException = require("java.io.IOException")
local InputStream = java_lazy("java.io.InputStream")
local Manager = java_lazy("javax.microedition.media.Manager")
local MediaException = java_lazy("javax.microedition.media.MediaException")
local Player = java_lazy("javax.microedition.media.Player")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local AudioContentTypeDataFactory = java_lazy("org.allbinary.audio.AudioContentTypeDataFactory")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NoPlayer = java_lazy("org.allbinary.media.audio.NoPlayer")
local PCClipWavPlayer = java_lazy("org.allbinary.media.audio.PCClipWavPlayer")
local Sounds = java_lazy("org.allbinary.media.audio.Sounds")
local SoundsFactoryInterface = java_lazy("org.allbinary.media.audio.SoundsFactoryInterface")

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

--J2SEMediaMIDPMinimalJavaLibrary
-- class table AllBinaryMediaManager is declared before the requires
AllBinaryMediaManager.__index = AllBinaryMediaManager
AllBinaryMediaManager.className = "AllBinaryMediaManager"
AllBinaryMediaManager.javaClassName = "org.allbinary.media.audio.AllBinaryMediaManager"


function AllBinaryMediaManager._jinit(self)
    return self
end

function AllBinaryMediaManager.new(...)
    local self = setmetatable({}, AllBinaryMediaManager)
    AllBinaryMediaManager._jinit(self, ...)
    return self
end


function AllBinaryMediaManager.isMuted()
        return false
end


function AllBinaryMediaManager.setMuted(aMuted)
end


function AllBinaryMediaManager.update()
        return true
end


-- throws Exception
function AllBinaryMediaManager.init(soundsFactoryInterface)
        local logUtil = LogUtil.getInstance()
        local commonString = CommonStrings.getInstance()
        logUtil:putF(commonString.START, AllBinaryMediaManager.THIS, commonString.INIT)
        ProgressCanvasFactory.getInstance():addNormalPortion(50, "Media Manager")
        Sounds.new(soundsFactoryInterface):init()
end


-- throws Exception
function AllBinaryMediaManager.shutdown(soundsFactoryInterface)
        Sounds.new(soundsFactoryInterface):stopAll()
        Sounds.new(soundsFactoryInterface):closeAll()
        TsUtil.getInstance():gc()
end


-- throws Exception
function AllBinaryMediaManager.createPlayer(resource)
        if not rawequal(resource, nil) and not rawequal(Manager.TONE_DEVICE_LOCATOR, nil) and (string.sub(resource, 1, #Manager.TONE_DEVICE_LOCATOR) == Manager.TONE_DEVICE_LOCATOR) then
            return AllBinaryMediaManager.createPlayerFromInputStream(ByteArrayInputStream.new(NullUtil.getInstance().NULL_BYTE_ARRAY), AudioContentTypeDataFactory.getInstance().MIME_AUDIO_TONE:getName())
        elseif Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            local try_ok, try_error, try_value = pcall(function()
                local inputStream = ResourceUtil.getInstance():getResourceAsStream(resource)
                local bufferedInputStream = BufferedInputStream.new(inputStream)
                do return "__jreturn", PCClipWavPlayer.new(bufferedInputStream) end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                local logUtil = LogUtil.getInstance()
                local commonString = CommonStrings.getInstance()
                logUtil:put(commonString.EXCEPTION, AllBinaryMediaManager.THIS, AllBinaryMediaManager.CREATE_PLAYER, e)
                return NoPlayer.NO_PLAYER
            end
            if try_ok and try_error == "__jreturn" then return try_value end
        else
            return NoPlayer.NO_PLAYER
        end
end


-- throws IOException, MediaException
function AllBinaryMediaManager.createPlayerFromInputStream(stream, type)
        error(java_exception("MediaException", "No Impl"), 0)
end


-- throws MediaException
function AllBinaryMediaManager.playTone(frequency, time, volume)
        error(java_exception("MediaException", "No Impl"), 0)
end


function AllBinaryMediaManager.isInitialized()
        return true
end

AllBinaryMediaManager.THIS = "AllBinaryMediaManagerPC"
AllBinaryMediaManager.CREATE_PLAYER = "createPlayer"

return AllBinaryMediaManager

