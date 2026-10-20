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

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameTypeFactory = {}
GameTypeFactory.__index = GameTypeFactory
GameTypeFactory.className = "GameTypeFactory"

function GameTypeFactory:_init_fields()
    self.NULL_GAME_TYPE_ARRAY = java_new_array(nil, 0)
    self.NONE = GameType.new(StringUtil.getInstance().NULL_STRING)
    self.SINGLE_PLAYER = GameType.new("Single Player")
    self.MULTI_PLAYER = GameType.new("Multi Player")
    self.BOT = GameType.new("Artificial Player")
end

function GameTypeFactory.new()
    local self = setmetatable({}, GameTypeFactory)
    self:_init_fields()
    return self
end


function GameTypeFactory.getInstance()
        return GameTypeFactory.instance
end

GameTypeFactory.instance = GameTypeFactory.new()

return GameTypeFactory

