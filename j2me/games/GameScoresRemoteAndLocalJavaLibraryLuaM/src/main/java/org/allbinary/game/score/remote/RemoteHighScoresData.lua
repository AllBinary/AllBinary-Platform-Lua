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
-- package org.allbinary.game.score.remote


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoteHighScoresData = {}
RemoteHighScoresData.__index = RemoteHighScoresData
RemoteHighScoresData.className = "RemoteHighScoresData"

function RemoteHighScoresData:_init_fields()
    self.HIGH_SCORES = "HIGH_SCORES"
    self.CUSTOMER_USER_NAME = "CUSTOMER_USER_NAME"
    self.DISPLAY_NAME = "DISPLAY_NAME"
    self.SCORE = "SCORE"
    self.GAME_INFO = "GAME_INFO"
    self.GAME_CONFIGURATION = "GAME_CONFIGURATION"
end

function RemoteHighScoresData.new()
    local self = setmetatable({}, RemoteHighScoresData)
    self:_init_fields()
    return self
end


function RemoteHighScoresData.getInstance()
        return RemoteHighScoresData.SINGLETON
end

RemoteHighScoresData.SINGLETON = RemoteHighScoresData.new()

return RemoteHighScoresData

