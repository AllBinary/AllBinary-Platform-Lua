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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderData = {}
OrderData.__index = OrderData
OrderData.className = "OrderData"

function OrderData.new()
    local self = setmetatable({}, OrderData)
    return self
end

OrderData.ORDERS = "ORDERS"
OrderData.ORDER = "ORDER"
OrderData.ID = "ORDER_ID"
OrderData.CUSTOMERCOMMENT = "ORDER_CUSTOMER_COMMENT"
OrderData.CUSTOMERCANCELCOMMENT = "ORDER_CUSTOMER_CANCEL_COMMENT"
OrderData.STORECOMMENT = "ORDER_STORE_COMMENT"
OrderData.STORECANCELCOMMENT = "ORDER_STORE_CANCEL_COMMENT"

return OrderData

