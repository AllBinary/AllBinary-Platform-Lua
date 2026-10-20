-- Generated Code Do Not Modify
-- package org.allbinary.game.midlet

local GameState = require("org.allbinary.game.state.GameState")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameMidletStateFactory = {}
GameMidletStateFactory.__index = GameMidletStateFactory
GameMidletStateFactory.className = "GameMidletStateFactory"

function GameMidletStateFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.currentGameState = GameStateFactory.getInstance().NO_GAME_STATE
end


function GameMidletStateFactory.new()
    local self = setmetatable({}, GameMidletStateFactory)
    self:_init_fields()
    return self
end


function GameMidletStateFactory.getInstance()
        return GameMidletStateFactory.INSTANCE
end


function GameMidletStateFactory:getCurrentGameState()
        return self.currentGameState
end


function GameMidletStateFactory:setCurrentGameState(currentGameState)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().CURRENT):append(" GameState: "):append(StringUtil.getInstance():toString(currentGameState))), self, "setCurrentGameState")
        self.currentGameState = currentGameState
end

GameMidletStateFactory.INSTANCE = GameMidletStateFactory.new()

return GameMidletStateFactory

