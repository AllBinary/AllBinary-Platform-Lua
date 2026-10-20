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
-- package org.allbinary.business.user.address


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BillingAddressData = {}
BillingAddressData.__index = BillingAddressData
BillingAddressData.className = "BillingAddressData"


function BillingAddressData.new()
    local self = setmetatable({}, BillingAddressData)
    return self
end

BillingAddressData.MAX = 255
BillingAddressData.MIN = 0
BillingAddressData.MULTIPLE = "BILLINGADDRESSES"
BillingAddressData.STATES = "BILLINGADDRESS_STATES"
BillingAddressData.SETTOSHIPPINGADDRESS = "Set To Shipping Address"
BillingAddressData.SELECT = "Select Billing Address"
BillingAddressData.SETTOSHIPPINGADDRESSNAME = "SETTOSHIPPINGADDRESS"
BillingAddressData.BILLINGADDRESSES = "BILLINGADDRESSES"
BillingAddressData.BILLINGADDRESS = "BILLINGADDRESS"
BillingAddressData.ID = "BILLINGADDRESS_ID"
BillingAddressData.ADDRESS = "BILLINGADDRESS_ADDRESS"
BillingAddressData.NAME = "BILLINGADDRESS_NAME"
BillingAddressData.STREET = "BILLINGADDRESS_STREET"
BillingAddressData.CITY = "BILLINGADDRESS_CITY"
BillingAddressData.STATE = "BILLINGADDRESS_STATE"
BillingAddressData.CODE = "BILLINGADDRESS_CODE"
BillingAddressData.COUNTRY = "BILLINGADDRESS_COUNTRY"

return BillingAddressData

