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

local BasicWeblisketSession = {}
package.loaded["org.allbinary.logic.communication.http.request.session.BasicWeblisketSession"] = BasicWeblisketSession

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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpSession = require("javax.servlet.http.HttpSession")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local BasicUserRole = java_lazy("org.allbinary.business.user.role.BasicUserRole")
local BasicUserRoleData = java_lazy("org.allbinary.business.user.role.BasicUserRoleData")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local GLOBALS2 = java_lazy("org.allbinary.globals.GLOBALS2")
local WeblisketSessionData = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSessionData")

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

-- class table BasicWeblisketSession is declared before the requires
BasicWeblisketSession.__index = BasicWeblisketSession
BasicWeblisketSession.className = "BasicWeblisketSession"
BasicWeblisketSession.javaClassName = "org.allbinary.logic.communication.http.request.session.BasicWeblisketSession"

function BasicWeblisketSession:_init_fields()
    if self.session == nil then self.session = nil end
    if self.pageContext == nil then self.pageContext = nil end
end


function BasicWeblisketSession._jinit(self, pageContext)
    BasicWeblisketSession._init_fields(self)
        self.pageContext = pageContext
        local request = pageContext:getRequest()
        self.session = request:getSession(true)
    return self
end

function BasicWeblisketSession.new(...)
    local self = setmetatable({}, BasicWeblisketSession)
    BasicWeblisketSession._jinit(self, ...)
    return self
end


function BasicWeblisketSession:setRole(aRole)
        self.session:setAttribute(tostring(BasicUserRoleData.NAME), aRole)
end


function BasicWeblisketSession:getRole()
        return self.session:getAttribute(tostring(BasicUserRoleData.NAME))
end


function BasicWeblisketSession:setPassword(password)
        self.session:setAttribute(UserData.PASSWORD, password)
end


function BasicWeblisketSession:setUserName(userName)
        self.session:setAttribute(UserData.USERNAME, userName)
end


function BasicWeblisketSession:setPaymentMethod(value)
        self.session:setAttribute(tostring(PaymentGatewayData.NAME), value)
end


function BasicWeblisketSession:setAuthenticated_j0()
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().TRUE_STRING)
end


function BasicWeblisketSession:setAttempts(value)
        self.session:setAttribute(WeblisketSessionData.ATTEMPTS, value)
end


function BasicWeblisketSession:setTimeout(value)
        self.session:setAttribute(WeblisketSessionData.TIMEOUT, value)
end


function BasicWeblisketSession:setStoreName(value)
        self.session:setAttribute(StoreFrontData.getInstance().NAME, value)
end


function BasicWeblisketSession:getWebAppPath()
        return self.session:getAttribute(GLOBALS2.WEBAPPPATH)
end


function BasicWeblisketSession:getUserName()
        return self.session:getAttribute(UserData.USERNAME)
end


function BasicWeblisketSession:getPassword()
        return self.session:getAttribute(UserData.PASSWORD)
end


function BasicWeblisketSession:getPaymentMethod()
        return self.session:getAttribute(tostring(PaymentGatewayData.NAME))
end


function BasicWeblisketSession:getAuthentication()
        return self.session:getAttribute(WeblisketSessionData.AUTHENTICATED)
end


function BasicWeblisketSession:getAttempts()
        return self.session:getAttribute(WeblisketSessionData.ATTEMPTS)
end


function BasicWeblisketSession:getTimeout()
        return self.session:getAttribute(WeblisketSessionData.TIMEOUT)
end


function BasicWeblisketSession:getStoreName()
        return self.session:getAttribute(StoreFrontData.getInstance().NAME)
end


function BasicWeblisketSession:setAuthenticated_j1(value)
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING)
end
function BasicWeblisketSession:setAuthenticated(...)
    local count = select("#", ...)
    if count == 0 then return self:setAuthenticated_j0(...) end
    if count == 1 then return self:setAuthenticated_j1(...) end
    error("No method setAuthenticated takes " .. count .. " arguments")
end
BasicWeblisketSession.setAuthenticated__jdispatcher = BasicWeblisketSession.setAuthenticated


function BasicWeblisketSession:clear()
        self.session:removeAttribute(WeblisketSessionData.AUTHENTICATED)
        self.session:removeAttribute(WeblisketSessionData.TIMEOUT)
        self.session:removeAttribute(tostring(BasicUserRoleData.NAME))
        self.session:removeAttribute(UserData.USERNAME)
end


function BasicWeblisketSession:getCreationTime()
        return self.session:getCreationTime()
end


function BasicWeblisketSession:getLastAccessedTime()
        local lastAccessedTime = self.session:getLastAccessedTime()
        return lastAccessedTime
end

return BasicWeblisketSession

