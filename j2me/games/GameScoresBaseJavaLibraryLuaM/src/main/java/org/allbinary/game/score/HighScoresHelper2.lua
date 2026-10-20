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

local HighScoresHelper2 = {}
HighScoresHelper2.__index = HighScoresHelper2
HighScoresHelper2.className = "HighScoresHelper2"
setmetatable(HighScoresHelper2, {__index = HighScoresHelperBase})

function HighScoresHelper2:_init_fields()
    self.circularIndexUtil = CircularIndexUtil.createInstanceAt(0, 0)
    self.selectedHighScores = NullHighScoresSingletonFactory.getInstance()
end

function HighScoresHelper2.new()
    local self = setmetatable(HighScoresHelperBase.new(), HighScoresHelper2)
    self:_init_fields()
    return self
end


function HighScoresHelper2:setSelectedHighScores(selectedHighScores)
        self.selectedHighScores = selectedHighScores
end


function HighScoresHelper2:getSelectedHighScores()
        return self.selectedHighScores
end


function HighScoresHelper2:setHighScoresArray(highScoresArrayP)
        HighScoresHelperBase.setHighScoresArray(self, highScoresArrayP)
        self.circularIndexUtil:setSize((self.highScoresArrayP.n or #self.highScoresArrayP))
        self:selectHighScores()
end


function HighScoresHelper2:selectHighScores()
        if (self.highScoresArrayP.n or #self.highScoresArrayP) == 0 then
            self:setSelectedHighScores(NullHighScoresSingletonFactory.getInstance())
            return
        end
        self.circularIndexUtil:next()
        local highScores = self.highScoresArrayP[self.circularIndexUtil:getIndex() + 1]
        local index = 0
        while highScores:getTotal() < 1 and index < (self.highScoresArrayP.n or #self.highScoresArrayP) do
            highScores = self.highScoresArrayP[self.circularIndexUtil:next() + 1]
            index = index + 1
        end
        self:setSelectedHighScores(highScores)
end

return HighScoresHelper2

