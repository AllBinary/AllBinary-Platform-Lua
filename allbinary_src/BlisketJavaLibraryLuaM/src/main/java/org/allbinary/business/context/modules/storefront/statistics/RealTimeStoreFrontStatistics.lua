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

local RealTimeStoreFrontStatistics = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatistics"] = RealTimeStoreFrontStatistics

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StoreFrontAdvertisementsStatistics = java_lazy("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatistics")
local StoreFrontAdvertisementsStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.advertisements.StoreFrontAdvertisementsStatisticsInterface")
local StoreFrontInventoryStatistics = java_lazy("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics")
local StoreFrontInventoryStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontOrdersHistoryStatistics = java_lazy("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatistics")
local StoreFrontOrdersHistoryStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.orders.history.StoreFrontOrdersHistoryStatisticsInterface")
local StoreFrontUsersStatistics = java_lazy("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatistics")
local StoreFrontUsersStatisticsInterface = java_lazy("org.allbinary.business.context.modules.storefront.statistics.users.StoreFrontUsersStatisticsInterface")
local StoreFrontStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.StoreFrontStatisticsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table RealTimeStoreFrontStatistics is declared before the requires
RealTimeStoreFrontStatistics.__index = RealTimeStoreFrontStatistics
RealTimeStoreFrontStatistics.className = "RealTimeStoreFrontStatistics"
RealTimeStoreFrontStatistics.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.RealTimeStoreFrontStatistics"
RealTimeStoreFrontStatistics.java_implements = " StoreFrontStatisticsInterface "
RealTimeStoreFrontStatistics.java_interfaces = function() return {StoreFrontStatisticsInterface} end

function RealTimeStoreFrontStatistics:_init_fields()
    if self.storeFrontAdvertisementsStatisticsInterface == nil then self.storeFrontAdvertisementsStatisticsInterface = nil end
    if self.storeFrontUsersStatisticsInterface == nil then self.storeFrontUsersStatisticsInterface = nil end
    if self.storeFrontInventoryStatisticsInterface == nil then self.storeFrontInventoryStatisticsInterface = nil end
    if self.storeFrontOrderHistoryStatisticsInterface == nil then self.storeFrontOrderHistoryStatisticsInterface = nil end
end


function RealTimeStoreFrontStatistics._jinit(self, storeFrontInterface)
    RealTimeStoreFrontStatistics._init_fields(self)
        self.storeFrontAdvertisementsStatisticsInterface = StoreFrontAdvertisementsStatistics.new(storeFrontInterface)
        self.storeFrontUsersStatisticsInterface = StoreFrontUsersStatistics.new(storeFrontInterface)
        self.storeFrontInventoryStatisticsInterface = StoreFrontInventoryStatistics.new(storeFrontInterface)
        self.storeFrontOrderHistoryStatisticsInterface = StoreFrontOrdersHistoryStatistics.new(storeFrontInterface)
    return self
end

function RealTimeStoreFrontStatistics.new(...)
    local self = setmetatable({}, RealTimeStoreFrontStatistics)
    RealTimeStoreFrontStatistics._jinit(self, ...)
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

