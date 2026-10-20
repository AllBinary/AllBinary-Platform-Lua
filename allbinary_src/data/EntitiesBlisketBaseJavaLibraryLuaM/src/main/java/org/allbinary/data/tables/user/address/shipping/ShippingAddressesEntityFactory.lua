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
-- package org.allbinary.data.tables.user.address.shipping

local StreetAddressesEntity = require("org.allbinary.data.tables.user.address.StreetAddressesEntity")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShippingAddressesEntityFactory = {}
ShippingAddressesEntityFactory.__index = ShippingAddressesEntityFactory
ShippingAddressesEntityFactory.className = "ShippingAddressesEntityFactory"

function ShippingAddressesEntityFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ShippingAddressesEntityFactory.getInstance()
        return ShippingAddressesEntityFactory.instance
end


function ShippingAddressesEntityFactory.new()
    local self = setmetatable({}, ShippingAddressesEntityFactory)
    self:_init_fields()
    return self
end


-- Java overloaded method: Lua keeps the last definition
function ShippingAddressesEntityFactory:getInstance(userName)
        local try_ok, try_error = pcall(function()
            return ShippingAddressesEntity.new(userName)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().ENTITYFACTORYERROR) then
                self.logUtil:put(commonStrings.EXCEPTION, self, "getShippingAddressesEntityInstance()", e)
            end
            return nil
        end
end

ShippingAddressesEntityFactory.instance = ShippingAddressesEntityFactory.new()

return ShippingAddressesEntityFactory

