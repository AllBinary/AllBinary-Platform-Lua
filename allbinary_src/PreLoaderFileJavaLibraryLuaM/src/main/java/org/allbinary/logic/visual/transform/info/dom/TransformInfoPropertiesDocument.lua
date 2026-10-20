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
-- package org.allbinary.logic.visual.transform.info.dom

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local DomDocumentFileHelper = require("org.allbinary.data.tree.dom.document.DomDocumentFileHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoProperties = require("org.allbinary.logic.visual.transform.info.TransformInfoProperties")
local TransformInfoPropertiesFactory = require("org.allbinary.logic.visual.transform.info.TransformInfoPropertiesFactory")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
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

local TransformInfoPropertiesDocument = {}
TransformInfoPropertiesDocument.__index = TransformInfoPropertiesDocument
TransformInfoPropertiesDocument.className = "TransformInfoPropertiesDocument"

function TransformInfoPropertiesDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.document = nil
end


function TransformInfoPropertiesDocument.new(filePath)
    local self = setmetatable({}, TransformInfoPropertiesDocument)
    self:_init_fields()
        local xmlFile = AbFile.createAbFile(filePath)
        self.document = DomDocumentFileHelper.createDocument(xmlFile)
    return self
end


function TransformInfoPropertiesDocument:toTransformInfoPropertiesHashMap()
        local try_ok, try_error = pcall(function()
            local transformInfoPropertiesHashMap = StdUtil.getInstance():createHashMap()
            local transformInfosNode = self.document:getElementsByTagName(TransformInfosData.getInstance().NAME):item(0)
            local transformInfosChildNodeList = transformInfosNode:getChildNodes()
            local transformInfoNodeVector = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, transformInfosChildNodeList)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Size: " .. tostring(transformInfoNodeVector:size()), self, "toTransformInfoPropertiesHashMap()")
            end
            local size = transformInfoNodeVector:size()
            local node = nil
            local transformInfoProperties = nil
            for index = 0, size - 1 do
                node = transformInfoNodeVector:get(index)
                transformInfoProperties = TransformInfoPropertiesFactory.getInstance():getInstance(node)
                transformInfoPropertiesHashMap:put(transformInfoProperties:getName(), transformInfoProperties)
            end
            return transformInfoPropertiesHashMap
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "toTransformInfoPropertiesHashMap()", e)
            end
            return nil
        end
end

return TransformInfoPropertiesDocument

