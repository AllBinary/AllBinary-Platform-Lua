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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontOrdersHistoryStatisticsData = {}
StoreFrontOrdersHistoryStatisticsData.__index = StoreFrontOrdersHistoryStatisticsData
StoreFrontOrdersHistoryStatisticsData.className = "StoreFrontOrdersHistoryStatisticsData"

function StoreFrontOrdersHistoryStatisticsData:_init_fields()
    self.NAME = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NAME"
    self.NUMBEROFORDERS = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NUMBER_OF_ORDERS"
    self.SUBTOTAL = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SUBTOTAL"
    self.SHIPPINGCOST = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SHIPPINGCOST"
    self.TAXES = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TAXES"
    self.TOTAL = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TOTAL"
end


function StoreFrontOrdersHistoryStatisticsData.getInstance()
        return StoreFrontOrdersHistoryStatisticsData.instance
end


function StoreFrontOrdersHistoryStatisticsData.new()
    local self = setmetatable({}, StoreFrontOrdersHistoryStatisticsData)
    self:_init_fields()
    return self
end

StoreFrontOrdersHistoryStatisticsData.instance = StoreFrontOrdersHistoryStatisticsData.new()

return StoreFrontOrdersHistoryStatisticsData

