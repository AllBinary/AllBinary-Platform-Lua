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
-- package org.allbinary.business.user.commerce.inventory.order

local OrderHistory = {}
package.loaded["org.allbinary.business.user.commerce.inventory.order.OrderHistory"] = OrderHistory

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

local Date = java_lazy("java.util.Date")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local BillingAddressData = java_lazy("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = java_lazy("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local MoneyException = java_lazy("org.allbinary.business.user.commerce.money.MoneyException")
local Payment = java_lazy("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderHistoryInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface")

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

-- class table OrderHistory is declared before the requires
OrderHistory.__index = OrderHistory
OrderHistory.className = "OrderHistory"
OrderHistory.javaClassName = "org.allbinary.business.user.commerce.inventory.order.OrderHistory"
setmetatable(OrderHistory, {__index = Order})
OrderHistory.java_implements = " OrderHistoryInterface "
OrderHistory.java_interfaces = function() return {OrderHistoryInterface} end

function OrderHistory:_init_fields()
    if self.userName == nil then self.userName = nil end
    if self.shippingAddress == nil then self.shippingAddress = nil end
    if self.billingAddress == nil then self.billingAddress = nil end
    if self.payment == nil then self.payment = nil end
    if self.shipDate == nil then self.shipDate = nil end
    if self.orderDate == nil then self.orderDate = nil end
    if self.transDate == nil then self.transDate = nil end
    if self.cancelDate == nil then self.cancelDate = nil end
    if self.status == nil then self.status = nil end
    if self.subTotal == nil then self.subTotal = nil end
    if self.shippingCost == nil then self.shippingCost = nil end
    if self.taxes == nil then self.taxes = nil end
    if self.total == nil then self.total = nil end
end

function OrderHistory._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return OrderHistory._new1(self, ...)
    elseif count == 2 then return OrderHistory._new2(self, ...)
    end
    error("No constructor of OrderHistory takes " .. count .. " arguments")
end

function OrderHistory.new(...)
    local self = setmetatable({}, OrderHistory)
    OrderHistory._jinit(self, ...)
    return self
end

function OrderHistory._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "BasketInterface")) and (java_a2 == nil or java_is(java_a2, "OrderHistory")) then return OrderHistory._new2_1(self, ...) end
    return OrderHistory._new2_2(self, ...)
end


function OrderHistory._new1(self, basketInterface)
    java_super_init(Order, self, basketInterface)
    OrderHistory._init_fields(self)
        -- super(...) made self above
    return self
end


function OrderHistory._new2_1(self, basketInterface, orderHistory)
    java_super_init(Order, self, orderHistory:getStoreName(), basketInterface, orderHistory:getId(), orderHistory:getShippingMethod(), orderHistory:getSpecial(), orderHistory:getPaymentMethod())
    OrderHistory._init_fields(self)
        -- super(...) made self above
        self.userName = orderHistory:getUserName()
        self.shippingAddress = orderHistory:getShippingAddress()
        self.billingAddress = orderHistory:getBillingAddress()
        self.payment = orderHistory:getPaymentInfo()
        self.shipDate = orderHistory:getShipDate()
        self.orderDate = orderHistory:getOrderDate()
        self.transDate = orderHistory:getTransDate()
        self.cancelDate = orderHistory:getCancelDate()
        self.status = orderHistory:getStatus()
        self.subTotal = orderHistory:getSubTotal()
        self.shippingCost = orderHistory:getShippingCost()
        self.taxes = orderHistory:getTaxes()
        self.total = orderHistory:getTotal()
        java_super(Order, "setUserComments", 1)(self, orderHistory:getUserComments())
        java_super(Order, "setUserCancelComments", 1)(self, orderHistory:getUserCancelComments())
        java_super(Order, "setStoreComments", 1)(self, orderHistory:getStoreComments())
        java_super(Order, "setStoreCancelComments", 1)(self, orderHistory:getStoreCancelComments())
    return self
end


