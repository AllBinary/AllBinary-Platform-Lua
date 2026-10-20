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
-- package org.allbinary.game.input

local NullUtil = require("org.allbinary.logic.NullUtil")

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

local GameKeyMappingFactory = {}
GameKeyMappingFactory.__index = GameKeyMappingFactory
GameKeyMappingFactory.className = "GameKeyMappingFactory"

function GameKeyMappingFactory:_init_fields()
    self.intKeyToGameKey = java_new_array(nil, InputFactory.getInstance().MAX)
end


function GameKeyMappingFactory.getInstance()
        if GameKeyMappingFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            GameKeyMappingFactory.instance = GameKeyMappingFactory.new()
        end
        return GameKeyMappingFactory.instance
end


function GameKeyMappingFactory.new()
    local self = setmetatable({}, GameKeyMappingFactory)
    self:_init_fields()
        local gameKeyFactory = GameKeyFactory.getInstance()
        self:setGameKey(gameKeyFactory.NONE)
        self:setGameKey(gameKeyFactory.UP)
        self:setGameKey(gameKeyFactory.DOWN)
        self:setGameKey(gameKeyFactory.LEFT)
        self:setGameKey(gameKeyFactory.RIGHT)
        self:setGameKey(gameKeyFactory.KEY_POUND)
        self:setGameKey(gameKeyFactory.KEY_STAR)
        self:setGameKey(gameKeyFactory.KEY_NUM0)
        self:setGameKey(gameKeyFactory.KEY_NUM1)
        self:setGameKey(gameKeyFactory.KEY_NUM2)
        self:setGameKey(gameKeyFactory.KEY_NUM3)
        self:setGameKey(gameKeyFactory.KEY_NUM4)
        self:setGameKey(gameKeyFactory.KEY_NUM5)
        self:setGameKey(gameKeyFactory.KEY_NUM6)
        self:setGameKey(gameKeyFactory.KEY_NUM7)
        self:setGameKey(gameKeyFactory.KEY_NUM8)
        self:setGameKey(gameKeyFactory.KEY_NUM9)
        self:setGameKey(gameKeyFactory.GAME_A)
        self:setGameKey(gameKeyFactory.GAME_B)
        self:setGameKey(gameKeyFactory.GAME_C)
        self:setGameKey(gameKeyFactory.GAME_D)
        self:setGameKey(gameKeyFactory.FIRE)
        self:setGameKey(gameKeyFactory.LEVEL_DOWN)
        self:setGameKey(gameKeyFactory.LEVEL_UP)
    return self
end


function GameKeyMappingFactory:getGameKey(key)
        return self.intKeyToGameKey[key + 1]
end


function GameKeyMappingFactory:setGameKey(gameKey)
        self.intKeyToGameKey[gameKey:getId() + 1] = gameKey
end

GameKeyMappingFactory.instance = NullUtil.getInstance().NULL_OBJECT

return GameKeyMappingFactory

