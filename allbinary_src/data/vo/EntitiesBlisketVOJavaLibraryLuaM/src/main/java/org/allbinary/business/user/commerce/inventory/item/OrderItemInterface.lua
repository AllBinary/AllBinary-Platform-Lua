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
-- package org.allbinary.business.user.commerce.inventory.item

local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local OrderItemInterface = {}
OrderItemInterface.__index = OrderItemInterface
OrderItemInterface.className = "OrderItemInterface"
setmetatable(OrderItemInterface, {__index = ItemInterface})


function OrderItemInterface:setGroup(value)
    error("abstract method setGroup")
end


function OrderItemInterface:setTax(value)
    error("abstract method setTax")
end


function OrderItemInterface:setShippingType(value)
    error("abstract method setShippingType")
end


function OrderItemInterface:setShippingCost(value)
    error("abstract method setShippingCost")
end


function OrderItemInterface:setShippingAddress(value)
    error("abstract method setShippingAddress")
end


function OrderItemInterface:setSpecial(value)
    error("abstract method setSpecial")
end


function OrderItemInterface:getGroup()
    error("abstract method getGroup")
end


function OrderItemInterface:getTax()
    error("abstract method getTax")
end


function OrderItemInterface:getShippingType()
    error("abstract method getShippingType")
end


function OrderItemInterface:getShippingCost()
    error("abstract method getShippingCost")
end


function OrderItemInterface:getShippingAddress()
    error("abstract method getShippingAddress")
end


function OrderItemInterface:getSpecial()
    error("abstract method getSpecial")
end

return OrderItemInterface

