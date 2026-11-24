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
-- package org.allbinary.business.user.commerce.money.tax.modules

local SimpleStateTaxModule = {}
package.loaded["org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule"] = SimpleStateTaxModule

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

local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = java_lazy("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = java_lazy("org.allbinary.business.user.address.StreetAddressData")
local TaxData = java_lazy("org.allbinary.business.user.commerce.money.tax.components.TaxData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonPhoneStrings = java_lazy("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TaxModuleInterface = require("org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface")

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

-- class table SimpleStateTaxModule is declared before the requires
SimpleStateTaxModule.__index = SimpleStateTaxModule
SimpleStateTaxModule.className = "SimpleStateTaxModule"
SimpleStateTaxModule.javaClassName = "org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule"
SimpleStateTaxModule.java_implements = " TaxModuleInterface "
SimpleStateTaxModule.java_interfaces = function() return {TaxModuleInterface} end

function SimpleStateTaxModule:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.streetAddress == nil then self.streetAddress = nil end
    if self.storeFrontInterface == nil then self.storeFrontInterface = nil end
    self.ALL = CommonPhoneStrings.getInstance().STAR
    self.STATETAXPATH = "/generic/taxes/"
    self.STATETAXFILE = "stateTaxation.xml"
    if self.document == nil then self.document = nil end
end


function SimpleStateTaxModule._jinit(self)
    SimpleStateTaxModule._init_fields(self)
    return self
end

function SimpleStateTaxModule.new(...)
    local self = setmetatable({}, SimpleStateTaxModule)
    SimpleStateTaxModule._jinit(self, ...)
    return self
end


-- throws Exception
function SimpleStateTaxModule:getTaxRate(streetAddress, storeFrontInterface)
        self.streetAddress = streetAddress
        self.storeFrontInterface = storeFrontInterface
        local fileAbPath = AbPath.new(tostring(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH) .. self.storeFrontInterface:getName() .. self.STATETAXPATH, self.STATETAXFILE)
        local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(fileAbPath)
        self.document = DomDocumentHelper.create(data)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAX) then
            self.logUtil:putF("Tax Doc: " .. XmlDocumentHelper.toString(self.document), self, "getTaxRate")
        end
        local state = self.streetAddress:getState()
        local country = self.streetAddress:getCountry()
        state = string.upper(state)
        local nodeList = self.document:getElementsByTagName(TaxData.NAME)
        for index = 0, nodeList:getLength() - 1 do
            local node = nodeList:item(index)
            local taxNodeChildren = node:getChildNodes()
            local streetAddressNode = DomSearchHelper.getNode(StreetAddressData.NAME, taxNodeChildren)
            local taxableStreetAddress = StreetAddress.new(streetAddressNode)
            local stringValidationUtil = StringValidationUtil.getInstance()
            if not stringValidationUtil:isEmpty(country) and not stringValidationUtil:isEmpty(taxableStreetAddress:getCountry()) and ((country < taxableStreetAddress:getCountry() and -1) or (country > taxableStreetAddress:getCountry() and 1) or 0) == 0 then
                if state ~= nil and taxableStreetAddress:getState() ~= nil and ((state < taxableStreetAddress:getState() and -1) or (state > taxableStreetAddress:getState() and 1) or 0) == 0 then
                    local rateNode = DomSearchHelper.getNode(TaxData.RATE, taxNodeChildren)
                    local taxRate = DomNodeHelper.getTextNodeValue(rateNode)
                    local taxRateFloat = (taxRate + 0.0) * .01
                    return taxRateFloat
                end
            end
        end
        return 0
end


function SimpleStateTaxModule:isValid(streetAddress, storeFrontInterface)
        local try_ok, try_error, try_value = pcall(function()
            self.streetAddress = streetAddress
            self.storeFrontInterface = storeFrontInterface
            local fileAbPath = AbPath.new(tostring(URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH) .. self.storeFrontInterface:getName() .. self.STATETAXPATH, self.STATETAXFILE)
            local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(fileAbPath)
            self.document = DomDocumentHelper.create(data)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAX) then
                self.logUtil:putF("Tax Doc: " .. XmlDocumentHelper.toString(self.document), self, self.commonStrings.IS_VALID)
            end
            local country = self.streetAddress:getCountry()
            local rootNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
            local nodeList = self.document:getElementsByTagName(TaxData.NAME)
            for index = 0, nodeList:getLength() - 1 do
                local node = nodeList:item(index)
                local taxNodeChildren = node:getChildNodes()
                local streetAddressNode = DomSearchHelper.getNode(StreetAddressData.NAME, taxNodeChildren)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAX) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("StreetAddress Node: ")
                    stringBuffer:append(streetAddressNode:getNodeName())
                    stringBuffer:append(" Value: ")
                    stringBuffer:append(streetAddressNode:getNodeValue())
                    stringBuffer:append(" Number Of Children: ")
                    stringBuffer:appendint(java_int(streetAddressNode:getChildNodes():getLength()))
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                local taxableStreetAddress = StreetAddress.new(streetAddressNode)
                local stringValidationUtil = StringValidationUtil.getInstance()
                if not stringValidationUtil:isEmpty(country) and not stringValidationUtil:isEmpty(taxableStreetAddress:getCountry()) and taxableStreetAddress:getCountry():compareTo(self.ALL) == 0 then
                    do return "__jreturn", true end
                end
                if not stringValidationUtil:isEmpty(country) and not stringValidationUtil:isEmpty(taxableStreetAddress:getCountry()) and ((country < taxableStreetAddress:getCountry() and -1) or (country > taxableStreetAddress:getCountry() and 1) or 0) == 0 then
                    local state = self.streetAddress:getState()
                    if state ~= nil then
                        do return "__jreturn", true end
                    end
                end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return SimpleStateTaxModule

