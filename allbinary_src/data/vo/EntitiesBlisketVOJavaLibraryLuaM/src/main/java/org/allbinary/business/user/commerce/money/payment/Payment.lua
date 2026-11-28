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
-- package org.allbinary.business.user.commerce.money.payment

local Payment = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.Payment"] = Payment

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
-- local ServletRequest = require("javax.servlet.ServletRequest")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local SuperCrypt = java_lazy("org.allbinary.logic.control.crypt.SuperCrypt")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local CreditCardType = java_lazy("org.allbinary.business.user.commerce.money.payment.types.CreditCardType")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")
local PaymentData = java_lazy("org.allbinary.business.user.commerce.money.payment.PaymentData")

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

-- class table Payment is declared before the requires
Payment.__index = Payment
Payment.className = "Payment"
Payment.javaClassName = "org.allbinary.business.user.commerce.money.payment.Payment"
Payment.java_implements = " PaymentInterface DomNodeInterface "
Payment.java_interfaces = function() return {PaymentInterface, DomNodeInterface} end

function Payment:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.expiration == nil then self.expiration = nil end
    if self.encryption == nil then self.encryption = nil end
    if self.number == nil then self.number = nil end
    if self.id == nil then self.id = nil end
    if self.type == nil then self.type = nil end
    if self.tenderType == nil then self.tenderType = nil end
    if self.transactionType == nil then self.transactionType = nil end
    if self.aba == nil then self.aba = nil end
    if self.account == nil then self.account = nil end
    if self.accountType == nil then self.accountType = nil end
    if self.authorizationCode == nil then self.authorizationCode = nil end
    if self.checkNumber == nil then self.checkNumber = nil end
    if self.checkType == nil then self.checkType = nil end
    if self.driversLicense == nil then self.driversLicense = nil end
    if self.magneticInkCheckReader == nil then self.magneticInkCheckReader = nil end
    self.isDefault_f = false
end

function Payment._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return Payment._new1(self, ...)
    elseif count == 0 then return Payment._new0(self, ...)
    end
    error("No constructor of Payment takes " .. count .. " arguments")
end

function Payment.new(...)
    local self = setmetatable({}, Payment)
    Payment._jinit(self, ...)
    return self
end

function Payment._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HashMap")) then return Payment._new1_1(self, ...) end
    return Payment._new1_2(self, ...)
end


