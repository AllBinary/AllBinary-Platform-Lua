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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local PaymentGatewayEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local PaymentGatewayEntityInterface = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local SelectExistingView = {}
SelectExistingView.__index = SelectExistingView
SelectExistingView.className = "SelectExistingView"
setmetatable(SelectExistingView, {__index = PaymentGatewayViewAbstract})

function SelectExistingView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function SelectExistingView.new(transformInfoInterface)
    local self = setmetatable(PaymentGatewayViewAbstract.new(transformInfoInterface), SelectExistingView)
    self:_init_fields()
        -- super(...) made self above
    return self
end


-- throws Exception
function SelectExistingView:view()
        local try_ok, try_error = pcall(function()
            local paymentGatewayEntityInterface = PaymentGatewayEntityFactory.getInstance()
            local existingGateways = paymentGatewayEntityInterface:findPaymentTypeVectorByStore(self:getPaymentGatewayPrimaryKey():getStoreName())
            return PaymentGatewaysView.new(self:getTransformInfoInterface(), existingGateways):view()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view", e)
            end
            error(e, 0)
        end
end

return SelectExistingView

