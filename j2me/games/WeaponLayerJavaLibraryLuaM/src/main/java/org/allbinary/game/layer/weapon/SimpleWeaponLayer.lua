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

local Animation = require("org.allbinary.animation.Animation")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local NullIndexedAnimationFactory = require("org.allbinary.animation.NullIndexedAnimationFactory")
local ExplosionResources = require("org.allbinary.game.combat.damage.ExplosionResources")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local Movement = require("org.allbinary.physics.movement.Movement")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local WeaponLayer = require("org.allbinary.game.layer.weapon.WeaponLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimpleWeaponLayer = {}
SimpleWeaponLayer.__index = SimpleWeaponLayer
SimpleWeaponLayer.className = "SimpleWeaponLayer"
setmetatable(SimpleWeaponLayer, {__index = WeaponLayer})


-- throws Exception
function SimpleWeaponLayer.createDestroyed()
        return FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():getProcedural(ExplosionResources.getInstance().THIRD_EXPLOSION_RESOURCE):getInstanceAnimation(NullIndexedAnimationFactory.getFactoryInstance():getInstance(0))
end


function SimpleWeaponLayer.new(name, remoteInfo, multiPlayerType, movement, animationInterface, destroyedAnimationInterface, rectangle, viewPosition)
    local self = setmetatable(WeaponLayer.new(name, remoteInfo, multiPlayerType, movement, animationInterface, destroyedAnimationInterface, rectangle, viewPosition), SimpleWeaponLayer)
        -- super(...) made self above
        self:setCollidableInferface(CollidableWeaponBehavior.new(true))
    return self
end

return SimpleWeaponLayer

