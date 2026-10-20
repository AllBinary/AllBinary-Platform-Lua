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
-- package org.allbinary.business.user.commerce.money.payment.gateway.processor

local PaymentException = require("org.allbinary.business.user.commerce.money.payment.PaymentException")
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
local PaymentProcessorInterface = {}
PaymentProcessorInterface.__index = PaymentProcessorInterface
PaymentProcessorInterface.className = "PaymentProcessorInterface"
setmetatable(PaymentProcessorInterface, {__index = DomNodeInterface})


-- throws PaymentException, Exception
function PaymentProcessorInterface:process()
    error("abstract method process")
end

return PaymentProcessorInterface

