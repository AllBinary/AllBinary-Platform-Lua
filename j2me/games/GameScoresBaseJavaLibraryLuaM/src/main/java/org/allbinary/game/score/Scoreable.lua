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

local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Scoreable = {}
Scoreable.__index = Scoreable
Scoreable.className = "Scoreable"

function Scoreable:_init_fields()
    self.points = nil
end


function Scoreable.new(points)
    local self = setmetatable({}, Scoreable)
    self:_init_fields()
        self.points = points
    return self
end


function Scoreable:addPoints(points)
        self.points = self.points + (points)
end


function Scoreable:removePoints(points)
        self.points = self.points - (points)
end


function Scoreable:setPoints(points)
        self.points = points
end


function Scoreable:getPoints()
        return self.points
end

Scoreable.ID = SmallIntegerSingletonFactory.getInstance():getAt(3)

return Scoreable

