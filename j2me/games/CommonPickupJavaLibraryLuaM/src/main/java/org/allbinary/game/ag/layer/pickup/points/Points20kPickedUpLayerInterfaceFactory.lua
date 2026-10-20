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
-- package org.allbinary.game.ag.layer.pickup.points

local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
local GameConfigurationUtil = require("org.allbinary.game.configuration.GameConfigurationUtil")
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

local Points20kPickedUpLayerInterfaceFactory = {}
Points20kPickedUpLayerInterfaceFactory.__index = Points20kPickedUpLayerInterfaceFactory
Points20kPickedUpLayerInterfaceFactory.className = "Points20kPickedUpLayerInterfaceFactory"
setmetatable(Points20kPickedUpLayerInterfaceFactory, {__index = PickedUpLayerInterfaceFactory})

function Points20kPickedUpLayerInterfaceFactory:_init_fields()
    self.pool = PointsLayerCircularStaticPool.new(PointsLayerFactory.new(GameConfigurationUtil.getInstance():getCompetitionValue() * 20000), 1)
end


-- throws Exception
function Points20kPickedUpLayerInterfaceFactory.init()
        Points20kPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = Points20kPickedUpLayerInterfaceFactory.new()
end


function Points20kPickedUpLayerInterfaceFactory.new()
    local self = setmetatable(PickedUpLayerInterfaceFactory.new(PickedUpLayerTypeFactory.getInstance().POINTS, IconLayerFactory.getInstance(FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(PointsResources.getInstance().RESOURCE_2):getInstance(0), 10, 10), FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance():get(PointsResources.getInstance().RESOURCE_2):getInstance(0)), Points20kPickedUpLayerInterfaceFactory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function Points20kPickedUpLayerInterfaceFactory:getTotal()
        return 1
end


function Points20kPickedUpLayerInterfaceFactory.getInstance()
        return Points20kPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface
end


-- throws Exception
function Points20kPickedUpLayerInterfaceFactory:process(sourceLayerInterface)
        self.pool:visit(sourceLayerInterface)
end

Points20kPickedUpLayerInterfaceFactory.pickedUpLayerInterfaceFactoryInterface = CountedPickedUpLayerInterfaceFactory.NULL_COUNTED_PICKUP_LAYER_FACTORY

return Points20kPickedUpLayerInterfaceFactory

