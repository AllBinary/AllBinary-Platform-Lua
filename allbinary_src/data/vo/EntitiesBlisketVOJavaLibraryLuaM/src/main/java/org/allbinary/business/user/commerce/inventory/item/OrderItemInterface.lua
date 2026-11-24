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
-- package org.allbinary.business.user.commerce.inventory.item

local OrderItemInterface = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.OrderItemInterface"] = OrderItemInterface

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

local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")

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

-- Java interface
-- class table OrderItemInterface is declared before the requires
OrderItemInterface.__index = OrderItemInterface
OrderItemInterface.className = "OrderItemInterface"
OrderItemInterface.javaClassName = "org.allbinary.business.user.commerce.inventory.item.OrderItemInterface"
setmetatable(OrderItemInterface, {__index = ItemInterface})
OrderItemInterface.java_interfaces = function() return {ItemInterface} end


function OrderItemInterface:setGroup(value)
    error("abstract method setGroup")
end


function OrderItemInterface:setTax(value)
    error("abstract method setTax")
end


function OrderItemInterface:setShippingType(value)
    error("abstract method setShippingType")
end


function OrderItemInterface:setShippingCost(value)
    error("abstract method setShippingCost")
end


function OrderItemInterface:setShippingAddress(value)
    error("abstract method setShippingAddress")
end


function OrderItemInterface:setSpecial(value)
    error("abstract method setSpecial")
end


function OrderItemInterface:getGroup()
    error("abstract method getGroup")
end


function OrderItemInterface:getTax()
    error("abstract method getTax")
end


function OrderItemInterface:getShippingType()
    error("abstract method getShippingType")
end


function OrderItemInterface:getShippingCost()
    error("abstract method getShippingCost")
end


function OrderItemInterface:getShippingAddress()
    error("abstract method getShippingAddress")
end


function OrderItemInterface:getSpecial()
    error("abstract method getSpecial")
end

return OrderItemInterface

