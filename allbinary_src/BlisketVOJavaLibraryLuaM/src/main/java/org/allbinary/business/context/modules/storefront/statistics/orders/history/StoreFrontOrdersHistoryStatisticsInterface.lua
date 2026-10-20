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

local Money = require("org.allbinary.business.user.commerce.money.Money")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")

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
local StoreFrontOrdersHistoryStatisticsInterface = {}
StoreFrontOrdersHistoryStatisticsInterface.__index = StoreFrontOrdersHistoryStatisticsInterface
StoreFrontOrdersHistoryStatisticsInterface.className = "StoreFrontOrdersHistoryStatisticsInterface"
setmetatable(StoreFrontOrdersHistoryStatisticsInterface, {__index = TableMappingInterface})


function StoreFrontOrdersHistoryStatisticsInterface:getNumberOfOrders()
    error("abstract method getNumberOfOrders")
end


function StoreFrontOrdersHistoryStatisticsInterface:getSubTotal()
    error("abstract method getSubTotal")
end


function StoreFrontOrdersHistoryStatisticsInterface:getShippingCost()
    error("abstract method getShippingCost")
end


function StoreFrontOrdersHistoryStatisticsInterface:getTaxes()
    error("abstract method getTaxes")
end


function StoreFrontOrdersHistoryStatisticsInterface:getTotal()
    error("abstract method getTotal")
end

return StoreFrontOrdersHistoryStatisticsInterface

