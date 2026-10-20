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

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local InputOutputTypeData = require("org.allbinary.logic.io.InputOutputTypeData")
local OutputTypeData = require("org.allbinary.logic.io.OutputTypeData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
local XslData = require("org.allbinary.logic.visual.transform.template.XslData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Attr = require("org.w3c.dom.Attr")
local Document = require("org.w3c.dom.Document")
local NamedNodeMap = require("org.w3c.dom.NamedNodeMap")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoObjectConfig = {}
TransformInfoObjectConfig.__index = TransformInfoObjectConfig
TransformInfoObjectConfig.className = "TransformInfoObjectConfig"

function TransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.ownerTransformInfoInterface = nil
    self.document = nil
    self.outputTypeName = nil
end

function TransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 1 then return TransformInfoObjectConfig._new1(...)
    elseif count == 2 then return TransformInfoObjectConfig._new2(...)
    elseif count == 3 then return TransformInfoObjectConfig._new3(...)
    end
end


function TransformInfoObjectConfig._new1(transformInfoInterface)
    local self = setmetatable({}, TransformInfoObjectConfig)
    self:_init_fields()
        self.ownerTransformInfoInterface = transformInfoInterface
        self:createDocument()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if self.ownerTransformInfoInterface ~= nil then
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


function TransformInfoObjectConfig._new2(transformInfoInterface, document)
    local self = setmetatable({}, TransformInfoObjectConfig)
    self:_init_fields()
        self.ownerTransformInfoInterface = transformInfoInterface
        self.document = document
        local node = DomSearchHelper.getNodeNoThrow(OutputTypeData.getInstance().NAME, self:getRootNode():getChildNodes())
        if node ~= nil then
            self:setOutputTypeName(DomNodeHelper.getTextNodeValue(node))
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if self.ownerTransformInfoInterface ~= nil then
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


function TransformInfoObjectConfig._new3(transformInfoInterface, name, type)
    local self = setmetatable({}, TransformInfoObjectConfig)
    self:_init_fields()
        self.ownerTransformInfoInterface = transformInfoInterface
        self:createDocument()
        local configNameAttr = self.document:createAttribute(TransformInfoObjectConfigData.getInstance().NAME)
        configNameAttr:setValue(name)
        local objectConfigNode = self.document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
        objectConfigNode:appendChild(configNameAttr)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if self.ownerTransformInfoInterface ~= nil then
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
            if transformInfoInterface:getName():compareTo(attrNode:getValue()) == 0 then
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
        if componentsNodeList ~= nil and componentsNodeList:getLength() > 0 then
            local viewNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNodeList:item(0):getChildNodes())
            local numberOfViews = viewNodeVector:size()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
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
function TransformInfoObjectConfig:getTransformDomNodes(nodeName)
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
function TransformInfoObjectConfig:getTransforms(nodeName)
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
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Started: " .. group, self, "getTransformsGroup()")
        end
        local viewVector = BasicArrayListD.new()
        local GROUP = TransformInfosData.getInstance().GROUP
        local componentsNodeList = self.document:getElementsByTagName(GROUP)
        if componentsNodeList ~= nil and componentsNodeList:getLength() > 0 then
            local componentsNode = componentsNodeList:item(0)
            local length = componentsNodeList:getLength()
            for index = 0, length - 1 do
                local node = componentsNodeList:item(index)
                local attributes = node:getAttributes()
                local attrNode = attributes:getNamedItem(GROUP)
                local value = attrNode:getValue()
                if ((value < group and -1) or (value > group and 1) or 0) == 0 then
                    componentsNode = node
                    break
                end
            end
            local viewNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNode:getChildNodes())
            local numberOfViews = viewNodeVector:size()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Number Of Nodes: " .. tostring(numberOfViews), self, "getTransformsGroup()")
            end
            local size = viewNodeVector:size()
            for index = 0, size - 1 do
                local viewNode = viewNodeVector:get(index)
                viewVector:add(TransformInfoDomNode.new(viewNode))
            end
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                if componentsNodeList == nil then
                    self.logUtil:putF("Number Of Nodes: NULL", self, "getTransformsGroup()")
                else
                    self.logUtil:putF("Number Of Nodes: 0", self, "getTransformsGroup()")
                end
            end
        end
        return viewVector
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfig:getTransformDomNodes()
        return self:getTransformDomNodes(TransformInfosData.getInstance().GROUP)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoObjectConfig:getTransforms()
        return self:getTransforms(TransformInfosData.getInstance().NAME)
end


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
        local try_ok, try_error = pcall(function()
            if self.document ~= nil then
                return XmlDocumentHelper.toString(self.document)
            else
                return nil
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:putF("DOM Document error", self, self.commonStrings.TOSTRING)
            end
            return nil
        end
end
TransformInfoObjectConfig.__tostring = function(self) return self:toString() end

return TransformInfoObjectConfig

