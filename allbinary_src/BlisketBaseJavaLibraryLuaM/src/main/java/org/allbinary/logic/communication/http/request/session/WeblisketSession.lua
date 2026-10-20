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
-- package org.allbinary.logic.communication.http.request.session

-- local HashMap = require("java.util.HashMap")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpSession = require("javax.servlet.http.HttpSession")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserData = require("org.allbinary.business.user.UserData")
local Basket = require("org.allbinary.business.user.commerce.inventory.basket.Basket")
local Order = require("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local UserRole = require("org.allbinary.business.user.role.UserRole")
local UserRoleB = require("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = require("org.allbinary.business.user.role.UserRoleData")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local WeblisketSession = {}
WeblisketSession.__index = WeblisketSession
WeblisketSession.className = "WeblisketSession"

function WeblisketSession:_init_fields()
    self.session = nil
end

function WeblisketSession.new(...)
    local count = select("#", ...)
    if count == 2 then return WeblisketSession._new2(...)
    elseif count == 2 then return WeblisketSession._new2(...)
    end
end


function WeblisketSession._new2(hashMap, pageContext)
    local self = WeblisketSession._new2(hashMap, pageContext:getRequest())
        -- this(...) made self above
    return self
end


function WeblisketSession._new2(hashMap, httpServletRequest)
    local self = setmetatable({}, WeblisketSession)
    self:_init_fields()
        local propertiesHashMap = hashMap
        local request = httpServletRequest
        self.session = request:getSession(true)
        if self:getStoreName() == nil then
            self:setStoreName(propertiesHashMap:get(StoreFrontData.getInstance().NAME))
        end
    return self
end


function WeblisketSession:getId()
        return self.session:getId()
end


function WeblisketSession:setPassword(password)
        self.session:setAttribute(UserData.PASSWORD, password)
end


function WeblisketSession:setUserName(userName)
        self.session:setAttribute(UserData.USERNAME, userName)
end


function WeblisketSession:setPaymentMethod(value)
        self.session:setAttribute(tostring(PaymentGatewayData.NAME), value)
end


function WeblisketSession:setAuthenticated()
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().TRUE_STRING)
end


function WeblisketSession:setRole(aRole)
        self.session:setAttribute(tostring(UserRoleData.NAME), aRole)
end


function WeblisketSession:setAttempts(value)
        self.session:setAttribute(WeblisketSessionData.ATTEMPTS, value)
end


function WeblisketSession:setTimeout(value)
        self.session:setAttribute(WeblisketSessionData.TIMEOUT, value)
end


function WeblisketSession:setStoreName(value)
        self.session:setAttribute(StoreFrontData.getInstance().NAME, value)
end


function WeblisketSession:getWebAppPath()
        return self.session:getAttribute(org.allbinary.globals.GLOBALS2.WEBAPPPATH)
end


function WeblisketSession:getUserName()
        return self.session:getAttribute(UserData.USERNAME)
end


function WeblisketSession:getPassword()
        return self.session:getAttribute(UserData.PASSWORD)
end


function WeblisketSession:getPaymentMethod()
        return self.session:getAttribute(tostring(PaymentGatewayData.NAME))
end


function WeblisketSession:getAuthentication()
        return self.session:getAttribute(WeblisketSessionData.AUTHENTICATED)
end


function WeblisketSession:getAttempts()
        return self.session:getAttribute(WeblisketSessionData.ATTEMPTS)
end


function WeblisketSession:getTimeout()
        return self.session:getAttribute(WeblisketSessionData.TIMEOUT)
end


function WeblisketSession:getStoreName()
        return self.session:getAttribute(StoreFrontData.getInstance().NAME)
end


-- throws Exception
function WeblisketSession:getRole()
        local userRole = self.session:getAttribute(tostring(UserRoleData.NAME))
        if userRole ~= nil then
            return UserRoleB.getRole(userRole:getBasicUserRole():getRole())
        else
            return nil
        end
end


-- throws Exception
function WeblisketSession:getOrder()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getStoreName())
        local basketName = storeFrontInterface:getBasketName()
        if not StringValidationUtil.getInstance():isEmpty(basketName) then
            local orderInterface = self.session:getAttribute(basketName)
            if orderInterface == nil then
                orderInterface = Order.new(Basket.new())
            end
            self.session:setAttribute(basketName, orderInterface)
            return orderInterface
        else
            error(java_exception("Exception", "Basket Name Not Found"), 0)
        end
end


-- Java overloaded method: Lua keeps the last definition
function WeblisketSession:setAuthenticated(value)
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING)
end


function WeblisketSession:clear()
        self.session:removeAttribute(WeblisketSessionData.AUTHENTICATED)
        self.session:removeAttribute(WeblisketSessionData.TIMEOUT)
        self.session:removeAttribute(tostring(UserRoleData.NAME))
        self.session:removeAttribute(UserData.USERNAME)
end


function WeblisketSession:getCreationTime()
        return self.session:getCreationTime()
end


function WeblisketSession:getLastAccessedTime()
        return self.session:getLastAccessedTime()
end


function WeblisketSession:removeBasket()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getStoreName())
        local basketName = storeFrontInterface:getBasketName()
        if not StringValidationUtil.getInstance():isEmpty(basketName) then
            self.session:removeAttribute(basketName)
        end
end

return WeblisketSession

