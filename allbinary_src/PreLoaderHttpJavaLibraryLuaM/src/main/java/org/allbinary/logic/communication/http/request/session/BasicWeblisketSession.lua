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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpSession = require("javax.servlet.http.HttpSession")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local UserData = require("org.allbinary.business.user.UserData")
local PaymentGatewayData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local BasicUserRole = require("org.allbinary.business.user.role.BasicUserRole")
local BasicUserRoleData = require("org.allbinary.business.user.role.BasicUserRoleData")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicWeblisketSession = {}
BasicWeblisketSession.__index = BasicWeblisketSession
BasicWeblisketSession.className = "BasicWeblisketSession"

function BasicWeblisketSession:_init_fields()
    self.session = nil
    self.pageContext = nil
end


function BasicWeblisketSession.new(pageContext)
    local self = setmetatable({}, BasicWeblisketSession)
    self:_init_fields()
        self.pageContext = pageContext
        local request = pageContext:getRequest()
        self.session = request:getSession(true)
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


function BasicWeblisketSession:setAuthenticated()
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
        return self.session:getAttribute(org.allbinary.globals.GLOBALS2.WEBAPPPATH)
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


-- Java overloaded method: Lua keeps the last definition
function BasicWeblisketSession:setAuthenticated(value)
        self.session:setAttribute(WeblisketSessionData.AUTHENTICATED, BooleanFactory.getInstance().FALSE_STRING)
end


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

