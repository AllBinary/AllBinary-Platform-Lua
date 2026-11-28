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

local PaymentTransactionInterfaceRequestFactory = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceRequestFactory"] = PaymentTransactionInterfaceRequestFactory

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local HashMap = java_lazy("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local Basket = java_lazy("org.allbinary.business.user.commerce.inventory.basket.Basket")
local OrderHistory = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderHistory")
local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local Payment = java_lazy("org.allbinary.business.user.commerce.money.payment.Payment")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local TenderTypeFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.types.TenderTypeFactory")
local TransactionTypeFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.types.TransactionTypeFactory")
local OrderIdGenerator = java_lazy("org.allbinary.data.generator.OrderIdGenerator")
local OrderHistoryEntityFactory = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityFactory")
local OrderHistoryEntityInterface = java_lazy("org.allbinary.data.tables.user.commerce.inventory.order.OrderHistoryEntityInterface")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PaymentTransactionInterface = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterface")
local PaymentTransactionInterfaceFactory = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceFactory")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PaymentTransactionInterfaceRequestFactory is declared before the requires
PaymentTransactionInterfaceRequestFactory.__index = PaymentTransactionInterfaceRequestFactory
PaymentTransactionInterfaceRequestFactory.className = "PaymentTransactionInterfaceRequestFactory"
PaymentTransactionInterfaceRequestFactory.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.transaction.PaymentTransactionInterfaceRequestFactory"

function PaymentTransactionInterfaceRequestFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function PaymentTransactionInterfaceRequestFactory.getInstance()
        return PaymentTransactionInterfaceRequestFactory.instance_f
end
PaymentTransactionInterfaceRequestFactory.getInstance__static = PaymentTransactionInterfaceRequestFactory.getInstance


function PaymentTransactionInterfaceRequestFactory._jinit(self)
    PaymentTransactionInterfaceRequestFactory._init_fields(self)
    return self
end

function PaymentTransactionInterfaceRequestFactory.new(...)
    local self = setmetatable({}, PaymentTransactionInterfaceRequestFactory)
    PaymentTransactionInterfaceRequestFactory._jinit(self, ...)
    return self
end


-- throws Exception
function PaymentTransactionInterfaceRequestFactory:getInstance(transformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
            local httpTransformInfoInterface = transformInfoInterface
            local pageContext = httpTransformInfoInterface:getPageContext()
            local httpServletRequest = pageContext:getRequest()
            local command = httpServletRequest:getParameter(GLOBALS2.ADMINCOMMAND)
            if not rawequal(command, nil) and rawequal(((command < GLOBALS2.AUTHORIZEFORMEVALBODYONERROR and -1) or (command > GLOBALS2.AUTHORIZEFORMEVALBODYONERROR and 1) or 0), 0) then
                do return "__jreturn", self:generateFromTestData(transformInfoInterface) end
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
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
                    self.logUtil:putF(orderReview:getId(), self, "getPaymentTransactionInterface()")
                end
                local paymentTransactionInterface = PaymentTransactionInterfaceFactory.getInstance():getInstance(orderReview)
                do return "__jreturn", paymentTransactionInterface end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getPaymentTransactionInterface()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
PaymentTransactionInterfaceRequestFactory.getInstance__instance = PaymentTransactionInterfaceRequestFactory.getInstance
function PaymentTransactionInterfaceRequestFactory.getInstance(...)
                
    if select("#", ...) == 0 then return PaymentTransactionInterfaceRequestFactory.getInstance__static() end
                
    return PaymentTransactionInterfaceRequestFactory.getInstance__instance(...)
                
end


-- throws Exception
function PaymentTransactionInterfaceRequestFactory:generateFromTestData(transformInfoInterface)
        local try_ok, try_error, try_value = pcall(function()
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
            if rawequal(orderId, nil) or rawequal(((orderId < StringUtil.getInstance().EMPTY_STRING and -1) or (orderId > StringUtil.getInstance().EMPTY_STRING and 1) or 0), 0) then
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
            do return "__jreturn", paymentTransactionInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENTERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "generatePaymentTransactionInterfaceFromTestData()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

PaymentTransactionInterfaceRequestFactory.instance_f = PaymentTransactionInterfaceRequestFactory.new()

return PaymentTransactionInterfaceRequestFactory

