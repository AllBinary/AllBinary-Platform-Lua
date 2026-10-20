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
-- package org.allbinary.business.user.commerce.money.payment.gateway

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local BasicPaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local PaymentGatewayInterfaceFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayInterfaceFactory = {}
PaymentGatewayInterfaceFactory.__index = PaymentGatewayInterfaceFactory
PaymentGatewayInterfaceFactory.className = "PaymentGatewayInterfaceFactory"

function PaymentGatewayInterfaceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentGatewayInterfaceFactory.new()
    local self = setmetatable({}, PaymentGatewayInterfaceFactory)
    self:_init_fields()
    return self
end


-- throws Exception
function PaymentGatewayInterfaceFactory:getInstance(httpServletRequest)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                self.logUtil:putF("Getting", self, commonStrings.GET_INSTANCE)
            end
            return self:getInstance(RequestParams.new(httpServletRequest):toHashMap())
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "getInstance(HttpServletRequest)", e)
            end
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function PaymentGatewayInterfaceFactory:getInstance(paymentType)
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(tostring(PaymentGatewayData.NAME), paymentType:getName())
        return self:getInstance(hashMap)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function PaymentGatewayInterfaceFactory:getInstance(hashMap)
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local gatewayName = hashMap:get(tostring(PaymentGatewayData.NAME))
            local paymentType = BasicPaymentTypeUtil.getInstance():get(gatewayName)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                self.logUtil:putF("Getting PaymentGatewayInterface for PaymentType: " .. paymentType:getName() .. " with: " .. tostring(hashMap), self, commonStrings.GET_INSTANCE)
            end
            local paymentGatewayInterfaceFactoryInterface = paymentType:getPaymentGatewayInterfaceFactoryInterface()
            return paymentGatewayInterfaceFactoryInterface:getInstance(hashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            error(e, 0)
        end
end

return PaymentGatewayInterfaceFactory

