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
-- package org.allbinary.logic.visual.transform.info.objectConfig

local TransformInfoObjectConfig = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig"] = TransformInfoObjectConfig

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
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = java_lazy("org.allbinary.logic.io.InputOutputTypeData")
local OutputTypeData = java_lazy("org.allbinary.logic.io.OutputTypeData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfoData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoDomNode = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfosData")
local XslData = java_lazy("org.allbinary.logic.visual.transform.template.XslData")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Attr = java_lazy("org.w3c.dom.Attr")
local Document = java_lazy("org.w3c.dom.Document")
local NamedNodeMap = java_lazy("org.w3c.dom.NamedNodeMap")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local TransformInfoObjectConfigData = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")

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

-- class table TransformInfoObjectConfig is declared before the requires
TransformInfoObjectConfig.__index = TransformInfoObjectConfig
TransformInfoObjectConfig.className = "TransformInfoObjectConfig"
TransformInfoObjectConfig.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig"
TransformInfoObjectConfig.java_implements = " TransformInfoObjectConfigInterface "
TransformInfoObjectConfig.java_interfaces = function() return {TransformInfoObjectConfigInterface} end

function TransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.ownerTransformInfoInterface == nil then self.ownerTransformInfoInterface = nil end
    if self.document == nil then self.document = nil end
    if self.outputTypeName == nil then self.outputTypeName = nil end
end

function TransformInfoObjectConfig._jinit(self, ...)
    local count = select("#", ...)
    if count == 1 then return TransformInfoObjectConfig._new1(self, ...)
    elseif count == 2 then return TransformInfoObjectConfig._new2(self, ...)
    elseif count == 3 then return TransformInfoObjectConfig._new3(self, ...)
    end
    error("No constructor of TransformInfoObjectConfig takes " .. count .. " arguments")
end

function TransformInfoObjectConfig.new(...)
    local self = setmetatable({}, TransformInfoObjectConfig)
    TransformInfoObjectConfig._jinit(self, ...)
    return self
end


function TransformInfoObjectConfig._new1(self, transformInfoInterface)
    TransformInfoObjectConfig._init_fields(self)
        self.ownerTransformInfoInterface = transformInfoInterface
        self:createDocument()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if not rawequal(self.ownerTransformInfoInterface, nil) then
                stringBuffer:append(self.ownerTransformInfoInterface:getName())
            else
                stringBuffer:append("No Owner!?#@")
            end
            stringBuffer:append("\nConstructed with document: ")
            stringBuffer:append(tostring(self))
            self.logUtil:putF(tostring(stringBuffer), self, "Constructor(TransformInfoInterface)")
        end
    return self
end


function TransformInfoObjectConfig._new2(self, transformInfoInterface, document)
    TransformInfoObjectConfig._init_fields(self)
        self.ownerTransformInfoInterface = transformInfoInterface
        self.document = document
        local node = DomSearchHelper.getNodeNoThrow(OutputTypeData.getInstance().NAME, self:getRootNode():getChildNodes())
        if not rawequal(node, nil) then
            self:setOutputTypeName(DomNodeHelper.getTextNodeValue(node))
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if not rawequal(self.ownerTransformInfoInterface, nil) then
                stringBuffer:append(self.ownerTransformInfoInterface:getName())
            else
                stringBuffer:append("No Owner!?#@")
            end
            stringBuffer:append("\nConstructed with document: ")
            stringBuffer:append(tostring(self))
            self.logUtil:putF(tostring(stringBuffer), self, "Constructor(TransformInfoInterface, Document)")
        end
    return self
end


function TransformInfoObjectConfig._new3(self, transformInfoInterface, name, type)
    TransformInfoObjectConfig._init_fields(self)
        self.ownerTransformInfoInterface = transformInfoInterface
        self:createDocument()
        local configNameAttr = self.document:createAttribute(TransformInfoObjectConfigData.getInstance().NAME)
        configNameAttr:setValue(name)
        local objectConfigNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
        objectConfigNode:appendChild(configNameAttr)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if not rawequal(self.ownerTransformInfoInterface, nil) then
                stringBuffer:append(self.ownerTransformInfoInterface:getName())
            else
                stringBuffer:append("No Owner!?#@")
            end
            stringBuffer:append("\nConstructed with document: ")
            stringBuffer:append(tostring(self))
            self.logUtil:putF(tostring(stringBuffer), self, "Constructor(TransformInfoInterface, name, type)")
        end
    return self
