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
-- package org.allbinary.game.ag.life


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
local LifeInterface = {}
LifeInterface.__index = LifeInterface
LifeInterface.className = "LifeInterface"


function LifeInterface:get()
    error("abstract method get")
end


function LifeInterface:set(lives)
    error("abstract method set")
end


function LifeInterface:reset()
    error("abstract method reset")
end


function LifeInterface:add(lives)
    error("abstract method add")
end


function LifeInterface:deaths(lives)
    error("abstract method deaths")
end


function LifeInterface:getMaxlives()
    error("abstract method getMaxlives")
end


function LifeInterface:isAlive()
    error("abstract method isAlive")
end

return LifeInterface

