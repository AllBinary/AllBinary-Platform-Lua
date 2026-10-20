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
-- package org.allbinary.data.tables.user.commerce.money.payment.gateway

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

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
local PaymentGatewayEntityInterface = {}
PaymentGatewayEntityInterface.__index = PaymentGatewayEntityInterface
PaymentGatewayEntityInterface.className = "PaymentGatewayEntityInterface"
setmetatable(PaymentGatewayEntityInterface, {__index = BasicDataTableInterface})


function PaymentGatewayEntityInterface:getPaymentGatewayInterface(storeName, paymentType)
    error("abstract method getPaymentGatewayInterface")
end


function PaymentGatewayEntityInterface:findPaymentTypeVectorByStore(storeName)
    error("abstract method findPaymentTypeVectorByStore")
end


function PaymentGatewayEntityInterface:remove(storeName, paymentType)
    error("abstract method remove")
end


function PaymentGatewayEntityInterface:add(paymentGatewayInterface)
    error("abstract method add")
end


function PaymentGatewayEntityInterface:update(paymentGatewayInterface)
    error("abstract method update")
end

return PaymentGatewayEntityInterface

