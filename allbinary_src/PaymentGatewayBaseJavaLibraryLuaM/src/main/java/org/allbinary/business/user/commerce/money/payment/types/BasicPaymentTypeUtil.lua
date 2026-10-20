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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
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

local BasicPaymentTypeUtil = {}
BasicPaymentTypeUtil.__index = BasicPaymentTypeUtil
BasicPaymentTypeUtil.className = "BasicPaymentTypeUtil"

function BasicPaymentTypeUtil:_init_fields()
    self.paymentTypeVector = BasicArrayListD.new()
end


function BasicPaymentTypeUtil.getInstance()
        return BasicPaymentTypeUtil.instance
end


function BasicPaymentTypeUtil.new()
    local self = setmetatable({}, BasicPaymentTypeUtil)
    self:_init_fields()
    return self
end


function BasicPaymentTypeUtil:add(paymentType)
        self.paymentTypeVector:add(paymentType)
end


-- throws Exception
function BasicPaymentTypeUtil:get(paymentTypeString)
        local size = self.paymentTypeVector:size()
        for i = 0, size - 1 do
            local paymentType = self.paymentTypeVector:get(i)
            if paymentType:getName():compareTo(paymentTypeString) == 0 then
                return paymentType
            end
        end
        error(java_exception("Exception", "Unknown PaymentType: " .. paymentTypeString), 0)
end


function BasicPaymentTypeUtil:isContain(paymentType)
        return self.paymentTypeVector:contains(paymentType)
end


function BasicPaymentTypeUtil:difference(a_PaymentTypeVector)
        local diff = BasicArrayListD.new()
        local size = self.paymentTypeVector:size()
        for i = 0, size - 1 do
            local paymentType = self.paymentTypeVector:get(i)
            if not a_PaymentTypeVector:contains(paymentType) then
                diff:add(paymentType)
            end
        end
        return diff
end

BasicPaymentTypeUtil.instance = BasicPaymentTypeUtil.new()


do -- Java static initializer
end

return BasicPaymentTypeUtil

