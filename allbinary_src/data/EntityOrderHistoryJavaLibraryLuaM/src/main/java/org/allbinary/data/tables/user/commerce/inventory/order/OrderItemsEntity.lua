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

local OrderItemsEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity"] = OrderItemsEntity

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
-- local ListIterator = require("java.util.ListIterator")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local HistoryDbInitInfo = java_lazy("org.allbinary.business.init.db.HistoryDbInitInfo")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local BasketReview = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketReview")
local BasicItemData = java_lazy("org.allbinary.business.user.commerce.inventory.item.BasicItemData")
local Item = java_lazy("org.allbinary.business.user.commerce.inventory.item.Item")
local ItemInterface = java_lazy("org.allbinary.business.user.commerce.inventory.item.ItemInterface")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderItemIdGenerator = java_lazy("org.allbinary.data.generator.OrderItemIdGenerator")
local TableDataFactory = java_lazy("org.allbinary.data.tables.TableDataFactory")
local InventoryEntity = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity")
local InventoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local OrderItemsEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
end

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
end

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

-- class table OrderItemsEntity is declared before the requires
OrderItemsEntity.__index = OrderItemsEntity
OrderItemsEntity.className = "OrderItemsEntity"
OrderItemsEntity.javaClassName = "org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntity"
setmetatable(OrderItemsEntity, {__index = AbSqlBean})
OrderItemsEntity.java_implements = " OrderItemsEntityInterface "
OrderItemsEntity.java_interfaces = function() return {OrderItemsEntityInterface} end

function OrderItemsEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.tableName = "orderitems"
end


function OrderItemsEntity._jinit(self)
    java_super_init(AbSqlBean, self, HistoryDbInitInfo.new())
    OrderItemsEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function OrderItemsEntity.new(...)
    local self = setmetatable({}, OrderItemsEntity)
    OrderItemsEntity._jinit(self, ...)
    return self
end


function OrderItemsEntity:insert_j2(userName, order)
        local vector = BasicArrayListD.new()
        local try_ok, try_error, try_value = pcall(function()
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF("Command Success Added: " .. tostring(items:size()), self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put("Command Failed: " .. tostring(vector), self, self.INSERT, e)
            end
        end
end


function OrderItemsEntity:setStatus(orderId, groupId, status)
        local try_ok, try_error, try_value = pcall(function()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            local updateHashMap = StdUtil.getInstance():createHashMap()
            whereHashMap:put(OrderData.ID, orderId)
            whereHashMap:put(ShippingMethodData.GROUP, groupId)
            updateHashMap:put(OrderHistoryData.STATUS, status)
            java_super(AbSqlBean, "updateWhere", 2)(self, whereHashMap, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setStatus", e)
            end
        end
end
java_overload(OrderItemsEntity, "setStatus", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") end)


function OrderItemsEntity:isEverythingShipped(orderId)
        local try_ok, try_error, try_value = pcall(function()
            local itemStatusVector = java_super(AbSqlBean, "getColumnWhere", 3)(self, OrderHistoryData.STATUS, OrderData.ID, orderId)
            local size = itemStatusVector:size()
            for index = 0, size - 1 do
                local status = itemStatusVector:get(index)
                if ((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0) ~= 0 then
                    do return "__jreturn", false end
                end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "isEverythingShipped", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(OrderItemsEntity, "isEverythingShipped", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderItemsEntity:getBasketReview(orderId)
        local try_ok, try_error, try_value = pcall(function()
            local basketReview = BasketReview.new()
            local keyValues = StdUtil.getInstance():createHashMap()
            keyValues:put(OrderData.ID, orderId)
            local items = java_super(AbSqlBean, "getRows", 1)(self, keyValues)
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
                do return "__jreturn", basketReview end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "getBasketReview", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(OrderItemsEntity, "getBasketReview", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


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
java_overload(OrderItemsEntity, "createTableStatement", 0)


function OrderItemsEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(OrderItemsEntity, "createTable", 0)


function OrderItemsEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(OrderItemsEntity, "dropTable", 0)


function OrderItemsEntity:insert_j1(values)
        java_super(AbSqlBean, "insert", 1)(self, values)
end
function OrderItemsEntity:insert(...)
    local count = select("#", ...)
    if count == 2 then return self:insert_j2(...) end
    if count == 1 then return self:insert_j1(...) end
    error("No method insert takes " .. count .. " arguments")
end
OrderItemsEntity.insert__jdispatcher = OrderItemsEntity.insert

return OrderItemsEntity

