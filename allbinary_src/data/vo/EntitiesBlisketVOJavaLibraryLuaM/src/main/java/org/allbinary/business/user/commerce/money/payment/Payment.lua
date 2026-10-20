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

-- local HashMap = require("java.util.HashMap")
-- local ServletRequest = require("javax.servlet.ServletRequest")
local EntryData = require("org.allbinary.business.entry.EntryData")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local SuperCrypt = require("org.allbinary.logic.control.crypt.SuperCrypt")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local PaymentInterface = require("org.allbinary.business.user.commerce.money.payment.PaymentInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Payment = {}
Payment.__index = Payment
Payment.className = "Payment"

function Payment:_init_fields()
    self.name = nil
    self.expiration = nil
    self.encryption = nil
    self.number = nil
    self.id = nil
    self.type = nil
    self.tenderType = nil
    self.transactionType = nil
    self.aba = nil
    self.account = nil
    self.accountType = nil
    self.authorizationCode = nil
    self.checkNumber = nil
    self.checkType = nil
    self.driversLicense = nil
    self.magneticInkCheckReader = nil
    self.isDefault = false
end

function Payment.new(...)
    local count = select("#", ...)
    if count == 1 then return Payment._new1(...)
    elseif count == 1 then return Payment._new1(...)
    elseif count == 0 then return Payment._new0(...)
    end
end


function Payment._new1(payment)
    local self = setmetatable({}, Payment)
    self:_init_fields()
        self.name = payment:get(PaymentData.NAME)
        self.type = payment:get(PaymentData.TYPE)
        self.expiration = payment:get(PaymentData.EXPIRATION)
        self.encryption = payment:get(EntryData.getInstance().ENCRYPTION)
        self.number = SuperCrypt.new(math.tointeger(self.encryption // 1)):decrypt(payment:get(PaymentData.NUMBER))
        self.id = payment:get(PaymentData.ID)
        local def = payment:get(EntryData.getInstance().DEFAULT)
        if def ~= nil and ((def < EntryData.getInstance().DEFAULT and -1) or (def > EntryData.getInstance().DEFAULT and 1) or 0) == 0 then
            self.isDefault = true
        else
            self.isDefault = false
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


function Payment._new1(request)
    local self = setmetatable({}, Payment)
    self:_init_fields()
        self.name = request:getParameter(PaymentData.NAME)
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


function Payment._new0()
    local self = setmetatable({}, Payment)
    self:_init_fields()
    return self
end


function Payment:isValid()
        local stringUtil = StringUtil.getInstance()
        local aFalse = false
        if self.name == nil or ((self.name < stringUtil.EMPTY_STRING and -1) or (self.name > stringUtil.EMPTY_STRING and 1) or 0) == 0 then
            return aFalse
        end
        if self.type == nil or ((self.type < stringUtil.EMPTY_STRING and -1) or (self.type > stringUtil.EMPTY_STRING and 1) or 0) == 0 then
            return aFalse
        end
        if self.expiration == nil or ((self.expiration < stringUtil.EMPTY_STRING and -1) or (self.expiration > stringUtil.EMPTY_STRING and 1) or 0) == 0 then
            return aFalse
        end
        if self.number == nil or ((self.number < stringUtil.EMPTY_STRING and -1) or (self.number > stringUtil.EMPTY_STRING and 1) or 0) == 0 then
            return aFalse
        end
        if #self.number > org.allbinary.business.user.commerce.money.payment.types.CreditCardType.MAXLEN then
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
        self.name = value
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
        return self.name
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
        return self.isDefault
end


function Payment:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(PaymentData.NAME, self.name)
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
        if self.isDefault then
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

