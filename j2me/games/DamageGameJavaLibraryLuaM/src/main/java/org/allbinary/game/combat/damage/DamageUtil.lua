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

local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DamageUtil = {}
DamageUtil.__index = DamageUtil
DamageUtil.className = "DamageUtil"

function DamageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.COLLIDE = "collide"
end


function DamageUtil.getInstance()
        return DamageUtil.instance
end


function DamageUtil.new()
    local self = setmetatable({}, DamageUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function DamageUtil:process(damageableInterface, damageableInterface2)
        damageableInterface:damage(damageableInterface2:getDamage(0), 0)
end


-- throws Exception
function DamageUtil:debugDamage(collidableInterfaceCompositeInterface1, collidableInterfaceCompositeInterface)
        local collidableDestroyableDamageableLayer = collidableInterfaceCompositeInterface
        local damage = collidableDestroyableDamageableLayer:getDamage(0)
        if damage > 20000 then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Collision ")
            stringBuffer:append(tostring(collidableInterfaceCompositeInterface1))
            stringBuffer:append(" with: ")
            stringBuffer:append(tostring(collidableInterfaceCompositeInterface))
            stringBuffer:append(" damage: ")
            stringBuffer:appendint(damage)
            self.logUtil:putF(tostring(stringBuffer), collidableInterfaceCompositeInterface1, self.COLLIDE)
        end
end

DamageUtil.instance = DamageUtil.new()

return DamageUtil

