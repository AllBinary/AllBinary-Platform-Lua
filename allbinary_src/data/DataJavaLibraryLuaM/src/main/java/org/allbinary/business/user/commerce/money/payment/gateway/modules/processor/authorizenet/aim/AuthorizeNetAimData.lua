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
-- package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.aim


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AuthorizeNetAimData = {}
AuthorizeNetAimData.__index = AuthorizeNetAimData
AuthorizeNetAimData.className = "AuthorizeNetAimData"


function AuthorizeNetAimData.new()
    local self = setmetatable({}, AuthorizeNetAimData)
    return self
end

AuthorizeNetAimData.X_DELIM_DATA = "x_delim_data"
AuthorizeNetAimData.X_DELIM_CHAR = "x_delim_char"
AuthorizeNetAimData.X_ENCAP_CHAR = "x_encap_char"
AuthorizeNetAimData.X_AUTHENTICATION_INDICATOR = "x_authentication_indicator"
AuthorizeNetAimData.X_CARDHOLDER_AUTHENTICATION_VALUE = "x_cardholder_authentication_value"
AuthorizeNetAimData.X_DRIVERS_LICENSE_NUM = "x_drivers_license_num"
AuthorizeNetAimData.X_DRIVERS_LICENSE_STATE = "x_drivers_license_state"
AuthorizeNetAimData.X_DRIVERS_LICENSE_DOB = "x_drivers_license_dob"

return AuthorizeNetAimData

