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

local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollisionType = require("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = require("org.allbinary.game.collision.CollisionTypeFactory")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local PickedUpLayerInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local CollidableDestroyableDamageableBehavior = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableCharacterNoDamageBehavior = {}
CollidableCharacterNoDamageBehavior.__index = CollidableCharacterNoDamageBehavior
CollidableCharacterNoDamageBehavior.className = "CollidableCharacterNoDamageBehavior"
setmetatable(CollidableCharacterNoDamageBehavior, {__index = CollidableDestroyableDamageableBehavior})


function CollidableCharacterNoDamageBehavior.new(collidable)
    local self = setmetatable(CollidableDestroyableDamageableBehavior.new(collidable), CollidableCharacterNoDamageBehavior)
        -- super(...) made self above
    return self
end


-- throws Exception
function CollidableCharacterNoDamageBehavior:collide(ownerLayer, collidableInterfaceCompositeInterface)
        local collisionTypeFactory = CollisionTypeFactory.getInstance()
        local collisionType = collidableInterfaceCompositeInterface:getCollidableInferface():getCollisionTypeWith(ownerLayer)
        if collisionType == collisionTypeFactory.PICKUP then
            local collidableDestroyableDamageableLayer = ownerLayer
            collidableDestroyableDamageableLayer:getPickupBehavior():doPickupLayer(collidableInterfaceCompositeInterface)
        else
        end
end


-- throws Exception
function CollidableCharacterNoDamageBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, self)
end

return CollidableCharacterNoDamageBehavior

