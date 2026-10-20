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
-- package org.allbinary.business.context.modules.storefront.statistics.inventory


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontInventoryStatisticsData = {}
StoreFrontInventoryStatisticsData.__index = StoreFrontInventoryStatisticsData
StoreFrontInventoryStatisticsData.className = "StoreFrontInventoryStatisticsData"

function StoreFrontInventoryStatisticsData:_init_fields()
    self.NAME = "STOREFRONT_INVENTORY_STATISTICS_NAME"
    self.NUMBEROFITEMS = "STOREFRONT_INVENTORY_STATISTICS_NUMBER_OF_ITEMS"
    self.TOTALVALUE = "STOREFRONT_INVENTORY_STATISTICS_TOTAL_VALUE"
end


function StoreFrontInventoryStatisticsData.getInstance()
        return StoreFrontInventoryStatisticsData.instance
end


function StoreFrontInventoryStatisticsData.new()
    local self = setmetatable({}, StoreFrontInventoryStatisticsData)
    self:_init_fields()
    return self
end

StoreFrontInventoryStatisticsData.instance = StoreFrontInventoryStatisticsData.new()

return StoreFrontInventoryStatisticsData