function OrderHistory._new2_2(self, basketInterface, orderHistoryHashMap)
    java_super_init(Order, self, orderHistoryHashMap:get(StoreFrontData.getInstance().NAME), basketInterface, orderHistoryHashMap:get(OrderData.ID), orderHistoryHashMap:get(ShippingMethodData.NAME), orderHistoryHashMap:get(EntryData.getInstance().SPECIAL), orderHistoryHashMap:get(PaymentData.METHOD))
    OrderHistory._init_fields(self)
        -- super(...) made self above
        self.shippingAddress = StreetAddress.new(orderHistoryHashMap:get(ShippingAddressData.NAME), orderHistoryHashMap:get(ShippingAddressData.STREET), orderHistoryHashMap:get(ShippingAddressData.CITY), orderHistoryHashMap:get(ShippingAddressData.STATE), orderHistoryHashMap:get(ShippingAddressData.CODE), orderHistoryHashMap:get(ShippingAddressData.COUNTRY))
        self.billingAddress = StreetAddress.new(orderHistoryHashMap:get(BillingAddressData.NAME), orderHistoryHashMap:get(BillingAddressData.STREET), orderHistoryHashMap:get(BillingAddressData.CITY), orderHistoryHashMap:get(BillingAddressData.STATE), orderHistoryHashMap:get(BillingAddressData.CODE), orderHistoryHashMap:get(BillingAddressData.COUNTRY))
        self.payment = Payment.new(orderHistoryHashMap)
        self.userName = orderHistoryHashMap:get(UserData.USERNAME)
        self.orderDate = orderHistoryHashMap:get(OrderHistoryData.ORDERDATE)
        self.shipDate = orderHistoryHashMap:get(OrderHistoryData.SHIPPEDDATE)
        self.transDate = orderHistoryHashMap:get(OrderHistoryData.TRANSDATE)
        self.cancelDate = orderHistoryHashMap:get(OrderHistoryData.CANCELDATE)
        self.status = orderHistoryHashMap:get(OrderHistoryData.STATUS)
        self.subTotal = Money.new(orderHistoryHashMap:get(OrderHistoryData.SUBTOTAL))
        self.total = Money.new(orderHistoryHashMap:get(OrderHistoryData.TOTAL))
        self.shippingCost = Money.new(orderHistoryHashMap:get(OrderHistoryData.SHIPPINGCOST))
        self.taxes = Money.new(orderHistoryHashMap:get(OrderHistoryData.TAX))
        java_super(Order, "setUserComments", 1)(self, orderHistoryHashMap:get(OrderData.CUSTOMERCOMMENT))
        java_super(Order, "setUserCancelComments", 1)(self, orderHistoryHashMap:get(OrderData.CUSTOMERCANCELCOMMENT))
        java_super(Order, "setStoreComments", 1)(self, orderHistoryHashMap:get(OrderData.STORECOMMENT))
        java_super(Order, "setStoreCancelComments", 1)(self, orderHistoryHashMap:get(OrderData.STORECANCELCOMMENT))
    return self
end


function OrderHistory:setUserName(value)
        self.userName = value
end
java_overload(OrderHistory, "setUserName", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setDefaultShippingAddress(shippingAddress)
        self.shippingAddress = shippingAddress
end
java_overload(OrderHistory, "setDefaultShippingAddress", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StreetAddress")) end)


function OrderHistory:setBillingAddress(billingAddress)
        self.billingAddress = billingAddress
end
java_overload(OrderHistory, "setBillingAddress", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "StreetAddress")) end)


function OrderHistory:setPaymentInfo(payment)
        self.payment = payment
