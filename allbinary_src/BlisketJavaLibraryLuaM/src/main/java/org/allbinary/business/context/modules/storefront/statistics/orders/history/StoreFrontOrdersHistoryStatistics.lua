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
-- package org.allbinary.business.context.modules.storefront.statistics.orders.history

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local OrderHistoryInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderHistoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StoreFrontOrdersHistoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontOrdersHistoryStatistics = {}
StoreFrontOrdersHistoryStatistics.__index = StoreFrontOrdersHistoryStatistics
StoreFrontOrdersHistoryStatistics.className = "StoreFrontOrdersHistoryStatistics"

function StoreFrontOrdersHistoryStatistics:_init_fields()
    self.numberOfOrdersLong = nil
    self.subTotalMoney = nil
    self.shippingCostMoney = nil
    self.taxesMoney = nil
    self.totalMoney = nil
end


function StoreFrontOrdersHistoryStatistics.new(storeFrontInterface)
    local self = setmetatable({}, StoreFrontOrdersHistoryStatistics)
    self:_init_fields()
        self.subTotalMoney = Money.new()
        self.shippingCostMoney = Money.new()
        self.taxesMoney = Money.new()
        self.totalMoney = Money.new()
        local orderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance()
        local orderHistoryInterfaceVector = orderHistoryEntityInterface:getStoreOrders(storeFrontInterface)
        local numberOfOrders = 0
        local orderHistoryInterface = nil
        local size = orderHistoryInterfaceVector:size()
        for index = 0, size - 1 do
            orderHistoryInterface = orderHistoryInterfaceVector:get(index)
            numberOfOrders = numberOfOrders + 1
            self.subTotalMoney:add(orderHistoryInterface:getSubTotal())
            self.shippingCostMoney:add(orderHistoryInterface:getShippingCost())
            self.taxesMoney:add(orderHistoryInterface:getTaxes())
            self.totalMoney:add(orderHistoryInterface:getTotal())
        end
        self.numberOfOrdersLong = numberOfOrders
    return self
end


function StoreFrontOrdersHistoryStatistics:getNumberOfOrders()
        return self.numberOfOrdersLong
end


function StoreFrontOrdersHistoryStatistics:getSubTotal()
        return self.subTotalMoney
end


function StoreFrontOrdersHistoryStatistics:getShippingCost()
        return self.shippingCostMoney
end


function StoreFrontOrdersHistoryStatistics:getTaxes()
        return self.taxesMoney
end


function StoreFrontOrdersHistoryStatistics:getTotal()
        return self.totalMoney
end


function StoreFrontOrdersHistoryStatistics:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        local storeFrontOrdersHistoryStatisticsData = StoreFrontOrdersHistoryStatisticsData.getInstance()
        hashMap:put(storeFrontOrdersHistoryStatisticsData.NUMBEROFORDERS, tostring(self:getNumberOfOrders()))
        hashMap:put(storeFrontOrdersHistoryStatisticsData.SUBTOTAL, tostring(self:getSubTotal()))
        hashMap:put(storeFrontOrdersHistoryStatisticsData.SHIPPINGCOST, tostring(self:getShippingCost()))
        hashMap:put(storeFrontOrdersHistoryStatisticsData.TAXES, tostring(self:getTaxes()))
        hashMap:put(storeFrontOrdersHistoryStatisticsData.TOTAL, tostring(self:getTotal()))
        return hashMap
end


function StoreFrontOrdersHistoryStatistics:toVector()
        return nil
end


function StoreFrontOrdersHistoryStatistics:getKey()
        return nil
end

return StoreFrontOrdersHistoryStatistics

