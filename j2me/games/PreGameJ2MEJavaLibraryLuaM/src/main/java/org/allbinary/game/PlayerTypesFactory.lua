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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerTypesFactory = {}
PlayerTypesFactory.__index = PlayerTypesFactory
PlayerTypesFactory.className = "PlayerTypesFactory"

function PlayerTypesFactory:_init_fields()
    self.PLAYER_TYPE_ONE = PlayerType.new("Player Type One", 0)
    self.PLAYER_TYPE_TWO = PlayerType.new("Player Type Two", 1)
    self.PLAYER_TYPE_THREE = PlayerType.new("Player Type Three", 2)
end

function PlayerTypesFactory.new()
    local self = setmetatable({}, PlayerTypesFactory)
    self:_init_fields()
    return self
end


function PlayerTypesFactory.getInstance()
        return PlayerTypesFactory.SINGLETON
end

PlayerTypesFactory.SINGLETON = PlayerTypesFactory.new()

return PlayerTypesFactory

