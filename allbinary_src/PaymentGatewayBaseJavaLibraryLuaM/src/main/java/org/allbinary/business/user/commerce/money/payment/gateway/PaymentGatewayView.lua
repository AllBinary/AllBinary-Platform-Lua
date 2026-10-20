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
-- package org.allbinary.business.user.commerce.money.payment.gateway

-- local HashMap = require("java.util.HashMap")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGatewayView = {}
PaymentGatewayView.__index = PaymentGatewayView
PaymentGatewayView.className = "PaymentGatewayView"

function PaymentGatewayView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.paymentGatewayInterface = nil
end


function PaymentGatewayView.new(paymentGatewayInterface)
    local self = setmetatable({}, PaymentGatewayView)
    self:_init_fields()
        self.paymentGatewayInterface = paymentGatewayInterface
    return self
end


function PaymentGatewayView:getPaymentGatewayInterface()
        return self.paymentGatewayInterface
end


-- throws Exception
function PaymentGatewayView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        return hashMap
end


-- throws Exception
function PaymentGatewayView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, "toXmlNode")
            end
            local hashMap = PaymentGatewayMapping.new(self.paymentGatewayInterface):toHashMap()
            hashMap:putAll(self:toHashMap())
            local paymentGatewayNode = ModDomHelper.createNodeWithValueNodes(document, tostring(PaymentGatewayData.NAME), hashMap)
            return paymentGatewayNode
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode", e)
            end
            error(e, 0)
        end
end

return PaymentGatewayView

