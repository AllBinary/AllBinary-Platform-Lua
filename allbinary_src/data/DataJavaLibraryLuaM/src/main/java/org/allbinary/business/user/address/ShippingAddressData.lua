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

local ShippingAddressData = {}
ShippingAddressData.__index = ShippingAddressData
ShippingAddressData.className = "ShippingAddressData"


function ShippingAddressData.new()
    local self = setmetatable({}, ShippingAddressData)
    return self
end

ShippingAddressData.SETTOBILLINGADDRESS = "Set To Billing Address"
ShippingAddressData.SELECT = "Select Shipping Address"
ShippingAddressData.SELECTNAME = "SELECTSHIPPINGADDRESS"
ShippingAddressData.MULTIPLE = "SHIPPINGADDRESSES"
ShippingAddressData.SHIPPINGADDRESSES = "SHIPPINGADDRESSES"
ShippingAddressData.SHIPPINGADDRESS = "SHIPPINGADDRESS"
ShippingAddressData.ID = "SHIPPINGADDRESS_ID"
ShippingAddressData.ADDRESS = "SHIPPINGADDRESS_ADDRESS"
ShippingAddressData.NAME = "SHIPPINGADDRESS_NAME"
ShippingAddressData.STREET = "SHIPPINGADDRESS_STREET"
ShippingAddressData.CITY = "SHIPPINGADDRESS_CITY"
ShippingAddressData.STATE = "SHIPPINGADDRESS_STATE"
ShippingAddressData.CODE = "SHIPPINGADDRESS_CODE"
ShippingAddressData.COUNTRY = "SHIPPINGADDRESS_COUNTRY"
ShippingAddressData.TAX = "SHIPPINGADDRESS_TAX"

return ShippingAddressData

