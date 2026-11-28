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

local StoreFrontInventoryStatistics = {}
package.loaded["org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics"] = StoreFrontInventoryStatistics

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local InventoryEntityInterface = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StoreFrontInventoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")
local StoreFrontInventoryStatisticsData = java_lazy("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsData")

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

-- class table StoreFrontInventoryStatistics is declared before the requires
StoreFrontInventoryStatistics.__index = StoreFrontInventoryStatistics
StoreFrontInventoryStatistics.className = "StoreFrontInventoryStatistics"
StoreFrontInventoryStatistics.javaClassName = "org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatistics"
StoreFrontInventoryStatistics.java_implements = " StoreFrontInventoryStatisticsInterface "
StoreFrontInventoryStatistics.java_interfaces = function() return {StoreFrontInventoryStatisticsInterface} end

function StoreFrontInventoryStatistics:_init_fields()
    if self.totalNumberOfItems == nil then self.totalNumberOfItems = 0 end
    if self.totalInventorySaleValueMoney == nil then self.totalInventorySaleValueMoney = nil end
end


function StoreFrontInventoryStatistics._jinit(self, storeFrontInterface)
    StoreFrontInventoryStatistics._init_fields(self)
        self.totalInventorySaleValueMoney = Money.new()
        local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
        local itemVector = inventoryEntityInterface:getItems(storeFrontInterface)
        local size = itemVector:size()
        for index = 0, size - 1 do
            local itemInterface = itemVector:get(index)
            local numberInStock = require("allbinary_java").number_value(tostring(itemInterface:getNumber()), "intValue")
            self.totalNumberOfItems = self.totalNumberOfItems + numberInStock
            local itemPriceMoney = itemInterface:getPrice()
            itemPriceMoney:multiply(numberInStock)
            self.totalInventorySaleValueMoney:add(tostring(itemPriceMoney))
        end
    return self
end

function StoreFrontInventoryStatistics.new(...)
    local self = setmetatable({}, StoreFrontInventoryStatistics)
    StoreFrontInventoryStatistics._jinit(self, ...)
    return self
end


function StoreFrontInventoryStatistics:getNumber()
        return self.totalNumberOfItems
end


function StoreFrontInventoryStatistics:getTotal()
        return self.totalInventorySaleValueMoney
end


function StoreFrontInventoryStatistics:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(StoreFrontInventoryStatisticsData.getInstance().NUMBEROFITEMS, tostring(self:getNumber()))
        hashMap:put(StoreFrontInventoryStatisticsData.getInstance().TOTALVALUE, tostring(self:getTotal()))
        return hashMap
end


function StoreFrontInventoryStatistics:toVector()
        return nil
end


function StoreFrontInventoryStatistics:getKey()
        return nil
end

return StoreFrontInventoryStatistics

