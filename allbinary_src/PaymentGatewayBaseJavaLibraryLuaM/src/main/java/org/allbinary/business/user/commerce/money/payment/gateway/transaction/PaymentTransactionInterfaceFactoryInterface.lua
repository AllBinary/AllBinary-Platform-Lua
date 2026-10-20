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
local TenderType = require("org.allbinary.business.user.commerce.money.payment.types.TenderType")

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
local PaymentTransactionInterfaceFactoryInterface = {}
PaymentTransactionInterfaceFactoryInterface.__index = PaymentTransactionInterfaceFactoryInterface
PaymentTransactionInterfaceFactoryInterface.className = "PaymentTransactionInterfaceFactoryInterface"


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getInstance(orderHistory)
    error("abstract method getInstance")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getSaleTransaction(tenderType)
    error("abstract method getSaleTransaction")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getCreditTransaction(tenderType)
    error("abstract method getCreditTransaction")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getAuthorizationTransaction(tenderType)
    error("abstract method getAuthorizationTransaction")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getCaptureDelayedTransaction(tenderType)
    error("abstract method getCaptureDelayedTransaction")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getVoidTransaction(tenderType)
    error("abstract method getVoidTransaction")
end


-- throws Exception
function PaymentTransactionInterfaceFactoryInterface:getInquiryTransaction(tenderType)
    error("abstract method getInquiryTransaction")
end

return PaymentTransactionInterfaceFactoryInterface

