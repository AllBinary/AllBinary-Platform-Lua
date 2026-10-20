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

local StoreFrontAdvertisementsStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface")
local StoreFrontInventoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontOrdersHistoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")
local StoreFrontUsersStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")

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
local StoreFrontStatisticsInterface = {}
StoreFrontStatisticsInterface.__index = StoreFrontStatisticsInterface
StoreFrontStatisticsInterface.className = "StoreFrontStatisticsInterface"


function StoreFrontStatisticsInterface:getAdvertisements()
    error("abstract method getAdvertisements")
end


function StoreFrontStatisticsInterface:getUsers()
    error("abstract method getUsers")
end


function StoreFrontStatisticsInterface:getInventory()
    error("abstract method getInventory")
end


function StoreFrontStatisticsInterface:getOrders()
    error("abstract method getOrders")
end

return StoreFrontStatisticsInterface

