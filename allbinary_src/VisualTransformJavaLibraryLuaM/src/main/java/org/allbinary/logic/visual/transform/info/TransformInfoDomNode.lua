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
-- package org.allbinary.logic.visual.transform.info

local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Attr = require("org.w3c.dom.Attr")
local NamedNodeMap = require("org.w3c.dom.NamedNodeMap")
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

local TransformInfoDomNode = {}
TransformInfoDomNode.__index = TransformInfoDomNode
TransformInfoDomNode.className = "TransformInfoDomNode"

function TransformInfoDomNode:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.transformInfoInterface = nil
    self.mappedName = nil
end

function TransformInfoDomNode.new(...)
    local count = select("#", ...)
    if count == 1 then return TransformInfoDomNode._new1(...)
    elseif count == 1 then return TransformInfoDomNode._new1(...)
    elseif count == 2 then return TransformInfoDomNode._new2(...)
    elseif count == 2 then return TransformInfoDomNode._new2(...)
    end
end


function TransformInfoDomNode._new1(node)
    local self = setmetatable({}, TransformInfoDomNode)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Constructing TransformInfo From TransformInfoDomNode: " .. tostring(node:getNodeName()), self, "TransformInfoDomNode(Node node)")
        end
        local transformInfoData = TransformInfoData.getInstance()
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(transformInfoData.NAME)
        local name = attrNode:getValue()
        local nodeList = node:getChildNodes()
        if nodeList:getLength() > 1 then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Constructing Complete TransformInfo Node For: ")
                stringBuffer:append(name)
                stringBuffer:append(" with ")
                stringBuffer:appendint(java_int(nodeList:getLength()))
                stringBuffer:append(" children")
                self.logUtil:putF(tostring(stringBuffer), self, "TransformInfoObjectConfigComponent(Node node)")
            end
            local objectFileNameNode = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, nodeList)
            local objectFileName = DomNodeHelper.getTextNodeValue(objectFileNameNode)
            local objectConfigFileNameNode = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, nodeList)
            local objectConfigFileName = DomNodeHelper.getTextNodeValue(objectConfigFileNameNode)
            local templateFileNameNode = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, nodeList)
            local templateFileName = DomNodeHelper.getTextNodeValue(templateFileNameNode)
            local dataFileNameNode = DomSearchHelper.getNode(transformInfoData.DATAFILENAME, nodeList)
            local dataFileName = DomNodeHelper.getTextNodeValue(dataFileNameNode)
            self.transformInfoInterface = TransformInfo.new(name, objectFileName, objectConfigFileName, templateFileName, dataFileName)
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Constructing Partial TransformInfo Node For: ")
                stringBuffer:append(name)
                stringBuffer:append(" with ")
                stringBuffer:appendint(java_int(nodeList:getLength()))
                stringBuffer:append(" children")
                self.logUtil:putF(tostring(stringBuffer), self, "TransformInfoObjectConfigComponent(Node node)")
            end
            self.transformInfoInterface = TransformInfo.new(name)
        end
        local templateAttrNode = attributes:getNamedItem(transformInfoData.MAPPED)
        if templateAttrNode ~= nil then
            self.mappedName = templateAttrNode:getValue()
        else
            self.mappedName = self:getTransformInfoInterface():getName()
        end
    return self
end


function TransformInfoDomNode._new1(transformInfoInterface)
    local self = setmetatable({}, TransformInfoDomNode)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        self.mappedName = transformInfoInterface:getName()
    return self
end


function TransformInfoDomNode._new2(transformInfoInterface, mappedName)
    local self = setmetatable({}, TransformInfoDomNode)
    self:_init_fields()
        self.transformInfoInterface = transformInfoInterface
        self.mappedName = mappedName
    return self
end


function TransformInfoDomNode._new2(name, mappedName)
    local self = setmetatable({}, TransformInfoDomNode)
    self:_init_fields()
        self.transformInfoInterface = TransformInfo.new(name)
        self.mappedName = mappedName
    return self
end


function TransformInfoDomNode:getTransformInfoInterface()
        return self.transformInfoInterface
end


function TransformInfoDomNode:getMappedName()
        return self.mappedName
end


function TransformInfoDomNode:getReplaceKey()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("<transform:component name=\"")
        stringBuffer:append("body")
        stringBuffer:append("\"/>")
        local key = tostring(stringBuffer)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Component Key: " .. key, self, "getReplaceKey()")
        end
        return key
end

return TransformInfoDomNode

