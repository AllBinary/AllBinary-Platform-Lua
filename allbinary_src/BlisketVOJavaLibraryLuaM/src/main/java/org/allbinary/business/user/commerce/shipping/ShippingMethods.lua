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

local ShippingMethods = {}
package.loaded["org.allbinary.business.user.commerce.shipping.ShippingMethods"] = ShippingMethods

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ShippingInterface = java_lazy("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ShippingMethodsInterface = require("org.allbinary.business.user.commerce.shipping.ShippingMethodsInterface")
local ShippingMethodsFactory = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodsFactory")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ShippingMethods is declared before the requires
ShippingMethods.__index = ShippingMethods
ShippingMethods.className = "ShippingMethods"
ShippingMethods.javaClassName = "org.allbinary.business.user.commerce.shipping.ShippingMethods"
ShippingMethods.java_implements = " ShippingMethodsInterface "
ShippingMethods.java_interfaces = function() return {ShippingMethodsInterface} end

function ShippingMethods:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.shippingVector == nil then self.shippingVector = nil end
    if self.defaultShippingMethodInterface == nil then self.defaultShippingMethodInterface = nil end
end


function ShippingMethods._jinit(self, abeClientInformation, storeFrontInterface)
    ShippingMethods._init_fields(self)
        self.defaultShippingMethodInterface = ShippingMethodsFactory.new(abeClientInformation, storeFrontInterface):getDefaultInstance()
        self.shippingVector = ShippingMethodsFactory.new(abeClientInformation, storeFrontInterface):getInstance()
    return self
end

function ShippingMethods.new(...)
    local self = setmetatable({}, ShippingMethods)
    ShippingMethods._jinit(self, ...)
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
            if rawequal(((name < shipping:getName() and -1) or (name > shipping:getName() and 1) or 0), 0) then
                return shipping
            end
        end
        local error = require("allbinary_java").to_string("Error Finding Shipping: ") .. require("allbinary_java").to_string(name)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SHIPPINGERROR) then
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "getShippingInterface(String name)")
        end
        error(require("java.lang.Exception").new(error), 0)
end


-- throws Exception
function ShippingMethods:getDefault()
        return self.defaultShippingMethodInterface
end

return ShippingMethods

