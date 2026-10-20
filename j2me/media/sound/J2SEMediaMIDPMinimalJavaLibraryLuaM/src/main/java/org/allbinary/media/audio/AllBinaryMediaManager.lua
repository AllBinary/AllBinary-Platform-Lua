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

-- local BufferedInputStream = require("java.io.BufferedInputStream")
-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local Manager = require("javax.microedition.media.Manager")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
local TsUtil = require("org.allbinary.TsUtil")
local AudioContentTypeDataFactory = require("org.allbinary.audio.AudioContentTypeDataFactory")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

--J2SEMediaMIDPMinimalJavaLibrary
local AllBinaryMediaManager = {}
AllBinaryMediaManager.__index = AllBinaryMediaManager
AllBinaryMediaManager.className = "AllBinaryMediaManager"


function AllBinaryMediaManager.new()
    local self = setmetatable({}, AllBinaryMediaManager)
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
        if (string.sub(resource, 1, #Manager.TONE_DEVICE_LOCATOR) == Manager.TONE_DEVICE_LOCATOR) then
            return AllBinaryMediaManager.createPlayerFromInputStream(ByteArrayInputStream.new(NullUtil.getInstance().NULL_BYTE_ARRAY), AudioContentTypeDataFactory.getInstance().MIME_AUDIO_TONE:getName())
        elseif Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            local try_ok, try_error = pcall(function()
                local inputStream = ResourceUtil.getInstance():getResourceAsStream(resource)
                local bufferedInputStream = BufferedInputStream.new(inputStream)
                return PCClipWavPlayer.new(bufferedInputStream)
            end)
            if not try_ok then
                local e = try_error
                local logUtil = LogUtil.getInstance()
                local commonString = CommonStrings.getInstance()
                logUtil:put(commonString.EXCEPTION, AllBinaryMediaManager.THIS, AllBinaryMediaManager.CREATE_PLAYER, e)
                return NoPlayer.NO_PLAYER
            end
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

