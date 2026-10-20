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
-- package org.allbinary.business.user.commerce.money.payment.types

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local PaymentGatewaysData = require("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

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

local PaymentTypeUtil = {}
PaymentTypeUtil.__index = PaymentTypeUtil
PaymentTypeUtil.className = "PaymentTypeUtil"

function PaymentTypeUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.PAYMENTGATEWAYFILEPATHSTRING = nil
    self.SHIPPINGMETHODSFILENAME = "paymentGatewayTypes.xml"
    self.defaultName = nil
    self.paymentTypeVector = BasicArrayListD.new()
end


function PaymentTypeUtil.getInstance()
        return PaymentTypeUtil.instance
end


function PaymentTypeUtil.new()
    local self = setmetatable({}, PaymentTypeUtil)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        local sep = AbPathData.getInstance().SEPARATOR
        stringBuffer:append(sep)
        stringBuffer:append("generic")
        stringBuffer:append(sep)
        stringBuffer:append("user")
        stringBuffer:append(sep)
        stringBuffer:append("commerce")
        stringBuffer:append(sep)
        stringBuffer:append("money")
        stringBuffer:append(sep)
        stringBuffer:append("payment")
        stringBuffer:append(sep)
        stringBuffer:append("gateway")
        stringBuffer:append(sep)
        self.PAYMENTGATEWAYFILEPATHSTRING = tostring(stringBuffer)
    return self
end


function PaymentTypeUtil:add(paymentType)
        self.paymentTypeVector:add(paymentType)
end


-- throws Exception
function PaymentTypeUtil:get(paymentTypeString)
        local size = self.paymentTypeVector:size()
        for i = 0, size - 1 do
            local paymentType = self.paymentTypeVector:get(i)
            if paymentType:getBasicPaymentType():getName():compareTo(paymentTypeString) == 0 then
                return paymentType
            end
        end
        error(java_exception("Exception", "Unknown PaymentType: " .. paymentTypeString), 0)
end


-- throws Exception
function PaymentTypeUtil:initDefault(storeName)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
            self.logUtil:putF("initDefault Payment: " .. self.defaultName, self, "initDefault")
        end
        if StringValidationUtil.getInstance():isEmpty(self.defaultName) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.URLGLOBALS:getMainPath())
            stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
            stringBuffer:append(storeName)
            stringBuffer:append(AbPathData.getInstance().SEPARATOR)
            stringBuffer:append(self.PAYMENTGATEWAYFILEPATHSTRING)
            local abPath = AbPath.new(tostring(stringBuffer), self.SHIPPINGMETHODSFILENAME)
            local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(abPath)
            local document = DomDocumentHelper.create(data)
            local nodeList = document:getElementsByTagName(PaymentGatewaysData.NAME)
            for index = 0, nodeList:getLength() - 1 do
                local node = nodeList:item(index)
                local defaultPaymentGatewayNode = DomSearchHelper.getNode(EntryData.getInstance().DEFAULT, node:getChildNodes())
                local defaultPaymentGatewayNodeValue = DomNodeHelper.getTextNodeValue(defaultPaymentGatewayNode)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
                    self.logUtil:putF("DefaultPaymentGatewayNodeValue: " .. defaultPaymentGatewayNodeValue, self, "initDefault")
                end
                if not StringValidationUtil.getInstance():isEmpty(defaultPaymentGatewayNodeValue) then
                    self.defaultName = defaultPaymentGatewayNodeValue
                end
            end
        end
end


-- throws Exception
function PaymentTypeUtil:getDefault(storeName)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PAYMENT) then
            self.logUtil:putF(self.commonStrings.START, self, "getDefault")
        end
        self:initDefault(storeName)
        if not StringValidationUtil.getInstance():isEmpty(self.defaultName) then
            return self:get(self.defaultName)
        end
        error(java_exception("Exception", "No Default: " .. self.defaultName), 0)
end


function PaymentTypeUtil:isContain(paymentType)
        return self.paymentTypeVector:contains(paymentType)
end


function PaymentTypeUtil:difference(a_PaymentTypeVector)
        local diff = BasicArrayListD.new()
        local size = self.paymentTypeVector:size()
        for i = 0, size - 1 do
            local paymentType = self.paymentTypeVector:get(i)
            if not a_PaymentTypeVector:contains(paymentType) then
                diff:add(paymentType)
            end
        end
        return diff
end

PaymentTypeUtil.instance = PaymentTypeUtil.new()


do -- Java static initializer
end

return PaymentTypeUtil

