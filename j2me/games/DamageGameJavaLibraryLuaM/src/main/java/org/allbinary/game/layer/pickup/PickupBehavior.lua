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

local HealthInterfaceCompositeInterface = require("org.allbinary.game.health.HealthInterfaceCompositeInterface")
local CollidableCompositeLayer = require("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableLayer = require("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local CountedLayerInterfaceFactoryPart = require("org.allbinary.game.part.CountedLayerInterfaceFactoryPart")
local PartInterface = require("org.allbinary.game.part.PartInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PickupBehaviorInterface = require("org.allbinary.game.layer.pickup.PickupBehaviorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickupBehavior = {}
PickupBehavior.__index = PickupBehavior
PickupBehavior.className = "PickupBehavior"

function PickupBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.countedIndex = nil
    self.ownerLayerInterface = nil
end


function PickupBehavior.getNullInstance()
        if PickupBehavior.NULL_PICKUP_BEHAVIOR == NullUtil.getInstance().NULL_OBJECT then
            PickupBehavior.NULL_PICKUP_BEHAVIOR = PickupBehavior.new(CollidableCompositeLayer.getNullInstance(), 0)
        end
        return PickupBehavior.NULL_PICKUP_BEHAVIOR
end


function PickupBehavior.new(ownerLayerInterface, countedIndex)
    local self = setmetatable({}, PickupBehavior)
    self:_init_fields()
        self.ownerLayerInterface = ownerLayerInterface
        self.countedIndex = countedIndex
    return self
end


function PickupBehavior:doPickup(pickupProcessorInterface)
        local try_ok, try_error = pcall(function()
            local healthInterfaceCompositeInterface = self.ownerLayerInterface
            if healthInterfaceCompositeInterface:getHealthInterface():isAlive() then
                pickupProcessorInterface:process(self.ownerLayerInterface)
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "doPickup", e)
        end
end


function PickupBehavior:doPickupLayer(pickupLayerInterface)
        local try_ok, try_error = pcall(function()
            local pickedUpLayerInterfaceFactoryInterface = pickupLayerInterface:getPickedUpLayerInterfaceFactoryInterface()
            local pickedUpLayerType = pickedUpLayerInterfaceFactoryInterface:getPickedUpLayerType()
            local pickedUpLayerTypeFactory = PickedUpLayerTypeFactory.getInstance()
            if pickedUpLayerType == pickedUpLayerTypeFactory.BEAM or pickedUpLayerType == pickedUpLayerTypeFactory.MINE or pickedUpLayerType == pickedUpLayerTypeFactory.PROJECTILE or pickedUpLayerType == pickedUpLayerTypeFactory.ENHANCEMENT then
                self:add(pickedUpLayerInterfaceFactoryInterface)
            elseif pickedUpLayerInterfaceFactoryInterface:getPickedUpLayerType() == pickedUpLayerTypeFactory.PART then
                local collidableDestroyableDamageableLayer = self.ownerLayerInterface
                collidableDestroyableDamageableLayer:addPart(pickedUpLayerInterfaceFactoryInterface)
            elseif pickedUpLayerType == pickedUpLayerTypeFactory.NONE then
            else
                local pickupProcessorInterface = pickedUpLayerInterfaceFactoryInterface
                self:doPickup(pickupProcessorInterface)
            end
            pickupLayerInterface:setPickedUp()
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, "doPickup", e)
        end
end


function PickupBehavior:add(countedPickedUpLayerInterfaceFactoryInterface)
        local partIndex = countedPickedUpLayerInterfaceFactoryInterface:getId() + self.countedIndex
        self:addAt(countedPickedUpLayerInterfaceFactoryInterface, partIndex)
end


function PickupBehavior:addAt(countedPickedUpLayerInterfaceFactoryInterface, partIndex)
        local collidableDestroyableDamageableLayer = self.ownerLayerInterface
        local countedLayerInterfaceFactory = collidableDestroyableDamageableLayer:getPartInterfaceArray()[partIndex + 1]
        countedLayerInterfaceFactory:setTotal(countedLayerInterfaceFactory:getTotal() + countedPickedUpLayerInterfaceFactoryInterface:getTotal())
end


function PickupBehavior:getFirstAvailableCountedLayerInterfaceFactory(pickedUpLayerTypeArray)
        local collidableDestroyableDamageableLayer = self.ownerLayerInterface
        local partInterfaceArray = collidableDestroyableDamageableLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local nextCountedLayerInterfaceFactory = nil
        local countedPickedUpLayerInterfaceFactory = nil
        for index = self.countedIndex, size - 1 do
            nextCountedLayerInterfaceFactory = collidableDestroyableDamageableLayer:getPartInterfaceArray()[index + 1]
            countedPickedUpLayerInterfaceFactory = nextCountedLayerInterfaceFactory:getCountedPickedUpLayerInterfaceFactory()
            do
                local index2 = (pickedUpLayerTypeArray.n or #pickedUpLayerTypeArray)
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                if countedPickedUpLayerInterfaceFactory:getPickedUpLayerType() == pickedUpLayerTypeArray[index2 + 1] then
                    if nextCountedLayerInterfaceFactory:getTotal() > 0 then
                        return nextCountedLayerInterfaceFactory
                    end
                end
                end
            end
        end
        return CountedLayerInterfaceFactoryPart.NULL_COUNTED_LAYER_INTERFACE_FACTORY
end


-- throws Exception
function PickupBehavior:getCountedLayerInterfaceFactoryForSlot(slotIndex)
        local currentSlot = 0
        local collidableDestroyableDamageableLayer = self.ownerLayerInterface
        local partInterfaceArray = collidableDestroyableDamageableLayer:getPartInterfaceArray()
        local size = (partInterfaceArray.n or #partInterfaceArray)
        local nextCountedLayerInterfaceFactory = nil
        for index = self.countedIndex, size - 1 do
            nextCountedLayerInterfaceFactory = collidableDestroyableDamageableLayer:getPartInterfaceArray()[index + 1]
            if nextCountedLayerInterfaceFactory:getTotal() > 0 then
                if currentSlot == slotIndex then
                    return nextCountedLayerInterfaceFactory
                else
                    currentSlot = currentSlot + 1
                end
            end
        end
        return CountedLayerInterfaceFactoryPart.NULL_COUNTED_LAYER_INTERFACE_FACTORY
end


function PickupBehavior:getCountedIndex()
        return self.countedIndex
end

PickupBehavior.NULL_PICKUP_BEHAVIOR = NullUtil.getInstance().NULL_OBJECT

return PickupBehavior

