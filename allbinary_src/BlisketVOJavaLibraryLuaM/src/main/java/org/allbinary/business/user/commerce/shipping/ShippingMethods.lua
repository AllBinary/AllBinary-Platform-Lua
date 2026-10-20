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
-- package org.allbinary.business.user.commerce.shipping

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ShippingMethodsInterface = require("org.allbinary.business.user.commerce.shipping.ShippingMethodsInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ShippingMethods = {}
ShippingMethods.__index = ShippingMethods
ShippingMethods.className = "ShippingMethods"

function ShippingMethods:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.shippingVector = nil
    self.defaultShippingMethodInterface = nil
end


function ShippingMethods.new(abeClientInformation, storeFrontInterface)
    local self = setmetatable({}, ShippingMethods)
    self:_init_fields()
        self.defaultShippingMethodInterface = ShippingMethodsFactory.new(abeClientInformation, storeFrontInterface):getDefaultInstance()
        self.shippingVector = ShippingMethodsFactory.new(abeClientInformation, storeFrontInterface):getInstance()
    return self
end


function ShippingMethods:get()
        return self.shippingVector
end


-- throws Exception
function ShippingMethods:getShippingInterface(name)
        local shipping = nil
        local size = self.shippingVector:size()
        for index = 0, size - 1 do
            shipping = self.shippingVector:get(index)
            if ((name < shipping:getName() and -1) or (name > shipping:getName() and 1) or 0) == 0 then
                return shipping
            end
        end
        local error = "Error Finding Shipping: " .. name
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SHIPPINGERROR) then
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "getShippingInterface(String name)")
        end
        error(java_exception("Exception", error), 0)
end


-- throws Exception
function ShippingMethods:getDefault()
        return self.defaultShippingMethodInterface
end

return ShippingMethods

