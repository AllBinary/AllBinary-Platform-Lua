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
-- package taghelpers

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local TagHelper = require("admin.taghelpers.TagHelper")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderHistoryFactory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryFactory")
local OrderHistoryInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryInterface")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderHistoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHistoryHelper = {}
OrderHistoryHelper.__index = OrderHistoryHelper
OrderHistoryHelper.className = "OrderHistoryHelper"
setmetatable(OrderHistoryHelper, {__index = TagHelper})

function OrderHistoryHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
    self.request = nil
    self.streetAddress = nil
    self.id = nil
    self.groupId = nil
    self.status = nil
    self.newStatus = nil
end


function OrderHistoryHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(TagHelper.new(), OrderHistoryHelper)
    self:_init_fields()
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        self.newStatus = propertiesHashMap:get(OrderHistoryData.STATUS)
        if storeName ~= nil then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
        self:getFormData()
    return self
end


function OrderHistoryHelper:getFormData()
        self.id = self.request:getParameter(OrderData.ID)
        self.groupId = self.request:getParameter(ShippingMethodData.GROUP)
        if self.newStatus == nil then
            self.newStatus = self.request:getParameter(OrderHistoryData.STATUS)
        end
end


function OrderHistoryHelper:setOrderStatus()
        local try_ok, try_error = pcall(function()
            local success = "Status successfully set to: " .. self.status
            local orderReviewInterface = OrderHistoryFactory.getInstance(self.id)
            local status = orderReviewInterface:getStatus()
            if ((status < OrderHistoryData.CANCELLED and -1) or (status > OrderHistoryData.CANCELLED and 1) or 0) == 0 then
                return "Order " .. self.id .. " Already Cancelled<br/>"
            elseif ((status < OrderHistoryData.SHIPPED and -1) or (status > OrderHistoryData.SHIPPED and 1) or 0) == 0 then
                return "Order " .. self.id .. " Already Shipped. You can't cancel a shipped order.<br/>"
            elseif ((status < OrderHistoryData.PREPROCESSING and -1) or (status > OrderHistoryData.PREPROCESSING and 1) or 0) == 0 then
                return "Order " .. self.id .. " has been cancelled.<br/>"
            elseif ((status < OrderHistoryData.PARTIALLYSHIPPED and -1) or (status > OrderHistoryData.PARTIALLYSHIPPED and 1) or 0) == 0 then
                return "Order " .. self.id .. " Partially Shipped. You can cancel unshipped items, but not the whole order.<br/>"
            elseif ((status < OrderHistoryData.PROCESSING and -1) or (status > OrderHistoryData.PROCESSING and 1) or 0) == 0 then
                local orderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance()
                orderHistoryEntityInterface:setStatus(self.id, self.newStatus)
                return "Order " .. self.id .. " has been cancelled.<br/>"
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF(success, self, "setOrderStatus()")
            end
            return "Error Setting Order Status"
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set order status"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setOrderStatus()", e)
            end
            return error .. "<br/>" .. "Exception: " .. tostring(e) .. "<br/>"
        end
end

return OrderHistoryHelper

