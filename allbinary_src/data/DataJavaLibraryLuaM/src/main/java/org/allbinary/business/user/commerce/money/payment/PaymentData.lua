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
-- package org.allbinary.business.user.commerce.money.payment


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentData = {}
PaymentData.__index = PaymentData
PaymentData.className = "PaymentData"

function PaymentData.new()
    local self = setmetatable({}, PaymentData)
    return self
end

PaymentData.MIN = 4
PaymentData.MAX = 19
PaymentData.ADDNEW = "Add New Payment"
PaymentData.VIEW = "View Payment"
PaymentData.SELECT = "Select Payment"
PaymentData.CHANGE = "Change Payment"
PaymentData.PAYMENT = "PAYMENT"
PaymentData.METHOD = "PAYMENT_METHOD"
PaymentData.ID = "PAYMENT_ID"
PaymentData.NUMBER = "PAYMENT_NUMBER"
PaymentData.NAME = "PAYMENT_NAME"
PaymentData.TYPE = "PAYMENT_TYPE"
PaymentData.EXPIRATION = "PAYMENT_EXPIRATION"
PaymentData.TENDERTYPE = "PAYMENT_TENDERTYPE"
PaymentData.TRANSACTIONTYPE = "PAYMENT_TRANSACTIONTYPE"
PaymentData.ABA = "PAYMENT_ABA"
PaymentData.ACCOUNT = "PAYMENT_ACCOUNT"
PaymentData.ACCOUNTTYPE = "PAYMENT_ACCOUNTTYPE"
PaymentData.AUTHORIZATIONCODE = "PAYMENT_AUTHORIZATIONCODE"
PaymentData.CHECKNUMBER = "PAYMENT_CHECKNUMBER"
PaymentData.CHECKTYPE = "PAYMENT_CHECKTYPE"
PaymentData.DRIVERSLICENSE = "PAYMENT_DRIVERSLICENSE"
PaymentData.MAGNETICINKCHECKREADER = "PAYMENT_MAGNETICINKCHECKREADER"

return PaymentData

