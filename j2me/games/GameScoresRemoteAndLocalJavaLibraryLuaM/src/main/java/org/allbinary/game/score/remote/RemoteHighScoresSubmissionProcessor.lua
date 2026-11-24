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

local RemoteHighScoresSubmissionProcessor = {}
package.loaded["org.allbinary.game.score.remote.RemoteHighScoresSubmissionProcessor"] = RemoteHighScoresSubmissionProcessor

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

local GameInfoData = java_lazy("org.allbinary.game.GameInfoData")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = java_lazy("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local NoCrypt = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local RemoteHighScoresSubmissionProcessorInterface = require("org.allbinary.game.score.remote.RemoteHighScoresSubmissionProcessorInterface")
local RemoteHighScores = java_lazy("org.allbinary.game.score.remote.RemoteHighScores")
local RemoteHighScoresData = java_lazy("org.allbinary.game.score.remote.RemoteHighScoresData")
local XmlRpcRemoteHighScoresClient = java_lazy("org.allbinary.game.score.remote.XmlRpcRemoteHighScoresClient")

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

-- class table RemoteHighScoresSubmissionProcessor is declared before the requires
RemoteHighScoresSubmissionProcessor.__index = RemoteHighScoresSubmissionProcessor
RemoteHighScoresSubmissionProcessor.className = "RemoteHighScoresSubmissionProcessor"
RemoteHighScoresSubmissionProcessor.javaClassName = "org.allbinary.game.score.remote.RemoteHighScoresSubmissionProcessor"
RemoteHighScoresSubmissionProcessor.java_implements = " RemoteHighScoresSubmissionProcessorInterface "
RemoteHighScoresSubmissionProcessor.java_interfaces = function() return {RemoteHighScoresSubmissionProcessorInterface} end

function RemoteHighScoresSubmissionProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.noCrypt = NoCrypt.new()
end


function RemoteHighScoresSubmissionProcessor._jinit(self)
    RemoteHighScoresSubmissionProcessor._init_fields(self)
    return self
end

function RemoteHighScoresSubmissionProcessor.new(...)
    local self = setmetatable({}, RemoteHighScoresSubmissionProcessor)
    RemoteHighScoresSubmissionProcessor._jinit(self, ...)
    return self
end


function RemoteHighScoresSubmissionProcessor:process(remoteHighScores, abeClientInformation, highScore)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
        end
end

return RemoteHighScoresSubmissionProcessor

