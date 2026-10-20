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
-- package org.allbinary.business.user.commerce.money.payment.gateway.transaction

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local Basket = require("org.allbinary.business.user.commerce.inventory.basket.Basket")
local OrderHistory = require("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local Payment = require("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local TenderTypeFactory = require("org.allbinary.business.user.commerce.money.payment.types.TenderTypeFactory")
local TransactionTypeFactory = require("org.allbinary.business.user.commerce.money.payment.types.TransactionTypeFactory")
local OrderIdGenerator = require("org.allbinary.data.generator.OrderIdGenerator")
local OrderHistoryEntityFactory = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderHistoryEntityInterface = require("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentTransactionInterfaceRequestFactory = {}
PaymentTransactionInterfaceRequestFactory.__index = PaymentTransactionInterfaceRequestFactory
PaymentTransactionInterfaceRequestFactory.className = "PaymentTransactionInterfaceRequestFactory"

function PaymentTransactionInterfaceRequestFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function PaymentTransactionInterfaceRequestFactory.getInstance()
        return PaymentTransactionInterfaceRequestFactory.instance
end


function PaymentTransactionInterfaceRequestFactory.new()
    local self = setmetatable({}, PaymentTransactionInterfaceRequestFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function PaymentTransactionInterfaceRequestFactory:getInstance(transformInfoInterface)
        local try_ok, try_error = pcall(function()
            local httpTransformInfoInterface = transformInfoInterface
            local pageContext = httpTransformInfoInterface:getPageContext()
            local httpServletRequest = pageContext:getRequest()
            local command = httpServletRequest:getParameter(org.allbinary.globals.GLOBALS2.ADMINCOMMAND)
            if command ~= nil and ((command < org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR and -1) or (command > org.allbinary.globals.GLOBALS2.AUTHORIZEFORMEVALBODYONERROR and 1) or 0) == 0 then
                return self:generateFromTestData(transformInfoInterface)
            else
                local propertiesHashMap = httpTransformInfoInterface:getPropertiesHashMap()
                local weblisketSession = WeblisketSession.new(propertiesHashMap, pageContext)
                local storeFrontInterface = StoreFrontFactory.getInstance(weblisketSession:getStoreName())
                local order = weblisketSession:getOrder()
                local orderId = order:getId()
                local orderHistoryEntityInterface = OrderHistoryEntityFactory.getInstance()
                local orderReview = orderHistoryEntityInterface:getOrder(orderId)
                local orderPaymentInfo = orderReview:getPaymentInfo()
                orderPaymentInfo:setTransactionType(tostring(TransactionTypeFactory.getInstance().SALE))
                orderPaymentInfo:setTenderType(tostring(TenderTypeFactory.getInstance().CREDITCARD))
                orderReview:setPaymentInfo(orderPaymentInfo)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                    self.logUtil:putF(orderReview:getId(), self, "getPaymentTransactionInterface()")
                end
                local paymentTransactionInterface = PaymentTransactionInterfaceFactory.getInstance():getInstance(orderReview)
                return paymentTransactionInterface
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getPaymentTransactionInterface()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function PaymentTransactionInterfaceRequestFactory:generateFromTestData(transformInfoInterface)
        local try_ok, try_error = pcall(function()
            local httpTransformInfoInterface = transformInfoInterface
            local propertiesHashMap = httpTransformInfoInterface:getPropertiesHashMap()
            local pageContext = httpTransformInfoInterface:getPageContext()
            local weblisketSession = WeblisketSession.new(propertiesHashMap, pageContext)
            local storeFrontInterface = StoreFrontFactory.getInstance(weblisketSession:getStoreName())
            local httpServletRequest = pageContext:getRequest()
            local gatewayName = weblisketSession:getPaymentMethod()
            if StringValidationUtil.getInstance():isEmpty(gatewayName) then
                gatewayName = httpServletRequest:getParameter(tostring(PaymentGatewayData.NAME))
            end
            local transactionType = httpServletRequest:getParameter(PaymentData.TRANSACTIONTYPE)
            local tenderType = httpServletRequest:getParameter(PaymentData.TENDERTYPE)
            local payment = Payment.new()
            payment:setTransactionType(transactionType)
            payment:setTenderType(tenderType)
            local orderReview = OrderHistory.new(Basket.new())
            orderReview:setStoreName(storeFrontInterface:getName())
            orderReview:setPaymentMethod(gatewayName)
            orderReview:setUserName("testing")
            local orderId = httpServletRequest:getParameter("orderNumber")
            if orderId == nil or ((orderId < StringUtil.getInstance().EMPTY_STRING and -1) or (orderId > StringUtil.getInstance().EMPTY_STRING and 1) or 0) == 0 then
                orderId = OrderIdGenerator.new():getNext()
                orderReview:setId(orderId)
                local account = httpServletRequest:getParameter("account")
                local expirationDate = httpServletRequest:getParameter("expirationDate")
                local checkNumber = httpServletRequest:getParameter("checkNumber")
                local driversLicense = httpServletRequest:getParameter("driversLicense")
                local magneticInkCheckReader = httpServletRequest:getParameter("magneticInkCheckReader")
                local aba = httpServletRequest:getParameter("aba")
                local accountType = httpServletRequest:getParameter("accountType")
                local name = httpServletRequest:getParameter("name")
                payment:setName(name)
                payment:setNumber(account)
                payment:setExpiration(expirationDate)
                payment:setCheckNumber(checkNumber)
                payment:setDriversLicense(driversLicense)
                payment:setMagneticInkCheckReader(magneticInkCheckReader)
                payment:setAba(aba)
                payment:setAccountType(accountType)
                local street = httpServletRequest:getParameter("street")
                local city = httpServletRequest:getParameter("city")
                local state = httpServletRequest:getParameter("state")
                local zip = httpServletRequest:getParameter("zip")
                local streetAddress = StreetAddress.new()
                streetAddress:setName(name)
                streetAddress:setStreet(street)
                streetAddress:setCity(city)
                streetAddress:setState(state)
                streetAddress:setCode(zip)
                local email = httpServletRequest:getParameter("email")
                local amount = httpServletRequest:getParameter("amount")
                orderReview:setTotal(Money.new(amount))
                orderReview:setBillingAddress(streetAddress)
            else
                orderReview:setId(orderId)
            end
            orderReview:setPaymentInfo(payment)
            local paymentTransactionInterface = PaymentTransactionInterfaceFactory.getInstance():getInstance(orderReview)
            return paymentTransactionInterface
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generatePaymentTransactionInterfaceFromTestData()", e)
            end
            error(e, 0)
        end
end

PaymentTransactionInterfaceRequestFactory.instance = PaymentTransactionInterfaceRequestFactory.new()

return PaymentTransactionInterfaceRequestFactory

