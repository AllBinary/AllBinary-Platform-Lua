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

-- local InputStream = require("java.io.InputStream")
-- local Manager = require("javax.microedition.media.Manager")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
local MIDPUtil = java_lazy("org.allbinary.MIDPUtil")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local AudioContentTypeDataFactory = java_lazy("org.allbinary.audio.AudioContentTypeDataFactory")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NoPlayer = java_lazy("org.allbinary.media.audio.NoPlayer")
local Sounds = java_lazy("org.allbinary.media.audio.Sounds")
local SoundsFactoryInterface = java_lazy("org.allbinary.media.audio.SoundsFactoryInterface")

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

--NotDeviceSpecificMIDP2JavaLibrary
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
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            if TsUtil.getInstance():compareTo(resource, Manager.TONE_DEVICE_LOCATOR) == 0 then
                return Manager.createPlayer(resource)
            else
                local inputStream = ResourceUtil.getInstance():getResourceAsStream(resource)
                return MIDPUtil.getInstance():createPlayerFromInputStream(inputStream, AudioContentTypeDataFactory.getInstance().MIME_AUDIO_WAV:getName())
            end
        else
            return NoPlayer.NO_PLAYER
        end
end


-- throws MediaException
function AllBinaryMediaManager.playTone(frequency, time, volume)
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            Manager.playTone(frequency, time, volume)
        end
end

AllBinaryMediaManager.THIS = "AllBinaryMediaManagerNoMIPD2"

return AllBinaryMediaManager

