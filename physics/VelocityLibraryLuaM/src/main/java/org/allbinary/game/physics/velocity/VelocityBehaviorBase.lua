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
-- package org.allbinary.game.physics.velocity


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VelocityBehaviorBase = {}
VelocityBehaviorBase.__index = VelocityBehaviorBase
VelocityBehaviorBase.className = "VelocityBehaviorBase"

function VelocityBehaviorBase.new()
    local self = setmetatable({}, VelocityBehaviorBase)
    return self
end


function VelocityBehaviorBase:reduce(velocityProperties, nominator, denominator)
end


function VelocityBehaviorBase:reduceX(velocityProperties, nominator, denominator)
end


function VelocityBehaviorBase:reduceY(velocityProperties, nominator, denominator)
end

return VelocityBehaviorBase

