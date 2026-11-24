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

local PaymentData = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.PaymentData"] = PaymentData

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

-- class table PaymentData is declared before the requires
PaymentData.__index = PaymentData
PaymentData.className = "PaymentData"
PaymentData.javaClassName = "org.allbinary.business.user.commerce.money.payment.PaymentData"

function PaymentData._jinit(self)
    return self
end

function PaymentData.new()
    return PaymentData._jinit(setmetatable({}, PaymentData))
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

