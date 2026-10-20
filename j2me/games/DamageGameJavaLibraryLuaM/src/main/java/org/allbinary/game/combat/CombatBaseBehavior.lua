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
-- package org.allbinary.game.combat

local DamageableBaseBehavior = require("org.allbinary.game.combat.damage.DamageableBaseBehavior")
local DestroyableBaseBehavior = require("org.allbinary.game.combat.destroy.DestroyableBaseBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CombatBaseBehavior = {}
CombatBaseBehavior.__index = CombatBaseBehavior
CombatBaseBehavior.className = "CombatBaseBehavior"

function CombatBaseBehavior:_init_fields()
    self.damageableBaseBehavior = nil
    self.destroyableBaseBehavior = nil
    self.readyForExplosion = false
end


function CombatBaseBehavior.new(damageableBaseBehavior, destroyableBaseBehavior)
    local self = setmetatable({}, CombatBaseBehavior)
    self:_init_fields()
        self.damageableBaseBehavior = damageableBaseBehavior
        self.destroyableBaseBehavior = destroyableBaseBehavior
    return self
end


function CombatBaseBehavior:getDamageableBaseBehavior()
        return self.damageableBaseBehavior
end


function CombatBaseBehavior:getDestroyableBaseBehavior()
        return self.destroyableBaseBehavior
end


function CombatBaseBehavior:isReadyForExplosion()
        return self.readyForExplosion
end


function CombatBaseBehavior:setReadyForExplosion(readyForExplosion)
        self.readyForExplosion = readyForExplosion
end

CombatBaseBehavior.NULL_COMBAT_BEHAVIOR = CombatBaseBehavior.new(DamageableBaseBehavior.getInstance(), DestroyableBaseBehavior.getInstance())

return CombatBaseBehavior