end
java_overload(OrderHistory, "setPaymentInfo", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Payment")) end)


function OrderHistory:setShipDate(value)
        self.shipDate = value
end
java_overload(OrderHistory, "setShipDate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setOrderDate(value)
        self.orderDate = value
end
java_overload(OrderHistory, "setOrderDate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setTransDate(value)
        self.transDate = value
end
java_overload(OrderHistory, "setTransDate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setCancelDate(value)
        self.cancelDate = value
end
java_overload(OrderHistory, "setCancelDate", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setStatus(value)
        self.status = value
end
java_overload(OrderHistory, "setStatus", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


function OrderHistory:setSubTotal(value)
        self.subTotal = value
end
java_overload(OrderHistory, "setSubTotal", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Money")) end)


function OrderHistory:setShippingCost(value)
        self.shippingCost = value
end
java_overload(OrderHistory, "setShippingCost", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Money")) end)


function OrderHistory:setTaxes(value)
        self.taxes = value
end
java_overload(OrderHistory, "setTaxes", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Money")) end)


function OrderHistory:setTotal(value)
        self.total = value
end
java_overload(OrderHistory, "setTotal", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Money")) end)


function OrderHistory:getUserName()
        return self.userName
end
java_overload(OrderHistory, "getUserName", 0)


function OrderHistory:getShippingAddress()
        return self.shippingAddress
end
java_overload(OrderHistory, "getShippingAddress", 0)


function OrderHistory:getBillingAddress()
        return self.billingAddress
end
java_overload(OrderHistory, "getBillingAddress", 0)


function OrderHistory:getPaymentInfo()
        return self.payment
end
java_overload(OrderHistory, "getPaymentInfo", 0)


function OrderHistory:getShipDate()
        return self.shipDate
end
java_overload(OrderHistory, "getShipDate", 0)


function OrderHistory:getOrderDate()
        return self.orderDate
end
java_overload(OrderHistory, "getOrderDate", 0)


function OrderHistory:getTransDate()
        return self.transDate
end
java_overload(OrderHistory, "getTransDate", 0)


function OrderHistory:getCancelDate()
        return self.cancelDate
end
java_overload(OrderHistory, "getCancelDate", 0)


function OrderHistory:getStatus()
        return self.status
end
java_overload(OrderHistory, "getStatus", 0)


function OrderHistory:getSubTotal()
        return self.subTotal
end
java_overload(OrderHistory, "getSubTotal", 0)


function OrderHistory:getShippingCost()
        return self.shippingCost
end
java_overload(OrderHistory, "getShippingCost", 0)


function OrderHistory:getTaxes()
        return self.taxes
end
java_overload(OrderHistory, "getTaxes", 0)


function OrderHistory:getTotal()
        return self.total
end
java_overload(OrderHistory, "getTotal", 0)


function OrderHistory:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(UserData.USERNAME, self.userName)
        hashMap:put(OrderHistoryData.ORDERDATE, self.orderDate)
        hashMap:put(OrderHistoryData.SHIPPEDDATE, self.shipDate)
        hashMap:put(OrderHistoryData.TRANSDATE, self.transDate)
        hashMap:put(OrderHistoryData.CANCELDATE, self.cancelDate)
        hashMap:put(OrderHistoryData.ORDERDATEFORMATTED, tostring(Date.new(math.tointeger(self.orderDate // 1))))
        hashMap:put(OrderHistoryData.SHIPPEDDATEFORMATTED, tostring(Date.new(math.tointeger(self.shipDate // 1))))
        hashMap:put(OrderHistoryData.TRANSDATEFORMATTED, tostring(Date.new(math.tointeger(self.transDate // 1))))
        hashMap:put(OrderHistoryData.CANCELDATEFORMATTED, tostring(Date.new(math.tointeger(self.cancelDate // 1))))
        hashMap:put(OrderHistoryData.STATUS, self.status)
        hashMap:put(OrderHistoryData.SUBTOTAL, tostring(self.subTotal))
        hashMap:put(OrderHistoryData.TOTAL, tostring(self.total))
        hashMap:put(OrderHistoryData.SHIPPINGCOST, tostring(self.shippingCost))
        hashMap:put(OrderHistoryData.TAX, tostring(self.taxes))
        return hashMap
end
java_overload(OrderHistory, "toHashMap", 0)


-- throws Exception
function OrderHistory:toXmlNode(document)
        local hashMap = self:toHashMap()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        local node = document:createElement(OrderHistoryData.ORDERHISTORY)
        node:appendChild(java_super(Order, "toXmlNode", 1)(self, document))
        local billingAddressNode = document:createElement(BillingAddressData.BILLINGADDRESS)
        billingAddressNode:appendChild(self.billingAddress:toXmlNode(document))
        local shippingAddressNode = document:createElement(ShippingAddressData.SHIPPINGADDRESS)
        shippingAddressNode:appendChild(self.shippingAddress:toXmlNode(document))
        node:appendChild(billingAddressNode)
        node:appendChild(shippingAddressNode)
        node:appendChild(self.payment:toXmlNode(document))
        for i = 0, size - 1 do
            local name = keyArray[i + 1]
            local value = hashMap:get(name)
            value = StringUtil.getInstance():getNonNull(value)
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        return node
end
java_overload(OrderHistory, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function OrderHistory:getPaymentMethod()
        return java_super(Order, "getPaymentMethod", 0)(self)
end
java_overload(OrderHistory, "getPaymentMethod", 0)

return OrderHistory

