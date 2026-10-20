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
-- package org.allbinary.business.user.commerce.inventory.order

local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local Payment = require("org.allbinary.business.user.commerce.money.payment.Payment")

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
local OrderHistoryInterface = {}
OrderHistoryInterface.__index = OrderHistoryInterface
OrderHistoryInterface.className = "OrderHistoryInterface"


function OrderHistoryInterface:setUserName(value)
    error("abstract method setUserName")
end


function OrderHistoryInterface:setDefaultShippingAddress(shippingAddress)
    error("abstract method setDefaultShippingAddress")
end


function OrderHistoryInterface:setBillingAddress(billingAddress)
    error("abstract method setBillingAddress")
end


function OrderHistoryInterface:setPaymentInfo(payment)
    error("abstract method setPaymentInfo")
end


function OrderHistoryInterface:setShipDate(value)
    error("abstract method setShipDate")
end


function OrderHistoryInterface:setOrderDate(value)
    error("abstract method setOrderDate")
end


function OrderHistoryInterface:setTransDate(value)
    error("abstract method setTransDate")
end


function OrderHistoryInterface:setCancelDate(value)
    error("abstract method setCancelDate")
end


function OrderHistoryInterface:setStatus(value)
    error("abstract method setStatus")
end


function OrderHistoryInterface:setSubTotal(value)
    error("abstract method setSubTotal")
end


function OrderHistoryInterface:setShippingCost(value)
    error("abstract method setShippingCost")
end


function OrderHistoryInterface:setTaxes(value)
    error("abstract method setTaxes")
end


function OrderHistoryInterface:setTotal(value)
    error("abstract method setTotal")
end


function OrderHistoryInterface:getUserName()
    error("abstract method getUserName")
end


function OrderHistoryInterface:getShippingAddress()
    error("abstract method getShippingAddress")
end


function OrderHistoryInterface:getBillingAddress()
    error("abstract method getBillingAddress")
end


function OrderHistoryInterface:getPaymentInfo()
    error("abstract method getPaymentInfo")
end


function OrderHistoryInterface:getShipDate()
    error("abstract method getShipDate")
end


function OrderHistoryInterface:getOrderDate()
    error("abstract method getOrderDate")
end


function OrderHistoryInterface:getTransDate()
    error("abstract method getTransDate")
end


function OrderHistoryInterface:getCancelDate()
    error("abstract method getCancelDate")
end


function OrderHistoryInterface:getStatus()
    error("abstract method getStatus")
end


function OrderHistoryInterface:getSubTotal()
    error("abstract method getSubTotal")
end


function OrderHistoryInterface:getShippingCost()
    error("abstract method getShippingCost")
end


function OrderHistoryInterface:getTaxes()
    error("abstract method getTaxes")
end


function OrderHistoryInterface:getTotal()
    error("abstract method getTotal")
end


function OrderHistoryInterface:getPaymentMethod()
    error("abstract method getPaymentMethod")
end

return OrderHistoryInterface

