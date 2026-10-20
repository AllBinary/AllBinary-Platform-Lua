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

-- local Manager = require("javax.microedition.media.Manager")
-- local MediaException = require("javax.microedition.media.MediaException")
-- local Player = require("javax.microedition.media.Player")
local TsUtil = require("org.allbinary.TsUtil")
local Features = require("org.allbinary.game.configuration.feature.Features")
local GameFeatureFactory = require("org.allbinary.game.configuration.feature.GameFeatureFactory")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--MediaMIDP2ForHTMLJavaLibrary
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
        if Features.getInstance():isFeature(GameFeatureFactory.getInstance().SOUND) then
            if TsUtil.getInstance():compareTo(resource, Manager.TONE_DEVICE_LOCATOR) == 0 then
                return Manager.createPlayer(resource)
            else
                return Manager.createPlayer(string.sub(resource, (0) + 1, #resource - 4))
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

AllBinaryMediaManager.THIS = "AllBinaryMediaManagerHTML5"

return AllBinaryMediaManager

