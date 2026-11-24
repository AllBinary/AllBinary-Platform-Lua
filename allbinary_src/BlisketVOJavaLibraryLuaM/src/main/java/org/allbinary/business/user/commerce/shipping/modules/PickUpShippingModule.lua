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

local PickUpShippingModule = {}
package.loaded["org.allbinary.business.user.commerce.shipping.modules.PickUpShippingModule"] = PickUpShippingModule

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
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
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

-- class table PickUpShippingModule is declared before the requires
PickUpShippingModule.__index = PickUpShippingModule
PickUpShippingModule.className = "PickUpShippingModule"
PickUpShippingModule.javaClassName = "org.allbinary.business.user.commerce.shipping.modules.PickUpShippingModule"
PickUpShippingModule.java_implements = " ShippingInterface "
PickUpShippingModule.java_interfaces = function() return {ShippingInterface} end

function PickUpShippingModule:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.name_f = "No Shipping (For Pickup Orders Only)"
    self.description = "This shipping method is for pickup orders only."
end


function PickUpShippingModule._jinit(self)
    PickUpShippingModule._init_fields(self)
    return self
end

function PickUpShippingModule.new(...)
    local self = setmetatable({}, PickUpShippingModule)
    PickUpShippingModule._jinit(self, ...)
    return self
end


function PickUpShippingModule:getCost(order)
        return Money.new()
end


function PickUpShippingModule:getDescription()
        return self.description
end


function PickUpShippingModule:getName()
        return self.name_f
end

return PickUpShippingModule

