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

local PickupBehavior = {}
package.loaded["org.allbinary.game.layer.pickup.PickupBehavior"] = PickupBehavior

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HealthInterfaceCompositeInterface = java_lazy("org.allbinary.game.health.HealthInterfaceCompositeInterface")
local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableDestroyableDamageableLayer = java_lazy("org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer")
local CountedLayerInterfaceFactoryPart = java_lazy("org.allbinary.game.part.CountedLayerInterfaceFactoryPart")
local PartInterface = java_lazy("org.allbinary.game.part.PartInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local PickupBehaviorInterface = require("org.allbinary.game.layer.pickup.PickupBehaviorInterface")
local CountedPickedUpLayerInterfaceFactory = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactory")
local CountedPickedUpLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.pickup.CountedPickedUpLayerInterfaceFactoryInterface")
local PickedUpLayerInterface = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerInterface")
local PickedUpLayerInterfaceFactoryInterface = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerInterfaceFactoryInterface")
local PickedUpLayerType = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerType")
local PickedUpLayerTypeFactory = java_lazy("org.allbinary.game.layer.pickup.PickedUpLayerTypeFactory")
local PickupProcessorInterface = java_lazy("org.allbinary.game.layer.pickup.PickupProcessorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PickupBehavior is declared before the requires
PickupBehavior.__index = PickupBehavior
PickupBehavior.className = "PickupBehavior"
PickupBehavior.javaClassName = "org.allbinary.game.layer.pickup.PickupBehavior"
PickupBehavior.java_implements = " PickupBehaviorInterface "
PickupBehavior.java_interfaces = function() return {PickupBehaviorInterface} end

function PickupBehavior:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.countedIndex == nil then self.countedIndex = nil end
    if self.ownerLayerInterface == nil then self.ownerLayerInterface = nil end
end


function PickupBehavior.getNullInstance()
        if PickupBehavior.NULL_PICKUP_BEHAVIOR == NullUtil.getInstance().NULL_OBJECT then
            PickupBehavior.NULL_PICKUP_BEHAVIOR = PickupBehavior.new(CollidableCompositeLayer.getNullInstance(), 0)
        end
        return PickupBehavior.NULL_PICKUP_BEHAVIOR
end


function PickupBehavior._jinit(self, ownerLayerInterface, countedIndex)
    PickupBehavior._init_fields(self)
        self.ownerLayerInterface = ownerLayerInterface
        self.countedIndex = countedIndex
    return self
end

function PickupBehavior.new(...)
    local self = setmetatable({}, PickupBehavior)
    PickupBehavior._jinit(self, ...)
    return self
end


function PickupBehavior:doPickup(pickupProcessorInterface)
        local try_ok, try_error, try_value = pcall(function()
            local healthInterfaceCompositeInterface = self.ownerLayerInterface
            if healthInterfaceCompositeInterface:getHealthInterface():isAlive() then
                pickupProcessorInterface:process(self.ownerLayerInterface)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, "doPickup", e)
        end
end


function PickupBehavior:doPickupLayer(pickupLayerInterface)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

