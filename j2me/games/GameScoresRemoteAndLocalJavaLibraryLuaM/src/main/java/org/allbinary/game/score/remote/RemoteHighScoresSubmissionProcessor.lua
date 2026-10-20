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

local GameInfoData = require("org.allbinary.game.GameInfoData")
local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local HighScore = require("org.allbinary.game.score.HighScore")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = require("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local NoCrypt = require("org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local HashtableUtil = require("org.allbinary.util.HashtableUtil")
local RemoteHighScoresSubmissionProcessorInterface = require("org.allbinary.game.score.remote.RemoteHighScoresSubmissionProcessorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoteHighScoresSubmissionProcessor = {}
RemoteHighScoresSubmissionProcessor.__index = RemoteHighScoresSubmissionProcessor
RemoteHighScoresSubmissionProcessor.className = "RemoteHighScoresSubmissionProcessor"

function RemoteHighScoresSubmissionProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.noCrypt = NoCrypt.new()
end


function RemoteHighScoresSubmissionProcessor.new()
    local self = setmetatable({}, RemoteHighScoresSubmissionProcessor)
    self:_init_fields()
    return self
end


function RemoteHighScoresSubmissionProcessor:process(remoteHighScores, abeClientInformation, highScore)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF("Begin Remote HighScores Submission", self, self.commonStrings.PROCESS)
            local gameInfoData = GameInfoData.getInstance()
            local hashtable = abeClientInformation:toHashtable()
            HashtableUtil.getInstance():putAll(highScore:getGameInfo():toHashtable(), hashtable)
            hashtable:put(RemoteHighScoresData.getInstance().CUSTOMER_USER_NAME, "None")
            hashtable:put(RemoteHighScoresData.getInstance().DISPLAY_NAME, highScore:getName())
            hashtable:put(gameInfoData.SOFTWARE_INFORMATION, tostring(remoteHighScores:getSoftwareInformation()))
            hashtable:put(remoteHighScores.ASCENDING, tostring(remoteHighScores:getAscending()))
            local displayInfoSingleton = DisplayInfoSingleton.getInstance()
            hashtable:put(displayInfoSingleton.ORIENTATION, BooleanFactory.getInstance():toStringb(displayInfoSingleton:isPortrait()))
            hashtable:put(RemoteHighScoresData.getInstance().GAME_CONFIGURATION, tostring(GameConfigurationCentral.getInstance()))
            hashtable:put(RemoteHighScoresData.getInstance().SCORE, tostring(highScore:getScore()))
            if XmlRpcAbeClient.isOnline then
                local resultHashtable = XmlRpcRemoteHighScoresClient.new(abeClientInformation, "highscoresubmissionservicessl.php", "HighScoreSubmissionService.process"):get(hashtable, self.noCrypt)
                remoteHighScores:update(resultHashtable)
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end

return RemoteHighScoresSubmissionProcessor

