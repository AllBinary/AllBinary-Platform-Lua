-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SensorActionFactory = {}
SensorActionFactory.__index = SensorActionFactory
SensorActionFactory.className = "SensorActionFactory"

function SensorActionFactory:_init_fields()
    self.ATTACK = SensorAction.new("Attack")
    self.EVADE = SensorAction.new("Evade")
end


function SensorActionFactory.getInstance()
        return SensorActionFactory.instance
end


function SensorActionFactory.new()
    local self = setmetatable({}, SensorActionFactory)
    self:_init_fields()
    return self
end

SensorActionFactory.instance = SensorActionFactory.new()

return SensorActionFactory

