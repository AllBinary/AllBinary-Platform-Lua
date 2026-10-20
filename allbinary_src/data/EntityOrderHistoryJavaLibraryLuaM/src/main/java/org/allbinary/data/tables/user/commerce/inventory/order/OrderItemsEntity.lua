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
-- package org.allbinary.data.tables.user.commerce.inventory.order

-- local HashMap = require("java.util.HashMap")
-- local ListIterator = require("java.util.ListIterator")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local HistoryDbInitInfo = require("org.allbinary.business.init.db.HistoryDbInitInfo")
local StdUtil = require("org.allbinary.logic.StdUtil")
local UserData = require("org.allbinary.business.user.UserData")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local BasketReview = require("org.allbinary.business.user.commerce.inventory.basket.BasketReview")
local BasicItemData = require("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local Item = require("org.allbinary.business.user.commerce.inventory.item.Item")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderItemIdGenerator = require("org.allbinary.data.generator.OrderItemIdGenerator")
local TableDataFactory = require("org.allbinary.data.tables.TableDataFactory")
local InventoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local OrderItemsEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderItemsEntity = {}
OrderItemsEntity.__index = OrderItemsEntity
OrderItemsEntity.className = "OrderItemsEntity"
setmetatable(OrderItemsEntity, {__index = AbSqlBean})

function OrderItemsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "orderitems"
end


function OrderItemsEntity.new()
    local self = setmetatable(AbSqlBean.new(HistoryDbInitInfo.new()), OrderItemsEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function OrderItemsEntity:insert(userName, order)
        local vector = BasicArrayListD.new()
        local try_ok, try_error = pcall(function()
            local basket = order:getBasket()
            local items = basket:getIds()
            local ZERO_STRING = TableDataFactory.getInstance().ZERO_STRING
            local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
            local inventoryEntity = InventoryEntityFactory.getInstance():getInventoryEntityInstance()
            local itemsArray = items:toArray()
            local itemsSize = (itemsArray.n or #itemsArray)
            for i = 0, itemsSize - 1 do
                local item = itemsArray[i + 1]
                local itemInterface = inventoryEntity:getItem(item)
                vector = BasicArrayListD.new()
                vector:add(OrderItemIdGenerator.new():getNext())
                vector:add(order:getId())
                vector:add(TableDataFactory.getInstance().INTEGER_MAX_VALUE_STRING)
                vector:add(userName)
                vector:add(order:getStoreName())
                vector:add(itemInterface:getId())
                vector:add(tostring(basket:getNumberOf(item)))
                vector:add(itemInterface:getNewOrUsed())
                vector:add(itemInterface:getSummary())
                vector:add(itemInterface:getDistributor())
                vector:add(itemInterface:getIdUsedByDistributor())
                vector:add(itemInterface:getProducedBy())
                vector:add(itemInterface:getProductionDate())
                vector:add(itemInterface:getStartProductionDate())
                vector:add(itemInterface:getDescription())
                vector:add(itemInterface:getKeywords())
                vector:add(itemInterface:getCategory())
                vector:add(itemInterface:getType())
                vector:add(itemInterface:getSmallImage())
                vector:add(itemInterface:getMediumImage())
                vector:add(itemInterface:getLargeImage())
                vector:add(itemInterface:getWeight())
                vector:add(tostring(itemInterface:getPrice()))
                vector:add(itemInterface:getComment())
                vector:add(itemInterface:getCustoms())
                vector:add(itemInterface:getDownloads())
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(EMPTY_STRING)
                vector:add(ZERO_STRING)
                vector:add(ZERO_STRING)
                vector:add(ZERO_STRING)
                vector:add(ZERO_STRING)
                self:insert(vector)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF("Command Success Added: " .. tostring(items:size()), self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put("Command Failed: " .. tostring(vector), self, self.INSERT, e)
            end
        end
end


function OrderItemsEntity:setStatus(orderId, groupId, status)
        local try_ok, try_error = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            local updateHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(OrderData.ID, orderId)
            whereHashMap:put(ShippingMethodData.GROUP, groupId)
            updateHashMap:put(OrderHistoryData.STATUS, status)
            AbSqlBean.updateWhere(self, whereHashMap, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setStatus", e)
            end
        end
end


function OrderItemsEntity:isEverythingShipped(orderId)
        local try_ok, try_error = pcall(function()
            local itemStatusVector = AbSqlBean.getColumnWhere(self, OrderHistoryData.STATUS, OrderData.ID, orderId)
            local size = itemStatusVector:size()
            for index = 0, size - 1 do
                local status = itemStatusVector:get(index)
                if ((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0) ~= 0 then
                    return false
                end
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "isEverythingShipped", e)
            end
            return false
        end
end


function OrderItemsEntity:getBasketReview(orderId)
        local try_ok, try_error = pcall(function()
            local basketReview = BasketReview.new()
            local keyValues = StdUtil.getInstance():createHashMap()
            keyValues:put(OrderData.ID, orderId)
            local items = AbSqlBean.getRows(self, keyValues)
            local entryData = EntryData.getInstance()
            if items ~= nil and items:size() > 0 then
                local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
                local itemsArray = items:toArray()
                local itemsSize = (itemsArray.n or #itemsArray)
                for i = 0, itemsSize - 1 do
                    local itemHashMap = itemsArray[i + 1]
                    itemHashMap:put(self.basicItemData.INBASKETS, EMPTY_STRING)
                    itemHashMap:put(entryData.ENABLE, EMPTY_STRING)
                    itemHashMap:put(entryData.TIMECREATED, EMPTY_STRING)
                    itemHashMap:put(entryData.LASTMODIFIED, EMPTY_STRING)
                    itemHashMap:put(self.basicItemData.GROUPS, EMPTY_STRING)
                    itemHashMap:put(self.basicItemData.OPTIONS, EMPTY_STRING)
                    itemHashMap:put(self.basicItemData.PERMISSIONS, EMPTY_STRING)
                    itemHashMap:put(self.basicItemData.SPECIALS, EMPTY_STRING)
                    local item = Item.new(itemHashMap)
                    basketReview:addItem(item)
                end
                return basketReview
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getBasketReview", e)
            end
            return nil
        end
end


function OrderItemsEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CREATE TABLE ")
        stringBuffer:append(self.tableName)
        stringBuffer:append(" (")
        stringBuffer:append(entryData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(OrderData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(ShippingMethodData.GROUP)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(StoreFrontData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.NUMBER)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.NEWORUSED)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SUMMARY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.IDUSEDBYDISTRIBUTOR)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCEDBY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.STARTPRODUCTIONDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.DESCRIPTION)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.KEYWORDS)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.CATEGORY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.TYPE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.SMALLIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.MEDIUMIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.LARGEIMAGE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.WEIGHT)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(self.basicItemData.PRICE)
        stringBuffer:append(" VARCHAR(20) NOT NULL,")
        stringBuffer:append(self.basicItemData.COMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(self.basicItemData.CUSTOMS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(self.basicItemData.DOWNLOADS)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(ShippingMethodData.COST)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.TAX)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.STREET)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.CITY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.STATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.CODE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingAddressData.COUNTRY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(ShippingMethodData.NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(entryData.SPECIAL)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(OrderHistoryData.STATUS)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.CANCELINFO)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.CANCELTYPE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.SHIPPEDDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(OrderHistoryData.ORDERDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(OrderHistoryData.TRANSDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(OrderHistoryData.CANCELDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append("PRIMARY KEY(")
        stringBuffer:append(entryData.ID)
        stringBuffer:append(") )")
        return tostring(stringBuffer)
end


function OrderItemsEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function OrderItemsEntity:dropTable()
        return AbSqlBean.dropTable(self)
end

return OrderItemsEntity

