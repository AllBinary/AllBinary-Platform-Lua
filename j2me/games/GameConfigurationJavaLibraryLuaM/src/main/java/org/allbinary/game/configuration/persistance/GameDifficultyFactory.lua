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
-- package org.allbinary.game.configuration.persistance


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameDifficultyFactory = {}
GameDifficultyFactory.__index = GameDifficultyFactory
GameDifficultyFactory.className = "GameDifficultyFactory"

function GameDifficultyFactory:_init_fields()
    self.level = 0
end

function GameDifficultyFactory.new()
    local self = setmetatable({}, GameDifficultyFactory)
    self:_init_fields()
    return self
end


function GameDifficultyFactory.getInstance()
        return GameDifficultyFactory.instance
end


function GameDifficultyFactory:setLevel(level)
        self.level = level
end


function GameDifficultyFactory:getLevel()
        return self.level
end

GameDifficultyFactory.instance = GameDifficultyFactory.new()

return GameDifficultyFactory

