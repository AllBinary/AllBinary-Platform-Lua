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
-- package org.allbinary.business.user.commerce.inventory.basket


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasketData = {}
BasketData.__index = BasketData
BasketData.className = "BasketData"


function BasketData.new()
    local self = setmetatable({}, BasketData)
    return self
end

BasketData.BASKET = "BASKET"
BasketData.NAME = "NAME"
BasketData.BASKETREVIEW = "BASKET_REVIEW"
BasketData.TOTALWEIGHT = "BASKET_TOTALWEIGTH"
BasketData.ITEMTOTAL = "BASKET_ITEMTOTAL"
BasketData.ITEMTOTALINBASKET = "BASKET_ITEMTOTALINBASKET"
BasketData.SUBTOTAL = "BASKET_SUBTOTAL"
BasketData.ISEMPTY = "BASKET_ISEMPTY"
BasketData.INSERT = "BASKET_INSERT"
BasketData.DELETE = "BASKET_DELETE"
BasketData.ADJUST = "BASKET_ADJUST"

return BasketData

