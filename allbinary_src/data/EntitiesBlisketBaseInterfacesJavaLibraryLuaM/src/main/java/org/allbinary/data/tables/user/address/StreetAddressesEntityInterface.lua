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
-- package org.allbinary.data.tables.user.address

local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local BasicDataTableInterface = require("org.allbinary.data.tables.BasicDataTableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local StreetAddressesEntityInterface = {}
StreetAddressesEntityInterface.__index = StreetAddressesEntityInterface
StreetAddressesEntityInterface.className = "StreetAddressesEntityInterface"
setmetatable(StreetAddressesEntityInterface, {__index = BasicDataTableInterface})


function StreetAddressesEntityInterface:remove(index)
    error("abstract method remove")
end


function StreetAddressesEntityInterface:add(address)
    error("abstract method add")
end


function StreetAddressesEntityInterface:update(address)
    error("abstract method update")
end


function StreetAddressesEntityInterface:getLastId()
    error("abstract method getLastId")
end


function StreetAddressesEntityInterface:getDefault()
    error("abstract method getDefault")
end


function StreetAddressesEntityInterface:setDefault(value)
    error("abstract method setDefault")
end

return StreetAddressesEntityInterface

