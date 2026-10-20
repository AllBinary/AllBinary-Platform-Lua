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

local OrderIdGenerator = require("org.allbinary.data.generator.OrderIdGenerator")
local OrderHistoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity")
local OrderItemsEntity = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderProcessorUtil = {}
OrderProcessorUtil.__index = OrderProcessorUtil
OrderProcessorUtil.className = "OrderProcessorUtil"

function OrderProcessorUtil:_init_fields()
    self.ORDER_PROCESSED = "Order Processed"
end

function OrderProcessorUtil.new()
    local self = setmetatable({}, OrderProcessorUtil)
    self:_init_fields()
    return self
end


function OrderProcessorUtil.getInstance()
        return OrderProcessorUtil.instance
end


-- throws Exception
function OrderProcessorUtil:process(userName, order)
        local orderItems = OrderItemsEntity.new()
        local orderHistory = OrderHistoryEntity.new()
        order:setId(OrderIdGenerator.new():getNext())
        orderItems:insert(userName, order)
        orderHistory:insert(userName, order)
        return self.ORDER_PROCESSED
end

OrderProcessorUtil.instance = OrderProcessorUtil.new()

return OrderProcessorUtil

