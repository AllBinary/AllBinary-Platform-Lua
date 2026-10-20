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
-- package org.allbinary.business.user.commerce.inventory.order

local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")

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
local OrderInterface = {}
OrderInterface.__index = OrderInterface
OrderInterface.className = "OrderInterface"


function OrderInterface:setShippingMethod(shippingType)
    error("abstract method setShippingMethod")
end


function OrderInterface:setPaymentMethod(value)
    error("abstract method setPaymentMethod")
end


function OrderInterface:setSpecial(special)
    error("abstract method setSpecial")
end


function OrderInterface:setStoreName(value)
    error("abstract method setStoreName")
end


function OrderInterface:setUserComments(value)
    error("abstract method setUserComments")
end


function OrderInterface:setUserCancelComments(value)
    error("abstract method setUserCancelComments")
end


function OrderInterface:setStoreComments(value)
    error("abstract method setStoreComments")
end


function OrderInterface:setStoreCancelComments(value)
    error("abstract method setStoreCancelComments")
end


function OrderInterface:getBasket()
    error("abstract method getBasket")
end


function OrderInterface:getShippingMethod()
    error("abstract method getShippingMethod")
end


function OrderInterface:getPaymentMethod()
    error("abstract method getPaymentMethod")
end


function OrderInterface:getSpecial()
    error("abstract method getSpecial")
end


function OrderInterface:getId()
    error("abstract method getId")
end


function OrderInterface:getStoreName()
    error("abstract method getStoreName")
end


function OrderInterface:getUserComments()
    error("abstract method getUserComments")
end


function OrderInterface:getUserCancelComments()
    error("abstract method getUserCancelComments")
end


function OrderInterface:getStoreComments()
    error("abstract method getStoreComments")
end


function OrderInterface:getStoreCancelComments()
    error("abstract method getStoreCancelComments")
end

return OrderInterface

