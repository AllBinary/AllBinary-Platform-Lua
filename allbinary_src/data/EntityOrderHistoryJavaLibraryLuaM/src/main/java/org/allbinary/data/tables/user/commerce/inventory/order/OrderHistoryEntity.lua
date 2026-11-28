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

local OrderHistoryEntity = {}
package.loaded["org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity"] = OrderHistoryEntity

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

local Calendar = java_lazy("java.util.Calendar")
local HashMap = java_lazy("java.util.HashMap")
local Random = java_lazy("java.util.Random")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local HistoryDbInitInfo = java_lazy("org.allbinary.business.init.db.HistoryDbInitInfo")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local BillingAddressData = java_lazy("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local Basket = java_lazy("org.allbinary.business.user.commerce.inventory.basket.Basket")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local Order = java_lazy("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local TaxFactory = java_lazy("org.allbinary.business.user.commerce.money.tax.TaxFactory")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ShippingMethods = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethods")
local ShippingInterface = java_lazy("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local OrderHistoryIdGenerator = java_lazy("org.allbinary.data.generator.OrderHistoryIdGenerator")
local TableDataFactory = java_lazy("org.allbinary.data.tables.TableDataFactory")
local BillingAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.billing.BillingAddressesEntity")
local ShippingAddressesEntity = java_lazy("org.allbinary.data.tables.user.address.shipping.ShippingAddressesEntity")
local PaymentEntity = java_lazy("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntity")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbSqlBean = require("org.allbinary.logic.communication.sql.AbSqlBean")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = java_lazy("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local OrderHistoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table OrderHistoryEntity is declared before the requires
OrderHistoryEntity.__index = OrderHistoryEntity
OrderHistoryEntity.className = "OrderHistoryEntity"
OrderHistoryEntity.javaClassName = "org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity"
setmetatable(OrderHistoryEntity, {__index = AbSqlBean})
OrderHistoryEntity.java_implements = " OrderHistoryEntityInterface "
OrderHistoryEntity.java_interfaces = function() return {OrderHistoryEntityInterface} end

function OrderHistoryEntity:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tableName = "orderhistory"
end


function OrderHistoryEntity._jinit(self)
    java_super_init(AbSqlBean, self, HistoryDbInitInfo.new())
    OrderHistoryEntity._init_fields(self)
        -- super(...) made self above
        self:setTableName(self.tableName)
    return self
end

function OrderHistoryEntity.new(...)
    local self = setmetatable({}, OrderHistoryEntity)
    OrderHistoryEntity._jinit(self, ...)
    return self
end


function OrderHistoryEntity:insert_j2(userName, order)
        local vector = BasicArrayListD.new()
        local try_ok, try_error, try_value = pcall(function()
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
            if not rawequal(paymentInterface, nil) then
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
            if not rawequal(billingAddress, nil) then
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
            if not rawequal(shippingAddress, nil) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(require("allbinary_java").to_string("Command Failed: ") .. require("allbinary_java").to_string(vector), self, self.INSERT, e)
            end
        end
end


function OrderHistoryEntity:insert_j1(values)
        local try_ok, try_error, try_value = pcall(function()
            java_super(AbSqlBean, "insert", 1)(self, values)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:putF(self.commonStrings.SUCCESS, self, self.INSERT)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, self.INSERT, e)
            end
        end
end
function OrderHistoryEntity:insert(...)
    local count = select("#", ...)
    if count == 2 then return self:insert_j2(...) end
    if count == 1 then return self:insert_j1(...) end
    local parent = getmetatable(OrderHistoryEntity).__index
    if parent.insert then return parent.insert(self, ...) end
    error("No method insert takes " .. count .. " arguments")
end
OrderHistoryEntity.insert__jdispatcher = OrderHistoryEntity.insert


function OrderHistoryEntity:setStatus(orderId, status)
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local updateHashMap = StdUtil.getInstance():createHashMap()
            updateHashMap:put(OrderHistoryData.STATUS, status)
            if rawequal(((status < OrderHistoryData.CANCELLED and -1) or (status > OrderHistoryData.CANCELLED and 1) or 0), 0) then
                updateHashMap:put(OrderHistoryData.CANCELDATE, time)
            elseif rawequal(((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0), 0) then
                updateHashMap:put(OrderHistoryData.SHIPPEDDATE, time)
            end
            java_super(AbSqlBean, "updateWhere", 3)(self, OrderData.ID, orderId, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setStatus", e)
            end
        end
end
java_overload(OrderHistoryEntity, "setStatus", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


function OrderHistoryEntity:setPaymentMethod(orderId, paymentMethod)
        local try_ok, try_error, try_value = pcall(function()
            local calendar = Calendar.getInstance()
            local time = tostring(tostring(calendar:getTimeInMillis()))
            local updateHashMap = StdUtil.getInstance():createHashMap()
            updateHashMap:put(PaymentData.METHOD, paymentMethod)
            updateHashMap:put(OrderHistoryData.TRANSDATE, time)
            java_super(AbSqlBean, "updateWhere", 3)(self, OrderData.ID, orderId, updateHashMap)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "setPaymentMethod", e)
            end
        end
end
java_overload(OrderHistoryEntity, "setPaymentMethod", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") end)


-- throws Exception
function OrderHistoryEntity:getStoreOrders(storeFrontInterface)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(StoreFrontData.getInstance().NAME, storeFrontInterface:getName())
        local orderHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, whereHashMap)
        local size = orderHashMapVector:size()
        for i = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(i)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end
java_overload(OrderHistoryEntity, "getStoreOrders", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StoreFrontInterface")) end)


-- throws Exception
function OrderHistoryEntity:getOrders_j1(userName)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(UserData.USERNAME, userName)
        local orderHashMapVector = java_super(AbSqlBean, "getRows", 1)(self, whereHashMap)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
function OrderHistoryEntity:getOrders_j3(status, fromDate, toDate)
        local orderReviewVector = BasicArrayListD.new()
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(OrderHistoryData.STATUS, status)
        local orderHashMapVector = java_super(AbSqlBean, "getRowsWhereBetween", 4)(self, whereHashMap, OrderHistoryData.ORDERDATE, fromDate, toDate)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end


-- throws Exception
function OrderHistoryEntity:getOrders_j2(fromDate, toDate)
        local orderReviewVector = BasicArrayListD.new()
        local orderHashMapVector = java_super(AbSqlBean, "getRowsWhereBetween", 3)(self, OrderHistoryData.ORDERDATE, fromDate, toDate)
        local size = orderHashMapVector:size()
        for index = 0, size - 1 do
            local orderReviewHashMap = orderHashMapVector:get(index)
            local orderReview = OrderHistory.new(Basket.new(), orderReviewHashMap)
            orderReviewVector:add(orderReview)
        end
        return orderReviewVector
end
function OrderHistoryEntity:getOrders(...)
    local count = select("#", ...)
    if count == 1 then return self:getOrders_j1(...) end
    if count == 3 then return self:getOrders_j3(...) end
    if count == 2 then return self:getOrders_j2(...) end
    local parent = getmetatable(OrderHistoryEntity).__index
    if parent.getOrders then return parent.getOrders(self, ...) end
    error("No method getOrders takes " .. count .. " arguments")
end
OrderHistoryEntity.getOrders__jdispatcher = OrderHistoryEntity.getOrders


-- throws Exception
function OrderHistoryEntity:getOrder(id)
        local whereHashMap = StdUtil.getInstance():createHashMap()
        whereHashMap:put(OrderData.ID, id)
        local orderReviewHashMap = java_super(AbSqlBean, "getRow", 1)(self, whereHashMap)
        if not rawequal(orderReviewHashMap, nil) then
            local orderHistory = OrderHistory.new(Basket.new(), orderReviewHashMap)
            return orderHistory
        else
            return nil
        end
end
java_overload(OrderHistoryEntity, "getOrder", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


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
java_overload(OrderHistoryEntity, "createTableStatement", 0)


function OrderHistoryEntity:createTable()
        return java_super(AbSqlBean, "createTable", 1)(self, self:createTableStatement())
end
java_overload(OrderHistoryEntity, "createTable", 0)


function OrderHistoryEntity:dropTable()
        return java_super(AbSqlBean, "dropTable", 0)(self)
end
java_overload(OrderHistoryEntity, "dropTable", 0)


-- throws Exception
function OrderHistoryEntity:update(whereHashMap, orderHashMap)
        local try_ok, try_error, try_value = pcall(function()
            self:updateWhere(whereHashMap, orderHashMap)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
end
java_overload(OrderHistoryEntity, "update", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "HashMap")) end)

return OrderHistoryEntity

