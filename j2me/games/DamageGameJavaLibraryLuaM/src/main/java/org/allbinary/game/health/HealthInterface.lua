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
-- package org.allbinary.game.health


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
local HealthInterface = {}
HealthInterface.__index = HealthInterface
HealthInterface.className = "HealthInterface"


function HealthInterface:isAlive()
    error("abstract method isAlive")
end


function HealthInterface:damage(ahealth)
    error("abstract method damage")
end


function HealthInterface:heal(ahealth)
    error("abstract method heal")
end


function HealthInterface:healMax()
    error("abstract method healMax")
end


function HealthInterface:getMaxHealth()
    error("abstract method getMaxHealth")
end


function HealthInterface:setMaxHealth(maxHealth)
    error("abstract method setMaxHealth")
end


function HealthInterface:getHealth()
    error("abstract method getHealth")
end


function HealthInterface:addListener(healthListenerInterface)
    error("abstract method addListener")
end

return HealthInterface

