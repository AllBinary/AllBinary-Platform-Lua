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

local KeyValuePersistance = require("org.allbinary.game.configuration.persistance.KeyValuePersistance")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GamePersistanceSingleton = {}
GamePersistanceSingleton.__index = GamePersistanceSingleton
GamePersistanceSingleton.className = "GamePersistanceSingleton"
setmetatable(GamePersistanceSingleton, {__index = KeyValuePersistance})


function GamePersistanceSingleton.getInstance()
        return GamePersistanceSingleton.GAME_PERSISTANCE
end


function GamePersistanceSingleton.new()
    local self = setmetatable(KeyValuePersistance.new(GamePersistanceStrings.getInstance().SAVED_GAME_RECORD_ID), GamePersistanceSingleton)
        -- super(...) made self above
    return self
end

GamePersistanceSingleton.GAME_PERSISTANCE = GamePersistanceSingleton.new()

return GamePersistanceSingleton

