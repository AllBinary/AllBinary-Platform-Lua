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
-- package views.business.context

local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local GeneratorTransformInfoData = require("org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData")
local RootTransformInfoData = require("org.allbinary.logic.visual.transform.info.RootTransformInfoData")
local TransformInfoHttp = require("org.allbinary.logic.visual.transform.info.TransformInfoHttp")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigAndManipulatorFactory = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local TransformTemplateInterface = require("org.allbinary.logic.visual.transform.template.TransformTemplateInterface")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OverrideObjectConfigRootContextView = {}
OverrideObjectConfigRootContextView.__index = OverrideObjectConfigRootContextView
OverrideObjectConfigRootContextView.className = "OverrideObjectConfigRootContextView"
setmetatable(OverrideObjectConfigRootContextView, {__index = HttpStoreComponentView})

function OverrideObjectConfigRootContextView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OverrideObjectConfigRootContextView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), OverrideObjectConfigRootContextView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "OverrideObjectRootContextView()")
        end
    return self
end


-- throws Exception
function OverrideObjectConfigRootContextView:view()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("View Name: " .. self:getTransformInfoInterface():getName(), self, "view()")
            end
            local rootTransformInfoInterface = TransformInfoHttp.new(self:getTransformInfoInterface())
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self:getTransformInfoInterface():getStoreName())
            stringBuffer:append(CommonSeps.getInstance().SPACE)
            local nameStart = tostring(stringBuffer)
            if self:getTransformInfoInterface():getName():indexOf(GeneratorTransformInfoData.NAME) > 0 then
                rootTransformInfoInterface:setName(nameStart .. tostring(GeneratorTransformInfoData.NAME))
            elseif self:getTransformInfoInterface():getName():indexOf(RootTransformInfoData.NAME) > 0 then
                rootTransformInfoInterface:setName(nameStart .. tostring(RootTransformInfoData.NAME))
            else
                error(java_exception("Exception", "Override Currently Not Supported"), 0)
            end
            local overrideObjectConfigDocument = self:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Retrieved OverrideObjectConfig: " .. XmlDocumentHelper.toString(overrideObjectConfigDocument), self, "view()")
            end
            local transformFactory = TransformFactory.getInstance()
            local rootComponentInterface = transformFactory:getInstance(self.abeClientInformation, rootTransformInfoInterface:getName(), rootTransformInfoInterface)
            local transformTemplateInterface = rootComponentInterface
            local componentInterface = transformFactory:getInstance(self.abeClientInformation, transformTemplateInterface:getName(), rootComponentInterface:getTransformInfoInterface())
            local transformInfoObjectConfigInterface = TransformInfoObjectConfigAndManipulatorFactory.getInstance():getInstance(self.abeClientInformation, componentInterface:getTransformInfoInterface(), overrideObjectConfigDocument)
            componentInterface:getTransformInfoInterface():setObjectConfigInterface(transformInfoObjectConfigInterface)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Set OverrideObjectConfig: " .. tostring(componentInterface:getTransformInfoInterface():getObjectConfigInterface()), self, "view()")
            end
            return componentInterface:view()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return OverrideObjectConfigRootContextView

