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
-- package org.allbinary.game

local GameInfo = {}
package.loaded["org.allbinary.game.GameInfo"] = GameInfo

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local GameInfoData = java_lazy("org.allbinary.game.GameInfoData")
local GameMode = java_lazy("org.allbinary.game.GameMode")
local GameType = java_lazy("org.allbinary.game.GameType")
local GameTypeFactory = java_lazy("org.allbinary.game.GameTypeFactory")
local PlayerType = java_lazy("org.allbinary.game.PlayerType")
local PlayerTypesFactory = java_lazy("org.allbinary.game.PlayerTypesFactory")

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

-- class table GameInfo is declared before the requires
GameInfo.__index = GameInfo
GameInfo.className = "GameInfo"
GameInfo.javaClassName = "org.allbinary.game.GameInfo"

function GameInfo:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.gameInfoData = GameInfoData.getInstance()
    if self.gameType == nil then self.gameType = nil end
    if self.gameMode == nil then self.gameMode = nil end
    if self.playerType == nil then self.playerType = nil end
    if self.highestLevel == nil then self.highestLevel = 0 end
    if self.currentLevel == nil then self.currentLevel = 0 end
    self.NEW_LEVEL = "New Level: "
    self.SET_CURRENT_LEVEL = "setCurrentLevel"
    self.NEXT_GAME_LEVEL = "nextGameLevel"
end


function GameInfo._jinit(self, gameType, gameMode, playerType, highestLevel, currentLevel)
    GameInfo._init_fields(self)
        self.gameType = gameType
        self.gameMode = gameMode
        self:setHighestLevel(highestLevel)
        self.currentLevel = currentLevel
        self.playerType = playerType
    return self
end

function GameInfo.new(...)
    local self = setmetatable({}, GameInfo)
    GameInfo._jinit(self, ...)
    return self
end


function GameInfo:getGameType()
        return self.gameType
end


function GameInfo:getGameMode()
        return self.gameMode
end


function GameInfo:getPlayerType()
        return self.playerType
end


function GameInfo:getHighestLevel()
        return self.highestLevel
end


function GameInfo:setHighestLevel(highestLevel)
        self.highestLevel = highestLevel
end


function GameInfo:getCurrentLevel()
        return self.currentLevel
end


function GameInfo:setCurrentLevel(currentLevel)
        self.currentLevel = currentLevel
        self.logUtil:putF(tostring(StringMaker.new():append(self.NEW_LEVEL):appendint(self:getCurrentLevel())), self, self.SET_CURRENT_LEVEL)
end


function GameInfo:nextGameLevel()
        if self:getCurrentLevel() < self:getHighestLevel() then
            self.currentLevel = self.currentLevel + 1
        end
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().NEXT):append(CommonSeps.getInstance().SPACE):append(self.NEW_LEVEL):appendint(self:getCurrentLevel())), self, self.NEXT_GAME_LEVEL)
end


function GameInfo:previousGameLevel()
        if self:getCurrentLevel() > 1 then
            self.currentLevel = self.currentLevel - 1
        end
end


function GameInfo:isLastLevel()
        if self:getCurrentLevel() >= self:getHighestLevel() then
            return true
        else
            return false
        end
end


function GameInfo:toHashtable()
        local hashtable = StdUtil.getInstance():createHashtable()
        hashtable:put(self.gameInfoData.GAME_TYPE, tostring(self:getGameType()))
        hashtable:put(self.gameInfoData.GAME_MODE, tostring(self.gameMode))
        hashtable:put(self.gameInfoData.PLAYER_TYPE, tostring(self.playerType))
        hashtable:put(self.gameInfoData.HIGHEST_LEVEL, tostring(self:getHighestLevel()))
        hashtable:put(self.gameInfoData.CURRENT_LEVEL, tostring(self.currentLevel))
        return hashtable
end


function GameInfo:toString()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append(self.gameInfoData.GAME_TYPE)
        stringBuffer:append(commonSeps.EQUALS)
        stringBuffer:append(tostring(self:getGameType()))
        stringBuffer:append(commonSeps.COMMA_SEP)
        stringBuffer:append(self.gameInfoData.GAME_MODE)
        stringBuffer:append(commonSeps.EQUALS)
        stringBuffer:append(tostring(self.gameMode))
        stringBuffer:append(commonSeps.COMMA_SEP)
        stringBuffer:append(self.gameInfoData.PLAYER_TYPE)
        stringBuffer:append(commonSeps.EQUALS)
        stringBuffer:append(StringUtil.getInstance():toString(self.playerType))
        stringBuffer:append(commonSeps.COMMA_SEP)
        stringBuffer:append(self.gameInfoData.HIGHEST_LEVEL)
        stringBuffer:append(commonSeps.EQUALS)
        stringBuffer:appendint(self:getHighestLevel())
        stringBuffer:append(commonSeps.COMMA_SEP)
        stringBuffer:append(self.gameInfoData.CURRENT_LEVEL)
        stringBuffer:append(commonSeps.EQUALS)
        stringBuffer:appendint(self.currentLevel)
        return tostring(stringBuffer)
end
GameInfo.__tostring = function(self) return self:toString() end

GameInfo.NONE = GameInfo.new(GameTypeFactory.getInstance().NONE, GameMode.NONE, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, -1, -1)
GameInfo.LEVEL_NAME = "LEVEL"

return GameInfo

