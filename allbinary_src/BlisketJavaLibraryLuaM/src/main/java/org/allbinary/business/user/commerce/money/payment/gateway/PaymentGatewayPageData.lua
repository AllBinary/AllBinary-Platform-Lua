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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayPageData = {}
PaymentGatewayPageData.__index = PaymentGatewayPageData
PaymentGatewayPageData.className = "PaymentGatewayPageData"

function PaymentGatewayPageData:_init_fields()
    self.MAKEPAYMENT = nil
    self.CHECKOUT = nil
    self.SHIPPING = nil
    self.SHIPPINGADDRESS = nil
    self.SHIPPINGADDRESSACTION = nil
    self.BILLINGADDRESS = nil
    self.PAYMENT = nil
    self.AUTHORIZE = nil
    self.FINISH = nil
end


function PaymentGatewayPageData.new(location, paymentMethod)
    local self = setmetatable({}, PaymentGatewayPageData)
    self:_init_fields()
        local paymentMethodString = tostring(PaymentGatewayPageData.NAME) .. paymentMethod
        local stringBuffer = StringMaker.new()
        stringBuffer:append(location)
        stringBuffer:append("MakePayment")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.MAKEPAYMENT = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("Checkout")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.CHECKOUT = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("Shipping")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.SHIPPING = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("ShippingAddress")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.SHIPPINGADDRESS = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("ShippingAddressAction")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.SHIPPINGADDRESSACTION = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("BillingAddress")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.BILLINGADDRESS = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("Payment")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.PAYMENT = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("Authorize")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.AUTHORIZE = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(paymentMethodString)
        stringBuffer:append("PaymentFinish")
        stringBuffer:append(PaymentGatewayPageData.EXTENSION)
        self.FINISH = tostring(stringBuffer)
    return self
end

PaymentGatewayPageData.EXTENSION = ".jsp"
PaymentGatewayPageData.NAME = StringUtil.getInstance().EMPTY_STRING
PaymentGatewayPageData.FORWARDMAKEPAYMENT = "MakePayment.jsp"
PaymentGatewayPageData.PAYMENTOPTIONS = "PaymentOptions" .. tostring(PaymentGatewayPageData.EXTENSION)
PaymentGatewayPageData.STARTCHECKOUT = "StartCheckout" .. tostring(PaymentGatewayPageData.EXTENSION)

return PaymentGatewayPageData

