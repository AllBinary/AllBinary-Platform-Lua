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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local OrderProcessorUtil = require("org.allbinary.business.user.commerce.inventory.order.OrderProcessorUtil")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local BasicPaymentType = require("org.allbinary.business.user.commerce.money.payment.types.BasicPaymentType")
local PaymentGatewayEntity = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntity")
local PaymentGatewayEntityFactory = require("org.allbinary.data.tables.user.commerce.money.payment.gateway.PaymentGatewayEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TagHelper = require("admin.taghelpers.TagHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHelper = {}
OrderHelper.__index = OrderHelper
OrderHelper.className = "OrderHelper"
setmetatable(OrderHelper, {__index = TagHelper})

function OrderHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.weblisketSession = nil
    self.storeFrontInterface = nil
    self.propertiesHashMap = nil
    self.pageContext = nil
    self.request = nil
end


function OrderHelper.new(propertiesHashMap, pageContext)
    local self = setmetatable(TagHelper.new(), OrderHelper)
    self:_init_fields()
        self.propertiesHashMap = propertiesHashMap
        self.pageContext = pageContext
        self.request = pageContext:getRequest()
        local storeName = propertiesHashMap:get(StoreFrontData.getInstance().NAME)
        if not StringValidationUtil.getInstance():isEmpty(storeName) then
            self.storeFrontInterface = StoreFrontFactory.getInstance(storeName)
        end
        self.weblisketSession = WeblisketSession.new(self.propertiesHashMap, self.pageContext)
    return self
end


function OrderHelper:setPaymentGateway()
        local try_ok, try_error = pcall(function()
            local paymentGatewayBoolean = false
            local orderInterface = self.weblisketSession:getOrder()
            local requestPaymentGateway = self.request:getParameter(tostring(PaymentGatewayData.NAME))
            if not StringValidationUtil.getInstance():isEmpty(requestPaymentGateway) then
                self.weblisketSession:setPaymentMethod(requestPaymentGateway)
                orderInterface:setPaymentMethod(requestPaymentGateway)
                paymentGatewayBoolean = true
            end
            local paymentGatewayEntityInterface = PaymentGatewayEntityFactory.getInstance()
            local paymentTypeVector = paymentGatewayEntityInterface:findPaymentTypeVectorByStore(self.weblisketSession:getStoreName())
            if paymentTypeVector:size() == 1 then
                local paymentType = paymentTypeVector:get(0)
                local paymentGatewayInterface = paymentGatewayEntityInterface:getPaymentGatewayInterface(self.weblisketSession:getStoreName(), paymentType)
                local paymentGateway = paymentGatewayInterface:getName()
                self.weblisketSession:setPaymentMethod(paymentGateway)
                orderInterface:setPaymentMethod(paymentGateway)
                paymentGatewayBoolean = true
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Successfully set PaymentGateway Order: ")
                stringBuffer:append(orderInterface:getId())
                stringBuffer:append(" to: ")
                stringBuffer:append(orderInterface:getPaymentMethod())
                self.logUtil:putF(tostring(stringBuffer), self, "setPaymentGateway()")
            end
            return paymentGatewayBoolean
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failed to set PaymentGateway for Order: ")
                local try_ok, try_error = pcall(function()
                    local orderInterface = self.weblisketSession:getOrder()
                    if orderInterface ~= nil then
                        stringBuffer:append(orderInterface:getId())
                        stringBuffer:append(" to: ")
                        stringBuffer:append(orderInterface:getPaymentMethod())
                    end
                end)
                if not try_ok then
                    local ex = try_error
                    stringBuffer:append(" Exception Getting")
                end
                self.logUtil:put(tostring(stringBuffer), self, "setPaymentGateway()", e)
            end
            return false
        end
end


function OrderHelper:process()
        local try_ok, try_error = pcall(function()
            local order = self.weblisketSession:getOrder()
            order:setStoreName(self.storeFrontInterface:getName())
            local result = OrderProcessorUtil.getInstance():process(self.weblisketSession:getUserName(), order)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGS) then
                self.logUtil:putF("Successfully Processed Order: " .. result, self, "processOrder()")
            end
            return result
        end)
        if not try_ok then
            local e = try_error
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Failed to Process Order: ")
            local try_ok, try_error = pcall(function()
                stringBuffer:append(self.weblisketSession:getOrder():getId())
            end)
            if not try_ok then
                local ex = try_error
                stringBuffer:append(" Exception Getting Id")
            end
            local error = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
            end
            return error
        end
end

return OrderHelper

