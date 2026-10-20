-- Generated Code Do Not Modify
-- package org.allbinary.game.score

local GameInfo = require("org.allbinary.game.GameInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SoftwareInformation = require("org.allbinary.logic.system.SoftwareInformation")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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
    self.highScoresArray = java_new_array(nil, 1)
    self.TOP = "Top"
    self.SCORES = "Scores"
    self.PERSONAL_HIGH_SCORES = "Personal Top Scores"
    self.FETCH = "fetchHighScores"
end


function BasicHighScoresFactory.new(abeClientInformation, softwareInformation)
    local self = setmetatable(HighScoresBase.new(), BasicHighScoresFactory)
    self:_init_fields()
        self.abeClientInformation = abeClientInformation
    return self
end


function BasicHighScoresFactory:fetchHighScores(gameInfo, highScoresResultsListener)
        self.logUtil:putF("Getting Local HighScores", self, self.FETCH)
        self:fetchHighScoresPreload(gameInfo, highScoresResultsListener, true)
end


function BasicHighScoresFactory:fetchHighScoresPreload(gameInfo, highScoresResultsListener, preload)
        local try_ok, try_error = pcall(function()
            self.highScoresArray[1] = RecordStoreHighScores.getInstance(self.abeClientInformation, gameInfo, self.TOP, self.PERSONAL_HIGH_SCORES, self.SCORES, ScoreComparator.new(true))
            highScoresResultsListener:setHighScoresArray(self.highScoresArray)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.FETCH, e)
        end
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

