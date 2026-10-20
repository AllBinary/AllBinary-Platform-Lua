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
local PaymentGatewayInterfaceFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterfaceFactoryInterface")
local PaymentGatewayDomNodeFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local CommonSeps = require("org.allbinary.string.CommonSeps")

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

local BasicPaymentType = {}
BasicPaymentType.__index = BasicPaymentType
BasicPaymentType.className = "BasicPaymentType"

function BasicPaymentType:_init_fields()
    self.name = nil
    self.value = nil
    self.paymentGatewayInterfaceFactoryInterface = nil
    self.paymentGatewayDomNodeFactoryInterface = nil
end

function BasicPaymentType.new(...)
    local count = select("#", ...)
    if count == 1 then return BasicPaymentType._new1(...)
    elseif count == 3 then return BasicPaymentType._new3(...)
    end
end


function BasicPaymentType._new1(paymentMethod)
    local self = setmetatable({}, BasicPaymentType)
    self:_init_fields()
        self:init(paymentMethod)
    return self
end


function BasicPaymentType._new3(paymentMethod, paymentGatewayInterfaceFactoryInterface, paymentGatewayDomNodeFactoryInterface)
    local self = setmetatable({}, BasicPaymentType)
    self:_init_fields()
        self:init(paymentMethod)
        self.paymentGatewayInterfaceFactoryInterface = paymentGatewayInterfaceFactoryInterface
        self.paymentGatewayDomNodeFactoryInterface = paymentGatewayDomNodeFactoryInterface
    return self
end


function BasicPaymentType:init(paymentMethod)
        local hashMap = StdUtil.getInstance():createHashMap()
        local UNDERSCORE = "_"
        hashMap:put(CommonSeps.getInstance().SPACE, UNDERSCORE)
        hashMap:put(AbPathData.getInstance().EXTENSION_SEP, UNDERSCORE)
        hashMap:put("-", UNDERSCORE)
        local replace = Replace.new(hashMap)
        self.name = replace:all(paymentMethod)
        self.value = paymentMethod
        BasicPaymentTypeUtil.getInstance():add(self)
end


function BasicPaymentType:getName()
        return self.name
end


function BasicPaymentType:getValue()
        return self.value
end


-- throws Exception
function BasicPaymentType:getPaymentGatewayInterfaceFactoryInterface()
        if self.paymentGatewayInterfaceFactoryInterface == nil then
            error(java_exception("Exception", "PaymentGatewayInterfaceFactoryInterface is Null"), 0)
        end
        return self.paymentGatewayInterfaceFactoryInterface
end


-- throws Exception
function BasicPaymentType:getPaymentGatewayDomNodeFactoryInterface()
        if self.paymentGatewayDomNodeFactoryInterface == nil then
            error(java_exception("Exception", "PaymentGatewayDomNodeFactoryInterface is Null"), 0)
        end
        return self.paymentGatewayDomNodeFactoryInterface
end


function BasicPaymentType:getKey()
        return self:getName()
end


function BasicPaymentType:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.name)
        vector:add(self.value)
        return vector
end


function BasicPaymentType:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(tostring(PaymentGatewayData.NAME), self.name)
        hashMap:put(tostring(PaymentGatewayData.VALUE), self.value)
        return hashMap
end


function BasicPaymentType:toString()
        return self.name
end
BasicPaymentType.__tostring = function(self) return self:toString() end

return BasicPaymentType

