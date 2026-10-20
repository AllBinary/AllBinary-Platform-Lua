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

-- local Enumeration = require("java.util.Enumeration")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local GameInfo = require("org.allbinary.game.GameInfo")
local HighScore = require("org.allbinary.game.score.HighScore")
local HighScores = require("org.allbinary.game.score.HighScores")
local RemoteErrorHighScoresSingletonFactory = require("org.allbinary.game.score.RemoteErrorHighScoresSingletonFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local SoftwareInformation = require("org.allbinary.logic.system.SoftwareInformation")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local EnumerationUtil = require("org.allbinary.util.EnumerationUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoteHighScores = {}
RemoteHighScores.__index = RemoteHighScores
RemoteHighScores.className = "RemoteHighScores"
setmetatable(RemoteHighScores, {__index = HighScores})

function RemoteHighScores:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.abeClientInformation = nil
    self.softwareInformation = nil
    self.ascending = nil
    self.ASCENDING = "ASCENDING"
end


function RemoteHighScores.new(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, ascending, preload)
    local self = setmetatable(HighScores.new(tostring(gameInfo), heading, columnTwoHeading), RemoteHighScores)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self.softwareInformation = softwareInformation
        self:setAscending(ascending)
        if preload then
            RemoteHighScoresProcessorFactory.getInstance():process(self, self.abeClientInformation, gameInfo)
        end
    return self
end


function RemoteHighScores.getInstance(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending)
        return RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, true)
end


function RemoteHighScores.getInstancePreload(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, preload)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            local highScores = RemoteHighScores.hashTable:get(gameInfo)
            if highScores == nil then
                highScores = RemoteHighScores.new(abeClientInformation, softwareInformation, gameInfo, heading, columnTwoHeading, isAscending, preload)
                RemoteHighScores.hashTable:put(gameInfo, highScores)
            end
            return highScores
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, RemoteErrorHighScoresSingletonFactory.getInstance(), commonStrings.GET_INSTANCE, e)
            return RemoteErrorHighScoresSingletonFactory.getInstance()
        end
end


function RemoteHighScores:addHighScore(newHighScore)
        RemoteHighScoresSubmissionProcessorFactory.getInstance():process(self, self.abeClientInformation, newHighScore)
end


function RemoteHighScores:update(hashtable)
        self:getList():clear()
        local vector = hashtable:get(RemoteHighScoresData.getInstance().HIGH_SCORES)
        if vector ~= nil then
            local size = vector:size()
            for index = 0, size - 1 do
                local highScoreVector = vector:get(index)
                local displayName = highScoreVector:get(0)
                local score = highScoreVector:get(1)
                local longScore = math.tointeger(tonumber(score))
                local highScore = HighScore.new(-1, displayName, nil, longScore)
                self:getList():add(highScore)
            end
        else
            local NEXT_ELEMENT = tostring(StringMaker.new():append(CommonLabels.getInstance().NEXT):append("Element: "))
            local commonStrings = CommonStrings.getInstance()
            local enumeration = hashtable:elements()
            local nextElement = nil
            while self.enumerationUtil:hasMoreElements(enumeration) do
                nextElement = self.enumerationUtil:nextElement(enumeration)
                self.logUtil:putF(NEXT_ELEMENT .. tostring(nextElement), self, commonStrings.PROCESS)
            end
        end
end


function RemoteHighScores:setAscending(ascending)
        self.ascending = ascending
end


function RemoteHighScores:getAscending()
        return self.ascending
end


function RemoteHighScores:getSoftwareInformation()
        return self.softwareInformation
end

RemoteHighScores.hashTable = StdUtil.getInstance():createHashtable()

return RemoteHighScores

