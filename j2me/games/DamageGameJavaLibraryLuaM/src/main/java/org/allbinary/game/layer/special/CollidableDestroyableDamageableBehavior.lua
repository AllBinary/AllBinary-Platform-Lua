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
-- package org.allbinary.game.layer.special

local CollidableBaseBehavior = require("org.allbinary.game.collision.CollidableBaseBehavior")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local DamageUtil = require("org.allbinary.game.combat.damage.DamageUtil")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableDestroyableDamageableBehavior = {}
CollidableDestroyableDamageableBehavior.__index = CollidableDestroyableDamageableBehavior
CollidableDestroyableDamageableBehavior.className = "CollidableDestroyableDamageableBehavior"
setmetatable(CollidableDestroyableDamageableBehavior, {__index = CollidableBaseBehavior})

function CollidableDestroyableDamageableBehavior:_init_fields()
    self.damageUtil = DamageUtil.getInstance()
end


function CollidableDestroyableDamageableBehavior.new(collidable)
    local self = setmetatable(CollidableBaseBehavior.new(collidable), CollidableDestroyableDamageableBehavior)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CollidableDestroyableDamageableBehavior:isCollision(ownerLayer, collisionLayer)
        if ownerLayer:getGroupInterface()[1] ~= collisionLayer:getGroupInterface()[1] then
            return CollidableBaseBehavior.isCollision(self, ownerLayer, collisionLayer)
        end
        return false
end


-- throws Exception
function CollidableDestroyableDamageableBehavior:collide(ownerLayer, collidableInterfaceCompositeInterface)
        local ownerCollidableDestroyableDamageableLayer = ownerLayer
        local collidableDestroyableDamageableLayer = collidableInterfaceCompositeInterface
        ownerCollidableDestroyableDamageableLayer:damage(collidableDestroyableDamageableLayer:getDamage(0), 0)
end


function CollidableDestroyableDamageableBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        ForcedLogUtil.log("No Longer Used", self)
        return false
end


-- throws Exception
function CollidableDestroyableDamageableBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        ForcedLogUtil.log("No Longer Used", self)
end

return CollidableDestroyableDamageableBehavior

