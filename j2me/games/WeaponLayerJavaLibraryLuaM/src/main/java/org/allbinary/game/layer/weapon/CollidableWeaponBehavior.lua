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
-- package org.allbinary.game.layer.weapon

local CollidableHelperFactory = require("org.allbinary.game.collision.CollidableHelperFactory")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollisionHelper = require("org.allbinary.game.collision.CollisionHelper")
local CollisionType = require("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = require("org.allbinary.game.collision.CollisionTypeFactory")
local DamageableInterface = require("org.allbinary.game.combat.damage.DamageableInterface")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableBehavior = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local NullUtil = require("org.allbinary.logic.NullUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableWeaponBehavior = {}
CollidableWeaponBehavior.__index = CollidableWeaponBehavior
CollidableWeaponBehavior.className = "CollidableWeaponBehavior"
setmetatable(CollidableWeaponBehavior, {__index = CollidableDestroyableDamageableBehavior})

function CollidableWeaponBehavior:_init_fields()
    self.collided = false
    self.collisionHelper = nil
end


function CollidableWeaponBehavior.getNullInstance()
        if CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR == NullUtil.getInstance().NULL_OBJECT then
            CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR = CollidableWeaponBehavior.new(false)
        end
        return CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR
end


function CollidableWeaponBehavior.new(collidable)
    local self = setmetatable(CollidableDestroyableDamageableBehavior.new(collidable), CollidableWeaponBehavior)
    self:_init_fields()
        -- super(...) made self above
        self:setCollided(false)
        self:setCollidable(true)
        self.collisionHelper = CollidableHelperFactory.getInstance()
    return self
end


function CollidableWeaponBehavior:init(sourceLayerInterface)
        self:setCollided(false)
        self.collisionHelper:setOwnerLayerInterface(sourceLayerInterface)
end


function CollidableWeaponBehavior:isCollision(ownerLayer, collisionLayer)
        if self.collisionHelper:isCollidable(collisionLayer) then
            if ownerLayer:getGroupInterface()[1] ~= collisionLayer:getGroupInterface()[1] then
                return CollidableDestroyableDamageableBehavior.isCollision(self, ownerLayer, collisionLayer)
            end
        end
        return false
end


-- throws Exception
function CollidableWeaponBehavior:collide(ownerLayer, collisionLayer)
        CollidableDestroyableDamageableBehavior.collide(self, ownerLayer, collisionLayer)
        self.collided = true
end


function CollidableWeaponBehavior:isCollisionInterface(ownerLayer, collidableInterfaceCompositeInterface)
        if self.collisionHelper:isCollidable(collidableInterfaceCompositeInterface) then
            local layerInterface = collidableInterfaceCompositeInterface
            if ownerLayer:getGroupInterface()[1] ~= layerInterface:getGroupInterface()[1] then
                if self.layerCollisionUtil:isCollision(ownerLayer, layerInterface) then
                    return true
                end
            end
        end
        return false
end


-- throws Exception
function CollidableWeaponBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        local ownerDamageableInterface = ownerLayer
        local damageableInterface = collidableInterfaceCompositeInterface
        self.damageUtil:process(ownerDamageableInterface, damageableInterface)
        self.collided = true
end


function CollidableWeaponBehavior:getCollisionTypeWith(layerInterface)
        return CollisionTypeFactory.getInstance().COLLISION
end


function CollidableWeaponBehavior:isCollided()
        return self.collided
end


function CollidableWeaponBehavior:setCollided(collided)
        self.collided = collided
end

CollidableWeaponBehavior.NULL_COLLIDABLE_WEAPON_BEHAVIOR = NullUtil.getInstance().NULL_OBJECT

return CollidableWeaponBehavior

