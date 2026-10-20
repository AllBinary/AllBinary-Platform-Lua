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
-- package org.allbinary.business.user.commerce.shipping

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicWeightShippingModuleView = require("org.allbinary.business.user.commerce.shipping.modules.BasicWeightShippingModuleView")
local NoShippingModuleView = require("org.allbinary.business.user.commerce.shipping.modules.NoShippingModuleView")
local ShippingInterface = require("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local CryptFileReader = require("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeFactory = require("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
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

local ShippingMethodsFactory = {}
ShippingMethodsFactory.__index = ShippingMethodsFactory
ShippingMethodsFactory.className = "ShippingMethodsFactory"

function ShippingMethodsFactory:_init_fields()
    self.defaultShippingMethodInterface = nil
    self.document = nil
    self.shippingVector = nil
end


function ShippingMethodsFactory.new(abeClientInformation, storeFrontInterface)
    local self = setmetatable({}, ShippingMethodsFactory)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        local sep = AbPathData.getInstance().SEPARATOR
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(storeFrontInterface:getName())
        stringBuffer:append(sep)
        stringBuffer:append(ShippingMethodsFactory.SHIPPINGMETHODSFILEPATHSTRING)
        local abPath = AbPath.new(tostring(stringBuffer), self.SHIPPINGMETHODSFILENAME)
        local data = CryptFileReader.new(TransformInfoObjectConfigData.getInstance().UNCRYPTED_EXTENSION, TransformInfoObjectConfigData.getInstance().ENCRYPTED_EXTENSION):get(abPath)
        self.document = DomDocumentHelper.create(data)
        self.shippingVector = BasicArrayListD.new()
        local nodeList = self.document:getElementsByTagName(ShippingMethodsData.NAME)
        for index = 0, nodeList:getLength() - 1 do
            local node = nodeList:item(index)
            local shippingMethodNodeChildren = node:getChildNodes()
            local shippingMethodNameNode = DomSearchHelper.getNode(ShippingMethodData.NAME, shippingMethodNodeChildren)
            local classNameNode = DomSearchHelper.getNode(DynamicObjectData.NAME, shippingMethodNameNode:getChildNodes())
            local shippingMethodClassName = DomNodeHelper.getTextNodeValue(classNameNode)
            local shippingMethodInterface = AbeFactory.getInstance():getInstance(abeClientInformation, shippingMethodClassName)
            self.shippingVector:add(shippingMethodInterface)
            local defaultShippingMethodNameNode = DomSearchHelper.getNode(ShippingMethodData.DEFAULT, shippingMethodNameNode:getChildNodes())
            local defaultShippingMethodNameNodeValue = DomNodeHelper.getTextNodeValue(defaultShippingMethodNameNode)
            if defaultShippingMethodNameNodeValue ~= nil and ((defaultShippingMethodNameNodeValue < ShippingMethodData.DEFAULT and -1) or (defaultShippingMethodNameNodeValue > ShippingMethodData.DEFAULT and 1) or 0) == 0 then
                self.defaultShippingMethodInterface = shippingMethodInterface
            end
        end
        if self.shippingVector:size() < 1 then
            self.defaultShippingMethodInterface = BasicWeightShippingModuleView.new()
            self.shippingVector:add(self.defaultShippingMethodInterface)
            self.shippingVector:add(NoShippingModuleView.new())
        end
    return self
end


-- throws Exception
function ShippingMethodsFactory:getInstance()
        return self.shippingVector
end


function ShippingMethodsFactory:getDefaultInstance()
        return self.defaultShippingMethodInterface
end

ShippingMethodsFactory.SHIPPINGMETHODSFILEPATHSTRING = nil


do -- Java static initializer
        local stringBuffer = StringMaker.new()
        local sep = AbPathData.getInstance().SEPARATOR
        stringBuffer:append(sep)
        stringBuffer:append("generic")
        stringBuffer:append(sep)
        stringBuffer:append("shipping")
        stringBuffer:append(sep)
        ShippingMethodsFactory.SHIPPINGMETHODSFILEPATHSTRING = tostring(stringBuffer)
end
ShippingMethodsFactory.SHIPPINGMETHODSFILENAME = "shippingMethods.xml"

return ShippingMethodsFactory

