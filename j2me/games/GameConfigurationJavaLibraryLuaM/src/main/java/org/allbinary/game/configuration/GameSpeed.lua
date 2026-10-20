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
-- package org.allbinary.game.configuration


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GameSpeed = {}
GameSpeed.__index = GameSpeed
GameSpeed.className = "GameSpeed"

function GameSpeed.new()
    local self = setmetatable({}, GameSpeed)
    return self
end


function GameSpeed:getSpeed()
        local speedGameConfiguration = GameConfigurationCentral.getInstance().SPEED
        return (math.tointeger(speedGameConfiguration:getMaxValue() // 1) - math.tointeger(speedGameConfiguration:getValue() // 1) + 1)
end


function GameSpeed:getDelay()
        local speedGameConfiguration = GameConfigurationCentral.getInstance().SPEED
        return 19 * (math.tointeger(speedGameConfiguration:getMaxValue() // 1) - math.tointeger(speedGameConfiguration:getValue() // 1))
end


function GameSpeed.getInstance()
        return GameSpeed.instance
end

GameSpeed.instance = GameSpeed.new()

return GameSpeed

