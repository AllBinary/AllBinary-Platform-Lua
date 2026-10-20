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
-- package org.allbinary.game.displayable.canvas

local GameInfo = require("org.allbinary.game.GameInfo")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local EndGameInfo = {}
EndGameInfo.__index = EndGameInfo
EndGameInfo.className = "EndGameInfo"

function EndGameInfo:_init_fields()
    self.NORMAL_GAME_OVER_WIN = "You Won"
    self.TEASER_DEMO_GAME_END_LAST_LEVEL = "End of Demo."
    self.TEASER_DEMO_GAME_END = "Demo Game Over."
    self.gameOverStr = StringUtil.getInstance().EMPTY_STRING
    self.winStr = self.gameOverStr
end

function EndGameInfo.new()
    local self = setmetatable({}, EndGameInfo)
    self:_init_fields()
    return self
end


function EndGameInfo:update(gameInfo, myCanvas)
        if gameInfo:isLastLevel() then
            self:setWinStr(self.TEASER_DEMO_GAME_END_LAST_LEVEL)
            self:setGameOverStr(self.TEASER_DEMO_GAME_END_LAST_LEVEL)
        else
            self:setWinStr(self.NORMAL_GAME_OVER_WIN)
            self:setGameOverStr(self.TEASER_DEMO_GAME_END)
        end
end


function EndGameInfo:getGameOverStr()
        return self.gameOverStr
end


function EndGameInfo:setGameOverStr(gameOverStr)
        self.gameOverStr = gameOverStr
end


function EndGameInfo:getWinStr()
        return self.winStr
end


function EndGameInfo:setWinStr(winStr)
        self.winStr = winStr
end

return EndGameInfo

