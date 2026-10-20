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
-- package org.allbinary.game.score

local ARunnable = require("org.allbinary.thread.ARunnable")
local BasicHighScoresGameInfoFactory = require("org.allbinary.game.BasicHighScoresGameInfoFactory")
local GameInfo = require("org.allbinary.game.GameInfo")
local GameType = require("org.allbinary.game.GameType")
local GameTypeFactory = require("org.allbinary.game.GameTypeFactory")
local RemoteHighScores = require("org.allbinary.game.score.remote.RemoteHighScores")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local SoftwareInformation = require("org.allbinary.logic.system.SoftwareInformation")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local SecondaryThreadPool = require("org.allbinary.thread.SecondaryThreadPool")
local HighScoresBase = require("org.allbinary.game.score.HighScoresBase")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local BasicHighScoresFactory = {}
BasicHighScoresFactory.__index = BasicHighScoresFactory
BasicHighScoresFactory.className = "BasicHighScoresFactory"
setmetatable(BasicHighScoresFactory, {__index = HighScoresBase})

function BasicHighScoresFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = nil
    self.softwareInformation = nil
    self.highScoresArray = java_new_array(nil, 2)
    self.TOP = "Top"
    self.SCORES = "Scores"
    self.PERSONAL_HIGH_SCORES = "Personal Top Scores"
    self.WORLD_TOP_SCORES = "World Top Scores"
    self.FETCH = "fetchHighScores"
end


function BasicHighScoresFactory.new(abeClientInformation, softwareInformation)
    local self = setmetatable(HighScoresBase.new(), BasicHighScoresFactory)
    self:_init_fields()
        self.abeClientInformation = abeClientInformation
        self.softwareInformation = softwareInformation
    return self
end


function BasicHighScoresFactory:fetchHighScores(gameInfo, highScoresResultsListener)
        self.logUtil:putF("Getting Remote/Local HighScores", self, self.FETCH)
        self:fetchHighScoresPreload(gameInfo, highScoresResultsListener, true)
end


function BasicHighScoresFactory:fetchHighScoresPreload(gameInfo, highScoresResultsListener, preload)
        SecondaryThreadPool.getInstance():runTask((function()
            local o = ARunnable.new and ARunnable.new() or setmetatable({}, {__index = ARunnable})
            

            function o:run()
                local logUtil = LogUtil.getInstance()
                local try_ok, try_error = pcall(function()
                    logUtil:putF(self.commonStrings.START, self, self.FETCH)
                    self.highScoresArray[1] = RecordStoreHighScores.getInstance(self.abeClientInformation, gameInfo, self.TOP, self.PERSONAL_HIGH_SCORES, self.SCORES, ScoreComparator.new(true))
                    local gameType = gameInfo:getGameType()
                    local gameTypeFactory = GameTypeFactory.getInstance()
                    local gameInfo2 = gameInfo
                    if gameType == gameTypeFactory.SINGLE_PLAYER or gameType == gameTypeFactory.BOT then
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().SINGLE_PLAYER_SERVER
                    elseif gameType == gameTypeFactory.MULTI_PLAYER then
                        gameInfo2 = BasicHighScoresGameInfoFactory.getInstance().MULTI_PLAYER_SERVER
                    end
                    self.highScoresArray[2] = RemoteHighScores.getInstancePreload(self.abeClientInformation, self.softwareInformation, gameInfo2, self.WORLD_TOP_SCORES, self.SCORES, BooleanFactory.getInstance().FALSE, preload)
                    logUtil:putF(self.commonStrings.END, self, self.FETCH)
                    LastFetchHighScoresFactory.getInstance().highScoresArray = self.highScoresArray
                    highScoresResultsListener:setHighScoresArray(self.highScoresArray)
                end)
                if not try_ok then
                    local e = try_error
                    logUtil:put(self.commonStrings.EXCEPTION, self, self.FETCH, e)
                end
            end
            return o
        end)())
end


function BasicHighScoresFactory:createHighScoresHelper()
        return HighScoresHelper2.new()
end


function BasicHighScoresFactory.loaded(index2)
        if index2 >= 0 then
            return true
        end
        return false
end

return BasicHighScoresFactory

