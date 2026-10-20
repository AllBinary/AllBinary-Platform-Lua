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
-- package views.business.context.modules.storefront.customizer.template

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local TransformFactory = require("org.allbinary.logic.visual.transform.TransformFactory")
local TransformInterface = require("org.allbinary.logic.visual.transform.TransformInterface")
local GeneratorTransformInfoData = require("org.allbinary.logic.visual.transform.info.GeneratorTransformInfoData")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfosData = require("org.allbinary.logic.visual.transform.info.TransformInfosData")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")
local InsertTemplateCustomizerTransformInfoObjectConfig = require("views.business.context.modules.storefront.customizer.template.objectConfig.InsertTemplateCustomizerTransformInfoObjectConfig")
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

--Sets Template Type
local InsertCustomizerValidationView = {}
InsertCustomizerValidationView.__index = InsertCustomizerValidationView
InsertCustomizerValidationView.className = "InsertCustomizerValidationView"
setmetatable(InsertCustomizerValidationView, {__index = HttpStoreComponentView})

function InsertCustomizerValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.viewName = nil
end


function InsertCustomizerValidationView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), InsertCustomizerValidationView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, self.commonStrings.CONSTRUCTOR)
        end
        local requestHashMap = RequestParams.new(self:getPageContext()):toHashMap()
        self.viewName = requestHashMap:get(TransformInfoData.getInstance().NAME)
    return self
end


function InsertCustomizerValidationView:isValid()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Started Validation", self, self.commonStrings.IS_VALID)
            end
            local isValid = true
            if StringValidationUtil.getInstance():isEmpty(self.viewName) then
                isValid = false
            else
                local objectConfig = NoTemplateTransformInfoObjectConfig.new(self:getTransformInfoInterface(), self:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
                local componentVector = objectConfig:getGroupTransforms()
                local size = componentVector:size()
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Pointing ")
                    stringBuffer:appendint(componentVector:size())
                    stringBuffer:append(" Components")
                    self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                end
                for index = 0, size - 1 do
                    local transformInfo = componentVector:get(index)
                    local transformInfoName = transformInfo:getName()
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        self.logUtil:putF("Setting Template Component with ViewName: " .. transformInfoName, self, self.commonStrings.IS_VALID)
                    end
                    local componentInterface = TransformFactory.getInstance():getInstance(self.abeClientInformation, transformInfoName, self:getTransformInfoInterface())
                    local templateViewObjectConfig = InsertTemplateCustomizerTransformInfoObjectConfig.new(componentInterface:getTransformInfoInterface(), componentInterface:getTransformInfoInterface():getObjectConfigInterface():toXmlDoc())
                    local storeName = self:getTransformInfoInterface():getStoreName()
                    local endIndex = ((string.find(self.viewName, storeName, 1, true) or 0) - 1) + #storeName
                    local storePrepend = string.sub(self.viewName, (0) + 1, endIndex)
                    local viewNamePostfix = string.sub(self.viewName, (endIndex) + 1, #self.viewName)
                    local newViewNameStringBuffer = StringMaker.new()
                    newViewNameStringBuffer:append(storePrepend)
                    local commonSeps = CommonSeps.getInstance()
                    local transformInfosData = TransformInfosData.getInstance()
                    if ((string.find(transformInfoName, transformInfosData.SMALL_PREVIEW, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(transformInfosData.SMALL_PREVIEW)
                    elseif ((string.find(transformInfoName, transformInfosData.PREVIEW, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(transformInfosData.PREVIEW)
                    end
                    newViewNameStringBuffer:append(commonSeps.SPACE)
                    newViewNameStringBuffer:append(viewNamePostfix)
                    if ((string.find(transformInfoName, GeneratorTransformInfoData.NAME, 1, true) or 0) - 1) >= 0 then
                        newViewNameStringBuffer:append(commonSeps.SPACE)
                        newViewNameStringBuffer:append(GeneratorTransformInfoData.NAME)
                    end
                    local newViewName = tostring(newViewNameStringBuffer)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Template Component: ")
                        stringBuffer:append(transformInfoName)
                        stringBuffer:append("\n Now Pointing To View Name: ")
                        stringBuffer:append(newViewName)
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    templateViewObjectConfig:set(newViewName)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append("Template Component: ")
                        stringBuffer:append(transformInfoName)
                        stringBuffer:append("\n with ObjectConfig: ")
                        stringBuffer:append(tostring(templateViewObjectConfig))
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    componentInterface:getTransformInfoInterface():setObjectConfigInterface(templateViewObjectConfig)
                    local updatedTransformInfoHashMap = componentInterface:getTransformInfoInterface():toHashMap()
                    TransformInfoEntityBuilder.getInstance():update(updatedTransformInfoHashMap)
                end
            end
            return isValid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function InsertCustomizerValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Error: Template Name Is Empty.")
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function InsertCustomizerValidationView:toValidationInfoDoc()
        return nil
end


function InsertCustomizerValidationView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function InsertCustomizerValidationView:view()
        return self.views.ValidationOnlyTempUtil:getInstance():view(self)
end

return InsertCustomizerValidationView

