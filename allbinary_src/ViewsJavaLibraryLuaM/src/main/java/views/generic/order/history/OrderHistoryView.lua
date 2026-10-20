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
-- package views.generic.order.history

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local OrderHistoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHistoryView = {}
OrderHistoryView.__index = OrderHistoryView
OrderHistoryView.className = "OrderHistoryView"
setmetatable(OrderHistoryView, {__index = HttpStoreComponentView})

function OrderHistoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.shipped = nil
    self.partiallyShipped = nil
    self.processing = nil
    self.preprocessing = nil
    self.cancelled = nil
end


function OrderHistoryView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), OrderHistoryView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self.preprocessing = self.request:getParameter(OrderHistoryData.PREPROCESSINGNAME)
        self.shipped = self.request:getParameter(OrderHistoryData.SHIPPEDNAME)
        self.partiallyShipped = self.request:getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME)
        self.processing = self.request:getParameter(OrderHistoryData.PROCESSINGNAME)
        self.cancelled = self.request:getParameter(OrderHistoryData.CANCELLEDNAME)
    return self
end


-- throws Exception
function OrderHistoryView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local node = document:createElement(OrderData.ORDERS)
            local orderHistoryEntity = OrderHistoryEntity.new()
            local orderReviewVector = orderHistoryEntity:getOrders(self:getWeblisketSession():getUserName())
            local size = orderReviewVector:size()
            for index = 0, size - 1 do
                local orderHistory = orderReviewVector:get(index)
                local orderHistoryNode = orderHistory:toXmlNode(document)
                local orderNode = document:createElement(orderHistory:getPaymentMethod())
                node:appendChild(orderHistory:toXmlNode(document))
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Attempt to View a users order history", self, "view")
            end
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PREPROCESSINGNAME, OrderHistoryData.PREPROCESSING))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PROCESSINGNAME, OrderHistoryData.PROCESSING))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.CANCELLEDNAME, OrderHistoryData.CANCELLED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.PARTIALLYSHIPPEDNAME, OrderHistoryData.PARTIALLYSHIPPED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, OrderHistoryData.SHIPPEDNAME, OrderHistoryData.SHIPPED))
            node:appendChild(ModDomHelper.createNameValueNodes(document, self.GLOBALS2.VIEWNAME, self.GLOBALS2.VIEW))
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function OrderHistoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function OrderHistoryView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return OrderHistoryView

