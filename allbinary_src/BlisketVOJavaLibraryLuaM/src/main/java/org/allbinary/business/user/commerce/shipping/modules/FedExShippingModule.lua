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
-- package org.allbinary.business.user.commerce.shipping.modules

local FedExShippingModule = {}
package.loaded["org.allbinary.business.user.commerce.shipping.modules.FedExShippingModule"] = FedExShippingModule

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

local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")

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

-- class table FedExShippingModule is declared before the requires
FedExShippingModule.__index = FedExShippingModule
FedExShippingModule.className = "FedExShippingModule"
FedExShippingModule.javaClassName = "org.allbinary.business.user.commerce.shipping.modules.FedExShippingModule"
FedExShippingModule.java_implements = " ShippingInterface "
FedExShippingModule.java_interfaces = function() return {ShippingInterface} end

function FedExShippingModule:_init_fields()
    self.name_f = "FedEx"
    self.description = "Fast Mail"
end


function FedExShippingModule._jinit(self)
    FedExShippingModule._init_fields(self)
    return self
end

function FedExShippingModule.new(...)
    local self = setmetatable({}, FedExShippingModule)
    FedExShippingModule._jinit(self, ...)
    return self
end


function FedExShippingModule:getCost(order)
        return Money.new()
end


function FedExShippingModule:getDescription()
        return self.description
end


function FedExShippingModule:getName()
        return self.name_f
end

return FedExShippingModule

