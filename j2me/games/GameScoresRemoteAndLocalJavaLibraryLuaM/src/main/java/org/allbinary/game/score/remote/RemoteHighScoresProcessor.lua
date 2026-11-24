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

local RemoteHighScoresProcessor = {}
package.loaded["org.allbinary.game.score.remote.RemoteHighScoresProcessor"] = RemoteHighScoresProcessor

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

local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local GameInfoData = java_lazy("org.allbinary.game.GameInfoData")
local GameConfigurationCentral = java_lazy("org.allbinary.game.configuration.GameConfigurationCentral")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local XmlRpcAbeClient = java_lazy("org.allbinary.logic.communication.xmlrpc.XmlRpcAbeClient")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local NoCrypt = java_lazy("org.allbinary.logic.system.security.crypt.jcehelper.NoCrypt")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local HashtableUtil = java_lazy("org.allbinary.util.HashtableUtil")
local RemoteHighScoresProcessorInterface = require("org.allbinary.game.score.remote.RemoteHighScoresProcessorInterface")
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

-- class table RemoteHighScoresProcessor is declared before the requires
RemoteHighScoresProcessor.__index = RemoteHighScoresProcessor
RemoteHighScoresProcessor.className = "RemoteHighScoresProcessor"
RemoteHighScoresProcessor.javaClassName = "org.allbinary.game.score.remote.RemoteHighScoresProcessor"
RemoteHighScoresProcessor.java_implements = " RemoteHighScoresProcessorInterface "
RemoteHighScoresProcessor.java_interfaces = function() return {RemoteHighScoresProcessorInterface} end

function RemoteHighScoresProcessor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.noCrypt = NoCrypt.new()
end


function RemoteHighScoresProcessor._jinit(self)
    RemoteHighScoresProcessor._init_fields(self)
    return self
end

function RemoteHighScoresProcessor.new(...)
    local self = setmetatable({}, RemoteHighScoresProcessor)
    RemoteHighScoresProcessor._jinit(self, ...)
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

