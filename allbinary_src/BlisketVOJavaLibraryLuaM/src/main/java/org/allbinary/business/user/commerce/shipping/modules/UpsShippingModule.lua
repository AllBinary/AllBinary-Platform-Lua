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

local UpsShippingModule = {}
package.loaded["org.allbinary.business.user.commerce.shipping.modules.UpsShippingModule"] = UpsShippingModule

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

-- class table UpsShippingModule is declared before the requires
UpsShippingModule.__index = UpsShippingModule
UpsShippingModule.className = "UpsShippingModule"
UpsShippingModule.javaClassName = "org.allbinary.business.user.commerce.shipping.modules.UpsShippingModule"
UpsShippingModule.java_implements = " ShippingInterface "
UpsShippingModule.java_interfaces = function() return {ShippingInterface} end

function UpsShippingModule:_init_fields()
    self.name_f = "UPS"
    self.description = "Brown Mail"
end


function UpsShippingModule._jinit(self)
    UpsShippingModule._init_fields(self)
    return self
end

function UpsShippingModule.new(...)
    local self = setmetatable({}, UpsShippingModule)
    UpsShippingModule._jinit(self, ...)
    return self
end


function UpsShippingModule:getCost(order)
        return Money.new()
end


function UpsShippingModule:getDescription()
        return self.description
end


function UpsShippingModule:getName()
        return self.name_f
end

return UpsShippingModule

