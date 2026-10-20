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

local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local HighScoresHelperBase = require("org.allbinary.game.score.HighScoresHelperBase")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HighScoresHelper = {}
HighScoresHelper.__index = HighScoresHelper
HighScoresHelper.className = "HighScoresHelper"
setmetatable(HighScoresHelper, {__index = HighScoresHelperBase})

function HighScoresHelper:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.createInstanceAt(0, 0)
    self.lastIndex = -1
end

function HighScoresHelper.new()
    local self = setmetatable(HighScoresHelperBase.new(), HighScoresHelper)
    self:_init_fields()
    return self
end


function HighScoresHelper:setHighScoresArray(highScoresArrayP)
        HighScoresHelperBase.setHighScoresArray(self, highScoresArrayP)
        self.circularIndexUtil:setSize((self.highScoresArrayP.n or #self.highScoresArrayP))
end


function HighScoresHelper:getNextHighScores()
        local highScores = self.highScoresArrayP[self.circularIndexUtil:getIndex() + 1]
        local index = 0
        while (highScores:getTotal() < 1 or self.lastIndex == self.circularIndexUtil:getIndex()) and index < (self.highScoresArrayP.n or #self.highScoresArrayP) do
            self.circularIndexUtil:next()
            highScores = self.highScoresArrayP[self.circularIndexUtil:getIndex() + 1]
            index = index + 1
        end
        self.lastIndex = self.circularIndexUtil:getIndex()
        return highScores
end


function HighScoresHelper:isAnyHighScores()
        if (self.highScoresArrayP.n or #self.highScoresArrayP) < 1 then
            return false
        end
        local anyScores = false
        local highScores = nil
        for index = (self.highScoresArrayP.n or #self.highScoresArrayP) - 1, 0, -1 do
            highScores = self.highScoresArrayP[index + 1]
            if highScores:getTotal() > 0 then
                anyScores = true
            end
        end
        return anyScores
end

return HighScoresHelper

