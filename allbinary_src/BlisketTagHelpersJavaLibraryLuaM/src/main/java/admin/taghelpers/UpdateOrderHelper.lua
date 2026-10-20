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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local BillingAddressData = require("org.allbinary.business.user.address.BillingAddressData")
local ShippingAddressData = require("org.allbinary.business.user.address.ShippingAddressData")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UpdateOrderHelper = {}
UpdateOrderHelper.__index = UpdateOrderHelper
UpdateOrderHelper.className = "UpdateOrderHelper"
setmetatable(UpdateOrderHelper, {__index = TagHelper})

function UpdateOrderHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.entryId = nil
    self.orderId = nil
    self.userName = nil
    self.storeName = nil
    self.shipDate = nil
    self.orderDate = nil
    self.transDate = nil
    self.cancelDate = nil
    self.status = nil
    self.paymentMethod = nil
    self.name = nil
    self.type = nil
    self.expiration = nil
    self.number = nil
    self.encryption = nil
    self.billingName = nil
    self.billingStreet = nil
    self.billingCity = nil
    self.billingState = nil
    self.billingCode = nil
    self.billingCountry = nil
    self.shippingName = nil
    self.shippingStreet = nil
    self.shippingCity = nil
    self.shippingState = nil
    self.shippingCode = nil
    self.shippingCountry = nil
    self.shippingMethodName = nil
    self.subTotal = nil
    self.shippingCost = nil
    self.tax = nil
    self.total = nil
    self.special = nil
    self.userComment = nil
    self.userCancelComment = nil
    self.storeComment = nil
    self.storeCancelComment = nil
end


function UpdateOrderHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), UpdateOrderHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function UpdateOrderHelper:getFormData()
        self.entryId = self.request:getParameter(EntryData.getInstance().ID)
        self.orderId = self.request:getParameter(OrderData.ID)
        self.userName = self.request:getParameter(UserData.USERNAME)
        self.storeName = self.request:getParameter(StoreFrontData.getInstance().NAME)
        self.shipDate = self.request:getParameter(OrderHistoryData.SHIPPEDDATE)
        self.orderDate = self.request:getParameter(OrderHistoryData.ORDERDATE)
        self.transDate = self.request:getParameter(OrderHistoryData.TRANSDATE)
        self.cancelDate = self.request:getParameter(OrderHistoryData.CANCELDATE)
        self.status = self.request:getParameter(OrderHistoryData.STATUS)
        self.paymentMethod = self.request:getParameter(PaymentData.METHOD)
        self.name = self.request:getParameter(PaymentData.NAME)
        self.type = self.request:getParameter(PaymentData.TYPE)
        self.expiration = self.request:getParameter(PaymentData.EXPIRATION)
        self.number = self.request:getParameter(PaymentData.NUMBER)
        self.encryption = self.request:getParameter(EntryData.getInstance().ENCRYPTION)
        self.billingName = self.request:getParameter(BillingAddressData.NAME)
        self.billingStreet = self.request:getParameter(BillingAddressData.STREET)
        self.billingCity = self.request:getParameter(BillingAddressData.CITY)
        self.billingState = self.request:getParameter(BillingAddressData.STATE)
        self.billingCode = self.request:getParameter(BillingAddressData.CODE)
        self.billingCountry = self.request:getParameter(BillingAddressData.COUNTRY)
        self.shippingName = self.request:getParameter(ShippingAddressData.NAME)
        self.shippingStreet = self.request:getParameter(ShippingAddressData.STREET)
        self.shippingCity = self.request:getParameter(ShippingAddressData.CITY)
        self.shippingState = self.request:getParameter(ShippingAddressData.STATE)
        self.shippingCode = self.request:getParameter(ShippingAddressData.CODE)
        self.shippingCountry = self.request:getParameter(ShippingAddressData.COUNTRY)
        self.shippingMethodName = self.request:getParameter(ShippingMethodData.NAME)
        self.subTotal = self.request:getParameter(OrderHistoryData.SUBTOTAL)
        self.shippingCost = self.request:getParameter(OrderHistoryData.SHIPPINGCOST)
        self.tax = self.request:getParameter(OrderHistoryData.TAX)
        self.total = self.request:getParameter(OrderHistoryData.TOTAL)
        self.special = self.request:getParameter(EntryData.getInstance().SPECIAL)
        self.userComment = self.request:getParameter(OrderData.CUSTOMERCOMMENT)
        self.userCancelComment = self.request:getParameter(OrderData.CUSTOMERCANCELCOMMENT)
        self.storeComment = self.request:getParameter(OrderData.STORECOMMENT)
        self.storeCancelComment = self.request:getParameter(OrderData.STORECANCELCOMMENT)
