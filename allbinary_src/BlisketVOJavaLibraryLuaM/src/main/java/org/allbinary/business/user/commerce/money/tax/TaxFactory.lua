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

local TaxFactory = {}
package.loaded["org.allbinary.business.user.commerce.money.tax.TaxFactory"] = TaxFactory

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

local DynamicObjectData = java_lazy("org.allbinary.business.DynamicObjectData")
local StoreFrontInterface = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local TaxData = java_lazy("org.allbinary.business.user.commerce.money.tax.components.TaxData")
local SimpleStateTaxModule = java_lazy("org.allbinary.business.user.commerce.money.tax.modules.SimpleStateTaxModule")
local TaxModuleInterface = java_lazy("org.allbinary.business.user.commerce.money.tax.modules.TaxModuleInterface")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CryptFileReader = java_lazy("org.allbinary.logic.control.crypt.file.CryptFileReader")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeFactory = java_lazy("org.allbinary.logic.system.loader.AbeFactory")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table TaxFactory is declared before the requires
TaxFactory.__index = TaxFactory
TaxFactory.className = "TaxFactory"
TaxFactory.javaClassName = "org.allbinary.business.user.commerce.money.tax.TaxFactory"

function TaxFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TAXATIONFILENAME = "taxationMethod.xml"
end


function TaxFactory.getInstance()
        return TaxFactory.instance_f
end


function TaxFactory._jinit(self)
    TaxFactory._init_fields(self)
    return self
end

function TaxFactory.new(...)
    local self = setmetatable({}, TaxFactory)
    TaxFactory._jinit(self, ...)
    return self
end


-- throws Exception
function TaxFactory:getInstance(abeClientInformation, storeFrontInterface)
        local stringBuffer = StringMaker.new()
        stringBuffer:append(URLGLOBALS.getMainPath())
        stringBuffer:append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH)
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
            if not rawequal(nodeList, nil) then
                local classNameNode = DomSearchHelper.getNode(DynamicObjectData.NAME, nodeList)
                if not rawequal(classNameNode, nil) then
                    local className = DomNodeHelper.getTextNodeValue(classNameNode)
                    return AbeFactory.getInstance():getInstance(abeClientInformation, className)
                else
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAX) then
                        self.logUtil:putF("Class Node Null", self, self.commonStrings.GET_INSTANCE)
                    end
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAX) then
                    self.logUtil:putF("Tax Name Node Node Children", self, self.commonStrings.GET_INSTANCE)
                end
            end
        end
        return SimpleStateTaxModule.new()
end

TaxFactory.instance_f = TaxFactory.new()

return TaxFactory

