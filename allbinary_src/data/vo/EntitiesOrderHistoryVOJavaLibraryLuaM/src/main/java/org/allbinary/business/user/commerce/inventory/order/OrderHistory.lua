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

-- local Date = require("java.util.Date")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local BillingAddressData = require("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local Payment = require("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderHistoryInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHistory = {}
OrderHistory.__index = OrderHistory
OrderHistory.className = "OrderHistory"
setmetatable(OrderHistory, {__index = Order})

function OrderHistory:_init_fields()
    self.userName = nil
    self.shippingAddress = nil
    self.billingAddress = nil
    self.payment = nil
    self.shipDate = nil
    self.orderDate = nil
    self.transDate = nil
    self.cancelDate = nil
    self.status = nil
    self.subTotal = nil
    self.shippingCost = nil
    self.taxes = nil
    self.total = nil
end

function OrderHistory.new(...)
    local count = select("#", ...)
    if count == 1 then return OrderHistory._new1(...)
    elseif count == 2 then return OrderHistory._new2(...)
    elseif count == 2 then return OrderHistory._new2(...)
    end
end


function OrderHistory._new1(basketInterface)
    local self = setmetatable(Order.new(basketInterface), OrderHistory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function OrderHistory._new2(basketInterface, orderHistory)
    local self = setmetatable(Order.new(orderHistory:getStoreName(), basketInterface, orderHistory:getId(), orderHistory:getShippingMethod(), orderHistory:getSpecial(), orderHistory:getPaymentMethod()), OrderHistory)
    self:_init_fields()
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
        Order.setUserComments(self, orderHistory:getUserComments())
        Order.setUserCancelComments(self, orderHistory:getUserCancelComments())
        Order.setStoreComments(self, orderHistory:getStoreComments())
        Order.setStoreCancelComments(self, orderHistory:getStoreCancelComments())
    return self
end


function OrderHistory._new2(basketInterface, orderHistoryHashMap)
    local self = setmetatable(Order.new(orderHistoryHashMap:get(StoreFrontData.getInstance().NAME), basketInterface, orderHistoryHashMap:get(OrderData.ID), orderHistoryHashMap:get(ShippingMethodData.NAME), orderHistoryHashMap:get(EntryData.getInstance().SPECIAL), orderHistoryHashMap:get(PaymentData.METHOD)), OrderHistory)
    self:_init_fields()
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
        Order.setUserComments(self, orderHistoryHashMap:get(OrderData.CUSTOMERCOMMENT))
        Order.setUserCancelComments(self, orderHistoryHashMap:get(OrderData.CUSTOMERCANCELCOMMENT))
        Order.setStoreComments(self, orderHistoryHashMap:get(OrderData.STORECOMMENT))
        Order.setStoreCancelComments(self, orderHistoryHashMap:get(OrderData.STORECANCELCOMMENT))
    return self
end


function OrderHistory:setUserName(value)
        self.userName = value
end


function OrderHistory:setDefaultShippingAddress(shippingAddress)
        self.shippingAddress = shippingAddress
end


function OrderHistory:setBillingAddress(billingAddress)
        self.billingAddress = billingAddress
end


function OrderHistory:setPaymentInfo(payment)
        self.payment = payment
end


function OrderHistory:setShipDate(value)
        self.shipDate = value
end


function OrderHistory:setOrderDate(value)
        self.orderDate = value
end


function OrderHistory:setTransDate(value)
        self.transDate = value
end


function OrderHistory:setCancelDate(value)
        self.cancelDate = value
end


function OrderHistory:setStatus(value)
        self.status = value
end


function OrderHistory:setSubTotal(value)
        self.subTotal = value
end


function OrderHistory:setShippingCost(value)
        self.shippingCost = value
end


function OrderHistory:setTaxes(value)
        self.taxes = value
end


function OrderHistory:setTotal(value)
        self.total = value
end


function OrderHistory:getUserName()
        return self.userName
end


function OrderHistory:getShippingAddress()
        return self.shippingAddress
end


function OrderHistory:getBillingAddress()
        return self.billingAddress
end


function OrderHistory:getPaymentInfo()
        return self.payment
end


function OrderHistory:getShipDate()
        return self.shipDate
end


function OrderHistory:getOrderDate()
        return self.orderDate
end


function OrderHistory:getTransDate()
        return self.transDate
end


function OrderHistory:getCancelDate()
        return self.cancelDate
end


function OrderHistory:getStatus()
        return self.status
end


function OrderHistory:getSubTotal()
        return self.subTotal
end


function OrderHistory:getShippingCost()
        return self.shippingCost
end


function OrderHistory:getTaxes()
        return self.taxes
end


function OrderHistory:getTotal()
        return self.total
end


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


-- throws Exception
function OrderHistory:toXmlNode(document)
        local hashMap = self:toHashMap()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        local node = document:createElement(OrderHistoryData.ORDERHISTORY)
        node:appendChild(Order.toXmlNode(self, document))
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

return OrderHistory

