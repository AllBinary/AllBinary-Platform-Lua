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
local PaymentType = require("org.allbinary.business.user.commerce.money.payment.types.PaymentType")
local PaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local PaymentTransactionInterfaceFactory = {}
PaymentTransactionInterfaceFactory.__index = PaymentTransactionInterfaceFactory
PaymentTransactionInterfaceFactory.className = "PaymentTransactionInterfaceFactory"

function PaymentTransactionInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentTransactionInterfaceFactory.getInstance()
        return PaymentTransactionInterfaceFactory.instance
end


function PaymentTransactionInterfaceFactory.new()
    local self = setmetatable({}, PaymentTransactionInterfaceFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function PaymentTransactionInterfaceFactory:getInstance(orderReview)
        local try_ok, try_error = pcall(function()
            local gatewayName = orderReview:getPaymentMethod()
            if gatewayName ~= nil then
                local paymentType = PaymentTypeUtil.getInstance():get(gatewayName)
                local paymentTransactionInterfaceFactoryInterface = paymentType:getPaymentTransactionInterfaceFactoryInterface()
                local paymentTransactionInterface = paymentTransactionInterfaceFactoryInterface:getInstance(orderReview)
                return paymentTransactionInterface
            end
            error(java_exception("Exception", "Failed to create PaymentTransactionInterface: " .. "GatewayName is: " .. gatewayName), 0)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put("Failed to generate test data", self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

PaymentTransactionInterfaceFactory.instance = PaymentTransactionInterfaceFactory.new()

return PaymentTransactionInterfaceFactory

