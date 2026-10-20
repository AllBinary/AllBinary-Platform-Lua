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
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")

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
local ShippingMethodsInterface = {}
ShippingMethodsInterface.__index = ShippingMethodsInterface
ShippingMethodsInterface.className = "ShippingMethodsInterface"


function ShippingMethodsInterface:get()
    error("abstract method get")
end


-- throws Exception
function ShippingMethodsInterface:getShippingInterface(name)
    error("abstract method getShippingInterface")
end


-- throws Exception
function ShippingMethodsInterface:getDefault()
    error("abstract method getDefault")
end

return ShippingMethodsInterface

