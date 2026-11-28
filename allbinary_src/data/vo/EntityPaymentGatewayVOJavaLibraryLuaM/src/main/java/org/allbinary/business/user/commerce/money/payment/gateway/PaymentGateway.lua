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

local PaymentGateway = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.PaymentGateway"] = PaymentGateway

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local PaymentGatewayInterface = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayInterface")
local PaymentGatewayData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayData")
local PaymentGatewayPrimaryKey = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewayPrimaryKey")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table PaymentGateway is declared before the requires
PaymentGateway.__index = PaymentGateway
PaymentGateway.className = "PaymentGateway"
PaymentGateway.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.PaymentGateway"
PaymentGateway.java_implements = " PaymentGatewayInterface "
PaymentGateway.java_interfaces = function() return {PaymentGatewayInterface} end

function PaymentGateway:_init_fields()
    if self.storeName == nil then self.storeName = nil end
    if self.name_f == nil then self.name_f = nil end
    if self.enable_f == nil then self.enable_f = nil end
    if self.paymentMethod == nil then self.paymentMethod = nil end
    if self.mode == nil then self.mode = nil end
    if self.testProtocol == nil then self.testProtocol = nil end
    if self.testServer == nil then self.testServer = nil end
    if self.testPort == nil then self.testPort = nil end
    if self.testPath == nil then self.testPath = nil end
    if self.serverProtocol == nil then self.serverProtocol = nil end
    if self.server == nil then self.server = nil end
    if self.serverPort == nil then self.serverPort = nil end
    if self.serverPath == nil then self.serverPath = nil end
    if self.timeout == nil then self.timeout = nil end
    if self.userName == nil then self.userName = nil end
    if self.password == nil then self.password = nil end
    if self.proxyProtocol == nil then self.proxyProtocol = nil end
    if self.proxyServer == nil then self.proxyServer = nil end
    if self.proxyPort == nil then self.proxyPort = nil end
    if self.proxyPath == nil then self.proxyPath = nil end
    if self.proxyUserName == nil then self.proxyUserName = nil end
    if self.proxyPassword == nil then self.proxyPassword = nil end
    if self.proxyTimeout == nil then self.proxyTimeout = nil end
    if self.special1 == nil then self.special1 = nil end
    if self.special2 == nil then self.special2 = nil end
    if self.special3 == nil then self.special3 = nil end
    if self.special4 == nil then self.special4 = nil end
    if self.special5 == nil then self.special5 = nil end
    if self.special6 == nil then self.special6 = nil end
    if self.special7 == nil then self.special7 = nil end
    if self.special8 == nil then self.special8 = nil end
    if self.special9 == nil then self.special9 = nil end
    if self.lastModified == nil then self.lastModified = nil end
    if self.timeEntered == nil then self.timeEntered = nil end
end


function PaymentGateway._jinit(self, hashMap)
    PaymentGateway._init_fields(self)
        self:getFormData(hashMap)
    return self
end

function PaymentGateway.new(...)
    local self = setmetatable({}, PaymentGateway)
    PaymentGateway._jinit(self, ...)
    return self
end