end


function UpdateOrderHelper:update()
        local try_ok, try_error = pcall(function()
            local success = "Successful update"
            local orderHashMap = StdUtil.getInstance():createHashMap()
            local whereHashMap = StdUtil.getInstance():createHashMap()
            orderHashMap:put(EntryData.getInstance().ID, self.entryId)
            orderHashMap:put(OrderData.ID, self.orderId)
            orderHashMap:put(UserData.USERNAME, self.userName)
            orderHashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
            orderHashMap:put(OrderHistoryData.SHIPPEDDATE, self.shipDate)
            orderHashMap:put(OrderHistoryData.ORDERDATE, self.orderDate)
            orderHashMap:put(OrderHistoryData.TRANSDATE, self.transDate)
            orderHashMap:put(OrderHistoryData.CANCELDATE, self.cancelDate)
            orderHashMap:put(OrderHistoryData.STATUS, self.status)
            orderHashMap:put(PaymentData.METHOD, self.paymentMethod)
            orderHashMap:put(PaymentData.NAME, self.name)
            orderHashMap:put(PaymentData.TYPE, self.type)
            orderHashMap:put(PaymentData.EXPIRATION, self.expiration)
            orderHashMap:put(BillingAddressData.NAME, self.billingName)
            orderHashMap:put(BillingAddressData.STREET, self.billingStreet)
            orderHashMap:put(BillingAddressData.CITY, self.billingCity)
            orderHashMap:put(BillingAddressData.STATE, self.billingState)
            orderHashMap:put(BillingAddressData.CODE, self.billingCode)
            orderHashMap:put(BillingAddressData.COUNTRY, self.billingCountry)
            orderHashMap:put(ShippingAddressData.NAME, self.shippingName)
            orderHashMap:put(ShippingAddressData.STREET, self.shippingStreet)
            orderHashMap:put(ShippingAddressData.CITY, self.shippingCity)
            orderHashMap:put(ShippingAddressData.STATE, self.shippingState)
            orderHashMap:put(ShippingAddressData.CODE, self.shippingCode)
            orderHashMap:put(ShippingAddressData.COUNTRY, self.shippingCountry)
            orderHashMap:put(ShippingMethodData.NAME, self.shippingMethodName)
            orderHashMap:put(OrderHistoryData.SUBTOTAL, self.subTotal)
            orderHashMap:put(OrderHistoryData.SHIPPINGCOST, self.shippingCost)
            orderHashMap:put(OrderHistoryData.TAX, self.tax)
            orderHashMap:put(OrderHistoryData.TOTAL, self.total)
            orderHashMap:put(EntryData.getInstance().SPECIAL, self.special)
            orderHashMap:put(OrderData.CUSTOMERCOMMENT, self.userComment)
            orderHashMap:put(OrderData.CUSTOMERCANCELCOMMENT, self.userCancelComment)
            orderHashMap:put(OrderData.STORECOMMENT, self.storeComment)
            orderHashMap:put(OrderData.STORECANCELCOMMENT, self.storeCancelComment)
            whereHashMap:put(OrderData.ID, self.orderId)
            OrderHistoryEntityFactory.getInstance():update(whereHashMap, orderHashMap)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "update()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to update order table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "update()", e)
            end
            return error
        end
end

return UpdateOrderHelper

