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
-- package org.allbinary.game.layer.pickup

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
local CollidableAlwaysPickupNeverCollideBehaviorFactory = require("org.allbinary.game.collision.CollidableAlwaysPickupNeverCollideBehaviorFactory")
local DestroyedLayerProcessor = require("org.allbinary.game.combat.destroy.DestroyedLayerProcessor")
local BasicGroupFactory = require("org.allbinary.game.identification.BasicGroupFactory")
local MultiPlayerGameLayer = require("org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local OpenGLSurfaceChangedInterface = require("org.allbinary.image.opengles.OpenGLSurfaceChangedInterface")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local PickedUpLayerInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterface")
local PickupableInterface = require("org.allbinary.game.layer.pickup.PickupableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickupLayer = {}
PickupLayer.__index = PickupLayer
PickupLayer.className = "PickupLayer"
setmetatable(PickupLayer, {__index = MultiPlayerGameLayer})

function PickupLayer:_init_fields()
    self.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY
    self.destroyed = false
    self.animationInterface = NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function PickupLayer.new(name, remoteInfo, total, pickedUpLayerInterfaceFactoryInterface, animationInterface, rectangle, viewPosition)
    local self = setmetatable(MultiPlayerGameLayer.new(remoteInfo, BasicGroupFactory.getInstance().NONE_ARRAY, name, rectangle, viewPosition), PickupLayer)
    self:_init_fields()
        -- super(...) made self above
        self:setCollidableInferface(CollidableAlwaysPickupNeverCollideBehaviorFactory.getInstance():createBehavior())
        self:setLayerWidth(10)
        self:setLayerHeight(10)
        self:init(pickedUpLayerInterfaceFactoryInterface, animationInterface)
    return self
end


function PickupLayer:init(pickedUpLayerInterfaceFactoryInterface, animationInterface)
        self.pickedUpLayerInterfaceFactoryInterface = pickedUpLayerInterfaceFactoryInterface
        self.animationInterface = animationInterface
        self:setDestroyed(false)
end


function PickupLayer:initXYZ(x, y, z)
        self:setPosition(x, y, z)
end


function PickupLayer:paint(graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.animationInterface:paintXY(graphics, viewX, viewY)
end


function PickupLayer:paintThreed(graphics)
        local viewPosition = self:getViewPosition()
        local viewX = viewPosition:getX()
        local viewY = viewPosition:getY()
        self.animationInterface:paintThreedXYZ(graphics, viewX, viewY, 3)
end


function PickupLayer:getPickedUpLayerInterfaceFactoryInterface()
        return self.pickedUpLayerInterfaceFactoryInterface
end


function PickupLayer:setPickedUp()
        self:setDestroyed(true)
end


function PickupLayer:isDestroyed()
        return self.destroyed
end


function PickupLayer:setDestroyed(destroyed)
        self.destroyed = destroyed
        if self:isDestroyed() then
            DestroyedLayerProcessor.getInstance():add(self)
        end
end


function PickupLayer:damage(damage, damageType)
end


function PickupLayer:getDamage(damageType)
        return 0
end


-- throws Exception
function PickupLayer:set(gl)
        local openGLSurfaceChangedInterface = self.animationInterface
        openGLSurfaceChangedInterface:set(gl)
end

return PickupLayer

