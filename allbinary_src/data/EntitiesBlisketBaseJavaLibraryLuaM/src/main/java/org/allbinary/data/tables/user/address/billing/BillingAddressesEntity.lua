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
-- package org.allbinary.data.tables.user.address.billing

local StreetAddressesEntity = require("org.allbinary.data.tables.user.address.StreetAddressesEntity")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BillingAddressesEntity = {}
BillingAddressesEntity.__index = BillingAddressesEntity
BillingAddressesEntity.className = "BillingAddressesEntity"
setmetatable(BillingAddressesEntity, {__index = StreetAddressesEntity})

function BillingAddressesEntity:_init_fields()
    self.TABLENAME = "billing"
end


function BillingAddressesEntity.new(userName)
    local self = setmetatable(StreetAddressesEntity.new(userName), BillingAddressesEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.TABLENAME)
    return self
end

return BillingAddressesEntity

