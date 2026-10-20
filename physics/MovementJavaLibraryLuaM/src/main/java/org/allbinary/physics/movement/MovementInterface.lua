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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local MovementInterface = {}
MovementInterface.__index = MovementInterface
MovementInterface.className = "MovementInterface"


function MovementInterface:init(speedBasicDecimal, angle, otherAngle)
    error("abstract method init")
end


-- throws Exception
function MovementInterface:process(layer)
    error("abstract method process")
end


function MovementInterface:stop()
    error("abstract method stop")
end

return MovementInterface

