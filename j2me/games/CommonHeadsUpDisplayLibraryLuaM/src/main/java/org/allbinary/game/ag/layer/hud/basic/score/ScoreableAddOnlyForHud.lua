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
-- package org.allbinary.game.ag.layer.hud.basic.score

local Scoreable = require("org.allbinary.game.score.Scoreable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ScoreableAddOnlyForHud = {}
ScoreableAddOnlyForHud.__index = ScoreableAddOnlyForHud
ScoreableAddOnlyForHud.className = "ScoreableAddOnlyForHud"
setmetatable(ScoreableAddOnlyForHud, {__index = Scoreable})

function ScoreableAddOnlyForHud:_init_fields()
    self.scoreHudWidget = nil
end


function ScoreableAddOnlyForHud.new(scoreVectorGraphic)
    local self = setmetatable(Scoreable.new(0), ScoreableAddOnlyForHud)
    self:_init_fields()
        -- super(...) made self above
        self.scoreHudWidget = scoreVectorGraphic
        self:getScoreHudWidget():set(0)
    return self
end


function ScoreableAddOnlyForHud:removePoints(points)
end


function ScoreableAddOnlyForHud:addPoints(points)
        Scoreable.addPoints(self, points)
        self:getScoreHudWidget():add(points)
end


function ScoreableAddOnlyForHud:getScoreHudWidget()
        return self.scoreHudWidget
end

return ScoreableAddOnlyForHud

