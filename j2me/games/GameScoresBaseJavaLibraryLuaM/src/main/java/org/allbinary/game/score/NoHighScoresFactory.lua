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
-- package org.allbinary.game.score

local GameInfo = require("org.allbinary.game.GameInfo")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local HighScoresBase = require("org.allbinary.game.score.HighScoresBase")

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

local NoHighScoresFactory = {}
NoHighScoresFactory.__index = NoHighScoresFactory
NoHighScoresFactory.className = "NoHighScoresFactory"
setmetatable(NoHighScoresFactory, {__index = HighScoresBase})

function NoHighScoresFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.NO_HIGH_SCORES = java_new_array(nil, 0)
end


function NoHighScoresFactory.getInstance()
        return NoHighScoresFactory.instance
end


function NoHighScoresFactory.new()
    local self = setmetatable(HighScoresBase.new(), NoHighScoresFactory)
    self:_init_fields()
    return self
end


function NoHighScoresFactory:fetchHighScores(gameInfo, highScoresResultsListener)
        self.logUtil:putF("Getting No HighScores", self, "fetchHighScores")
        highScoresResultsListener:setHighScoresArray(self.NO_HIGH_SCORES)
end


function NoHighScoresFactory:createHighScoresHelper()
        return HighScoresHelperBase.new()
end

NoHighScoresFactory.instance = NoHighScoresFactory.new()

return NoHighScoresFactory

