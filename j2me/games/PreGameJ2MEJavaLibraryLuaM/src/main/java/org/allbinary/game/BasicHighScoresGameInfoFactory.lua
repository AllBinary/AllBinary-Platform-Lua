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

local BasicHighScoresGameInfoFactory = {}
BasicHighScoresGameInfoFactory.__index = BasicHighScoresGameInfoFactory
BasicHighScoresGameInfoFactory.className = "BasicHighScoresGameInfoFactory"

function BasicHighScoresGameInfoFactory:_init_fields()
    self.MULTI_PLAYER_SERVER = GameInfo.new(GameTypeFactory.getInstance().MULTI_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0)
    self.SINGLE_PLAYER_SERVER = GameInfo.new(GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER, PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE, 0, 0)
end

function BasicHighScoresGameInfoFactory.new()
    local self = setmetatable({}, BasicHighScoresGameInfoFactory)
    self:_init_fields()
    return self
end


function BasicHighScoresGameInfoFactory.getInstance()
        return BasicHighScoresGameInfoFactory.SINGLETON
end

BasicHighScoresGameInfoFactory.SINGLETON = BasicHighScoresGameInfoFactory.new()

return BasicHighScoresGameInfoFactory

