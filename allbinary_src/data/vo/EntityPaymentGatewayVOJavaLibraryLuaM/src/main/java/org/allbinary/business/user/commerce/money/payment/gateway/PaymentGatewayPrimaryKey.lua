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

local PaymentGatewayPrimaryKey = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey"] = PaymentGatewayPrimaryKey

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

local StoreFront = java_lazy("org.allbinary.business.context.modules.storefront.StoreFront")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Serializable = java_lazy("java.io.Serializable")
local PaymentGateway = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGateway")

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

-- class table PaymentGatewayPrimaryKey is declared before the requires
PaymentGatewayPrimaryKey.__index = PaymentGatewayPrimaryKey
PaymentGatewayPrimaryKey.className = "PaymentGatewayPrimaryKey"
PaymentGatewayPrimaryKey.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey"
PaymentGatewayPrimaryKey.java_implements = " Serializable "
PaymentGatewayPrimaryKey.java_interfaces = function() return {Serializable} end

function PaymentGatewayPrimaryKey:_init_fields()
    if self.storeName == nil then self.storeName = nil end
    if self.name_f == nil then self.name_f = nil end
end


function PaymentGatewayPrimaryKey._jinit(self, storeName, gatewayName)
    PaymentGatewayPrimaryKey._init_fields(self)
        self:setStoreName(storeName)
        self:setName(gatewayName)
    return self
end

function PaymentGatewayPrimaryKey.new(...)
    local self = setmetatable({}, PaymentGatewayPrimaryKey)
    PaymentGatewayPrimaryKey._jinit(self, ...)
    return self
end


function PaymentGatewayPrimaryKey:getStoreName()
        return self.storeName
end


function PaymentGatewayPrimaryKey:setStoreName(storeName)
        self.storeName = storeName
end


function PaymentGatewayPrimaryKey:getName()
        return self.name_f
end


function PaymentGatewayPrimaryKey:setName(name)
        self.name_f = name
end


function PaymentGatewayPrimaryKey:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PaymentGatewayPrimaryKey.javaClassName)
        stringBuffer:append(StoreFront.javaClassName)
        stringBuffer:append(" =")
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(PaymentGateway.javaClassName)
        stringBuffer:append("=")
        stringBuffer:append(self:getName())
        return tostring(stringBuffer)
end
PaymentGatewayPrimaryKey.__tostring = function(self) return self:toString() end

return PaymentGatewayPrimaryKey

