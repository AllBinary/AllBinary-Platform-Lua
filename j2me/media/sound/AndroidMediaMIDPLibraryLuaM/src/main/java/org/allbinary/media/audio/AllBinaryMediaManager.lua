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

-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
local TsUtil = require("org.allbinary.TsUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

--AndroidMediaMIDPLibrary
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
        AllBinaryMediaManager.shutdown(soundsFactoryInterface)
        ProgressCanvasFactory.getInstance():addNormalPortion(50, "Media Manager")
        TsUtil.getInstance():gc()
        Sounds.new(soundsFactoryInterface):init()
        logUtil:putF(commonString.END, AllBinaryMediaManager.THIS, commonString.INIT)
end


-- throws Exception
function AllBinaryMediaManager.shutdown(soundsFactoryInterface)
        local logUtil = LogUtil.getInstance()
        local commonString = CommonStrings.getInstance()
        logUtil:putF(commonString.START, AllBinaryMediaManager.THIS, "shutdown")
        if soundsFactoryInterface:isInitialized() then
            Sounds.new(soundsFactoryInterface):stopAll()
            local soundInterfaceArray = soundsFactoryInterface:getSoundInterfaceArray()
            local player = nil
            local player2 = nil
            local androidMediaPlayerWrapper = nil
            for i = 0, (soundInterfaceArray.n or #soundInterfaceArray) - 1 do
                if soundInterfaceArray[i + 1] ~= nil then
                    player = soundInterfaceArray[i + 1]:getPlayerP()
                    if player ~= nil then
                        player2 = (player):getPlayerP()
                        if java_instanceof(player2, AndroidMediaPlayerWrapper) then
                            androidMediaPlayerWrapper = player2
                            MediaPlayerUtil.getInstance():waitForMediaPlayer(androidMediaPlayerWrapper:getMediaPlayer())
                        else
                            error(java_exception("Exception", "Unknown Property Player: " .. getmetatable(player).className), 0)
                        end
                    end
                end
            end
            Sounds.new(soundsFactoryInterface):closeAll()
            TsUtil.getInstance():gc()
            soundsFactoryInterface:setInitialized(false)
            AllBinaryMediaManager.mostUsedTotal = 0
        end
        logUtil:putF(commonString.START, AllBinaryMediaManager.THIS, "shutdown")
end


-- throws Exception
function AllBinaryMediaManager.createPlayer(resource)
        AllBinaryMediaManager.mostUsedTotal = AllBinaryMediaManager.mostUsedTotal + 1
        local logUtil = LogUtil.getInstance()
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            local try_ok, try_error = pcall(function()
                return AndroidMediaPlayerWrapper.new(resource)
            end)
            if not try_ok then
                local e = try_error
                logUtil:put("Could not create AndroidMediaPlayerWrapper using NoPlayer at " .. tostring(CommonLabels.getInstance().TOTAL_LABEL) .. tostring(AllBinaryMediaManager.mostUsedTotal), AllBinaryMediaManager.THIS, "createPlayer", e)
                return NoPlayer.NO_PLAYER
            end
        else
            return NoPlayer.NO_PLAYER
        end
end


-- throws IOException, MediaException
function AllBinaryMediaManager.createPlayerFromInputStream(stream, type)
        error(java_exception("MediaException", "No Input Stream Player"), 0)
end


-- throws MediaException
function AllBinaryMediaManager.playTone(frequency, time, volume)
        error(java_exception("MediaException", "No Tone Player"), 0)
end


function AllBinaryMediaManager.isInitialized()
        return true
end

AllBinaryMediaManager.THIS = "AllBinaryMediaManagerAndroid"
AllBinaryMediaManager.mostUsedTotal = 0

return AllBinaryMediaManager

