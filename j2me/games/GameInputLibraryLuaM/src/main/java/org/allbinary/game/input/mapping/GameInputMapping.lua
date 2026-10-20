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
-- package org.allbinary.game.input.mapping

local GameKey = require("org.allbinary.game.input.GameKey")
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

local GameInputMapping = {}
GameInputMapping.__index = GameInputMapping
GameInputMapping.className = "GameInputMapping"

function GameInputMapping:_init_fields()
    self.name = StringUtil.getInstance().EMPTY_STRING
    self.gameKey = GameKey.NULL_GAME_KEY
end


function GameInputMapping.new(name, gameKey)
    local self = setmetatable({}, GameInputMapping)
    self:_init_fields()
        self:setName(name)
        self:setGameKey(gameKey)
    return self
end


function GameInputMapping:setGameKey(gameKey)
        self.gameKey = gameKey
end


function GameInputMapping:getGameKey()
        return self.gameKey
end


function GameInputMapping:setName(name)
        self.name = name
end


function GameInputMapping:getName()
        return self.name
end

return GameInputMapping

