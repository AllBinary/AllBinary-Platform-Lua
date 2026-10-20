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

local AllBinaryLayerCircularPool = require("org.allbinary.layer.AllBinaryLayerCircularPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickupLayerCircularStaticPool = {}
PickupLayerCircularStaticPool.__index = PickupLayerCircularStaticPool
PickupLayerCircularStaticPool.className = "PickupLayerCircularStaticPool"
setmetatable(PickupLayerCircularStaticPool, {__index = AllBinaryLayerCircularPool})


function PickupLayerCircularStaticPool.new()
    local self = setmetatable(AllBinaryLayerCircularPool.new(), PickupLayerCircularStaticPool)
    return self
end


function PickupLayerCircularStaticPool.getInstance()
        return PickupLayerCircularStaticPool.SINGLETON
end


-- throws Exception
function PickupLayerCircularStaticPool:getInstanceXYZ(pickedUpLayerInterfaceFactoryInterface, x, y, z)
        local pickupLayer = self:getNextInstance()
        pickupLayer:initXYZ(x, y, z)
        pickupLayer:init(pickedUpLayerInterfaceFactoryInterface, pickedUpLayerInterfaceFactoryInterface:getAnimationInterface())
        return pickupLayer
end

PickupLayerCircularStaticPool.SINGLETON = PickupLayerCircularStaticPool.new()

return PickupLayerCircularStaticPool

