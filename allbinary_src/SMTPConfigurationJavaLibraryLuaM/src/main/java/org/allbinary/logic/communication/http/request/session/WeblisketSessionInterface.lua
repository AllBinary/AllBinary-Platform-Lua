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

local OrderInterface = require("org.allbinary.business.user.commerce.inventory.order.OrderInterface")
local UserRole = require("org.allbinary.business.user.role.UserRole")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local WeblisketSessionInterface = {}
WeblisketSessionInterface.__index = WeblisketSessionInterface
WeblisketSessionInterface.className = "WeblisketSessionInterface"


function WeblisketSessionInterface:clear()
    error("abstract method clear")
end


function WeblisketSessionInterface:getAttempts()
    error("abstract method getAttempts")
end


function WeblisketSessionInterface:getAuthentication()
    error("abstract method getAuthentication")
end


function WeblisketSessionInterface:getCreationTime()
    error("abstract method getCreationTime")
end


function WeblisketSessionInterface:getId()
    error("abstract method getId")
end


function WeblisketSessionInterface:getLastAccessedTime()
    error("abstract method getLastAccessedTime")
end


-- throws Exception
function WeblisketSessionInterface:getOrder()
    error("abstract method getOrder")
end


function WeblisketSessionInterface:getPassword()
    error("abstract method getPassword")
end


function WeblisketSessionInterface:getPaymentMethod()
    error("abstract method getPaymentMethod")
end


-- throws Exception
function WeblisketSessionInterface:getRole()
    error("abstract method getRole")
end


function WeblisketSessionInterface:getStoreName()
    error("abstract method getStoreName")
end


function WeblisketSessionInterface:getTimeout()
    error("abstract method getTimeout")
end


function WeblisketSessionInterface:getUserName()
    error("abstract method getUserName")
end


function WeblisketSessionInterface:getWebAppPath()
    error("abstract method getWebAppPath")
end


function WeblisketSessionInterface:removeBasket()
    error("abstract method removeBasket")
end


function WeblisketSessionInterface:setAttempts(value)
    error("abstract method setAttempts")
end


function WeblisketSessionInterface:setAuthenticated()
    error("abstract method setAuthenticated")
end


-- Java overloaded method: Lua keeps the last definition
function WeblisketSessionInterface:setAuthenticated(value)
    error("abstract method setAuthenticated")
end


function WeblisketSessionInterface:setPassword(password)
    error("abstract method setPassword")
end


function WeblisketSessionInterface:setPaymentMethod(value)
    error("abstract method setPaymentMethod")
end


function WeblisketSessionInterface:setRole(aRole)
    error("abstract method setRole")
end


function WeblisketSessionInterface:setStoreName(value)
    error("abstract method setStoreName")
end


function WeblisketSessionInterface:setTimeout(value)
    error("abstract method setTimeout")
end


function WeblisketSessionInterface:setUserName(userName)
    error("abstract method setUserName")
end

return WeblisketSessionInterface

