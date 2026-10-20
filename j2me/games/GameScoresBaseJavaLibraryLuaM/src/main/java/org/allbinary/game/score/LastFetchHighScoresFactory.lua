-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.score

local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LastFetchHighScoresFactory = {}
LastFetchHighScoresFactory.__index = LastFetchHighScoresFactory
LastFetchHighScoresFactory.className = "LastFetchHighScoresFactory"

function LastFetchHighScoresFactory:_init_fields()
    self.highScoresArray = NoHighScoresFactory.getInstance().NO_HIGH_SCORES
end

function LastFetchHighScoresFactory.new()
    local self = setmetatable({}, LastFetchHighScoresFactory)
    self:_init_fields()
    return self
end


function LastFetchHighScoresFactory.getInstance()
        if LastFetchHighScoresFactory.instance == NullUtil.getInstance().NULL_OBJECT then
            LastFetchHighScoresFactory.instance = LastFetchHighScoresFactory.new()
        end
        return LastFetchHighScoresFactory.instance
end

LastFetchHighScoresFactory.instance = NullUtil.getInstance().NULL_OBJECT

return LastFetchHighScoresFactory

