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
-- package views.business.context.modules.storefront.customizer.template.objectConfig

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local TransformInfoDomNodeView = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNodeView")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")
local NoTemplateTransformInfoObjectConfig = require("views.business.context.modules.storefront.customizer.template.objectConfig.NoTemplateTransformInfoObjectConfig")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InsertTemplateCustomizerTransformInfoObjectConfig = {}
InsertTemplateCustomizerTransformInfoObjectConfig.__index = InsertTemplateCustomizerTransformInfoObjectConfig
InsertTemplateCustomizerTransformInfoObjectConfig.className = "InsertTemplateCustomizerTransformInfoObjectConfig"
setmetatable(InsertTemplateCustomizerTransformInfoObjectConfig, {__index = NoTemplateTransformInfoObjectConfig})

function InsertTemplateCustomizerTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function InsertTemplateCustomizerTransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 1 then return InsertTemplateCustomizerTransformInfoObjectConfig._new1(...)
    elseif count == 2 then return InsertTemplateCustomizerTransformInfoObjectConfig._new2(...)
    elseif count == 3 then return InsertTemplateCustomizerTransformInfoObjectConfig._new3(...)
    end
end


function InsertTemplateCustomizerTransformInfoObjectConfig._new1(transformInfoInterface)
    local self = setmetatable(NoTemplateTransformInfoObjectConfig.new(transformInfoInterface), InsertTemplateCustomizerTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function InsertTemplateCustomizerTransformInfoObjectConfig._new2(transformInfoInterface, document)
    local self = setmetatable(NoTemplateTransformInfoObjectConfig.new(transformInfoInterface, document), InsertTemplateCustomizerTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function InsertTemplateCustomizerTransformInfoObjectConfig._new3(transformInfoInterface, name, type)
    local self = setmetatable(NoTemplateTransformInfoObjectConfig.new(transformInfoInterface, name, type), InsertTemplateCustomizerTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function InsertTemplateCustomizerTransformInfoObjectConfig:set(aParentViewName)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Setting: " .. aParentViewName, self, "set()")
        end
        local document = self:toXmlDoc()
        local parentComponentsNodeList = document:getElementsByTagName(TransformInfosData.getInstance().NAME)
        if parentComponentsNodeList ~= nil and parentComponentsNodeList:getLength() > 0 then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Replacing", self, "set()")
            end
            local componentNode = parentComponentsNodeList:item(0):getChildNodes():item(0)
            if componentNode ~= nil then
                document:removeChild(componentNode)
            end
            parentComponentsNodeList:item(0):appendChild(TransformInfoDomNodeView.new(aParentViewName):toXmlNode(document))
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Setting", self, "set()")
            end
            local objectConfigNode = document:getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME):item(0)
            local parentComponentsNode = document:createElement(TransformInfosData.getInstance().NAME)
            objectConfigNode:appendChild(parentComponentsNode)
            local transformInfoDomNodeView = TransformInfoDomNodeView.new(aParentViewName)
            parentComponentsNode:appendChild(transformInfoDomNodeView:toXmlNode(document))
        end
end

return InsertTemplateCustomizerTransformInfoObjectConfig

