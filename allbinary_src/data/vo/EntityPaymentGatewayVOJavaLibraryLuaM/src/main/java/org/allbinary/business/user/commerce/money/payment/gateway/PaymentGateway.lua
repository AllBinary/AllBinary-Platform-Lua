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
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local PaymentData = require("org.allbinary.business.user.commerce.money.payment.PaymentData")
local StdUtil = require("org.allbinary.logic.StdUtil")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PaymentGateway = {}
PaymentGateway.__index = PaymentGateway
PaymentGateway.className = "PaymentGateway"

function PaymentGateway:_init_fields()
    self.storeName = nil
    self.name = nil
    self.enable = nil
    self.paymentMethod = nil
    self.mode = nil
    self.testProtocol = nil
    self.testServer = nil
    self.testPort = nil
    self.testPath = nil
    self.serverProtocol = nil
    self.server = nil
    self.serverPort = nil
    self.serverPath = nil
    self.timeout = nil
    self.userName = nil
    self.password = nil
    self.proxyProtocol = nil
    self.proxyServer = nil
    self.proxyPort = nil
    self.proxyPath = nil
    self.proxyUserName = nil
    self.proxyPassword = nil
    self.proxyTimeout = nil
    self.special1 = nil
    self.special2 = nil
    self.special3 = nil
    self.special4 = nil
    self.special5 = nil
    self.special6 = nil
    self.special7 = nil
    self.special8 = nil
    self.special9 = nil
    self.lastModified = nil
    self.timeEntered = nil
end


function PaymentGateway.new(hashMap)
    local self = setmetatable({}, PaymentGateway)
    self:_init_fields()
        self:getFormData(hashMap)
    return self
end


function PaymentGateway:getFormData(hashMap)
        local stringUtil = StringUtil.getInstance()
        local empty = stringUtil.EMPTY_STRING
        self.storeName = hashMap:get(tostring(StoreFrontData.getInstance().NAME))
        self.name = hashMap:get(tostring(PaymentGatewayData.NAME))
        self.enable = stringUtil:getNonNull(hashMap:get(tostring(EntryData.getInstance().ENABLE)))
        self.paymentMethod = stringUtil:getNonNull(hashMap:get(tostring(PaymentData.METHOD)))
        self.mode = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.MODE)))
        self.testProtocol = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTPROTOCOL)))
        self.testServer = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTSERVER)))
        self.testPort = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTPORT)))
        self.testPath = hashMap:get(tostring(PaymentGatewayData.TESTPATH))
        if self.testPath == nil then
            self.testPath = empty
        end
        self.serverProtocol = hashMap:get(tostring(PaymentGatewayData.SERVERPROTOCOL))
        if self.serverProtocol == nil then
            self.serverProtocol = empty
        end
        self.server = hashMap:get(tostring(PaymentGatewayData.SERVER))
        if self.server == nil then
            self.server = empty
        end
        self.serverPort = hashMap:get(tostring(PaymentGatewayData.SERVERPORT))
        if self.serverPort == nil then
            self.serverPort = empty
        end
        self.serverPath = hashMap:get(tostring(PaymentGatewayData.SERVERPATH))
        if self.serverPath == nil then
            self.serverPath = empty
        end
        self.userName = hashMap:get(tostring(UserData.USERNAME))
        if self.userName == nil then
            self.userName = empty
        end
        self.password = hashMap:get(tostring(UserData.PASSWORD))
        if self.password == nil then
            self.password = empty
        end
        self.timeout = hashMap:get(tostring(PaymentGatewayData.TIMEOUT))
        if self.timeout == nil then
            self.timeout = empty
        end
        self.proxyProtocol = hashMap:get(tostring(PaymentGatewayData.PROXYPROTOCOL))
        if self.proxyProtocol == nil then
            self.proxyProtocol = empty
        end
        self.proxyServer = hashMap:get(tostring(PaymentGatewayData.PROXYSERVER))
        if self.proxyServer == nil then
            self.proxyServer = empty
        end
        self.proxyPort = hashMap:get(tostring(PaymentGatewayData.PROXYPORT))
        if self.proxyPort == nil then
            self.proxyPort = empty
        end
        self.proxyPath = hashMap:get(tostring(PaymentGatewayData.PROXYPATH))
        if self.proxyPath == nil then
            self.proxyPath = empty
        end
        self.proxyUserName = hashMap:get(tostring(PaymentGatewayData.PROXYUSERNAME))
        if self.proxyUserName == nil then
            self.proxyUserName = empty
        end
        self.proxyPassword = hashMap:get(tostring(PaymentGatewayData.PROXYPASSWORD))
        if self.proxyPassword == nil then
            self.proxyPassword = empty
        end
        self.proxyTimeout = hashMap:get(tostring(PaymentGatewayData.PROXYTIMEOUT))
        if self.proxyTimeout == nil then
            self.proxyTimeout = empty
        end
        self.special1 = hashMap:get(tostring(PaymentGatewayData.SPECIAL1))
        if self.special1 == nil then
            self.special1 = empty
        end
        self.special2 = hashMap:get(tostring(PaymentGatewayData.SPECIAL2))
        if self.special2 == nil then
            self.special2 = empty
        end
        self.special3 = hashMap:get(tostring(PaymentGatewayData.SPECIAL3))
        if self.special3 == nil then
            self.special3 = empty
        end
        self.special4 = hashMap:get(tostring(PaymentGatewayData.SPECIAL4))
        if self.special4 == nil then
            self.special4 = empty
        end
        self.special5 = hashMap:get(tostring(PaymentGatewayData.SPECIAL5))
        if self.special5 == nil then
            self.special5 = empty
        end
        self.special6 = hashMap:get(tostring(PaymentGatewayData.SPECIAL6))
        if self.special6 == nil then
            self.special6 = empty
        end
        self.special7 = hashMap:get(tostring(PaymentGatewayData.SPECIAL7))
        if self.special7 == nil then
            self.special7 = empty
        end
        self.special8 = hashMap:get(tostring(PaymentGatewayData.SPECIAL8))
        if self.special8 == nil then
            self.special8 = empty
        end
        self.special9 = hashMap:get(tostring(PaymentGatewayData.SPECIAL9))
        if self.special9 == nil then
            self.special9 = empty
        end
        self.lastModified = hashMap:get(tostring(EntryData.getInstance().LASTMODIFIED))
        if self.lastModified == nil then
            self.lastModified = empty
        end
        self.timeEntered = hashMap:get(tostring(EntryData.getInstance().TIMECREATED))
        if self.timeEntered == nil then
            self.timeEntered = empty
        end