end


function TransformInfoObjectConfig:createDocument()
        self.document = DomDocumentHelper.create()
        local objectConfigNode = self.document:createElement(TransformInfoObjectConfigData.getInstance().NAME)
        self.document:appendChild(objectConfigNode)
end


function TransformInfoObjectConfig:getTransformInfoInterface()
        return self.ownerTransformInfoInterface
end


-- throws Exception
function TransformInfoObjectConfig:toXmlDoc()
        return self.document
end


function TransformInfoObjectConfig:setDocument(document)
        self.document = document
end


function TransformInfoObjectConfig:containsView(transformInfoInterface)
        local objectConfigNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
        local viewNodeList = objectConfigNode:getChildNodes()
        local numberOfViews = viewNodeList:getLength()
        for index = 0, numberOfViews - 1 do
            local viewNode = viewNodeList:item(index)
            local viewAttributes = viewNode:getAttributes()
            local attrNode = viewAttributes:getNamedItem(TransformInfoData.getInstance().NAME)
            if rawequal(transformInfoInterface:getName():compareTo(attrNode:getValue()), 0) then
                return true
            end
        end
        return false
end


-- throws Exception
function TransformInfoObjectConfig:getTemplateAttributes()
        local componentNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
        return componentNode:getAttributes()
end


-- throws Exception
function TransformInfoObjectConfig:getName()
        local attrNode = self:getTemplateAttributes():getNamedItem(TransformInfoObjectConfigData.getInstance().NAME)
        return attrNode:getValue()
end


-- throws Exception
function TransformInfoObjectConfig:setName(name)
        local attrNode = self:getTemplateAttributes():getNamedItem(TransformInfoObjectConfigData.getInstance().NAME)
        attrNode:setValue(name)
end


-- throws Exception
function TransformInfoObjectConfig:getNodeVector(nodeName)
        local componentsNodeList = self.document:getElementsByTagName(nodeName)
        if not rawequal(componentsNodeList, nil) and componentsNodeList:getLength() > 0 then
            local viewNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNodeList:item(0):getChildNodes())
            local numberOfViews = viewNodeVector:size()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Number Of ")
                stringBuffer:append(nodeName)
                stringBuffer:append(" Nodes: ")
                stringBuffer:appendint(numberOfViews)
                self.logUtil:putF(tostring(stringBuffer), self, "getNodeVector(nodename)")
            end
            return viewNodeVector
        end
        return BasicArrayListD.new()
end


-- throws Exception
function TransformInfoObjectConfig:getTransformDomNodes_j1(nodeName)
        local viewVector = BasicArrayListD.new()
        local viewNodeVector = self:getNodeVector(nodeName)
        local size = viewNodeVector:size()
        for index = 0, size - 1 do
            local viewNode = viewNodeVector:get(index)
            viewVector:add(TransformInfoDomNode.new(viewNode))
        end
        return viewVector
end


-- throws Exception
function TransformInfoObjectConfig:getTransforms_j1(nodeName)
        local viewVector = BasicArrayListD.new()
        local viewNodeVector = self:getNodeVector(nodeName)
        local size = viewNodeVector:size()
        for index = 0, size - 1 do
            local viewNode = viewNodeVector:get(index)
            viewVector:add(TransformInfoDomNode.new(viewNode):getTransformInfoInterface())
        end
        return viewVector
end


