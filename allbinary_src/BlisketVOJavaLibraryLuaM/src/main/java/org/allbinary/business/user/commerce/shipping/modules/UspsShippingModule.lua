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

local UspsShippingModule = {}
UspsShippingModule.__index = UspsShippingModule
UspsShippingModule.className = "UspsShippingModule"

function UspsShippingModule:_init_fields()
    self.name = "USPS"
    self.description = "Snail Mail"
end


function UspsShippingModule.new()
    local self = setmetatable({}, UspsShippingModule)
    self:_init_fields()
    return self
end


function UspsShippingModule:getCost(order)
        return Money.new()
end


function UspsShippingModule:getDescription()
        return self.description
end


function UspsShippingModule:getName()
        return self.name
end

return UspsShippingModule

