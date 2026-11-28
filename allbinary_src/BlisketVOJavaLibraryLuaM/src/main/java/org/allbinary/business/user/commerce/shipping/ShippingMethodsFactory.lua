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

local ShippingMethodsFactory = {}
package.loaded["org.allbinary.business.user.commerce.shipping.ShippingMethodsFactory"] = ShippingMethodsFactory

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
local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local BasicWeightShippingModuleView = java_lazy("org.allbinary.business.user.commerce.shipping.modules.BasicWeightShippingModuleView")
local NoShippingModuleView = java_lazy("org.allbinary.business.user.commerce.shipping.modules.NoShippingModuleView")
local ShippingInterface = java_lazy("org.allbinary.business.user.commerce.shipping.modules.ShippingInterface")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local ShippingMethodData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodData")
local ShippingMethodsData = java_lazy("org.allbinary.business.user.commerce.shipping.ShippingMethodsData")

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

-- class table ShippingMethodsFactory is declared before the requires
ShippingMethodsFactory.__index = ShippingMethodsFactory
ShippingMethodsFactory.className = "ShippingMethodsFactory"
ShippingMethodsFactory.javaClassName = "org.allbinary.business.user.commerce.shipping.ShippingMethodsFactory"

function ShippingMethodsFactory:_init_fields()
    if self.defaultShippingMethodInterface == nil then self.defaultShippingMethodInterface = nil end
    if self.document == nil then self.document = nil end
    if self.shippingVector == nil then self.shippingVector = nil end
end


function ShippingMethodsFactory._jinit(self, abeClientInformation, storeFrontInterface)
    ShippingMethodsFactory._init_fields(self)
        local stringBuffer = StringMaker.new()
        local sep = AbPathData.getInstance().SEPARATOR
        stringBuffer:append(URLGLOBALS.getMainPath())
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
        stringBuffer:append(storeFrontInterface:getName())
        stringBuffer:append(sep)
        stringBuffer:append(ShippingMethodsFactory.SHIPPINGMETHODSFILEPATHSTRING)
        local abPath = AbPath.new(tostring(stringBuffer), ShippingMethodsFactory.SHIPPINGMETHODSFILENAME)
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
            if not rawequal(defaultShippingMethodNameNodeValue, nil) and rawequal(((defaultShippingMethodNameNodeValue < ShippingMethodData.DEFAULT and -1) or (defaultShippingMethodNameNodeValue > ShippingMethodData.DEFAULT and 1) or 0), 0) then
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

function ShippingMethodsFactory.new(...)
    local self = setmetatable({}, ShippingMethodsFactory)
    ShippingMethodsFactory._jinit(self, ...)
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

