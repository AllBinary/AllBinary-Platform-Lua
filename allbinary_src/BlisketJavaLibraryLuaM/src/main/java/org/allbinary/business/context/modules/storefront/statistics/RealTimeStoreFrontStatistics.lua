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
-- package org.allbinary.business.context.modules.storefront.statistics

local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StoreFrontAdvertisementsStatistics = require("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatistics")
local StoreFrontAdvertisementsStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface")
local StoreFrontInventoryStatistics = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics")
local StoreFrontInventoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontOrdersHistoryStatistics = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatistics")
local StoreFrontOrdersHistoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")
local StoreFrontUsersStatistics = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics")
local StoreFrontUsersStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")
local StoreFrontStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.StoreFrontStatisticsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RealTimeStoreFrontStatistics = {}
RealTimeStoreFrontStatistics.__index = RealTimeStoreFrontStatistics
RealTimeStoreFrontStatistics.className = "RealTimeStoreFrontStatistics"

function RealTimeStoreFrontStatistics:_init_fields()
    self.storeFrontAdvertisementsStatisticsInterface = nil
    self.storeFrontUsersStatisticsInterface = nil
    self.storeFrontInventoryStatisticsInterface = nil
    self.storeFrontOrderHistoryStatisticsInterface = nil
end


function RealTimeStoreFrontStatistics.new(storeFrontInterface)
    local self = setmetatable({}, RealTimeStoreFrontStatistics)
    self:_init_fields()
        self.storeFrontAdvertisementsStatisticsInterface = StoreFrontAdvertisementsStatistics.new(storeFrontInterface)
        self.storeFrontUsersStatisticsInterface = StoreFrontUsersStatistics.new(storeFrontInterface)
        self.storeFrontInventoryStatisticsInterface = StoreFrontInventoryStatistics.new(storeFrontInterface)
        self.storeFrontOrderHistoryStatisticsInterface = StoreFrontOrdersHistoryStatistics.new(storeFrontInterface)
    return self
end


function RealTimeStoreFrontStatistics:getAdvertisements()
        return self.storeFrontAdvertisementsStatisticsInterface
end


function RealTimeStoreFrontStatistics:getUsers()
        return self.storeFrontUsersStatisticsInterface
end


function RealTimeStoreFrontStatistics:getInventory()
        return self.storeFrontInventoryStatisticsInterface
end


function RealTimeStoreFrontStatistics:getOrders()
        return self.storeFrontOrderHistoryStatisticsInterface
end

return RealTimeStoreFrontStatistics

