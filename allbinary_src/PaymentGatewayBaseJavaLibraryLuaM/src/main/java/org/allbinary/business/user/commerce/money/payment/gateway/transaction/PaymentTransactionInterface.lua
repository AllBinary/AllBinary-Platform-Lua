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
-- package org.allbinary.business.user.commerce.money.payment.gateway.transaction

local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")

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
local PaymentTransactionInterface = {}
PaymentTransactionInterface.__index = PaymentTransactionInterface
PaymentTransactionInterface.className = "PaymentTransactionInterface"
setmetatable(PaymentTransactionInterface, {__index = TableMappingInterface})


function PaymentTransactionInterface:getOrderHistory()
    error("abstract method getOrderHistory")
end

return PaymentTransactionInterface

