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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CreditCardTypeFactory = {}
CreditCardTypeFactory.__index = CreditCardTypeFactory
CreditCardTypeFactory.className = "CreditCardTypeFactory"

function CreditCardTypeFactory:_init_fields()
    self.VISA = CreditCardType.new("Visa")
    self.MASTERCARD = CreditCardType.new("MasterCard")
    self.DISCOVER = CreditCardType.new("Discover")
    self.AMERICANEXPRESS = CreditCardType.new("AMX")
end

function CreditCardTypeFactory.new()
    local self = setmetatable({}, CreditCardTypeFactory)
    self:_init_fields()
    return self
end


function CreditCardTypeFactory.getInstance()
        return CreditCardTypeFactory.instance
end

CreditCardTypeFactory.instance = CreditCardTypeFactory.new()

return CreditCardTypeFactory

