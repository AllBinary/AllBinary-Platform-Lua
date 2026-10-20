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

local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local WeaponProperties = require("org.allbinary.game.combat.weapon.WeaponProperties")
local CountedPickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local IconLayerFactory = require("org.allbinary.game.layer.pickup.IconLayerFactory")
local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickedUpLayerTypeFactory = require("org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory")
local WeaponLayerCircularPool = require("org.allbinary.game.layer.weapon.WeaponLayerCircularPool")
local ScoreableInterface = require("org.allbinary.game.score.ScoreableInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local SmallIntegerSingletonFactory = require("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MineCountedPickedUpLayerInterfaceFactory = {}
MineCountedPickedUpLayerInterfaceFactory.__index = MineCountedPickedUpLayerInterfaceFactory
MineCountedPickedUpLayerInterfaceFactory.className = "MineCountedPickedUpLayerInterfaceFactory"
setmetatable(MineCountedPickedUpLayerInterfaceFactory, {__index = CountedPickedUpLayerInterfaceFactory})

function MineCountedPickedUpLayerInterfaceFactory:_init_fields()
    self.weaponLayerCircularStaticPool = MineLayerCircularStaticPool.getInstance()
    self.weaponProperties = WeaponProperties.new(-1, -1, 0, 8000, 10)
    self.smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
end


-- throws Exception
function MineCountedPickedUpLayerInterfaceFactory.init()
        MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = MineCountedPickedUpLayerInterfaceFactory.new()
end


function MineCountedPickedUpLayerInterfaceFactory.new()
    local self = setmetatable(CountedPickedUpLayerInterfaceFactory.new(PickedUpLayerTypeFactory.getInstance().MINE, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().DROP_ICON_RESOURCE):getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(MineWeaponResources.getInstance().DROP_RESOURCE):getInstance(0)), MineCountedPickedUpLayerInterfaceFactory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function MineCountedPickedUpLayerInterfaceFactory.getInstance()
        return MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface
end


function MineCountedPickedUpLayerInterfaceFactory:getTotal()
        return 3
end


-- throws Exception
function MineCountedPickedUpLayerInterfaceFactory:getNextInstance(hashtable, x, y, z)
        local sourceLayerInterface = hashtable:get(self.smallIntegerSingletonFactory:getAt(0))
        local angle = hashtable:get(self.smallIntegerSingletonFactory:getAt(1))
        local scoreableInterface = sourceLayerInterface
        return self.weaponLayerCircularStaticPool:getInstanceWeaponLayer(sourceLayerInterface, x, y, z, java_int(math.tointeger(angle // 1)), 0, self.weaponProperties, scoreableInterface)
end

MineCountedPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY

return MineCountedPickedUpLayerInterfaceFactory

