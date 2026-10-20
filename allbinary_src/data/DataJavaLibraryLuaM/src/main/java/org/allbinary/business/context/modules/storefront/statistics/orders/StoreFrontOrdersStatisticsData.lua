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
-- package org.allbinary.business.context.modules.storefront.statistics.orders


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontOrdersStatisticsData = {}
StoreFrontOrdersStatisticsData.__index = StoreFrontOrdersStatisticsData
StoreFrontOrdersStatisticsData.className = "StoreFrontOrdersStatisticsData"

function StoreFrontOrdersStatisticsData:_init_fields()
    self.NAME = "STOREFRONT_ORDERS_STATISTICS_NAME"
end


function StoreFrontOrdersStatisticsData.getInstance()
        return StoreFrontOrdersStatisticsData.instance
end


function StoreFrontOrdersStatisticsData.new()
    local self = setmetatable({}, StoreFrontOrdersStatisticsData)
    self:_init_fields()
    return self
end

StoreFrontOrdersStatisticsData.instance = StoreFrontOrdersStatisticsData.new()

return StoreFrontOrdersStatisticsData

