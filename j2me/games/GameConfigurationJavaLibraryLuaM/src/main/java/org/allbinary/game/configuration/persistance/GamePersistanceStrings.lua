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

local GamePersistanceStrings = {}
GamePersistanceStrings.__index = GamePersistanceStrings
GamePersistanceStrings.className = "GamePersistanceStrings"

function GamePersistanceStrings:_init_fields()
    self.SAVED_GAME_RECORD_ID = "_SG"
    self.SAVED_GAME_CONFIGURATION_RECORD_ID = "_SGC"
    self.DEFAULT_INPUT_MAPPING_RECORD_ID = "_DIM"
    self.SAVED_INPUT_CONFIGURATION_RECORD_ID = "_SIC"
end

function GamePersistanceStrings.new()
    local self = setmetatable({}, GamePersistanceStrings)
    self:_init_fields()
    return self
end


function GamePersistanceStrings.getInstance()
        return GamePersistanceStrings.instance
end

GamePersistanceStrings.instance = GamePersistanceStrings.new()

return GamePersistanceStrings

