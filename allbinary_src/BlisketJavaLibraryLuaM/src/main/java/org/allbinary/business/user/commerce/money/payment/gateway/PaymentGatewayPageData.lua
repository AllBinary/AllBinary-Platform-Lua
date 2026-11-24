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

local PaymentGatewayPageData = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPageData"] = PaymentGatewayPageData

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PaymentGatewayPageData is declared before the requires
PaymentGatewayPageData.__index = PaymentGatewayPageData
PaymentGatewayPageData.className = "PaymentGatewayPageData"
PaymentGatewayPageData.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPageData"

function PaymentGatewayPageData:_init_fields()
    if self.MAKEPAYMENT == nil then self.MAKEPAYMENT = nil end
    if self.CHECKOUT == nil then self.CHECKOUT = nil end
    if self.SHIPPING == nil then self.SHIPPING = nil end
    if self.SHIPPINGADDRESS == nil then self.SHIPPINGADDRESS = nil end
    if self.SHIPPINGADDRESSACTION == nil then self.SHIPPINGADDRESSACTION = nil end
    if self.BILLINGADDRESS == nil then self.BILLINGADDRESS = nil end
    if self.PAYMENT == nil then self.PAYMENT = nil end
    if self.AUTHORIZE == nil then self.AUTHORIZE = nil end
    if self.FINISH == nil then self.FINISH = nil end
end


function PaymentGatewayPageData._jinit(self, location, paymentMethod)
    PaymentGatewayPageData._init_fields(self)
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

function PaymentGatewayPageData.new(...)
    local self = setmetatable({}, PaymentGatewayPageData)
    PaymentGatewayPageData._jinit(self, ...)
    return self
end

PaymentGatewayPageData.EXTENSION = ".jsp"
PaymentGatewayPageData.NAME = StringUtil.getInstance().EMPTY_STRING
PaymentGatewayPageData.FORWARDMAKEPAYMENT = "MakePayment.jsp"
PaymentGatewayPageData.PAYMENTOPTIONS = "PaymentOptions" .. tostring(PaymentGatewayPageData.EXTENSION)
PaymentGatewayPageData.STARTCHECKOUT = "StartCheckout" .. tostring(PaymentGatewayPageData.EXTENSION)

return PaymentGatewayPageData

