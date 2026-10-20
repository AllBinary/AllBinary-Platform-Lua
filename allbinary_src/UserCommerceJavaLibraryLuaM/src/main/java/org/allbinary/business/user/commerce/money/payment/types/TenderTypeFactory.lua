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

local TenderTypeFactory = {}
TenderTypeFactory.__index = TenderTypeFactory
TenderTypeFactory.className = "TenderTypeFactory"

function TenderTypeFactory:_init_fields()
    self.CREDITCARD = TenderType.new("Credit Card")
    self.CHECK = TenderType.new("Check")
    self.ACH = TenderType.new("Ach")
end

function TenderTypeFactory.new()
    local self = setmetatable({}, TenderTypeFactory)
    self:_init_fields()
    return self
end


function TenderTypeFactory.getInstance()
        return TenderTypeFactory.instance
end

TenderTypeFactory.instance = TenderTypeFactory.new()

return TenderTypeFactory

