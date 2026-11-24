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

local BasicPaymentTypeUtil = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil"] = BasicPaymentTypeUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BasicPaymentType = java_lazy("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BasicPaymentTypeUtil is declared before the requires
BasicPaymentTypeUtil.__index = BasicPaymentTypeUtil
BasicPaymentTypeUtil.className = "BasicPaymentTypeUtil"
BasicPaymentTypeUtil.javaClassName = "org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil"

function BasicPaymentTypeUtil:_init_fields()
    self.paymentTypeVector = BasicArrayListD.new()
end


function BasicPaymentTypeUtil.getInstance()
        return BasicPaymentTypeUtil.instance_f
end


function BasicPaymentTypeUtil._jinit(self)
    BasicPaymentTypeUtil._init_fields(self)
    return self
end

function BasicPaymentTypeUtil.new(...)
    local self = setmetatable({}, BasicPaymentTypeUtil)
    BasicPaymentTypeUtil._jinit(self, ...)
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
        error(require("java.lang.Exception").new("Unknown PaymentType: " .. paymentTypeString), 0)
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

BasicPaymentTypeUtil.instance_f = BasicPaymentTypeUtil.new()


do -- Java static initializer
end

return BasicPaymentTypeUtil

