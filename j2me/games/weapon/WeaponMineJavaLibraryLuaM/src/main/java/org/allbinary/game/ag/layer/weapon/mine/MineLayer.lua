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
-- package org.allbinary.game.ag.layer.weapon.mine

local DropWeaponSound = require("org.allbinary.ag.weapon.media.audio.DropWeaponSound")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local SimpleWeaponLayer = require("org.allbinary.game.layer.weapon.SimpleWeaponLayer")
local RemoteInfo = require("org.allbinary.game.multiplayer.layer.RemoteInfo")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local SecondaryPlayerQueueFactory = require("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local NoMovementFactory = require("org.allbinary.physics.movement.NoMovementFactory")
local ViewPositionBase = require("org.allbinary.view.ViewPositionBase")
local ViewPositionEventHandler = require("org.allbinary.view.event.ViewPositionEventHandler")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MineLayer = {}
MineLayer.__index = MineLayer
MineLayer.className = "MineLayer"
setmetatable(MineLayer, {__index = SimpleWeaponLayer})

function MineLayer:_init_fields()
    self.viewPositionEventHandler = ViewPositionEventHandler.getInstance()
end


function MineLayer.new(viewPosition)
    local self = setmetatable(SimpleWeaponLayer.new(MineLayer.NAME, RemoteInfo.REMOTE_INFO, -1, NoMovementFactory.getInstance():getMovmentInstance(), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().RESOURCE):getInstance(0), SimpleWeaponLayer.createDestroyed(), Rectangle.new(PointFactory.getInstance().ZERO_ZERO, 10, 10), viewPosition), MineLayer)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function MineLayer:initXYZ(x, y, z)
        self:setPosition(x + 5, y + 5, z)
        self.viewPositionEventHandler:addListener(self)
        SecondaryPlayerQueueFactory.getInstance():add(DropWeaponSound.getInstance())
end


function MineLayer:damage(damage, damageType)
        self.totalDamage = self:getInitDamage() + 1
end


function MineLayer:getDamage(damageType)
        SimpleWeaponLayer.getDamage(self, damageType)
        return self:getInitDamage()
end


function MineLayer:setDestroyed(destroyed)
        SimpleWeaponLayer.setDestroyed(self, destroyed)
        if self:isDestroyed() then
            self.viewPositionEventHandler:removeListener(self)
        end
end

MineLayer.NAME = "MineLayer"

return MineLayer