function Payment._new1_1(self, payment)
    Payment._init_fields(self)
        self.name_f = payment:get(PaymentData.NAME)
        self.type = payment:get(PaymentData.TYPE)
        self.expiration = payment:get(PaymentData.EXPIRATION)
        self.encryption = payment:get(EntryData.getInstance().ENCRYPTION)
        self.number = SuperCrypt.new(math.tointeger(self.encryption // 1)):decrypt(payment:get(PaymentData.NUMBER))
        self.id = payment:get(PaymentData.ID)
        local def = payment:get(EntryData.getInstance().DEFAULT)
        if not rawequal(def, nil) and rawequal(((def < EntryData.getInstance().DEFAULT and -1) or (def > EntryData.getInstance().DEFAULT and 1) or 0), 0) then
            self.isDefault_f = true
        else
            self.isDefault_f = false
        end
        self.tenderType = payment:get(PaymentData.TENDERTYPE)
        self.transactionType = payment:get(PaymentData.TRANSACTIONTYPE)
        self.aba = payment:get(PaymentData.ABA)
        self.account = payment:get(PaymentData.ACCOUNT)
        self.accountType = payment:get(PaymentData.ACCOUNTTYPE)
        self.authorizationCode = payment:get(PaymentData.AUTHORIZATIONCODE)
        self.checkNumber = payment:get(PaymentData.CHECKNUMBER)
        self.checkType = payment:get(PaymentData.CHECKTYPE)
        self.driversLicense = payment:get(PaymentData.DRIVERSLICENSE)
        self.magneticInkCheckReader = payment:get(PaymentData.MAGNETICINKCHECKREADER)
    return self
end


function Payment._new1_2(self, request)
    Payment._init_fields(self)
        self.name_f = request:getParameter(PaymentData.NAME)
        self.type = request:getParameter(PaymentData.TYPE)
        self.expiration = request:getParameter(PaymentData.EXPIRATION)
        self.number = request:getParameter(PaymentData.NUMBER)
        self.tenderType = request:getParameter(PaymentData.TENDERTYPE)
        self.transactionType = request:getParameter(PaymentData.TRANSACTIONTYPE)
        self.aba = request:getParameter(PaymentData.ABA)
        self.account = request:getParameter(PaymentData.ACCOUNT)
        self.accountType = request:getParameter(PaymentData.ACCOUNTTYPE)
        self.authorizationCode = request:getParameter(PaymentData.AUTHORIZATIONCODE)
        self.checkNumber = request:getParameter(PaymentData.CHECKNUMBER)
        self.checkType = request:getParameter(PaymentData.CHECKTYPE)
        self.driversLicense = request:getParameter(PaymentData.DRIVERSLICENSE)
        self.magneticInkCheckReader = request:getParameter(PaymentData.MAGNETICINKCHECKREADER)
    return self
end


function Payment._new0(self)
    Payment._init_fields(self)
    return self
end


function Payment:isValid()
        local stringUtil = StringUtil.getInstance()
        local aFalse = false
        if rawequal(self.name_f, nil) or rawequal(((self.name_f < stringUtil.EMPTY_STRING and -1) or (self.name_f > stringUtil.EMPTY_STRING and 1) or 0), 0) then
            return aFalse
        end
        if rawequal(self.type, nil) or rawequal(((self.type < stringUtil.EMPTY_STRING and -1) or (self.type > stringUtil.EMPTY_STRING and 1) or 0), 0) then
            return aFalse
        end
        if rawequal(self.expiration, nil) or rawequal(((self.expiration < stringUtil.EMPTY_STRING and -1) or (self.expiration > stringUtil.EMPTY_STRING and 1) or 0), 0) then
            return aFalse
        end
        if rawequal(self.number, nil) or rawequal(((self.number < stringUtil.EMPTY_STRING and -1) or (self.number > stringUtil.EMPTY_STRING and 1) or 0), 0) then
            return aFalse
        end
        if #self.number > CreditCardType.MAXLEN then
            return aFalse
        end
        return true
end


function Payment:setTenderType(value)
        self.tenderType = value
end


function Payment:setTransactionType(value)
        self.transactionType = value
end


function Payment:setAuthorizationCode(value)
        self.authorizationCode = value
end


function Payment:setCheckType(value)
        self.checkType = value
end


function Payment:setCheckNumber(value)
        self.checkNumber = value
end


function Payment:setDriversLicense(value)
        self.driversLicense = value
end


function Payment:setMagneticInkCheckReader(value)
        self.magneticInkCheckReader = value
end


function Payment:setAba(value)
        self.aba = value
end


function Payment:setAccountType(value)
        self.accountType = value
end


function Payment:setName(value)
        self.name_f = value
end


function Payment:setType(value)
        self.type = value
end


function Payment:setExpiration(value)
        self.expiration = value
end


function Payment:setNumber(value)
        self.number = value
end


function Payment:getId()
        return self.id
end


function Payment:getName()
        return self.name_f
end


function Payment:getType()
        return self.type
end


function Payment:getExpiration()
        return self.expiration
end


function Payment:getEncryption()
        return self.encryption
end


function Payment:getNumber()
        return self.number
end


function Payment:getTenderType()
        return self.tenderType
end


function Payment:getTransactionType()
        return self.transactionType
end


function Payment:getAba()
        return self.aba
end


function Payment:getAccount()
        return self.account
end


function Payment:getAccountType()
        return self.accountType
end


function Payment:getAuthorizationCode()
        return self.authorizationCode
end


function Payment:getCheckNumber()
        return self.checkNumber
end


function Payment:getCheckType()
        return self.checkType
end


function Payment:getDriversLicense()
        return self.driversLicense
end


function Payment:getMagneticInkCheckReader()
        return self.magneticInkCheckReader
end


function Payment:getLastFour()
        if #self.number > PaymentData.MIN and #self.number <= PaymentData.MAX then
            return string.sub(self.number, (#self.number - 4) + 1)
        else
            return "Invalid #"
        end
end


function Payment:isDefault()
        return self.isDefault_f
end


function Payment:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(PaymentData.NAME, self.name_f)
        hashMap:put(PaymentData.TYPE, self.type)
        hashMap:put(PaymentData.EXPIRATION, self.expiration)
        hashMap:put(PaymentData.NUMBER, self:getLastFour())
        hashMap:put(PaymentData.TENDERTYPE, self.tenderType)
        hashMap:put(PaymentData.TRANSACTIONTYPE, self.transactionType)
        hashMap:put(PaymentData.ABA, self.aba)
        hashMap:put(PaymentData.ACCOUNT, self.account)
        hashMap:put(PaymentData.ACCOUNTTYPE, self.accountType)
        hashMap:put(PaymentData.AUTHORIZATIONCODE, self.authorizationCode)
        hashMap:put(PaymentData.CHECKNUMBER, self.checkNumber)
        hashMap:put(PaymentData.DRIVERSLICENSE, self.driversLicense)
        hashMap:put(PaymentData.MAGNETICINKCHECKREADER, self.magneticInkCheckReader)
        if self.isDefault_f then
            hashMap:put(EntryData.getInstance().DEFAULT, EntryData.getInstance().DEFAULT)
        else
            hashMap:put(EntryData.getInstance().DEFAULT, StringUtil.getInstance().EMPTY_STRING)
        end
        return hashMap
end


-- throws Exception
function Payment:toXmlNode(document)
        local hashMap = self:toHashMap()
        local node = ModDomHelper.createNameValueNodes(document, PaymentData.PAYMENT, hashMap)
        return node
end


function Payment:toXmlDoc()
        return nil
end


function Payment:view()
        return nil
end


function Payment:toValidationInfoDoc()
        return nil
end


function Payment:toValidationInfoNode(document)
        return nil
end


function Payment:validationInfo()
        return nil
end

return Payment

