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
-- package views.compound.objectConfig

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local InputStream = require("java.io.InputStream")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local DocumentToNode = require("org.allbinary.data.tree.dom.document.DocumentToNode")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local RootTransformInfoData = require("org.allbinary.logic.visual.transform.info.RootTransformInfoData")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoDomNode = require("org.allbinary.logic.visual.transform.info.TransformInfoDomNode")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local GenericStoreTransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CompoundContextTransformInfoObjectConfig = {}
CompoundContextTransformInfoObjectConfig.__index = CompoundContextTransformInfoObjectConfig
CompoundContextTransformInfoObjectConfig.className = "CompoundContextTransformInfoObjectConfig"
setmetatable(CompoundContextTransformInfoObjectConfig, {__index = GenericStoreTransformInfoObjectConfig})

function CompoundContextTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function CompoundContextTransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 2 then return CompoundContextTransformInfoObjectConfig._new2(...)
    elseif count == 3 then return CompoundContextTransformInfoObjectConfig._new3(...)
    elseif count == 4 then return CompoundContextTransformInfoObjectConfig._new4(...)
    end
end


function CompoundContextTransformInfoObjectConfig._new2(abeClientInformation, transformInfoInterface)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface), CompoundContextTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function CompoundContextTransformInfoObjectConfig._new3(abeClientInformation, transformInfoInterface, document)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, document), CompoundContextTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function CompoundContextTransformInfoObjectConfig._new4(abeClientInformation, transformInfoInterface, name, type)
    local self = setmetatable(GenericStoreTransformInfoObjectConfig.new(abeClientInformation, transformInfoInterface, name, type), CompoundContextTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function CompoundContextTransformInfoObjectConfig:get()
        local storeName = self:getTransformInfoInterface():getStoreName()
        local httpTransformInfoInterface = self:getTransformInfoInterface()
        local templateNameOverride = StringUtil.getInstance():getNonNull(httpTransformInfoInterface:getPropertiesHashMap():get(TransformInfoData.getInstance().PARTIAL))
        local stringBuffer = StringMaker.new()
        stringBuffer:append(storeName)
        stringBuffer:append(templateNameOverride)
        stringBuffer:append(CommonSeps.getInstance().SPACE)
        stringBuffer:append(RootTransformInfoData.NAME)
        local rootComponentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, tostring(stringBuffer), self:getTransformInfoInterface())
        local viewVector = self:getTransformDomNodes()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Root View Called with: " .. tostring(viewVector:size()), self, "get(transformInfoInterface)")
        end
        local rootView = rootComponentInterface:view()
        local startXMLHeader = "<xsl:text disable-output-escaping=\"yes\" ><![CDATA["
        local endXMLHeader = "]]></xsl:text>"
        local size = viewVector:size()
        for index = 0, size - 1 do
            local objectConfigTransformInfoDomNode = viewVector:get(index)
            local templateKey = objectConfigTransformInfoDomNode:getReplaceKey()
            local componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, objectConfigTransformInfoDomNode:getTransformInfoInterface():getName(), self:getTransformInfoInterface())
            local replacementViewString = componentInterface:view()
            replacementViewString = DocumentToNode.convertDocumentToNodeString(replacementViewString)
            stringBuffer:delete(0, stringBuffer:length())
            stringBuffer:append(startXMLHeader)
            stringBuffer:append(replacementViewString)
            stringBuffer:append(endXMLHeader)
            local templateValue = tostring(stringBuffer)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append("Replacing: ")
                stringBuffer:append(templateKey)
                stringBuffer:append(" with ")
                stringBuffer:append(templateValue)
                self.logUtil:putF(tostring(stringBuffer), self, "get()")
            end
            local replace = Replace.new(templateKey, templateValue)
            rootView = replace:all(rootView)
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("End: Result of a compound view: " .. rootView, self, "get()")
        end
        return rootView
end


-- throws Exception
function CompoundContextTransformInfoObjectConfig:createInputStream()
        local completeTemplateViewBytes = self:get():getBytes()
        local bais = ByteArrayInputStream.new(completeTemplateViewBytes)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Template: " .. tostring(string.char(table.unpack(completeTemplateViewBytes))), self, "createInputStream()")
        end
        return bais
end

return CompoundContextTransformInfoObjectConfig

