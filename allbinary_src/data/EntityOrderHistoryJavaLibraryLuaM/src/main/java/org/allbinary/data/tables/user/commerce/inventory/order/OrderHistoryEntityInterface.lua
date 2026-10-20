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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
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
local OrderHistoryEntityInterface = {}
OrderHistoryEntityInterface.__index = OrderHistoryEntityInterface
OrderHistoryEntityInterface.className = "OrderHistoryEntityInterface"
setmetatable(OrderHistoryEntityInterface, {__index = BasicDataTableInterface})


function OrderHistoryEntityInterface:insert(userName, order)
    error("abstract method insert")
end


function OrderHistoryEntityInterface:setStatus(orderId, status)
    error("abstract method setStatus")
end


function OrderHistoryEntityInterface:setPaymentMethod(orderId, status)
    error("abstract method setPaymentMethod")
end


-- throws Exception
function OrderHistoryEntityInterface:getStoreOrders(storeFrontInterface)
    error("abstract method getStoreOrders")
end


-- throws Exception
function OrderHistoryEntityInterface:getOrders(userName)
    error("abstract method getOrders")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function OrderHistoryEntityInterface:getOrders(status, fromDate, toDate)
    error("abstract method getOrders")
end


-- throws Exception
function OrderHistoryEntityInterface:getOrder(id)
    error("abstract method getOrder")
end


-- throws Exception
function OrderHistoryEntityInterface:update(whereHashMap, orderHashMap)
    error("abstract method update")
end

return OrderHistoryEntityInterface

