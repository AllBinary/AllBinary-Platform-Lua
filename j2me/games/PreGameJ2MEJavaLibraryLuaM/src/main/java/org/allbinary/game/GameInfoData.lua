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

local GameInfoData = {}
GameInfoData.__index = GameInfoData
GameInfoData.className = "GameInfoData"

function GameInfoData:_init_fields()
    self.GAME_TYPE = "GAME_TYPE"
    self.GAME_MODE = "GAME_MODE"
    self.PLAYER_TYPE = "PLAYER_TYPE"
    self.HIGHEST_LEVEL = "HIGHEST_LEVEL"
    self.CURRENT_LEVEL = "CURRENT_LEVEL"
    self.SOFTWARE_INFORMATION = "SOFTWARE_INFORMATION"
end


function GameInfoData.getInstance()
        return GameInfoData.instance
end


function GameInfoData.new()
    local self = setmetatable({}, GameInfoData)
    self:_init_fields()
    return self
end

GameInfoData.instance = GameInfoData.new()

return GameInfoData

