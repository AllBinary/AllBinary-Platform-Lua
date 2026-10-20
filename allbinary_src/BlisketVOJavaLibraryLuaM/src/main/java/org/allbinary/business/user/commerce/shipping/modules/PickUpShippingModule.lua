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
-- package org.allbinary.business.user.commerce.shipping.modules

local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PickUpShippingModule = {}
PickUpShippingModule.__index = PickUpShippingModule
PickUpShippingModule.className = "PickUpShippingModule"

function PickUpShippingModule:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.name = "No Shipping (For Pickup Orders Only)"
    self.description = "This shipping method is for pickup orders only."
end


function PickUpShippingModule.new()
    local self = setmetatable({}, PickUpShippingModule)
    self:_init_fields()
    return self
end


function PickUpShippingModule:getCost(order)
        return Money.new()
end


function PickUpShippingModule:getDescription()
        return self.description
end


function PickUpShippingModule:getName()
        return self.name
end

return PickUpShippingModule

