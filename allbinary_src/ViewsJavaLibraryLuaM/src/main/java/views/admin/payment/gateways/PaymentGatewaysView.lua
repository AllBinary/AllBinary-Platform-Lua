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
-- package views.admin.payment.gateways

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewaysData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local PaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
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

local PaymentGatewaysView = {}
PaymentGatewaysView.__index = PaymentGatewaysView
PaymentGatewaysView.className = "PaymentGatewaysView"
setmetatable(PaymentGatewaysView, {__index = HttpStoreComponentView})

function PaymentGatewaysView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.paymentGatewayVector = nil
end


function PaymentGatewaysView.new(transformInfoInterface, gatewayVector)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), PaymentGatewaysView)
    self:_init_fields()
        -- super(...) made self above
        self.paymentGatewayVector = gatewayVector
    return self
end


-- throws Exception
function PaymentGatewaysView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local storeName = self:getTransformInfoInterface():getStoreName()
            local paymentGatewaysNode = document:createElement(PaymentGatewaysData.NAME)
            local size = self.paymentGatewayVector:size()
            for index = 0, size - 1 do
                local paymentType = self.paymentGatewayVector:get(index)
                local hashMap = paymentType:toHashMap()
                hashMap:put(EntryData.getInstance().DEFAULT, PaymentTypeUtil.getInstance():getDefault(storeName):getBasicPaymentType():getName())
                local paymentGatewayNode = ModDomHelper.createNodeWithValueNodes(document, tostring(PaymentGatewayData.NAME), hashMap)
                paymentGatewaysNode:appendChild(paymentGatewayNode)
            end
            return paymentGatewaysNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function PaymentGatewaysView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


function PaymentGatewaysView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view payment gateways"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
end

return PaymentGatewaysView

