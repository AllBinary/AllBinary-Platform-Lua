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

local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
-- java.lang.Serializable has no Lua module
local Serializable = {}

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayPrimaryKey = {}
PaymentGatewayPrimaryKey.__index = PaymentGatewayPrimaryKey
PaymentGatewayPrimaryKey.className = "PaymentGatewayPrimaryKey"

function PaymentGatewayPrimaryKey:_init_fields()
    self.storeName = nil
    self.name = nil
end


function PaymentGatewayPrimaryKey.new(storeName, gatewayName)
    local self = setmetatable({}, PaymentGatewayPrimaryKey)
    self:_init_fields()
        self:setStoreName(storeName)
        self:setName(gatewayName)
    return self
end


function PaymentGatewayPrimaryKey:getStoreName()
        return self.storeName
end


function PaymentGatewayPrimaryKey:setStoreName(storeName)
        self.storeName = storeName
end


function PaymentGatewayPrimaryKey:getName()
        return self.name
end


function PaymentGatewayPrimaryKey:setName(name)
        self.name = name
end


function PaymentGatewayPrimaryKey:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(PaymentGatewayPrimaryKey:getName())
        stringBuffer:append(StoreFront:getName())
        stringBuffer:append(" =")
        stringBuffer:append(self:getStoreName())
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(PaymentGateway:getName())
        stringBuffer:append("=")
        stringBuffer:append(self:getName())
        return tostring(stringBuffer)
end
PaymentGatewayPrimaryKey.__tostring = function(self) return self:toString() end

return PaymentGatewayPrimaryKey

