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
-- package views.admin.orderhistory

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local UserData = require("org.allbinary.business.user.UserData")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderHistoryData = require("org.allbinary.business.user.commerce.inventory.order.OrderHistoryData")
local UserName = require("org.allbinary.business.user.username.UserName")
local OrderHistoryEntity = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntity")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
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

local UserNameOrderHistoryView = {}
UserNameOrderHistoryView.__index = UserNameOrderHistoryView
UserNameOrderHistoryView.className = "UserNameOrderHistoryView"
setmetatable(UserNameOrderHistoryView, {__index = HttpStoreComponentView})

function UserNameOrderHistoryView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.userName = nil
    self.shipped = nil
    self.partiallyShipped = nil
    self.processing = nil
    self.preprocessing = nil
    self.cancelled = nil
    self.ON = "on"
end


function UserNameOrderHistoryView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), UserNameOrderHistoryView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self.userName = self.request:getParameter(UserData.USERNAME)
        self.preprocessing = self.request:getParameter(OrderHistoryData.PREPROCESSINGNAME)
        self.shipped = self.request:getParameter(OrderHistoryData.SHIPPEDNAME)
        self.partiallyShipped = self.request:getParameter(OrderHistoryData.PARTIALLYSHIPPEDNAME)
        self.processing = self.request:getParameter(OrderHistoryData.PROCESSINGNAME)
        self.cancelled = self.request:getParameter(OrderHistoryData.CANCELLEDNAME)
    return self
end


function UserNameOrderHistoryView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function UserNameOrderHistoryView:view()
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


function UserNameOrderHistoryView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local node = document:createElement(OrderData.ORDERS)
            local orderHistoryEntity = OrderHistoryEntity.new()
            local orderReviewVector = orderHistoryEntity:getOrders(self.userName)
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
            return nil
        end
end


function UserNameOrderHistoryView:isValid()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Started", self, self.commonStrings.IS_VALID)
        end
        if UserName.getInstance():isValid(self.userName) == true then
            return true
        end
        return false
end


function UserNameOrderHistoryView:toValidationInfoDoc()
        return nil
end


function UserNameOrderHistoryView:toValidationInfoNode(document)
        return nil
end


function UserNameOrderHistoryView:validationInfo()
        if self.userName == nil then
            return "No User Name Specified<br />"
        end
        if UserName.getInstance():isValid(self.userName) == false then
            return "Invalid User Name<br />"
        end
        return "Unknown Error<br />"
end

return UserNameOrderHistoryView

