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
local CommonLabels = require("org.allbinary.string.CommonLabels")
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

local TransformInfoPropertiesFactory = {}
TransformInfoPropertiesFactory.__index = TransformInfoPropertiesFactory
TransformInfoPropertiesFactory.className = "TransformInfoPropertiesFactory"

function TransformInfoPropertiesFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function TransformInfoPropertiesFactory.getInstance()
        return TransformInfoPropertiesFactory.instance
end


function TransformInfoPropertiesFactory.new()
    local self = setmetatable({}, TransformInfoPropertiesFactory)
    self:_init_fields()
    return self
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function TransformInfoPropertiesFactory:getInstance(node)
        local transformInfoChildNodeList = node:getChildNodes()
        local transformInfoData = TransformInfoData.getInstance()
        local attributes = node:getAttributes()
        local attrNode = attributes:getNamedItem(transformInfoData.NAME)
        local name = attrNode:getValue()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF(tostring(CommonLabels.getInstance().NEXT) .. " View Name: " .. name, self, "toTransformInfoPropertiesHashMap()")
        end
        local labelNode = DomSearchHelper.getNodeNoThrow(transformInfoData.LABEL, transformInfoChildNodeList)
        local label = DomNodeHelper.getTextNodesValue(labelNode)
        if label == nil then
            label = name
        end
        local descriptionNode = DomSearchHelper.getNode(transformInfoData.DESCRIPTION, transformInfoChildNodeList)
        local description = DomNodeHelper.getTextNodesValue(descriptionNode)
        local objectFileNode = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, transformInfoChildNodeList)
        local objectFileName = DomNodeHelper.getTextNodeValue(objectFileNode)
        local objectConfigFileNode = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, transformInfoChildNodeList)
        local objectConfigFileName = DomNodeHelper.getTextNodeValue(objectConfigFileNode)
        local templateFileNode = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, transformInfoChildNodeList)
        local templateFileName = DomNodeHelper.getTextNodeValue(templateFileNode)
        local transformInfoProperties = TransformInfoProperties.new(name, label, description, objectFileName, objectConfigFileName, templateFileName)
        return transformInfoProperties
end

TransformInfoPropertiesFactory.instance = TransformInfoPropertiesFactory.new()

return TransformInfoPropertiesFactory

