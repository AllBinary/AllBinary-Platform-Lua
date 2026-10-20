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
-- package org.allbinary.game.state

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameStateFactory = {}
GameStateFactory.__index = GameStateFactory
GameStateFactory.className = "GameStateFactory"

function GameStateFactory:_init_fields()
    self.index = 0
    self.NO_GAME_STATE = self:createGameState("NO_GAME_STATE")
    self.PLAYING_GAME_STATE = self:createGameState("PLAYING_GAME_STATE")
    self.SHOW_END_RESULT_GAME_STATE = self:createGameState("SHOW_END_RESULT_GAME_STATE")
    self.SHOW_HIGH_SCORE_GAME_STATE = self:createGameState("SHOW_HIGH_SCORE_GAME_STATE")
end


function GameStateFactory.getInstance()
        if GameStateFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            GameStateFactory.instance = GameStateFactory.new()
        end
        return GameStateFactory.instance
end


function GameStateFactory.new()
    local self = setmetatable({}, GameStateFactory)
    self:_init_fields()
    return self
end


function GameStateFactory:createGameState(name)
        return GameState.new(name, (function() local value = self.index self.index = value + 1 return value end)())
end

GameStateFactory.instance = NullUtil.getInstance().NULL_OBJECT

return GameStateFactory

