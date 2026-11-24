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

local PaymentTypeUtil = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil"] = PaymentTypeUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local PaymentGatewaysData = java_lazy("org.allbinary.business.user.commerce.money.payment.gateway.PaymentGatewaysData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local PaymentType = java_lazy("org.allbinary.business.user.commerce.money.payment.types.PaymentType")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table PaymentTypeUtil is declared before the requires
PaymentTypeUtil.__index = PaymentTypeUtil
PaymentTypeUtil.className = "PaymentTypeUtil"
PaymentTypeUtil.javaClassName = "org.allbinary.business.user.commerce.money.payment.types.PaymentTypeUtil"

function PaymentTypeUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.PAYMENTGATEWAYFILEPATHSTRING == nil then self.PAYMENTGATEWAYFILEPATHSTRING = nil end
    self.SHIPPINGMETHODSFILENAME = "paymentGatewayTypes.xml"
    self.defaultName = nil
    self.paymentTypeVector = BasicArrayListD.new()
end


function PaymentTypeUtil.getInstance()
        return PaymentTypeUtil.instance_f
end


function PaymentTypeUtil._jinit(self)
    PaymentTypeUtil._init_fields(self)
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

function PaymentTypeUtil.new(...)
    local self = setmetatable({}, PaymentTypeUtil)
    PaymentTypeUtil._jinit(self, ...)
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
        error(require("java.lang.Exception").new("Unknown PaymentType: " .. paymentTypeString), 0)
end


-- throws Exception
function PaymentTypeUtil:initDefault(storeName)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
            self.logUtil:putF("initDefault Payment: " .. self.defaultName, self, "initDefault")
        end
        if StringValidationUtil.getInstance():isEmpty(self.defaultName) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(URLGLOBALS.getMainPath())
            stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
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
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().PAYMENT) then
            self.logUtil:putF(self.commonStrings.START, self, "getDefault")
        end
        self:initDefault(storeName)
        if not StringValidationUtil.getInstance():isEmpty(self.defaultName) then
            return self:get(self.defaultName)
        end
        error(require("java.lang.Exception").new("No Default: " .. self.defaultName), 0)
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

PaymentTypeUtil.instance_f = PaymentTypeUtil.new()


do -- Java static initializer
end

return PaymentTypeUtil

