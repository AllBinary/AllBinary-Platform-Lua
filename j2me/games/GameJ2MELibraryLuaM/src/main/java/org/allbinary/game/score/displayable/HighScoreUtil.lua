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

local HighScoreUtil = {}
package.loaded["org.allbinary.game.score.displayable.HighScoreUtil"] = HighScoreUtil

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

-- local Command = require("javax.microedition.lcdui.Command")
-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local GameInfo = java_lazy("org.allbinary.game.GameInfo")
local HighScore = java_lazy("org.allbinary.game.score.HighScore")
local HighScoreNamePersistanceSingleton = java_lazy("org.allbinary.game.score.HighScoreNamePersistanceSingleton")
local HighScores = java_lazy("org.allbinary.game.score.HighScores")
local HighScoresFactoryInterface = java_lazy("org.allbinary.game.score.HighScoresFactoryInterface")
local HighScoresHelperBaseInterface = java_lazy("org.allbinary.game.score.HighScoresHelperBaseInterface")
local HighScoresResultsListener = java_lazy("org.allbinary.game.score.HighScoresResultsListener")
local MyCanvas = java_lazy("org.allbinary.graphics.displayable.MyCanvas")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table HighScoreUtil is declared before the requires
HighScoreUtil.__index = HighScoreUtil
HighScoreUtil.className = "HighScoreUtil"
HighScoreUtil.javaClassName = "org.allbinary.game.score.displayable.HighScoreUtil"
HighScoreUtil.java_implements = " HighScoresResultsListener "
HighScoreUtil.java_interfaces = function() return {HighScoresResultsListener} end

function HighScoreUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.highScoresFactoryInterface == nil then self.highScoresFactoryInterface = nil end
    if self.highScoresArray == nil then self.highScoresArray = nil end
    if self.highScore == nil then self.highScore = nil end
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    if self.gameInfo == nil then self.gameInfo = nil end
    if self.highScoresHelper == nil then self.highScoresHelper = nil end
    self.firstTime = true
end


function HighScoreUtil._jinit(self, highScoresFactoryInterface, highScoresHelper, abeClientInformation, gameInfo, cmdListener, name, highScore)
    HighScoreUtil._init_fields(self)
        self.highScoresFactoryInterface = highScoresFactoryInterface
        self.highScoresHelper = highScoresHelper
        self.highScoresArray = self.highScoresHelper:getHighScoresArray()
        self.highScore = highScore
        self.abeClientInformation = abeClientInformation
        self.gameInfo = gameInfo
    return self
end

function HighScoreUtil.new(...)
    local self = setmetatable({}, HighScoreUtil)
    HighScoreUtil._jinit(self, ...)
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

