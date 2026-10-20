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
-- package org.allbinary.physics.movement

local AllBinaryGameLayer = require("org.allbinary.game.layer.AllBinaryGameLayer")
local BasicDecimal = require("org.allbinary.logic.math.BasicDecimal")
local MovementInterface = require("org.allbinary.physics.movement.MovementInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Movement = {}
Movement.__index = Movement
Movement.className = "Movement"


function Movement.new()
    local self = setmetatable({}, Movement)
    return self
end


function Movement:init(speedBasicDecimal, angle, otherAngle)
end


-- throws Exception
function Movement:process(layer)
end


function Movement:stop()
end

return Movement

