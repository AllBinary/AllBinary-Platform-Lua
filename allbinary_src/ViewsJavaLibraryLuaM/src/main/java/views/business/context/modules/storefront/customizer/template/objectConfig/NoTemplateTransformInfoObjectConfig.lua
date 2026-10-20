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

-- local HashMap = require("java.util.HashMap")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local Replace = require("org.allbinary.logic.string.regex.replace.Replace")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfig = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfig")
local TransformInfoObjectConfigData = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData")
local TransformTemplateCustomizerUtil = require("org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil")
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

local NoTemplateTransformInfoObjectConfig = {}
NoTemplateTransformInfoObjectConfig.__index = NoTemplateTransformInfoObjectConfig
NoTemplateTransformInfoObjectConfig.className = "NoTemplateTransformInfoObjectConfig"
setmetatable(NoTemplateTransformInfoObjectConfig, {__index = TransformInfoObjectConfig})

function NoTemplateTransformInfoObjectConfig:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function NoTemplateTransformInfoObjectConfig.new(...)
    local count = select("#", ...)
    if count == 1 then return NoTemplateTransformInfoObjectConfig._new1(...)
    elseif count == 2 then return NoTemplateTransformInfoObjectConfig._new2(...)
    elseif count == 3 then return NoTemplateTransformInfoObjectConfig._new3(...)
    end
end


function NoTemplateTransformInfoObjectConfig._new1(transformInfoInterface)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface), NoTemplateTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function NoTemplateTransformInfoObjectConfig._new2(transformInfoInterface, document)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface, document), NoTemplateTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


function NoTemplateTransformInfoObjectConfig._new3(transformInfoInterface, name, type)
    local self = setmetatable(TransformInfoObjectConfig.new(transformInfoInterface, name, type), NoTemplateTransformInfoObjectConfig)
    self:_init_fields()
        -- super(...) made self above
        self:setDocument(self:generate(self:toXmlDoc()))
    return self
end


-- throws Exception
function NoTemplateTransformInfoObjectConfig:generate(objectConfigDocument)
        local docString = XmlDocumentHelper.toString(objectConfigDocument)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Initial ObjectConfig: " .. docString, self, "generate()")
        end
        local storeName = self:getTransformInfoInterface():getStoreName()
        local viewName = self:getTransformInfoInterface():getName()
        local hashMap = StdUtil.getInstance():createHashMap()
        local VARKEY = TransformInfoObjectConfigData.getInstance().VARKEY
        hashMap:put(VARKEY .. tostring(StoreFrontData.getInstance().NAME), storeName)
        hashMap:put(VARKEY .. tostring(TransformInfoData.getInstance().OWNER), viewName)
        local pageName = TransformTemplateCustomizerUtil.getInstance():getPageNameHack(self:getTransformInfoInterface():getName(), self:getTransformInfoInterface():getStoreName())
        hashMap:put(VARKEY .. tostring(TransformInfoData.getInstance().PARTIAL), pageName)
        local replace = Replace.new(hashMap)
        local newObjectConfigDocument = DomDocumentHelper.create(replace:all(docString))
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("Final ObjectConfig: " .. XmlDocumentHelper.toString(newObjectConfigDocument), self, "generate()")
        end
        return newObjectConfigDocument
end

return NoTemplateTransformInfoObjectConfig