function PaymentGateway:getFormData(hashMap)
        local stringUtil = StringUtil.getInstance()
        local empty = stringUtil.EMPTY_STRING
        self.storeName = hashMap:get(tostring(StoreFrontData.getInstance().NAME))
        self.name_f = hashMap:get(tostring(PaymentGatewayData.NAME))
        self.enable_f = stringUtil:getNonNull(hashMap:get(tostring(EntryData.getInstance().ENABLE)))
        self.paymentMethod = stringUtil:getNonNull(hashMap:get(tostring(PaymentData.METHOD)))
        self.mode = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.MODE)))
        self.testProtocol = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTPROTOCOL)))
        self.testServer = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTSERVER)))
        self.testPort = stringUtil:getNonNull(hashMap:get(tostring(PaymentGatewayData.TESTPORT)))
        self.testPath = hashMap:get(tostring(PaymentGatewayData.TESTPATH))
        if rawequal(self.testPath, nil) then
            self.testPath = empty
        end
        self.serverProtocol = hashMap:get(tostring(PaymentGatewayData.SERVERPROTOCOL))
        if rawequal(self.serverProtocol, nil) then
            self.serverProtocol = empty
        end
        self.server = hashMap:get(tostring(PaymentGatewayData.SERVER))
        if rawequal(self.server, nil) then
            self.server = empty
        end
        self.serverPort = hashMap:get(tostring(PaymentGatewayData.SERVERPORT))
        if rawequal(self.serverPort, nil) then
            self.serverPort = empty
        end
        self.serverPath = hashMap:get(tostring(PaymentGatewayData.SERVERPATH))
        if rawequal(self.serverPath, nil) then
            self.serverPath = empty
        end
        self.userName = hashMap:get(tostring(UserData.USERNAME))
        if rawequal(self.userName, nil) then
            self.userName = empty
        end
        self.password = hashMap:get(tostring(UserData.PASSWORD))
        if rawequal(self.password, nil) then
            self.password = empty
        end
        self.timeout = hashMap:get(tostring(PaymentGatewayData.TIMEOUT))
        if rawequal(self.timeout, nil) then
            self.timeout = empty
        end
        self.proxyProtocol = hashMap:get(tostring(PaymentGatewayData.PROXYPROTOCOL))
        if rawequal(self.proxyProtocol, nil) then
            self.proxyProtocol = empty
        end
        self.proxyServer = hashMap:get(tostring(PaymentGatewayData.PROXYSERVER))
        if rawequal(self.proxyServer, nil) then
            self.proxyServer = empty
        end
        self.proxyPort = hashMap:get(tostring(PaymentGatewayData.PROXYPORT))
        if rawequal(self.proxyPort, nil) then
            self.proxyPort = empty
        end
        self.proxyPath = hashMap:get(tostring(PaymentGatewayData.PROXYPATH))
        if rawequal(self.proxyPath, nil) then
            self.proxyPath = empty
        end
        self.proxyUserName = hashMap:get(tostring(PaymentGatewayData.PROXYUSERNAME))
        if rawequal(self.proxyUserName, nil) then
            self.proxyUserName = empty
        end
        self.proxyPassword = hashMap:get(tostring(PaymentGatewayData.PROXYPASSWORD))
        if rawequal(self.proxyPassword, nil) then
            self.proxyPassword = empty
        end
        self.proxyTimeout = hashMap:get(tostring(PaymentGatewayData.PROXYTIMEOUT))
        if rawequal(self.proxyTimeout, nil) then
            self.proxyTimeout = empty
        end
        self.special1 = hashMap:get(tostring(PaymentGatewayData.SPECIAL1))
        if rawequal(self.special1, nil) then
            self.special1 = empty
        end
        self.special2 = hashMap:get(tostring(PaymentGatewayData.SPECIAL2))
        if rawequal(self.special2, nil) then
            self.special2 = empty
        end
        self.special3 = hashMap:get(tostring(PaymentGatewayData.SPECIAL3))
        if rawequal(self.special3, nil) then
            self.special3 = empty
        end
        self.special4 = hashMap:get(tostring(PaymentGatewayData.SPECIAL4))
        if rawequal(self.special4, nil) then
            self.special4 = empty
        end
        self.special5 = hashMap:get(tostring(PaymentGatewayData.SPECIAL5))
        if rawequal(self.special5, nil) then
            self.special5 = empty
        end
        self.special6 = hashMap:get(tostring(PaymentGatewayData.SPECIAL6))
        if rawequal(self.special6, nil) then
            self.special6 = empty
        end
        self.special7 = hashMap:get(tostring(PaymentGatewayData.SPECIAL7))
        if rawequal(self.special7, nil) then
            self.special7 = empty
        end
        self.special8 = hashMap:get(tostring(PaymentGatewayData.SPECIAL8))
        if rawequal(self.special8, nil) then
            self.special8 = empty
        end
        self.special9 = hashMap:get(tostring(PaymentGatewayData.SPECIAL9))
        if rawequal(self.special9, nil) then
            self.special9 = empty
        end
        self.lastModified = hashMap:get(tostring(EntryData.getInstance().LASTMODIFIED))
        if rawequal(self.lastModified, nil) then
            self.lastModified = empty
        end
        self.timeEntered = hashMap:get(tostring(EntryData.getInstance().TIMECREATED))
        if rawequal(self.timeEntered, nil) then
            self.timeEntered = empty
        end
end


function PaymentGateway:getStoreName()
        return self.storeName
end


function PaymentGateway:getName()
        return self.name_f
end


function PaymentGateway:getEnable()
        return self.enable_f
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
        self.enable_f = value
end


function PaymentGateway:setStoreName(value)
        self.storeName = value
end


function PaymentGateway:setName(value)
        self.name_f = value
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
function PaymentGateway:toHashMap_j0()
        return self:toHashMap(true)
end


-- throws Exception
function PaymentGateway:toHashMap_j1(isEncrypted)
        local paymentGatewayHashMap = StdUtil.getInstance():createHashMap()
        paymentGatewayHashMap:put(EntryData.getInstance().ENABLE, self.enable_f)
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
function PaymentGateway:toHashMap(...)
    local count = select("#", ...)
    if count == 0 then return self:toHashMap_j0(...) end
    if count == 1 then return self:toHashMap_j1(...) end
    error("No method toHashMap takes " .. count .. " arguments")
end
PaymentGateway.toHashMap__jdispatcher = PaymentGateway.toHashMap


function PaymentGateway:toVector_j0()
        return self:toVector(true)
end


function PaymentGateway:toVector_j1(isEncrypted)
        local updateVector = BasicArrayListD.new()
        updateVector:add(self.enable_f)
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
function PaymentGateway:toVector(...)
    local count = select("#", ...)
    if count == 0 then return self:toVector_j0(...) end
    if count == 1 then return self:toVector_j1(...) end
    error("No method toVector takes " .. count .. " arguments")
end
PaymentGateway.toVector__jdispatcher = PaymentGateway.toVector


-- throws Exception
function PaymentGateway:getKey()
        return PaymentGatewayPrimaryKey.new(self:getStoreName(), self:getName())
end

return PaymentGateway

