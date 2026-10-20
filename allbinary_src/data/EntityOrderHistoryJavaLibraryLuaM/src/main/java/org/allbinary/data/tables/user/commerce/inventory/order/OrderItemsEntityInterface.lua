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
-- package org.allbinary.data.tables.user.commerce.inventory.order

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasketReview = require("org.allbinary.business.user.commerce.inventory.basket.BasketReview")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
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
local OrderItemsEntityInterface = {}
OrderItemsEntityInterface.__index = OrderItemsEntityInterface
OrderItemsEntityInterface.className = "OrderItemsEntityInterface"
setmetatable(OrderItemsEntityInterface, {__index = BasicDataTableInterface})


function OrderItemsEntityInterface:setStatus(orderId, groupId, status)
    error("abstract method setStatus")
end


function OrderItemsEntityInterface:isEverythingShipped(orderId)
    error("abstract method isEverythingShipped")
end


function OrderItemsEntityInterface:getBasketReview(orderId)
    error("abstract method getBasketReview")
end


function OrderItemsEntityInterface:insert(userName, order)
    error("abstract method insert")
end


-- Java overloaded method: Lua keeps the last definition
function OrderItemsEntityInterface:insert(values)
    error("abstract method insert")
end

return OrderItemsEntityInterface

