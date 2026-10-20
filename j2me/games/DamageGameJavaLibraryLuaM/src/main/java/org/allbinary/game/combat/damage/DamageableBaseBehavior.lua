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

local DamageableInterface = require("org.allbinary.game.combat.damage.DamageableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DamageableBaseBehavior = {}
DamageableBaseBehavior.__index = DamageableBaseBehavior
DamageableBaseBehavior.className = "DamageableBaseBehavior"

function DamageableBaseBehavior.new()
    local self = setmetatable({}, DamageableBaseBehavior)
    return self
end


function DamageableBaseBehavior.getInstance()
        return DamageableBaseBehavior.instance
end


function DamageableBaseBehavior:getName()
        return getmetatable(self).className
end


-- throws Exception
function DamageableBaseBehavior:damage(damage, damageType)
end


-- throws Exception
function DamageableBaseBehavior:getDamage(damageType)
        return 6000
end

DamageableBaseBehavior.instance = DamageableBaseBehavior.new()

return DamageableBaseBehavior

