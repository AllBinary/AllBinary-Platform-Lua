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

-- local HashMap = require("java.util.HashMap")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local RootTransformInfoData = require("org.allbinary.logic.visual.transform.info.RootTransformInfoData")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformTemplateFactory = require("org.allbinary.logic.visual.transform.template.TransformTemplateFactory")
local TransformTemplateInterface = require("org.allbinary.logic.visual.transform.template.TransformTemplateInterface")
local TransformTemplateCustomizerUtil = require("org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local TransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GenericStoreTransformInfoObjectConfig = {}
GenericStoreTransformInfoObjectConfig.__index = GenericStoreTransformInfoObjectConfig
GenericStoreTransformInfoObjectConfig.className = "GenericStoreTransformInfoObjectConfig"
setmetatable(GenericStoreTransformInfoObjectConfig, {__index = TransformInfoObjectConfig})

function GenericStoreTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abeClientInformation = nil
end

function GenericStoreTransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 2 then return GenericStoreTransformInfoObjectConfig._new2(...)
    elseif count == 3 then return GenericStoreTransformInfoObjectConfig._new3(...)
    elseif count == 4 then return GenericStoreTransformInfoObjectConfig._new4(...)
    end
end


function GenericStoreTransformInfoObjectConfig._new2(abeClientInformation, transformInfoInterface)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface), GenericStoreTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
    return self
end


function GenericStoreTransformInfoObjectConfig._new3(abeClientInformation, transformInfoInterface, document)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface, document), GenericStoreTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function GenericStoreTransformInfoObjectConfig._new4(abeClientInformation, transformInfoInterface, name, type)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface, name, type), GenericStoreTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function GenericStoreTransformInfoObjectConfig:generate(objectConfigDocument)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("TransformInfo: ")
            if self:getTransformInfoInterface() ~= nil then
                stringBuffer:append(self:getTransformInfoInterface():getName())
            else
                stringBuffer:append("No Owner!?#@")
            end
            self.logUtil:putF(tostring(stringBuffer), self, "generate()")
        end
        local transformInfoHttpStoreInterface = self:getTransformInfoInterface()
        local objectConfigDocumentString = XmlDocumentHelper.toString(objectConfigDocument)
        local replaceHashMap = self:createReplaceHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        return self:generate(objectConfigDocumentString, replaceHashMap)
end


-- throws Exception
function GenericStoreTransformInfoObjectConfig:createReplaceHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local storeName = transformInfoHttpStoreInterface:getStoreName()
        local hashMap = self:createHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local transformInfoObjectConfigData = TransformInfoObjectConfigData.getInstance()
        hashMap:put(transformInfoObjectConfigData.VARKEY + StoreFrontData.getInstance().NAME, storeName)
        local pageName = TransformTemplateCustomizerUtil.getInstance():getPageNameHack(self:getTransformInfoInterface():getName(), storeName)
        hashMap:put(transformInfoObjectConfigData.VARKEY + TransformInfoData.getInstance().PARTIAL, pageName)
        return hashMap
end


-- throws Exception
function GenericStoreTransformInfoObjectConfig:createHashMap(transformInfoHttpStoreInterface, objectConfigDocumentString)
        local hashMap = StdUtil.getInstance():createHashMap()
        local storeName = transformInfoHttpStoreInterface:getStoreName()
        local propertiesHashMap = transformInfoHttpStoreInterface:getPropertiesHashMap()
        local templateNameOverride = StringUtil.getInstance():getNonNull(propertiesHashMap:get(TransformInfoData.getInstance().PARTIAL))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("TemplateNameOverride: " .. templateNameOverride, self, "generate()")
        end
        local templateNameStringBuffer = StringMaker.new()
        templateNameStringBuffer:append(storeName)
        templateNameStringBuffer:append(templateNameOverride)
        templateNameStringBuffer:append(CommonSeps.getInstance().SPACE)
        templateNameStringBuffer:append(RootTransformInfoData.NAME)
        local templateNameKey = TransformInfoObjectConfigData.getInstance().VARKEY + TransformInfoData.getInstance().OWNER
        if ((string.find(objectConfigDocumentString, templateNameKey, 1, true) or 0) - 1) ~= -1 then
            local templateInterface = TransformTemplateFactory.getInstance():getInstance(self.abeClientInformation, tostring(templateNameStringBuffer), transformInfoHttpStoreInterface:getPropertiesHashMap(), transformInfoHttpStoreInterface:getPageContext())
            local selectedTemplate = templateInterface:getName()
            hashMap:put(templateNameKey, selectedTemplate)
        end
        return hashMap
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function GenericStoreTransformInfoObjectConfig:generate(objectConfigDocumentString, hashMap)
        local replace = Replace.new(hashMap)
        local newObjectConfigDocument = DomDocumentHelper.create(replace:all(objectConfigDocumentString))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Final ObjectConfig: " .. XmlDocumentHelper.toString(newObjectConfigDocument), self, "generate()")
        end
        return newObjectConfigDocument
end

return GenericStoreTransformInfoObjectConfig

