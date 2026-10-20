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

local GameState = require("org.allbinary.game.state.GameState")
local GameStateFactory = require("org.allbinary.game.state.GameStateFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IntermissionFactory = {}
IntermissionFactory.__index = IntermissionFactory
IntermissionFactory.className = "IntermissionFactory"

function IntermissionFactory:_init_fields()
    self.START_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("START_LEVEL_INTERMISSION_GAME_STATE")
    self.WAIT_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("WAIT_LEVEL_INTERMISSION_GAME_STATE")
    self.SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE")
    self.SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE = GameStateFactory.getInstance():createGameState("SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE")
end

function IntermissionFactory.new()
    local self = setmetatable({}, IntermissionFactory)
    self:_init_fields()
    return self
end


function IntermissionFactory.getInstance()
        return IntermissionFactory.instance
end

IntermissionFactory.instance = IntermissionFactory.new()

return IntermissionFactory

