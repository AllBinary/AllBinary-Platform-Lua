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
-- package views.generic.order

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local Basket = require("org.allbinary.business.user.commerce.inventory.basket.Basket")
local BasketReview = require("org.allbinary.business.user.commerce.inventory.basket.BasketReview")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderData = require("org.allbinary.business.user.commerce.inventory.order.OrderData")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
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

local OrderView = {}
OrderView.__index = OrderView
OrderView.className = "OrderView"
setmetatable(OrderView, {__index = HttpStoreComponentView})

function OrderView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.request = nil
    self.order = nil
    self.orderHistory = nil
    self.basketReview = nil
end


function OrderView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), OrderView)
    self:_init_fields()
        -- super(...) made self above
        self.request = self:getPageContext():getRequest()
        self:getFormData()
    return self
end


-- throws Exception
function OrderView:getFormData()
        local id = self.request:getParameter(OrderData.ID)
        if id == nil then
            id = self:getWeblisketSession():getOrder():getId()
        end
        self.order = Order.new(Basket.new())
        self.order:setId(id)
end


function OrderView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local orderHistoryNode = self.orderHistory:toXmlNode(document)
            local node = document:createElement(self.orderHistory:getPaymentMethod())
            orderHistoryNode:appendChild(self.basketReview:toXmlNode(document))
            node:appendChild(orderHistoryNode)
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


function OrderView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function OrderView:view()
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

return OrderView

