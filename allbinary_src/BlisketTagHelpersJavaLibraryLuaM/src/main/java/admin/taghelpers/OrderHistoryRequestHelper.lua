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
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderStatusEmail = require("org.allbinary.business.user.commerce.inventory.order.status.OrderStatusEmail")
local ShippingMethodData = require("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderItemsEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderItemsEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local ServiceClientInformationInterfaceFactory = require("org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
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

local OrderHistoryRequestHelper = {}
OrderHistoryRequestHelper.__index = OrderHistoryRequestHelper
OrderHistoryRequestHelper.className = "OrderHistoryRequestHelper"
setmetatable(OrderHistoryRequestHelper, {__index = TagHelper})

function OrderHistoryRequestHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = ServiceClientInformationInterfaceFactory.getInstance()
    self.request = nil
    self.id = nil
    self.groupId = nil
    self.status = nil
end


function OrderHistoryRequestHelper.new(hashMap, pageContext)
    local self = setmetatable(TagHelper.new(), OrderHistoryRequestHelper)
    self:_init_fields()
        self.request = pageContext:getRequest()
        self:getFormData()
    return self
end


function OrderHistoryRequestHelper:getFormData()
        self.id = self.request:getParameter(OrderData.ID)
        self.groupId = self.request:getParameter(ShippingMethodData.GROUP)
        self.status = self.request:getParameter(OrderHistoryData.STATUS)
end


function OrderHistoryRequestHelper:setOrderStatus()
        local try_ok, try_error = pcall(function()
            if ((self.groupId < CommonPhoneStrings.getInstance().ZERO and -1) or (self.groupId > CommonPhoneStrings.getInstance().ZERO and 1) or 0) ~= 0 then
                if OrderItemsEntityFactory.getInstance():isEverythingShipped(self.id) then
                    self.status = OrderHistoryData.SHIPPED
                else
                    self.status = OrderHistoryData.PARTIALLYSHIPPED
                end
            end
            local success = "Status successfully set to: " .. self.status
            OrderHistoryEntityFactory.getInstance():setStatus(self.id, self.status)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Success", self, "setOrderStatus()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to set order status"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setOrderStatus()", e)
            end
            return error
        end
end


-- Java overloaded method: Lua keeps the last definition
function OrderHistoryRequestHelper:setOrderStatus(newStatus)
        local try_ok, try_error = pcall(function()
            if newStatus == nil then
                newStatus = self.status
            end
            local success = "Status successfully set to: " .. newStatus
            OrderHistoryEntityFactory.getInstance():setStatus(self.id, newStatus)
            local orderHistory = OrderHistoryEntityFactory.getInstance():getOrder(self.id)
            OrderStatusEmail.new(self.abeClientInformation, orderHistory):process()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Success", self, "setOrderStatus()")
            end
            return success
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view order table"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setOrderStatus(newStatus)", e)
            end
            return error
        end
end

return OrderHistoryRequestHelper

