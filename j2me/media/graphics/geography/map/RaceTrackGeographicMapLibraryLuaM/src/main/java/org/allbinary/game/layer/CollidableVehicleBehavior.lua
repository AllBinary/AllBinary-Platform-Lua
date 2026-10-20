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
-- package org.allbinary.game.layer

local PickedUpLayerInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterface")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local CollidableInterfaceCompositeInterface = require("org.allbinary.game.collision.CollidableInterfaceCompositeInterface")
local CollisionType = require("org.allbinary.game.collision.CollisionType")
local CollisionTypeFactory = require("org.allbinary.game.collision.CollisionTypeFactory")
local CollidableDestroyableDamageableBehavior = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableBehavior")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CollidableVehicleBehavior = {}
CollidableVehicleBehavior.__index = CollidableVehicleBehavior
CollidableVehicleBehavior.className = "CollidableVehicleBehavior"
setmetatable(CollidableVehicleBehavior, {__index = CollidableDestroyableDamageableBehavior})

function CollidableVehicleBehavior:_init_fields()
    self.totalImpactVelocity = 0
    self.halfImpactVelocityX = 0
    self.halfImpactVelocityY = 0
end


function CollidableVehicleBehavior.new(collidable)
    local self = setmetatable(CollidableDestroyableDamageableBehavior.new(collidable), CollidableVehicleBehavior)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function CollidableVehicleBehavior:collide(ownerLayer, collidableInterfaceCompositeInterface)
        local collisionTypeFactory = CollisionTypeFactory.getInstance()
        local collisionType = collidableInterfaceCompositeInterface:getCollidableInferface():getCollisionTypeWith(ownerLayer)
        if collisionType == collisionTypeFactory.PICKUP then
            local collidableDestroyableDamageableLayer = (ownerLayer)
            collidableDestroyableDamageableLayer:getPickupBehavior():doPickupLayer(collidableInterfaceCompositeInterface)
        elseif collisionType == collisionTypeFactory.COLLISION then
            CollidableDestroyableDamageableBehavior.collide(self, ownerLayer, collidableInterfaceCompositeInterface)
        else
            self:collideVehicle(ownerLayer, collidableInterfaceCompositeInterface)
        end
end


function CollidableVehicleBehavior:collideInterface(ownerLayer, collidableInterfaceCompositeInterface)
        ForcedLogUtil.log("Don't Use Interface Version It Is Slower", self)
end


function CollidableVehicleBehavior:collideVehicle(ownerLayer, vehiclePropertiesCompositeInterface)
        local ownerVehicleLayerInterface = (ownerLayer)
        local ownerVehicleProperties = ownerVehicleLayerInterface:getVehicleProperties()
        local vehicleProperties = vehiclePropertiesCompositeInterface:getVehicleProperties()
        local impactVelocityX = ownerVehicleProperties:getVelocityProperties():getVelocityXBasicDecimalP():getUnscaled() - vehicleProperties:getVelocityProperties():getVelocityXBasicDecimalP():getUnscaled()
        local impactVelocityY = ownerVehicleProperties:getVelocityProperties():getVelocityYBasicDecimalP():getUnscaled() - vehicleProperties:getVelocityProperties():getVelocityYBasicDecimalP():getUnscaled()
        if impactVelocityX ~= 0 then
            self.halfImpactVelocityX = (((impactVelocityX) // (1 << (1))))
            ownerVehicleProperties:getVelocityProperties():getVelocityXBasicDecimalP():addlong(self.halfImpactVelocityX)
            vehicleProperties:getVelocityProperties():getVelocityXBasicDecimalP():addlong(self.halfImpactVelocityX)
        else
        end
        if impactVelocityY ~= 0 then
            self.halfImpactVelocityY = (((impactVelocityY) // (1 << (1))))
            ownerVehicleProperties:getVelocityProperties():getVelocityYBasicDecimalP():addlong(self.halfImpactVelocityY)
            vehicleProperties:getVelocityProperties():getVelocityXBasicDecimalP():addlong(self.halfImpactVelocityY)
        else
        end
        self:collideFriction(ownerVehicleLayerInterface)
        self:collideFriction(vehiclePropertiesCompositeInterface)
        self.totalImpactVelocity = impactVelocityX + impactVelocityY
end


function CollidableVehicleBehavior:collideFriction(vehiclePropertiesCompositeInterface)
        local vehicleFrictionProperties = vehiclePropertiesCompositeInterface:getVehicleProperties():getVehicleFrictionProperties()
        vehiclePropertiesCompositeInterface:getVehicleProperties():getVehicleFrictionProperties():friction(vehiclePropertiesCompositeInterface:getVehicleProperties():getVelocityProperties(), vehicleFrictionProperties:getCrashFrictionNominator())
end

return CollidableVehicleBehavior

