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

local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local StreetAddress = require("org.allbinary.business.user.address.StreetAddress")
local StreetAddressData = require("org.allbinary.business.user.address.StreetAddressData")
local TaxData = require("org.allbinary.business.user.commerce.money.tax.components.TaxData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local TaxModuleInterface = require("org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimpleStateTaxModule = {}
SimpleStateTaxModule.__index = SimpleStateTaxModule
SimpleStateTaxModule.className = "SimpleStateTaxModule"

function SimpleStateTaxModule:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.streetAddress = nil
    self.storeFrontInterface = nil
    self.ALL = CommonPhoneStrings.getInstance().STAR
    self.STATETAXPATH = "/generic/taxes/"
    self.STATETAXFILE = "stateTaxation.xml"
    self.document = nil
end


function SimpleStateTaxModule.new()
    local self = setmetatable({}, SimpleStateTaxModule)
    self:_init_fields()
    return self
end


-- throws Exception
function SimpleStateTaxModule:getTaxRate(streetAddress, storeFrontInterface)
        self.streetAddress = streetAddress
        self.storeFrontInterface = storeFrontInterface
        local fileAbPath = AbPath.new(tostring(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH) .. self.storeFrontInterface:getName() .. self.STATETAXPATH, self.STATETAXFILE)
        local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(fileAbPath)
        self.document = DomDocumentHelper.create(data)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAX) then
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
        local try_ok, try_error = pcall(function()
            self.streetAddress = streetAddress
            self.storeFrontInterface = storeFrontInterface
            local fileAbPath = AbPath.new(tostring(self.URLGLOBALS:getMainPath() + self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH) .. self.storeFrontInterface:getName() .. self.STATETAXPATH, self.STATETAXFILE)
            local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(fileAbPath)
            self.document = DomDocumentHelper.create(data)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAX) then
                self.logUtil:putF("Tax Doc: " .. XmlDocumentHelper.toString(self.document), self, self.commonStrings.IS_VALID)
            end
            local country = self.streetAddress:getCountry()
            local rootNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
            local nodeList = self.document:getElementsByTagName(TaxData.NAME)
            for index = 0, nodeList:getLength() - 1 do
                local node = nodeList:item(index)
                local taxNodeChildren = node:getChildNodes()
                local streetAddressNode = DomSearchHelper.getNode(StreetAddressData.NAME, taxNodeChildren)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAX) then
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
                    return true
                end
                if not stringValidationUtil:isEmpty(country) and not stringValidationUtil:isEmpty(taxableStreetAddress:getCountry()) and ((country < taxableStreetAddress:getCountry() and -1) or (country > taxableStreetAddress:getCountry() and 1) or 0) == 0 then
                    local state = self.streetAddress:getState()
                    if state ~= nil then
                        return true
                    end
                end
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end

return SimpleStateTaxModule

