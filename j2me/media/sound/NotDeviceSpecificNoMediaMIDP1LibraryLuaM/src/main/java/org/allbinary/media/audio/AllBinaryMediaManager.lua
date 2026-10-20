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

-- local InputStream = require("java.io.InputStream")
-- local Player = require("javax.microedition.media.Player")
local TsUtil = require("org.allbinary.TsUtil")
local ProgressCanvasFactory = require("org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

--NotDeviceSpecificNoMediaMIDP1Library
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


function AllBinaryMediaManager.createPlayerFromInputStream(stream, type)
        local logUtil = LogUtil.getInstance()
        local commonString = CommonStrings.getInstance()
        logUtil:putF(commonString.START, AllBinaryMediaManager.THIS, "creatPlayer(InputStream)")
        return NoPlayer.NO_PLAYER
end


function AllBinaryMediaManager.createPlayer(locator)
        local logUtil = LogUtil.getInstance()
        local commonString = CommonStrings.getInstance()
        logUtil:putF(commonString.START, AllBinaryMediaManager.THIS, "creatPlayer(locator)")
        return NoPlayer.NO_PLAYER
end


function AllBinaryMediaManager.playTone(frequency, time, volume)
end


function AllBinaryMediaManager.getSupportedContentTypes(protocol)
        return StringUtil.getInstance():getArrayInstance()
end


function AllBinaryMediaManager.getSupportedProtocols(content_type)
        return StringUtil.getInstance():getArrayInstance()
end

AllBinaryMediaManager.THIS = "AllBinaryMediaManagerNoMediaMIDP1"

return AllBinaryMediaManager