end


function PaymentGateway:getStoreName()
        return self.storeName
end


function PaymentGateway:getName()
        return self.name
end


function PaymentGateway:getEnable()
        return self.enable
end


function PaymentGateway:getPaymentMethod()
        return self.paymentMethod
end


function PaymentGateway:getMode()
        return self.mode
end


function PaymentGateway:getTestProtocol()
        return self.testProtocol
end


function PaymentGateway:getTestServer()
        return self.testServer
end


function PaymentGateway:getTestPort()
        return self.testPort
end


function PaymentGateway:getTestPath()
        return self.testPath
end


function PaymentGateway:getServerProtocol()
        return self.serverProtocol
end


function PaymentGateway:getServer()
        return self.server
end


function PaymentGateway:getServerPort()
        return self.serverPort
end


function PaymentGateway:getServerPath()
        return self.serverPath
end


function PaymentGateway:getUserName()
        return self.userName
end


function PaymentGateway:getPassword()
        return self.password
end


function PaymentGateway:getProxyProtocol()
        return self.proxyProtocol
end


function PaymentGateway:getProxyServer()
        return self.proxyServer
end


function PaymentGateway:getProxyPath()
        return self.proxyPath
end


function PaymentGateway:getProxyPort()
        return self.proxyPort
end


function PaymentGateway:getProxyUserName()
        return self.proxyUserName
end


function PaymentGateway:getProxyPassword()
        return self.proxyPassword
end


function PaymentGateway:getTimeout()
        return self.timeout
end


function PaymentGateway:getProxyTimeout()
        return self.proxyTimeout
end


function PaymentGateway:getSpecial1()
        return self.special1
end


function PaymentGateway:getSpecial2()
        return self.special2
end


function PaymentGateway:getSpecial3()
        return self.special3
