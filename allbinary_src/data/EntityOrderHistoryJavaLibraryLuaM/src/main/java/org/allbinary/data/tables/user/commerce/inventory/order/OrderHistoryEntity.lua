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

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
-- local Random = require("java.util.Random")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = require("org.allbinary.business.entry.EntryData")
local HistoryDbInitInfo = require("org.allbinary.business.init.db.HistoryDbInitInfo")
local UserData = require("org.allbinary.business.user.UserData")
local BillingAddressData = require("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local Basket = require("org.allbinary.business.user.commerce.inventory.basket.Basket")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local TaxFactory = require("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ShippingMethods = require("org.allbinary.business.user.commerce.shipping.ShippingMethods")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local OrderHistoryIdGenerator = require("org.allbinary.data.generator.OrderHistoryIdGenerator")
local TableDataFactory = require("org.allbinary.data.tables.TableDataFactory")
local BillingAddressesEntity = require("org.allbinary.data.tables.user.address.billing.BillingAddressesEntity")
local ShippingAddressesEntity = require("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local PaymentEntity = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local OrderHistoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHistoryEntity = {}
OrderHistoryEntity.__index = OrderHistoryEntity
OrderHistoryEntity.className = "OrderHistoryEntity"
setmetatable(OrderHistoryEntity, {__index = AbSqlBean})

function OrderHistoryEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "orderhistory"
end


function OrderHistoryEntity.new()
    local self = setmetatable(AbSqlBean.new(HistoryDbInitInfo.new()), OrderHistoryEntity)
    self:_init_fields()
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end


function OrderHistoryEntity:insert(userName, order)
        local vector = BasicArrayListD.new()
        local try_ok, try_error = pcall(function()
            local paymentInterface = PaymentEntity.new():getDefault(userName)
            local billingAddress = BillingAddressesEntity.new(userName):getDefault()
            local shippingAddress = ShippingAddressesEntity.new(userName):getDefault()
            local abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
            local storeFrontInterface = StoreFrontFactory.getInstance(order:getStoreName())
            local shippingInterface = ShippingMethods.new(abeClientInformation, storeFrontInterface):getShippingInterface(order:getShippingMethod())
            local shippingCost = shippingInterface:getCost(order)
            local basketInterface = order:getBasket()
            local subTotal = basketInterface:getSubTotal()
            local taxRate = TaxFactory.getInstance():getInstance(abeClientInformation, storeFrontInterface):getTaxRate(shippingAddress, storeFrontInterface)
            local tax = Money.new()
            local total = Money.new()
            total:add(tostring(shippingCost))
            total:add(tostring(subTotal))
            tax:add(tostring(total))
            tax:multiply(taxRate)
            total:add(tostring(tax))
            local empty = StringUtil.getInstance().EMPTY_STRING
            vector:add(OrderHistoryIdGenerator.new():getNext())
            local ZERO = TableDataFactory.getInstance().ZERO_STRING
            vector:add(order:getId())
            vector:add(userName)
            vector:add(order:getStoreName())
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            vector:add(ZERO)
            vector:add(time)
            vector:add(ZERO)
            vector:add(ZERO)
            vector:add(OrderHistoryData.PREPROCESSING)
            vector:add(order:getPaymentMethod())
            if paymentInterface ~= nil then
                vector:add(paymentInterface:getName())
                vector:add(paymentInterface:getType())
                vector:add(paymentInterface:getExpiration())
                local random = Random.new():nextInt(SuperCrypt.KEYMAX)
                vector:add(SuperCrypt.new(random):encrypt(paymentInterface:getNumber()))
                vector:add(tostring(random))
            else
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(ZERO)
            end
            if billingAddress ~= nil then
                vector:add(billingAddress:getName())
                vector:add(billingAddress:getStreet())
                vector:add(billingAddress:getCity())
                vector:add(billingAddress:getState())
                vector:add(billingAddress:getCode())
                vector:add(billingAddress:getCountry())
            else
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
            end
            if shippingAddress ~= nil then
                vector:add(shippingAddress:getName())
                vector:add(shippingAddress:getStreet())
                vector:add(shippingAddress:getCity())
                vector:add(shippingAddress:getState())
                vector:add(shippingAddress:getCode())
                vector:add(shippingAddress:getCountry())
            else
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
                vector:add(empty)
            end
            vector:add(order:getShippingMethod())
            vector:add(tostring(subTotal))
            vector:add(tostring(shippingCost))
            vector:add(tostring(tax))
            vector:add(tostring(total))
            vector:add(order:getSpecial())
            vector:add(order:getUserComments())
            vector:add(order:getUserCancelComments())
            vector:add(order:getStoreComments())
            vector:add(order:getStoreCancelComments())
            self:insert(vector)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put("Command Failed: " .. tostring(vector), self, self.INSERT, e)
            end
        end
end


-- Java overloaded method: Lua keeps the last definition
function OrderHistoryEntity:insert(values)
        local try_ok, try_error = pcall(function()
            AbSqlBean.insert(self, values)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end


function OrderHistoryEntity:setStatus(orderId, status)
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local updateHashMap = StdUtil.getInstance():createHashMap()
            updateHashMap:put(OrderHistoryData.STATUS, status)
            if ((status < OrderHistoryData.CANCELLED and -1) or (status > OrderHistoryData.CANCELLED and 1) or 0) == 0 then
                updateHashMap:put(OrderHistoryData.CANCELDATE, time)
            elseif ((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0) == 0 then
                updateHashMap:put(OrderHistoryData.SHIPPEDDATE, time)
            end
            AbSqlBean.updateWhere(self, OrderData.ID, orderId, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setStatus", e)
            end
        end
end


function OrderHistoryEntity:setPaymentMethod(orderId, paymentMethod)
        local try_ok, try_error = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local updateHashMap = StdUtil.getInstance():createHashMap()
            updateHashMap:put(PaymentData.METHOD, paymentMethod)
            updateHashMap:put(OrderHistoryData.TRANSDATE, time)
            AbSqlBean.updateWhere(self, OrderData.ID, orderId, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setPaymentMethod", e)
            end
        end
end


-- throws Exception
function OrderHistoryEntity:getStoreOrders(storeFrontInterface)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(StoreFrontData.getInstance().NAME, storeFrontInterface:getName())
        local orderHashMapVector = AbSqlBean.getRows(self, whereHashMap)
        local size = orderHashMapVector:size()
        for i = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(i)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
function OrderHistoryEntity:getOrders(userName)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(UserData.USERNAME, userName)
        local orderHashMapVector = AbSqlBean.getRows(self, whereHashMap)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function OrderHistoryEntity:getOrders(status, fromDate, toDate)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(OrderHistoryData.STATUS, status)
        local orderHashMapVector = AbSqlBean.getRowsWhereBetween(self, whereHashMap, OrderHistoryData.ORDERDATE, fromDate, toDate)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function OrderHistoryEntity:getOrders(fromDate, toDate)
        local orderReviewVector = BasicArrayListD.new()
        local orderHashMapVector = AbSqlBean.getRowsWhereBetween(self, OrderHistoryData.ORDERDATE, fromDate, toDate)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
function OrderHistoryEntity:getOrder(id)
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(OrderData.ID, id)
        local orderReviewHashMap = AbSqlBean.getRow(self, whereHashMap)
        if orderReviewHashMap ~= nil then
            local orderHistory = OrderHistory.new(Basket.new(), orderReviewHashMap)
            return orderHistory
        else
            return nil
        end
end


function OrderHistoryEntity:createTableStatement()
        local entryData = EntryData.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CREATE TABLE ")
        stringBuffer:append(self.tableName)
        stringBuffer:append(" (")
        stringBuffer:append(entryData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(OrderData.ID)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(UserData.USERNAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(StoreFrontData.getInstance().NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.SHIPPEDDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(OrderHistoryData.ORDERDATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_BIG_INT_UNSIGNED_NOT_NULL)
        stringBuffer:append(OrderHistoryData.TRANSDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(OrderHistoryData.CANCELDATE)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(OrderHistoryData.STATUS)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(PaymentData.METHOD)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(PaymentData.NAME)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(PaymentData.TYPE)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(PaymentData.EXPIRATION)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(PaymentData.NUMBER)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(entryData.ENCRYPTION)
        stringBuffer:append(" BIGINT(19) UNSIGNED ,")
        stringBuffer:append(BillingAddressData.NAME)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BillingAddressData.STREET)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BillingAddressData.CITY)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BillingAddressData.STATE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BillingAddressData.CODE)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(BillingAddressData.COUNTRY)
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
        stringBuffer:append(OrderHistoryData.SUBTOTAL)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.SHIPPINGCOST)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.TAX)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(OrderHistoryData.TOTAL)
        stringBuffer:append(self.sqlTypeStrings.MAX_CHAR_COLUMN_NOT_NULL)
        stringBuffer:append(entryData.SPECIAL)
        stringBuffer:append(" VARCHAR(255) ,")
        stringBuffer:append(OrderData.CUSTOMERCOMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(OrderData.CUSTOMERCANCELCOMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(OrderData.STORECOMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append(OrderData.STORECANCELCOMMENT)
        stringBuffer:append(self.sqlTypeStrings.BLOB_NOT_NULL)
        stringBuffer:append("PRIMARY KEY(")
        stringBuffer:append(entryData.ID)
        stringBuffer:append(") )")
        return tostring(stringBuffer)
end


function OrderHistoryEntity:createTable()
        return AbSqlBean.createTable(self, self:createTableStatement())
end


function OrderHistoryEntity:dropTable()
        return AbSqlBean.dropTable(self)
end


-- throws Exception
function OrderHistoryEntity:update(whereHashMap, orderHashMap)
        local try_ok, try_error = pcall(function()
            self:updateWhere(whereHashMap, orderHashMap)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

return OrderHistoryEntity

