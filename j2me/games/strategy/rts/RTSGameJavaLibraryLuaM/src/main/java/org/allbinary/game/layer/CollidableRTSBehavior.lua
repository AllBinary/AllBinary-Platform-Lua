-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local CollisionType = require("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = require("org.allbinary.game.collision.CollisionTypeFactory")
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

local CollidableRTSBehavior = {}
CollidableRTSBehavior.__index = CollidableRTSBehavior
CollidableRTSBehavior.className = "CollidableRTSBehavior"
setmetatable(CollidableRTSBehavior, {__index = CollidableDestroyableDamageableBehavior})


function CollidableRTSBehavior.new(collidable)
    local self = setmetatable(CollidableDestroyableDamageableBehavior.new(collidable), CollidableRTSBehavior)
        -- super(...) made self above
    return self
end


function CollidableRTSBehavior:isCollision(ownerLayer, collidableInterfaceCompositeInterface)
        local collisionTypeFactory = CollisionTypeFactory.getInstance()
        local collisionType = collidableInterfaceCompositeInterface:getCollidableInferface():getCollisionTypeWith(ownerLayer)
        if collisionType == collisionTypeFactory.PICKUP then
        elseif collisionType == collisionTypeFactory.COLLISION then
            return CollidableDestroyableDamageableBehavior.isCollision(self, ownerLayer, collidableInterfaceCompositeInterface)
        else
            if collidableInterfaceCompositeInterface:getX2() <= ownerLayer:getXP() or collidableInterfaceCompositeInterface:getY2() <= ownerLayer:getYP() or collidableInterfaceCompositeInterface:getYP() >= ownerLayer:getY2() or collidableInterfaceCompositeInterface:getXP() >= ownerLayer:getX2() then
                return false
            else
                return true
            end
        end
        return false
end


-- throws Exception
function CollidableRTSBehavior:collide(ownerLayer, collidableInterfaceCompositeInterface)
        local collisionTypeFactory = CollisionTypeFactory.getInstance()
        local collisionType = collidableInterfaceCompositeInterface:getCollidableInferface():getCollisionTypeWith(ownerLayer)
        if collisionType == collisionTypeFactory.PICKUP then
        elseif collisionType == collisionTypeFactory.COLLISION then
            CollidableDestroyableDamageableBehavior.collide(self, ownerLayer, collidableInterfaceCompositeInterface)
        else
            self:collideNone(ownerLayer, collidableInterfaceCompositeInterface)
        end
end


-- throws Exception
function CollidableRTSBehavior:collideNone(ownerLayer, collidableInterface)
end

return CollidableRTSBehavior

