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
-- package views.business.context.modules.storefront.customizer.generic.page

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local TransformInfoEntity = require("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local PageValidation = require("org.allbinary.logic.visual.transform.template.customizer.page.PageValidation")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local CustomizerUtil = require("views.business.context.modules.storefront.customizer.CustomizerUtil")
local PageView = require("views.business.context.modules.storefront.customizer.generic.page.PageView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PageValidationView = {}
PageValidationView.__index = PageValidationView
PageValidationView.className = "PageValidationView"
setmetatable(PageValidationView, {__index = PageView})

function PageValidationView:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function PageValidationView.new(transformInfoInterface)
    local self = setmetatable(PageView.new(transformInfoInterface), PageValidationView)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "PageViewValidation()")
        end
    return self
end


function PageValidationView:isValid()
        local try_ok, try_error = pcall(function()
            local isValid = true
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.IS_VALID)
            end
            local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
            local pageObjectConfigInterface = self:getTransformInfoInterface():getObjectConfigInterface()
            local allViewsToBeModifiedVector = pageObjectConfigInterface:getGroupTransforms()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                self.logUtil:putF("Views To Be Modified: " .. tostring(allViewsToBeModifiedVector:size()), self, "get(transformInfoInterface)")
            end
            local size = allViewsToBeModifiedVector:size()
            for index = 0, size - 1 do
                local transformInfoInterface = allViewsToBeModifiedVector:get(index)
                local viewNameOfViewToBeModified = transformInfoInterface:getName()
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self:getTransformInfoInterface():getName())
                    stringBuffer:append(" is modifying view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
                local httpTransformInfoInterface = self:getTransformInfoInterface()
                local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(self:getTransformInfoInterface():getName())
                    stringBuffer:append(" is adding data to view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
                local hashMap = StdUtil.getInstance():createHashMap()
                local title = specifiedTransformInfoInterface:getName():substring(self:getTransformInfoInterface():getStoreName():length())
                if ((title < "index" and -1) or (title > "index" and 1) or 0) == 0 then
                    hashMap:put(TitleData.getInstance().TEXT, tostring(self:getTransformInfoInterface():getStoreName()) .. " - Home Page")
                else
                    hashMap:put(TitleData.getInstance().TEXT, tostring(self:getTransformInfoInterface():getStoreName()) .. " -" .. title)
                end
                local pageValidation = PageValidation.new(hashMap)
                if pageValidation:isValid() == false then
                    isValid = false
                end
                if isValid == true then
                    local document = DomDocumentHelper.create()
                    document:appendChild(pageValidation:toXmlNode(document))
                    local documentString = XmlDocumentHelper.toString(document)
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                        local stringBuffer = StringMaker.new()
                        stringBuffer:append(viewNameOfViewToBeModified)
                        stringBuffer:append(" is changing data in ")
                        stringBuffer:append(tostring(specifiedTransformInfoInterface:getDataFilePath()))
                        stringBuffer:append(" to the following data:\n")
                        stringBuffer:append(documentString)
                        self.logUtil:putF(tostring(stringBuffer), self, self.commonStrings.IS_VALID)
                    end
                    CustomizerUtil.getInstance():write(specifiedTransformInfoInterface, documentString)
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


function PageValidationView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
            local objectConfig = self:getTransformInfoInterface():getObjectConfigInterface()
            local httpTransformInfoInterface = self:getTransformInfoInterface()
            local allViewsToBeModifiedVector = objectConfig:getGroupTransforms()
            local size = allViewsToBeModifiedVector:size()
            for index = 0, size - 1 do
                local transformInfoInterface = allViewsToBeModifiedVector:get(index)
                local viewNameOfViewToBeModified = transformInfoInterface:getName()
                local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
                local hashMap = StdUtil.getInstance():createHashMap()
                local title = specifiedTransformInfoInterface:getName():substring(self:getTransformInfoInterface():getStoreName():length())
                if ((title < "index" and -1) or (title > "index" and 1) or 0) == 0 then
                    hashMap:put(TitleData.getInstance().TEXT, tostring(self:getTransformInfoInterface():getStoreName()) .. " - Home Page")
                else
                    hashMap:put(TitleData.getInstance().TEXT, tostring(self:getTransformInfoInterface():getStoreName()) .. " -" .. title)
                end
                local pageValidation = PageValidation.new(hashMap)
                if pageValidation:isValid() == false then
                    stringBuffer:append("TransformInfo Name for PageValidation:" .. specifiedTransformInfoInterface:getName())
                    stringBuffer:append("PageValidation:" .. tostring(hashMap))
                    stringBuffer:append("PageValidation Info:" .. tostring(pageValidation:validationInfo()))
                end
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "An auto generated page name was invalid."
        end
end


function PageValidationView:toValidationInfoDoc()
        return nil
end


function PageValidationView:toValidationInfoNode(document)
        return nil
end

return PageValidationView

