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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayEncryptedMapping = {}
PaymentGatewayEncryptedMapping.__index = PaymentGatewayEncryptedMapping
PaymentGatewayEncryptedMapping.className = "PaymentGatewayEncryptedMapping"

function PaymentGatewayEncryptedMapping:_init_fields()
    self.paymentGatewayInterface = nil
end


function PaymentGatewayEncryptedMapping.new(paymentGatewayInterface)
    local self = setmetatable({}, PaymentGatewayEncryptedMapping)
    self:_init_fields()
        self.paymentGatewayInterface = paymentGatewayInterface
    return self
end


-- throws Exception
function PaymentGatewayEncryptedMapping:toHashMap()
        return self.paymentGatewayInterface:toHashMap(true)
end


function PaymentGatewayEncryptedMapping:toVector()
        return self.paymentGatewayInterface:toVector(true)
end


-- throws Exception
function PaymentGatewayEncryptedMapping:getKey()
        return self.paymentGatewayInterface:getKey()
end

return PaymentGatewayEncryptedMapping

