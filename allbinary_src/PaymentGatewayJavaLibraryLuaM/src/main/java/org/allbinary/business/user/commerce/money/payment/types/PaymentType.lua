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
-- package org.allbinary.business.user.commerce.money.payment.types

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentProcessorInterfaceFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.processor.PaymentProcessorInterfaceFactoryInterface")
local PaymentTransactionInterfaceFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceFactoryInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentType = {}
PaymentType.__index = PaymentType
PaymentType.className = "PaymentType"

function PaymentType:_init_fields()
    self.basicPaymentType = nil
    self.paymentTransactionInterfaceFactoryInterface = nil
    self.paymentProcessorInterfaceFactoryInterface = nil
end

function PaymentType.new(...)
    local count = select("#", ...)
    if count == 1 then return PaymentType._new1(...)
    elseif count == 3 then return PaymentType._new3(...)
    end
end


function PaymentType._new1(basicPaymentType)
    local self = setmetatable({}, PaymentType)
    self:_init_fields()
        self.basicPaymentType = basicPaymentType
        self.paymentTransactionInterfaceFactoryInterface = nil
        self.paymentProcessorInterfaceFactoryInterface = nil
        PaymentTypeUtil.getInstance():add(self)
    return self
end


function PaymentType._new3(basicPaymentType, paymentTransactionInterfaceFactoryInterface, paymentProcessorInterfaceFactoryInterface)
    local self = setmetatable({}, PaymentType)
    self:_init_fields()
        self.basicPaymentType = basicPaymentType
        self.paymentTransactionInterfaceFactoryInterface = paymentTransactionInterfaceFactoryInterface
        self.paymentProcessorInterfaceFactoryInterface = paymentProcessorInterfaceFactoryInterface
        PaymentTypeUtil.getInstance():add(self)
    return self
end


-- throws Exception
function PaymentType:getPaymentTransactionInterfaceFactoryInterface()
        if self.paymentTransactionInterfaceFactoryInterface == nil then
            error(java_exception("Exception", "PaymentTransactionInterfaceFactoryInterface is Null"), 0)
        end
        return self.paymentTransactionInterfaceFactoryInterface
end


-- throws Exception
function PaymentType:getPaymentProcessorInterfaceFactoryInterface()
        if self.paymentProcessorInterfaceFactoryInterface == nil then
            error(java_exception("Exception", "PaymentProcessorInterfaceFactoryInterface is Null"), 0)
        end
        return self.paymentProcessorInterfaceFactoryInterface
end


function PaymentType:toVector()
        local vector = BasicArrayListD.new()
        vector:addAllList(self:getBasicPaymentType():toVector())
        if self.paymentTransactionInterfaceFactoryInterface ~= nil then
            vector:add(getmetatable(self.paymentTransactionInterfaceFactoryInterface).className)
        end
        if self.paymentProcessorInterfaceFactoryInterface ~= nil then
            vector:add(getmetatable(self.paymentProcessorInterfaceFactoryInterface).className)
        end
        return vector
end


function PaymentType:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:putAll(self:getBasicPaymentType():toHashMap())
        if self.paymentTransactionInterfaceFactoryInterface ~= nil then
            hashMap:put(tostring(PaymentGatewayData.PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE), getmetatable(self.paymentTransactionInterfaceFactoryInterface).className)
        end
        if self.paymentProcessorInterfaceFactoryInterface ~= nil then
            hashMap:put(tostring(PaymentGatewayData.PAYMENTPROCESSORINTERFACEFACTORYINTERFACE), getmetatable(self.paymentProcessorInterfaceFactoryInterface).className)
        end
        return hashMap
end


function PaymentType:getBasicPaymentType()
        return self.basicPaymentType
end

return PaymentType

