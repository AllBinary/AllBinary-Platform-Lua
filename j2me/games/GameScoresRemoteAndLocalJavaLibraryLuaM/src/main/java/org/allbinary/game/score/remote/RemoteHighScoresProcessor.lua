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
-- package org.allbinary.game.score.remote

local GameInfo = require("org.allbinary.game.GameInfo")
local GameInfoData = require("org.allbinary.game.GameInfoData")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local NoCrypt = require("org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local RemoteHighScoresProcessorInterface = require("org.allbinary.game.score.remote.RemoteHighScoresProcessorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoteHighScoresProcessor = {}
RemoteHighScoresProcessor.__index = RemoteHighScoresProcessor
RemoteHighScoresProcessor.className = "RemoteHighScoresProcessor"

function RemoteHighScoresProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.noCrypt = NoCrypt.new()
end


function RemoteHighScoresProcessor.new()
    local self = setmetatable({}, RemoteHighScoresProcessor)
    self:_init_fields()
    return self
end


-- throws Exception
function RemoteHighScoresProcessor:process(remoteHighScores, abeClientInformation, gameInfo)
        self.logUtil:putF("Begin Remote HighScores Retrieval", self, self.commonStrings.PROCESS)
        local gameInfoData = GameInfoData.getInstance()
        local hashtable = abeClientInformation:toHashtable()
        HashtableUtil.getInstance():putAll(gameInfo:toHashtable(), hashtable)
        hashtable:put(gameInfoData.SOFTWARE_INFORMATION, tostring(remoteHighScores:getSoftwareInformation()))
        hashtable:put(remoteHighScores.ASCENDING, tostring(remoteHighScores:getAscending()))
        local displayInfoSingleton = DisplayInfoSingleton.getInstance()
        hashtable:put(displayInfoSingleton.ORIENTATION, BooleanFactory.getInstance():toStringb(displayInfoSingleton:isPortrait()))
        hashtable:put(RemoteHighScoresData.getInstance().GAME_CONFIGURATION, tostring(GameConfigurationCentral.getInstance()))
        if XmlRpcAbeClient.isOnline then
            local resultHashtable = XmlRpcRemoteHighScoresClient.new(abeClientInformation, "highscoresservicessl.php", "HighScoresService.process"):get(hashtable, self.noCrypt)
            remoteHighScores:update(resultHashtable)
        end
end

return RemoteHighScoresProcessor

