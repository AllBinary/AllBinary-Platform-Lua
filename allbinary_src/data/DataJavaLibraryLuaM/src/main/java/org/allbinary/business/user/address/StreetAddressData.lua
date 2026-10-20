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

local StreetAddressData = {}
StreetAddressData.__index = StreetAddressData
StreetAddressData.className = "StreetAddressData"


function StreetAddressData.new()
    local self = setmetatable({}, StreetAddressData)
    return self
end

StreetAddressData.MAX = 255
StreetAddressData.MIN = 0
StreetAddressData.FORM = "FORM"
StreetAddressData.STATES = "STATES"
StreetAddressData.NUMBEROFADDRESSES = "STREETADDRESS_NUMBEROFADDRESSES"
StreetAddressData.ID = "STREETADDRESS_ID"
StreetAddressData.DEFAULT = "STREETADDRESS_DEFAULT_ADDRESS"
StreetAddressData.ADDRESS = "STREETADDRESS_ADDRESS"
StreetAddressData.NAME = "STREETADDRESS_NAME"
StreetAddressData.STREET = "STREETADDRESS_STREET"
StreetAddressData.CITY = "STREETADDRESS_CITY"
StreetAddressData.STATE = "STREETADDRESS_STATE"
StreetAddressData.CODE = "STREETADDRESS_CODE"
StreetAddressData.COUNTRY = "STREETADDRESS_COUNTRY"

return StreetAddressData

