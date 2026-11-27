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

-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
local TsUtil = java_lazy("org.allbinary.TsUtil")
local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = java_lazy("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local ABSystemWrapper = java_lazy("org.allbinary.logic.ABSystemWrapper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AndroidMediaPlayerWrapper = java_lazy("org.allbinary.media.audio.AndroidMediaPlayerWrapper")
local MediaPlayerUtil = java_lazy("org.allbinary.media.audio.MediaPlayerUtil")
local NoPlayer = java_lazy("org.allbinary.media.audio.NoPlayer")
local PlayerComposite = java_lazy("org.allbinary.media.audio.PlayerComposite")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
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

local function java_instanceof(object, class)
    class = java_real(class)
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--AndroidMediaMIDPLibrary
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
                            error(require("java.lang.Exception").new("Unknown Property Player: " .. (getmetatable(player).javaClassName or getmetatable(player).className)), 0)
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
            local try_ok, try_error, try_value = pcall(function()
                do return "__jreturn", AndroidMediaPlayerWrapper.new(resource) end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                logUtil:put("Could not create AndroidMediaPlayerWrapper using NoPlayer at " .. tostring(CommonLabels.getInstance().TOTAL_LABEL) .. tostring(AllBinaryMediaManager.mostUsedTotal), AllBinaryMediaManager.THIS, "createPlayer", e)
                return NoPlayer.NO_PLAYER
            end
            if try_ok and try_error == "__jreturn" then return try_value end
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

