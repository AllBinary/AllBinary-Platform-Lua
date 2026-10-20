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

local TransactionTypeFactory = {}
TransactionTypeFactory.__index = TransactionTypeFactory
TransactionTypeFactory.className = "TransactionTypeFactory"

function TransactionTypeFactory:_init_fields()
    self.SALE = TransactionType.new("Sale")
    self.CREDIT = TransactionType.new("Credit")
    self.AUTHORIZATION = TransactionType.new("Authorization")
    self.DELAYEDCAPTURE = TransactionType.new("Delayed Capture")
    self.VOID = TransactionType.new("Void")
    self.INQUIRY = TransactionType.new("Inquiry")
end

function TransactionTypeFactory.new()
    local self = setmetatable({}, TransactionTypeFactory)
    self:_init_fields()
    return self
end


function TransactionTypeFactory.getInstance()
        return TransactionTypeFactory.instance
end

TransactionTypeFactory.instance = TransactionTypeFactory.new()

return TransactionTypeFactory

