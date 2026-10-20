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

-- local Serializable = require("java.io.Serializable")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = require("org.allbinary.business.entry.EntryData")
local BasketInterface = require("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Order = {}
Order.__index = Order
Order.className = "Order"

function Order:_init_fields()
    self.basket = nil
    self.paymentMethod = nil
    self.shippingType = nil
    self.storeName = nil
    self.special = nil
    self.id = nil
    self.userComment = nil
    self.userCancelComment = nil
    self.storeComment = nil
    self.storeCancelComment = nil
end

function Order.new(...)
    local count = select("#", ...)
    if count == 1 then return Order._new1(...)
    elseif count == 6 then return Order._new6(...)
    end
end


function Order._new1(basket)
    local self = setmetatable({}, Order)
    self:_init_fields()
        self.basket = basket
        self.id = nil
        self.shippingType = StringUtil.getInstance().EMPTY_STRING
    return self
end


function Order._new6(storeName, basket, id, shippingType, special, paymentMethod)
    local self = setmetatable({}, Order)
    self:_init_fields()
        self.storeName = storeName
        self.basket = basket
        self.id = id
        self.shippingType = shippingType
        self.special = special
        self.paymentMethod = paymentMethod
    return self
end


function Order:isIdValid()
        if self:getId() == nil or self:getId():compareTo(StringUtil.getInstance().EMPTY_STRING) == 0 or self:getId():length() > OrderHistoryData.MAXIDLEN or not StringValidationUtil.getInstance():isNumber(self:getId()) then
            return false
        end
        return true
end


function Order:isValid()
        return true
end


function Order:getIdValidationInfo()
        local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
        if self:getId() == nil or self:getId():compareTo(EMPTY_STRING) == 0 or self:getId():length() > OrderHistoryData.MAXIDLEN or not StringValidationUtil.getInstance():isNumber(self:getId()) then
            return "Please enter a valid order Id < " .. tostring(OrderHistoryData.MAXIDLEN) .. " digits in length.<br>"
        end
        return EMPTY_STRING
end


function Order:setShippingMethod(shippingType)
        self.shippingType = shippingType
end


function Order:setPaymentMethod(value)
        self.paymentMethod = value
end


function Order:setSpecial(special)
        self.special = special
end


function Order:setId(value)
        self.id = value
end


function Order:setStoreName(value)
        self.storeName = value
end


function Order:setUserComments(value)
        self.userComment = value
end


function Order:setUserCancelComments(value)
        self.userCancelComment = value
end


function Order:setStoreComments(value)
        self.storeComment = value
end


function Order:setStoreCancelComments(value)
        self.storeCancelComment = value
end


function Order:getBasket()
        return self.basket
end


function Order:getShippingMethod()
        return self.shippingType
end


function Order:getPaymentMethod()
        return self.paymentMethod
end


function Order:getSpecial()
        return self.special
end


function Order:getId()
        return self.id
end


function Order:getStoreName()
        return self.storeName
end


function Order:getUserComments()
        return self.userComment
end


function Order:getUserCancelComments()
        return self.userCancelComment
end


function Order:getStoreComments()
        return self.storeComment
end


function Order:getStoreCancelComments()
        return self.storeCancelComment
end


function Order:reviewOrder(paymentMethod)
        return "Create your own Order.reviewOrder"
end


function Order:viewOrder(paymentMethod)
        return "Create your own Order.viewOrder"
end


function Order:emailOrder(userName, paymentMethod, storeFrontInterface)
        return "Create your own Order.emailOrder"
end


function Order:toHashMapOrder()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(PaymentData.METHOD, self.paymentMethod)
        hashMap:put(ShippingMethodData.NAME, self.shippingType)
        hashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
        hashMap:put(EntryData.getInstance().SPECIAL, self.special)
        hashMap:put(OrderData.ID, self.id)
        hashMap:put(OrderData.CUSTOMERCOMMENT, self.userComment)
        hashMap:put(OrderData.CUSTOMERCANCELCOMMENT, self.userCancelComment)
        hashMap:put(OrderData.STORECOMMENT, self.storeComment)
        hashMap:put(OrderData.STORECANCELCOMMENT, self.storeCancelComment)
        return hashMap
end


-- throws Exception
function Order:toXmlNode(document)
        local hashMap = self:toHashMapOrder()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        local node = document:createElement(OrderData.ORDER)
        for i = 0, size - 1 do
            local name = keyArray[i + 1]
            local value = hashMap:get(name)
            value = StringUtil.getInstance():getNonNull(value)
            node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
        end
        return node
end

return Order

