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
-- package org.allbinary.business.user.commerce.money.payment.gateway

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")

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
local PaymentGatewayInterface = {}
PaymentGatewayInterface.__index = PaymentGatewayInterface
PaymentGatewayInterface.className = "PaymentGatewayInterface"
setmetatable(PaymentGatewayInterface, {__index = TableMappingInterface})


function PaymentGatewayInterface:getEnable()
    error("abstract method getEnable")
end


function PaymentGatewayInterface:getStoreName()
    error("abstract method getStoreName")
end


function PaymentGatewayInterface:getName()
    error("abstract method getName")
end


function PaymentGatewayInterface:getPaymentMethod()
    error("abstract method getPaymentMethod")
end


function PaymentGatewayInterface:getMode()
    error("abstract method getMode")
end


function PaymentGatewayInterface:getTestProtocol()
    error("abstract method getTestProtocol")
end


function PaymentGatewayInterface:getTestServer()
    error("abstract method getTestServer")
end


function PaymentGatewayInterface:getTestPort()
    error("abstract method getTestPort")
end


function PaymentGatewayInterface:getTestPath()
    error("abstract method getTestPath")
end


function PaymentGatewayInterface:getServerProtocol()
    error("abstract method getServerProtocol")
end


function PaymentGatewayInterface:getServer()
    error("abstract method getServer")
end


function PaymentGatewayInterface:getServerPort()
    error("abstract method getServerPort")
end


function PaymentGatewayInterface:getServerPath()
    error("abstract method getServerPath")
end


function PaymentGatewayInterface:getUserName()
    error("abstract method getUserName")
end


function PaymentGatewayInterface:getPassword()
    error("abstract method getPassword")
end


function PaymentGatewayInterface:getProxyProtocol()
    error("abstract method getProxyProtocol")
end


function PaymentGatewayInterface:getProxyServer()
    error("abstract method getProxyServer")
end


function PaymentGatewayInterface:getProxyPath()
    error("abstract method getProxyPath")
end


function PaymentGatewayInterface:getProxyPort()
    error("abstract method getProxyPort")
end


function PaymentGatewayInterface:getProxyUserName()
    error("abstract method getProxyUserName")
end


function PaymentGatewayInterface:getProxyPassword()
    error("abstract method getProxyPassword")
end


function PaymentGatewayInterface:getTimeout()
    error("abstract method getTimeout")
end


function PaymentGatewayInterface:getProxyTimeout()
    error("abstract method getProxyTimeout")
end


function PaymentGatewayInterface:getSpecial1()
    error("abstract method getSpecial1")
end


function PaymentGatewayInterface:getSpecial2()
    error("abstract method getSpecial2")
end


function PaymentGatewayInterface:getSpecial3()
    error("abstract method getSpecial3")
end


function PaymentGatewayInterface:getSpecial4()
    error("abstract method getSpecial4")
end


function PaymentGatewayInterface:getSpecial5()
    error("abstract method getSpecial5")
end


function PaymentGatewayInterface:getSpecial6()
    error("abstract method getSpecial6")
end


function PaymentGatewayInterface:getSpecial7()
    error("abstract method getSpecial7")
end


function PaymentGatewayInterface:getSpecial8()
    error("abstract method getSpecial8")
end


function PaymentGatewayInterface:getSpecial9()
    error("abstract method getSpecial9")
end


function PaymentGatewayInterface:getLastModified()
    error("abstract method getLastModified")
end


function PaymentGatewayInterface:getTimeEntered()
    error("abstract method getTimeEntered")
end


function PaymentGatewayInterface:setEnable(value)
    error("abstract method setEnable")
end


function PaymentGatewayInterface:setStoreName(value)
    error("abstract method setStoreName")
end


function PaymentGatewayInterface:setName(value)
    error("abstract method setName")
end


function PaymentGatewayInterface:setPaymentMethod(value)
    error("abstract method setPaymentMethod")
end


function PaymentGatewayInterface:setMode(value)
    error("abstract method setMode")
end


function PaymentGatewayInterface:setTestProtocol(value)
    error("abstract method setTestProtocol")
end


function PaymentGatewayInterface:setTestServer(value)
    error("abstract method setTestServer")
end


function PaymentGatewayInterface:setTestPort(value)
    error("abstract method setTestPort")
end


function PaymentGatewayInterface:setTestPath(value)
    error("abstract method setTestPath")
end


function PaymentGatewayInterface:setServerProtocol(value)
    error("abstract method setServerProtocol")
end


function PaymentGatewayInterface:setServer(value)
    error("abstract method setServer")
end


function PaymentGatewayInterface:setServerPort(value)
    error("abstract method setServerPort")
end


function PaymentGatewayInterface:setServerPath(value)
    error("abstract method setServerPath")
end


function PaymentGatewayInterface:setUserName(value)
    error("abstract method setUserName")
end


function PaymentGatewayInterface:setPassword(value)
    error("abstract method setPassword")
end


function PaymentGatewayInterface:setProxyProtocol(value)
    error("abstract method setProxyProtocol")
end


function PaymentGatewayInterface:setProxyServer(value)
    error("abstract method setProxyServer")
end


function PaymentGatewayInterface:setProxyPath(value)
    error("abstract method setProxyPath")
end


function PaymentGatewayInterface:setProxyPort(value)
    error("abstract method setProxyPort")
end


function PaymentGatewayInterface:setProxyUserName(value)
    error("abstract method setProxyUserName")
end


function PaymentGatewayInterface:setProxyPassword(value)
    error("abstract method setProxyPassword")
end


function PaymentGatewayInterface:setTimeout(value)
    error("abstract method setTimeout")
end


function PaymentGatewayInterface:setProxyTimeout(value)
    error("abstract method setProxyTimeout")
end


function PaymentGatewayInterface:setSpecial1(value)
    error("abstract method setSpecial1")
end


function PaymentGatewayInterface:setSpecial2(value)
    error("abstract method setSpecial2")
end


function PaymentGatewayInterface:setSpecial3(value)
    error("abstract method setSpecial3")
end


function PaymentGatewayInterface:setSpecial4(value)
    error("abstract method setSpecial4")
end


function PaymentGatewayInterface:setSpecial5(value)
    error("abstract method setSpecial5")
end


function PaymentGatewayInterface:setSpecial6(value)
    error("abstract method setSpecial6")
end


function PaymentGatewayInterface:setSpecial7(value)
    error("abstract method setSpecial7")
end


function PaymentGatewayInterface:setSpecial8(value)
    error("abstract method setSpecial8")
end


function PaymentGatewayInterface:setSpecial9(value)
    error("abstract method setSpecial9")
end


function PaymentGatewayInterface:setLastModified(value)
    error("abstract method setLastModified")
end


function PaymentGatewayInterface:setTimeEntered(value)
    error("abstract method setTimeEntered")
end


-- throws Exception
function PaymentGatewayInterface:toHashMap(isEncrypted)
    error("abstract method toHashMap")
end


function PaymentGatewayInterface:toVector(isEncrypted)
    error("abstract method toVector")
end

return PaymentGatewayInterface

