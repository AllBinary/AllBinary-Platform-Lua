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

local WeblisketSession = {}
package.loaded["org.allbinary.logic.communication.http.request.session.WeblisketSession"] = WeblisketSession

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
-- local HttpSession = require("javax.servlet.http.HttpSession")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local StoreFrontFactory = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local Basket = java_lazy("org.allbinary.business.user.commerce.inventory.basket.Basket")
local Order = java_lazy("org.allbinary.business.user.commerce.inventory.order.Order")
local OrderInterface = java_lazy("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local UserRole = java_lazy("org.allbinary.business.user.role.UserRole")
local UserRoleB = java_lazy("org.allbinary.business.user.role.UserRoleB")
local UserRoleData = java_lazy("org.allbinary.business.user.role.UserRoleData")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local WeblisketSessionInterface = require("org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")

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

-- class table WeblisketSession is declared before the requires
WeblisketSession.__index = WeblisketSession
WeblisketSession.className = "WeblisketSession"
WeblisketSession.javaClassName = "org.allbinary.logic.communication.http.request.session.WeblisketSession"
WeblisketSession.java_implements = " WeblisketSessionInterface "
WeblisketSession.java_interfaces = function() return {WeblisketSessionInterface} end

function WeblisketSession:_init_fields()
    if self.session == nil then self.session = nil end
end

function WeblisketSession._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return WeblisketSession._new2(self, ...)
    end
    error("No constructor of WeblisketSession takes " .. count .. " arguments")
end

function WeblisketSession.new(...)
    local self = setmetatable({}, WeblisketSession)
    WeblisketSession._jinit(self, ...)
    return self
end

function WeblisketSession._new2(self, ...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "PageContext")) then return WeblisketSession._new2_1(self, ...) end
    return WeblisketSession._new2_2(self, ...)
end


function WeblisketSession._new2_1(self, hashMap, pageContext)
    WeblisketSession._jinit(self, hashMap, pageContext:getRequest())
        -- this(...) made self above
    return self
end


function WeblisketSession._new2_2(self, hashMap, httpServletRequest)
    WeblisketSession._init_fields(self)
        local propertiesHashMap = hashMap
        local request = httpServletRequest
        self.session = request:getSession(true)
        if rawequal(self:getStoreName(), nil) then
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


function WeblisketSession:setAuthenticated_j0()
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
        return self.session:getAttribute(GLOBALS2.WEBAPPPATH)
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
        if not rawequal(userRole, nil) then
            return UserRoleB.getRole(userRole:getBasicUserRole():getRole())
        else
            return nil
        end
end


-- throws Exception
function WeblisketSession:getOrder()
        local storeFrontInterface = StoreFrontFactory.getInstance(self:getStoreName())
        local basketName = storeFrontInterface:getBasketName()
        if not (StringValidationUtil.getInstance():isEmpty(basketName)) then
            local orderInterface = self.session:getAttribute(basketName)
            if rawequal(orderInterface, nil) then
                orderInterface = Order.new(Basket.new())
            end
            self.session:setAttribute(basketName, orderInterface)
            return orderInterface
        else
            error(require("java.lang.Exception").new("Basket Name Not Found"), 0)
        end
end


function WeblisketSession:setAuthenticated_j1(value)
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING)
end
function WeblisketSession:setAuthenticated(...)
    local count = select("#", ...)
    if count == 0 then return self:setAuthenticated_j0(...) end
    if count == 1 then return self:setAuthenticated_j1(...) end
    error("No method setAuthenticated takes " .. count .. " arguments")
end
WeblisketSession.setAuthenticated__jdispatcher = WeblisketSession.setAuthenticated


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
        if not (StringValidationUtil.getInstance():isEmpty(basketName)) then
            self.session:removeAttribute(basketName)
        end
end

return WeblisketSession

