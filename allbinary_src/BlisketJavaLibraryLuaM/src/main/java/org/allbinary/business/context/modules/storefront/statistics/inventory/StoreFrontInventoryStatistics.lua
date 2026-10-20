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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local InventoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StoreFrontInventoryStatisticsInterface = require("org.allbinary.business.context.modules.storefront.statistics.inventory.StoreFrontInventoryStatisticsInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreFrontInventoryStatistics = {}
StoreFrontInventoryStatistics.__index = StoreFrontInventoryStatistics
StoreFrontInventoryStatistics.className = "StoreFrontInventoryStatistics"

function StoreFrontInventoryStatistics:_init_fields()
    self.totalNumberOfItems = 0
    self.totalInventorySaleValueMoney = nil
end


function StoreFrontInventoryStatistics.new(storeFrontInterface)
    local self = setmetatable({}, StoreFrontInventoryStatistics)
    self:_init_fields()
        self.totalInventorySaleValueMoney = Money.new()
        local inventoryEntityInterface = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
        local itemVector = inventoryEntityInterface:getItems(storeFrontInterface)
        local size = itemVector:size()
        for index = 0, size - 1 do
            local itemInterface = itemVector:get(index)
            local numberInStock = math.tointeger(tostring(itemInterface:getNumber()) // 1)
            self.totalNumberOfItems = self.totalNumberOfItems + numberInStock
            local itemPriceMoney = itemInterface:getPrice()
            itemPriceMoney:multiply(numberInStock)
            self.totalInventorySaleValueMoney:add(tostring(itemPriceMoney))
        end
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