-- throws Exception
function TransformInfoObjectConfig:getTransformsGroup(group)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("Started: ") .. require("allbinary_java").to_string(group), self, "getTransformsGroup()")
        end
        local viewVector = BasicArrayListD.new()
        local GROUP = TransformInfosData.getInstance().GROUP
        local componentsNodeList = self.document:getElementsByTagName(GROUP)
        if not rawequal(componentsNodeList, nil) and componentsNodeList:getLength() > 0 then
            local componentsNode = componentsNodeList:item(0)
            local length = componentsNodeList:getLength()
            for index = 0, length - 1 do
                local node = componentsNodeList:item(index)
                local attributes = node:getAttributes()
                local attrNode = attributes:getNamedItem(GROUP)
                local value = attrNode:getValue()
                if rawequal(((value < group and -1) or (value > group and 1) or 0), 0) then
                    componentsNode = node
                    break
                end
            end
            local viewNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNode:getChildNodes())
            local numberOfViews = viewNodeVector:size()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Number Of Nodes: ") .. require("allbinary_java").to_string(numberOfViews), self, "getTransformsGroup()")
            end
            local size = viewNodeVector:size()
            for index = 0, size - 1 do
                local viewNode = viewNodeVector:get(index)
                viewVector:add(TransformInfoDomNode.new(viewNode))
            end
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                if rawequal(componentsNodeList, nil) then
                    self.logUtil:putF("Number Of Nodes: NULL", self, "getTransformsGroup()")
                else
                    self.logUtil:putF("Number Of Nodes: 0", self, "getTransformsGroup()")
                end
            end
        end
        return viewVector
end


-- throws Exception
function TransformInfoObjectConfig:getTransformDomNodes_j0()
        return self:getTransformDomNodes(TransformInfosData.getInstance().GROUP)
end
function TransformInfoObjectConfig:getTransformDomNodes(...)
    local count = select("#", ...)
    if count == 1 then return self:getTransformDomNodes_j1(...) end
    if count == 0 then return self:getTransformDomNodes_j0(...) end
    error("No method getTransformDomNodes takes " .. count .. " arguments")
end
TransformInfoObjectConfig.getTransformDomNodes__jdispatcher = TransformInfoObjectConfig.getTransformDomNodes


-- throws Exception
function TransformInfoObjectConfig:getTransforms_j0()
        return self:getTransforms(TransformInfosData.getInstance().NAME)
end
function TransformInfoObjectConfig:getTransforms(...)
    local count = select("#", ...)
    if count == 1 then return self:getTransforms_j1(...) end
    if count == 0 then return self:getTransforms_j0(...) end
    error("No method getTransforms takes " .. count .. " arguments")
end
TransformInfoObjectConfig.getTransforms__jdispatcher = TransformInfoObjectConfig.getTransforms


-- throws Exception
function TransformInfoObjectConfig:getGroupTransforms()
        return self:getTransforms(TransformInfosData.getInstance().GROUP)
end


-- throws Exception
function TransformInfoObjectConfig:getParentTransforms()
        return self:getTransforms(TransformInfoData.getInstance().PARENT)
end


function TransformInfoObjectConfig:getRootNode()
        return self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
end


function TransformInfoObjectConfig:setOutputTypeName(outputTypeName)
        self.outputTypeName = outputTypeName
end


-- throws Exception
function TransformInfoObjectConfig:getOutputTypeName()
        return self.outputTypeName
end


-- throws Exception
function TransformInfoObjectConfig:getInputOutputTypeName()
        local node = DomSearchHelper.getNode(InputOutputTypeData.getInstance().NAME, self:getRootNode():getChildNodes())
        return DomNodeHelper.getTextNodeValue(node)
end


-- throws Exception
function TransformInfoObjectConfig:getInputOutputTypeFile()
        local node = DomSearchHelper.getNode(InputOutputTypeData.getInstance().FILE, self:getRootNode():getChildNodes())
        return DomNodeHelper.getTextNodeValue(node)
end


-- throws Exception
function TransformInfoObjectConfig:getImportUriPath()
        local node = DomSearchHelper.getNode(XslData.getInstance().ROOT_IMPORT_URI, self:getRootNode():getChildNodes())
        return DomNodeHelper.getTextNodeValue(node)
end


function TransformInfoObjectConfig:toString()
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(self.document, nil) then
                do return "__jreturn", XmlDocumentHelper.toString(self.document) end
            else
                do return "__jreturn", nil end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:putF("DOM Document error", self, self.commonStrings.TOSTRING)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
TransformInfoObjectConfig.__tostring = function(self) return self:toString() end

return TransformInfoObjectConfig

