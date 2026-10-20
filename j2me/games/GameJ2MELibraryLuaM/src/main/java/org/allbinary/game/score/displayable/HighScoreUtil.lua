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
-- package org.allbinary.game.score.displayable

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local GameInfo = require("org.allbinary.game.GameInfo")
local HighScore = require("org.allbinary.game.score.HighScore")
local HighScoreNamePersistanceSingleton = require("org.allbinary.game.score.HighScoreNamePersistanceSingleton")
local HighScores = require("org.allbinary.game.score.HighScores")
local HighScoresFactoryInterface = require("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelperBaseInterface = require("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresResultsListener = require("org.allbinary.game.score.HighScoresResultsListener")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
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

local HighScoreUtil = {}
HighScoreUtil.__index = HighScoreUtil
HighScoreUtil.className = "HighScoreUtil"

function HighScoreUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.highScoresFactoryInterface = nil
    self.highScoresArray = nil
    self.highScore = nil
    self.abeClientInformation = nil
    self.gameInfo = nil
    self.highScoresHelper = nil
    self.firstTime = true
end


function HighScoreUtil.new(highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore)
    local self = setmetatable({}, HighScoreUtil)
    self:_init_fields()
        self.highScoresFactoryInterface = highScoresFactoryInterface
        self.highScoresHelper = highScoresHelper
        self.highScoresArray = self.highScoresHelper:getHighScoresArray()
        self.highScore = highScore
        self.abeClientInformation = abeClientInformation
        self.gameInfo = gameInfo
    return self
end


function HighScoreUtil:setHighScoresArray(highScoresArray)
        self.highScoresArray = highScoresArray
        self.firstTime = false
        self:saveHighScore()
end


function HighScoreUtil:update(name)
        HighScoreNamePersistanceSingleton.getInstance():save(self.abeClientInformation, self.gameInfo, name)
        self.highScore:setName(name)
end


function HighScoreUtil:saveHighScore()
        self.logUtil:putF(tostring(StringMaker.new():append(self.commonStrings.START):append(StringUtil.getInstance():toString(self.highScore))), self, "saveHighScore")
        local size = (self.highScoresArray.n or #self.highScoresArray)
        if self.firstTime and size == 0 then
            self.logUtil:putF("Games canvas did not give us any HighScores", self, "saveHighScore")
            self.highScoresFactoryInterface:fetchHighScores(self.gameInfo, self)
            return
        end
        local highScores = nil
        local highScoresAsString = nil
        for index = 0, size - 1 do
            highScores = self.highScoresArray[index + 1]
            highScores:addHighScore(self.highScore)
            highScoresAsString = tostring(highScores)
            self.logUtil:putF(tostring(StringMaker.new():append("Added/Adding Score: "):append(highScoresAsString)), self, "saveHighScore")
        end
        self.highScoresHelper:setHighScoresArray(self.highScoresArray)
end


function HighScoreUtil:submit(myCanvas)
        local commandListener = myCanvas:getCustomCommandListener()
        commandListener:commandAction(HighScoreUtil.SUBMIT_TEXTBOX_COMMAND, myCanvas)
end

HighScoreUtil.SUBMIT_TEXTBOX_COMMAND = Command.new("Submit", StringUtil.getInstance().EMPTY_STRING, Command.SCREEN, 1)

return HighScoreUtil

