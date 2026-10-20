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
-- package views.generic.payment

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Payment = require("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.PaymentEntityFactory")
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

local PaymentView = {}
PaymentView.__index = PaymentView
PaymentView.className = "PaymentView"
setmetatable(PaymentView, {__index = HttpStoreComponentView})

function PaymentView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), PaymentView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function PaymentView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local paymentNode = document:createElement(PaymentData.PAYMENT)
            document:appendChild(paymentNode)
            local paymentVector = PaymentEntityFactory.getInstance():getPaymentEntityInstance():get(self:getWeblisketSession():getUserName())
            local size = paymentVector:size()
            for index = 0, size - 1 do
                local payment = paymentVector:get(index)
                paymentNode:appendChild(payment:toXmlNode(document))
            end
            return paymentNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLLOGGING) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end


function PaymentView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


function PaymentView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view Payment"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
end

return PaymentView

