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
-- package org.allbinary.game.ag.layer.pickup.health

local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local CountedPickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local IconLayerFactory = require("org.allbinary.game.layer.pickup.IconLayerFactory")
local PickedUpLayerInterfaceFactory = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactory")
local PickedUpLayerInterfaceFactoryInterface = require("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickedUpLayerTypeFactory = require("org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory")
local PickupProcessorInterface = require("org.allbinary.game.layer.pickup.PickupProcessorInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealPickedUpLayerInterfaceFactory = {}
HealPickedUpLayerInterfaceFactory.__index = HealPickedUpLayerInterfaceFactory
HealPickedUpLayerInterfaceFactory.className = "HealPickedUpLayerInterfaceFactory"
setmetatable(HealPickedUpLayerInterfaceFactory, {__index = PickedUpLayerInterfaceFactory})

function HealPickedUpLayerInterfaceFactory:_init_fields()
    self.pool = HealLayerCircularStaticPool.new(HealLayerFactory.new(), 1)
end


-- throws Exception
function HealPickedUpLayerInterfaceFactory.init()
        HealPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = HealPickedUpLayerInterfaceFactory.new()
end


function HealPickedUpLayerInterfaceFactory.new()
    local self = setmetatable(PickedUpLayerInterfaceFactory.new(PickedUpLayerTypeFactory.getInstance().HEAL, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(HealthResources.getInstance().RESOURCE):getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(HealthResources.getInstance().RESOURCE):getInstance(0)), HealPickedUpLayerInterfaceFactory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function HealPickedUpLayerInterfaceFactory:getTotal()
        return 1
end


function HealPickedUpLayerInterfaceFactory.getInstance()
        return HealPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface
end


-- throws Exception
function HealPickedUpLayerInterfaceFactory:process(sourceLayerInterface)
        self.pool:visit(sourceLayerInterface)
end

HealPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY

return HealPickedUpLayerInterfaceFactory