end


function PaymentGateway:getSpecial4()
        return self.special4
end


function PaymentGateway:getSpecial5()
        return self.special5
end


function PaymentGateway:getSpecial6()
        return self.special6
end


function PaymentGateway:getSpecial7()
        return self.special7
end


function PaymentGateway:getSpecial8()
        return self.special8
end


function PaymentGateway:getSpecial9()
        return self.special9
end


function PaymentGateway:getLastModified()
        return self.lastModified
end


function PaymentGateway:getTimeEntered()
        return self.timeEntered
end


function PaymentGateway:setEnable(value)
        self.enable = value
end


function PaymentGateway:setStoreName(value)
        self.storeName = value
end


function PaymentGateway:setName(value)
        self.name = value
end


function PaymentGateway:setPaymentMethod(value)
        self.paymentMethod = value
end


function PaymentGateway:setMode(value)
        self.mode = value
end


function PaymentGateway:setTestProtocol(value)
        self.testProtocol = value
end


function PaymentGateway:setTestServer(value)
        self.testServer = value
end


function PaymentGateway:setTestPort(value)
        self.testPort = value
end


function PaymentGateway:setTestPath(value)
        self.testPath = value
end


function PaymentGateway:setServerProtocol(value)
        self.serverProtocol = value
end


function PaymentGateway:setServer(value)
        self.server = value
end


function PaymentGateway:setServerPort(value)
        self.serverPort = value
end


function PaymentGateway:setServerPath(value)
        self.serverPath = value
end


function PaymentGateway:setTimeout(value)
        self.timeout = value
end


function PaymentGateway:setUserName(value)
        self.userName = value
end


function PaymentGateway:setPassword(value)
        self.password = value
end


function PaymentGateway:setProxyProtocol(value)
        self.proxyProtocol = value
end


function PaymentGateway:setProxyServer(value)
        self.proxyServer = value
end


function PaymentGateway:setProxyPort(value)
        self.proxyPort = value
end


function PaymentGateway:setProxyPath(value)
        self.proxyPath = value
end


function PaymentGateway:setProxyUserName(value)
        self.proxyUserName = value
end


function PaymentGateway:setProxyPassword(value)
        self.proxyPassword = value
end


function PaymentGateway:setProxyTimeout(value)
        self.proxyTimeout = value
end


function PaymentGateway:setSpecial1(value)
        self.special1 = value
end


function PaymentGateway:setSpecial2(value)
        self.special2 = value
end


function PaymentGateway:setSpecial3(value)
        self.special3 = value
end


function PaymentGateway:setSpecial4(value)
        self.special4 = value
end


function PaymentGateway:setSpecial5(value)
        self.special5 = value
end


function PaymentGateway:setSpecial6(value)
        self.special6 = value
end


function PaymentGateway:setSpecial7(value)
        self.special7 = value
end


function PaymentGateway:setSpecial8(value)
        self.special8 = value
end


function PaymentGateway:setSpecial9(value)
        self.special9 = value
end


function PaymentGateway:setLastModified(value)
        self.lastModified = value
end


function PaymentGateway:setTimeEntered(value)
        self.timeEntered = value
end


