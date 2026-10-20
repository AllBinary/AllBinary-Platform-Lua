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
-- package views.admin.payment

local PaymentProcessorInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.processor.PaymentProcessorInterface")
local PaymentProcessorInterfaceFactory = require("org.allbinary.business.user.commerce.money.payment.gateway.processor.PaymentProcessorInterfaceFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
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

local PaymentProcessorComponent = {}
PaymentProcessorComponent.__index = PaymentProcessorComponent
PaymentProcessorComponent.className = "PaymentProcessorComponent"
setmetatable(PaymentProcessorComponent, {__index = HttpStoreComponentView})

function PaymentProcessorComponent:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PaymentProcessorComponent.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), PaymentProcessorComponent)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function PaymentProcessorComponent:addDomNodeInterfaces()
        local paymentProcessorInterface = PaymentProcessorInterfaceFactory.getInstance():getInstance(self:getTransformInfoInterface())
        paymentProcessorInterface:process()
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        httpTransformInfoInterface:getWeblisketSession():removeBasket()
        self:addDomNodeInterface(paymentProcessorInterface)
end


-- throws Exception
function PaymentProcessorComponent:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return PaymentProcessorComponent

