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
-- package org.allbinary.business.user.commerce.money.tax

local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local TaxData = require("org.allbinary.business.user.commerce.money.tax.components.TaxData")
local SimpleStateTaxModule = require("org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule")
local TaxModuleInterface = require("org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TaxFactory = {}
TaxFactory.__index = TaxFactory
TaxFactory.className = "TaxFactory"

function TaxFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TAXATIONFILENAME = "taxationMethod.xml"
end


function TaxFactory.getInstance()
        return TaxFactory.instance
end


function TaxFactory.new()
    local self = setmetatable({}, TaxFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TaxFactory:getInstance(abeClientInformation, storeFrontInterface)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(storeFrontInterface:getName())
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append("generic")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        stringBuffer:append("taxes")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        local abPath = AbPath.new(tostring(stringBuffer), self.TAXATIONFILENAME)
        local transformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance()
        local data = CryptFileReader.new(transformInfoObjectConfigData.UNCRYPTED_EXTENSION, transformInfoObjectConfigData.ENCRYPTED_EXTENSION):get(abPath)
        local document = DomDocumentHelper.create(data)
        local taxNameNodeList = document:getElementsByTagName(TaxData.NAME)
        for index = 0, taxNameNodeList:getLength() - 1 do
            local node = taxNameNodeList:item(index)
            local nodeList = node:getChildNodes()
            if nodeList ~= nil then
                local classNameNode = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList)
                if classNameNode ~= nil then
                    local className = DomNodeHelper.getTextNodeValue(classNameNode)
                    return AbeFactory.getInstance():getInstance(abeClientInformation, className)
                else
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAX) then
                        self.logUtil:putF("Class Node Null", self, self.commonStrings.GET_INSTANCE)
                    end
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAX) then
                    self.logUtil:putF("Tax Name Node Node Children", self, self.commonStrings.GET_INSTANCE)
                end
            end
        end
        return SimpleStateTaxModule.new()
end

TaxFactory.instance = TaxFactory.new()

return TaxFactory