-- throws Exception
function PaymentGateway:toHashMap()
        return self:toHashMap(true)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function PaymentGateway:toHashMap(isEncrypted)
        local paymentGatewayHashMap = StdUtil.getInstance():createHashMap()
        paymentGatewayHashMap:put(EntryData.getInstance().ENABLE, self.enable)
        paymentGatewayHashMap:put(tostring(StoreFrontData.getInstance().NAME), self.storeName)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.NAME), self:getName())
        paymentGatewayHashMap:put(tostring(PaymentData.METHOD), self.paymentMethod)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.MODE), self.mode)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.TESTPROTOCOL), self.testProtocol)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.TESTSERVER), self.testServer)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.TESTPORT), self.testPort)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.TESTPATH), self.testPath)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.SERVERPROTOCOL), self.serverProtocol)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.SERVER), self.server)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.SERVERPORT), self.serverPort)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.SERVERPATH), self.serverPath)
        if isEncrypted then
            local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
            paymentGatewayHashMap:put(tostring(UserData.USERNAME), superCrypt:encrypt(self.userName))
            paymentGatewayHashMap:put(tostring(UserData.PASSWORD), superCrypt:encrypt(self.password))
        else
            paymentGatewayHashMap:put(tostring(UserData.USERNAME), self.userName)
            paymentGatewayHashMap:put(tostring(UserData.PASSWORD), self.password)
        end
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.TIMEOUT), self.timeout)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYPROTOCOL), self.proxyProtocol)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYSERVER), self.proxyServer)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYPORT), self.proxyPort)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYPATH), self.proxyPath)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYUSERNAME), self.proxyUserName)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYPASSWORD), self.proxyPassword)
        paymentGatewayHashMap:put(tostring(PaymentGatewayData.PROXYTIMEOUT), self.proxyTimeout)
        if isEncrypted then
            local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL1), superCrypt:encrypt(self.special1))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL2), superCrypt:encrypt(self.special2))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL3), superCrypt:encrypt(self.special3))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL4), superCrypt:encrypt(self.special4))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL5), superCrypt:encrypt(self.special5))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL6), superCrypt:encrypt(self.special6))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL7), superCrypt:encrypt(self.special7))
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL8), superCrypt:encrypt(self.special8))
        else
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL1), self.special1)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL2), self.special2)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL3), self.special3)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL4), self.special4)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL5), self.special5)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL6), self.special6)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL7), self.special7)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL8), self.special8)
            paymentGatewayHashMap:put(tostring(PaymentGatewayData.SPECIAL9), self.special9)
        end
        paymentGatewayHashMap:put(tostring(EntryData.getInstance().LASTMODIFIED), self.lastModified)
        return paymentGatewayHashMap
end


function PaymentGateway:toVector()
        return self:toVector(true)
end


-- Java overloaded method: Lua keeps the last definition
function PaymentGateway:toVector(isEncrypted)
        local updateVector = BasicArrayListD.new()
        updateVector:add(self.enable)
        updateVector:add(self.storeName)
        updateVector:add(self:getName())
        updateVector:add(self.paymentMethod)
        updateVector:add(self.mode)
        updateVector:add(self.testProtocol)
        updateVector:add(self.testServer)
        updateVector:add(self.testPort)
        updateVector:add(self.testPath)
        updateVector:add(self.serverProtocol)
        updateVector:add(self.server)
        updateVector:add(self.serverPort)
        updateVector:add(self.serverPath)
        if isEncrypted then
            local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
            updateVector:add(superCrypt:encrypt(self.userName))
            updateVector:add(superCrypt:encrypt(self.password))
        else
            updateVector:add(self.userName)
            updateVector:add(self.password)
        end
        updateVector:add(self.timeout)
        updateVector:add(self.proxyProtocol)
        updateVector:add(self.proxyServer)
        updateVector:add(self.proxyPort)
        updateVector:add(self.proxyPath)
        updateVector:add(self.proxyUserName)
        updateVector:add(self.proxyPassword)
        updateVector:add(self.proxyTimeout)
        if isEncrypted then
            local superCrypt = SuperCrypt.new(PaymentGatewayData.CRYPTNUM)
            updateVector:add(superCrypt:encrypt(self.special1))
            updateVector:add(superCrypt:encrypt(self.special2))
            updateVector:add(superCrypt:encrypt(self.special3))
            updateVector:add(superCrypt:encrypt(self.special4))
            updateVector:add(superCrypt:encrypt(self.special5))
            updateVector:add(superCrypt:encrypt(self.special6))
            updateVector:add(superCrypt:encrypt(self.special7))
            updateVector:add(superCrypt:encrypt(self.special8))
            updateVector:add(superCrypt:encrypt(self.special9))
        else
            updateVector:add(self.special1)
            updateVector:add(self.special2)
            updateVector:add(self.special3)
            updateVector:add(self.special4)
            updateVector:add(self.special5)
            updateVector:add(self.special6)
            updateVector:add(self.special7)
            updateVector:add(self.special8)
            updateVector:add(self.special9)
        end
        return updateVector
end


-- throws Exception
function PaymentGateway:getKey()
        return PaymentGatewayPrimaryKey.new(self:getStoreName(), self:getName())
end

return PaymentGateway

