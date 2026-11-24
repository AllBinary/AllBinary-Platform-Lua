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

local Order = {}
package.loaded["org.allbinary.business.user.commerce.inventory.order.Order"] = Order

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

local Serializable = java_lazy("java.io.Serializable")
local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local BasketInterface = java_lazy("org.allbinary.business.user.commerce.inventory.basket.BasketInterface")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")

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

-- class table Order is declared before the requires
Order.__index = Order
Order.className = "Order"
Order.javaClassName = "org.allbinary.business.user.commerce.inventory.order.Order"
Order.java_implements = " OrderInterface Serializable "
Order.java_interfaces = function() return {OrderInterface, Serializable} end

function Order:_init_fields()
    if self.basket == nil then self.basket = nil end
    if self.paymentMethod == nil then self.paymentMethod = nil end
    if self.shippingType == nil then self.shippingType = nil end
    if self.storeName == nil then self.storeName = nil end
    if self.special == nil then self.special = nil end
    if self.id == nil then self.id = nil end
    if self.userComment == nil then self.userComment = nil end
    if self.userCancelComment == nil then self.userCancelComment = nil end
    if self.storeComment == nil then self.storeComment = nil end
    if self.storeCancelComment == nil then self.storeCancelComment = nil end
end

function Order._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Order._new1(self, ...)
    elseif count == 6 then return Order._new6(self, ...)
    end
    error("No constructor of Order takes " .. count .. " arguments")
end

function Order.new(...)
    local self = setmetatable({}, Order)
    Order._jinit(self, ...)
    return self
end


function Order._new1(self, basket)
    Order._init_fields(self)
        self.basket = basket
        self.id = nil
        self.shippingType = StringUtil.getInstance().EMPTY_STRING
    return self
end


function Order._new6(self, storeName, basket, id, shippingType, special, paymentMethod)
    Order._init_fields(self)
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

