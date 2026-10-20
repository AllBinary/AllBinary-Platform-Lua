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
-- package views.admin.payment.gateway

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayPrimaryKey = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey")
local TransformInfoHttpComposite = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayViewAbstract = {}
PaymentGatewayViewAbstract.__index = PaymentGatewayViewAbstract
PaymentGatewayViewAbstract.className = "PaymentGatewayViewAbstract"
setmetatable(PaymentGatewayViewAbstract, {__index = TransformInfoHttpComposite})

function PaymentGatewayViewAbstract:_init_fields()
    self.paymentGatewayPrimaryKey = nil
end


function PaymentGatewayViewAbstract.new(transformInfoInterface)
    local self = setmetatable(TransformInfoHttpComposite.new(transformInfoInterface), PaymentGatewayViewAbstract)
    self:_init_fields()
        -- super(...) made self above
        self:getFormData(self:getPageContext():getRequest())
    return self
end


function PaymentGatewayViewAbstract:getFormData(request)
        local storeName = self:getWeblisketSession():getStoreName()
        local gatewayName = request:getParameter(tostring(PaymentGatewayData.NAME))
        self:setPaymentGatewayPrimaryKey(PaymentGatewayPrimaryKey.new(storeName, gatewayName))
end


function PaymentGatewayViewAbstract:getPaymentGatewayPrimaryKey()
        return self.paymentGatewayPrimaryKey
end


function PaymentGatewayViewAbstract:setPaymentGatewayPrimaryKey(paymentGatewayPrimaryKey)
        self.paymentGatewayPrimaryKey = paymentGatewayPrimaryKey
end

return PaymentGatewayViewAbstract

