-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local RaceGameStateFactory = {}
RaceGameStateFactory.__index = RaceGameStateFactory
RaceGameStateFactory.className = "RaceGameStateFactory"

function RaceGameStateFactory:_init_fields()
    self.START_GAME_STATE = GameStateFactory.getInstance():createGameState("START_GAME_STATE")
    self.YELLOW_LIGHT_GAME_STATE = GameStateFactory.getInstance():createGameState("YELLOW_LIGHT_GAME_STATE")
    self.RED_LIGHT_GAME_STATE = GameStateFactory.getInstance():createGameState("RED_LIGHT_GAME_STATE")
end

function RaceGameStateFactory.new()
    local self = setmetatable({}, RaceGameStateFactory)
    self:_init_fields()
    return self
end


function RaceGameStateFactory.getInstance()
        if RaceGameStateFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            RaceGameStateFactory.instance = RaceGameStateFactory.new()
        end
        return RaceGameStateFactory.instance
end

RaceGameStateFactory.instance = NullUtil.getInstance().NULL_OBJECT

return RaceGameStateFactory

