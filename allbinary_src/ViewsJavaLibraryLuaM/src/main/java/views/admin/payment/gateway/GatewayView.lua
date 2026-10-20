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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local BasicPaymentTypeUtil = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentTypeUtil")
local PaymentGatewayEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local PaymentGatewayViewAbstract = require("views.admin.payment.gateway.PaymentGatewayViewAbstract")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GatewayView = {}
GatewayView.__index = GatewayView
GatewayView.className = "GatewayView"
setmetatable(GatewayView, {__index = PaymentGatewayViewAbstract})

function GatewayView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function GatewayView.new(transformInfoInterface)
    local self = setmetatable(PaymentGatewayViewAbstract.new(transformInfoInterface), GatewayView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function GatewayView:getFormData(request)
        PaymentGatewayViewAbstract.getFormData(self, request)
        if StringValidationUtil.getInstance():isEmpty(self:getPaymentGatewayPrimaryKey():getName()) then
            self:getPaymentGatewayPrimaryKey():setName(self:getWeblisketSession():getPaymentMethod())
        end
end


-- throws Exception
function GatewayView:view()
        local try_ok, try_error = pcall(function()
            local paymentGatewayInterface = PaymentGatewayEntityFactory.getInstance():getPaymentGatewayInterface(self:getPaymentGatewayPrimaryKey():getStoreName(), BasicPaymentTypeUtil.getInstance():get(self:getPaymentGatewayPrimaryKey():getName()))
            return PaymentGatewayComponent.new(self:getTransformInfoInterface(), paymentGatewayInterface):view()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "edit()", e)
            end
            error(e, 0)
        end
end

return GatewayView

