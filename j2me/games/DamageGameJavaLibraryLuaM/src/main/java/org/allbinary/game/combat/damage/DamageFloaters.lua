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
-- package org.allbinary.game.combat.damage

local Paintable = require("org.allbinary.graphics.paint.Paintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DamageFloaters = {}
DamageFloaters.__index = DamageFloaters
DamageFloaters.className = "DamageFloaters"
setmetatable(DamageFloaters, {__index = Paintable})

function DamageFloaters.new()
    local self = setmetatable(Paintable.new(), DamageFloaters)
    return self
end


function DamageFloaters.getInstance()
        return DamageFloaters.SINGLETON
end


function DamageFloaters:add(damage)
end

DamageFloaters.SINGLETON = DamageFloaters.new()

return DamageFloaters

