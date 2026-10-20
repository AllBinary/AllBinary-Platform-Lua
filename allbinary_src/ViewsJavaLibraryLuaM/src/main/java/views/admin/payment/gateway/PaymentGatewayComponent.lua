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
-- package views.admin.payment.gateway

local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayDomNodeFactoryInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.modules.gateway.PaymentGatewayDomNodeFactoryInterface")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local BasicPaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local PaymentGatewayComponent = {}
PaymentGatewayComponent.__index = PaymentGatewayComponent
PaymentGatewayComponent.className = "PaymentGatewayComponent"
setmetatable(PaymentGatewayComponent, {__index = HttpStoreComponentView})

function PaymentGatewayComponent:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.paymentGatewayInterface = nil
end


function PaymentGatewayComponent.new(transformInfoInterface, paymentGatewayInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), PaymentGatewayComponent)
    self:_init_fields()
        -- super(...) made self above
        self.paymentGatewayInterface = paymentGatewayInterface
    return self
end


-- throws Exception
function PaymentGatewayComponent:addDomNodeInterfaces()
        local paymentType = BasicPaymentTypeUtil.getInstance():get(self.paymentGatewayInterface:getName())
        local paymentGatewayDomNodeFactoryInterface = paymentType:getPaymentGatewayDomNodeFactoryInterface()
        local domNodeInterface = paymentGatewayDomNodeFactoryInterface:getInstance(self.paymentGatewayInterface)
        self:addDomNodeInterface(domNodeInterface)
end


function PaymentGatewayComponent:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            local error = "Failed to view payment gateway"
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            return error
        end
end

return PaymentGatewayComponent

