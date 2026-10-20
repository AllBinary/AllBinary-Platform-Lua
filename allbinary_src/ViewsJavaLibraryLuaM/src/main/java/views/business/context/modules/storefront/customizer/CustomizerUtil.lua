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
-- package views.business.context.modules.storefront.customizer

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local TransformInfoEntity = require("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local TransformInfo = require("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = require("org.w3c.dom.Document")

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

local CustomizerUtil = {}
CustomizerUtil.__index = CustomizerUtil
CustomizerUtil.className = "CustomizerUtil"

function CustomizerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CustomizerUtil.getInstance()
        return CustomizerUtil.instance
end


function CustomizerUtil.new()
    local self = setmetatable({}, CustomizerUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function CustomizerUtil:getTransformInfoInterfaceToCustomize(customizerTransformInfoInterface, transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. customizerTransformInfoInterface:getName(), self, "getTransformInfoInterfaceToCustomize()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local viewName = transformInfoInterface:getName()
        local httpTransformInfoInterface = customizerTransformInfoInterface
        local customizedTransformInfoInterface = transformInfoEntityInterface:get(viewName, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        return customizedTransformInfoInterface
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigComponentNodesToCustomize(customizerTransformInfoInterface, transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. customizerTransformInfoInterface:getName(), self, "getTransformInfoObjectConfigComponentNodesToCustomize()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local viewName = transformInfoInterface:getName()
        local httpTransformInfoInterface = customizerTransformInfoInterface
        local customizedTransformInfoInterface = transformInfoEntityInterface:get(viewName, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        return self:getTransformInfoObjectConfigComponentNodes(customizedTransformInfoInterface)
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigComponentNodes(transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "getTransformInfoObjectConfigComponentNodes()")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        return transformInfoObjectConfigInterface:getTransforms()
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "getTransformInfoObjectConfigComponentNodes()")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        return transformInfoObjectConfigInterface:getGroupTransforms()
end


-- throws Exception
function CustomizerUtil:insert(transformInfoInterface, domNodeInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "insert()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local allViewsToBeModified = self:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        local document = DomDocumentHelper.create()
        document:appendChild(domNodeInterface:toXmlNode(document))
        local documentString = XmlDocumentHelper.toString(document)
        local stringBuffer = StringMaker.new()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            stringBuffer:append("Total Views For Modification: ")
            stringBuffer:appendint(allViewsToBeModified:size())
            stringBuffer:append(" New Xml/Data: ")
            stringBuffer:append(documentString)
            self.logUtil:putF(tostring(stringBuffer), self, "insert()")
        end
        transformInfoInterface:setData(documentString)
        local size = allViewsToBeModified:size()
        for index = 0, size - 1 do
            local transformInfo = allViewsToBeModified:get(index)
            local viewNameOfViewToBeModified = transformInfo:getName()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(transformInfoInterface:getName())
                stringBuffer:append(" is modifying view: ")
                stringBuffer:append(viewNameOfViewToBeModified)
                self.logUtil:putF(tostring(stringBuffer), self, "insert()")
            end
            local httpTransformInfoInterface = transformInfoInterface
            local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
            if specifiedTransformInfoInterface == nil then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(transformInfoInterface:getName())
                    stringBuffer:append(" is unable to add data to view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    stringBuffer:append(" since it does not exist")
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    self.logUtil:putF(transformInfoInterface:getName() .. " is adding data to view: " .. viewNameOfViewToBeModified, self, "insert()")
                end
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(viewNameOfViewToBeModified)
                    stringBuffer:append(" is changing data in ")
                    stringBuffer:append(tostring(specifiedTransformInfoInterface:getDataFilePath()))
                    stringBuffer:append(" to the following data:\n")
                    stringBuffer:append(documentString)
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
                self:write(specifiedTransformInfoInterface, documentString)
            end
        end
end


-- throws Exception
function CustomizerUtil:write(specifiedTransformInfoInterface, documentString)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. specifiedTransformInfoInterface:getName(), self, "write()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        specifiedTransformInfoInterface:setData(documentString)
        transformInfoEntityInterface:update(specifiedTransformInfoInterface:toHashMap())
end


-- throws Exception
function CustomizerUtil:getViewDataForComponentsInObjectConfig(transformInfoInterface)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("View Name: " .. transformInfoInterface:getName(), self, "getViewDataForComponentsInObjectConfig()")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        local allViewsToBeModified = transformInfoObjectConfigInterface:getGroupTransforms()
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local size = allViewsToBeModified:size()
        for index = 0, size - 1 do
            local nextTransformInfoInterface = allViewsToBeModified:get(index)
            local viewNameOfViewToBeModified = nextTransformInfoInterface:getName()
            local httpTransformInfoInterface = transformInfoInterface
            local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
            return specifiedTransformInfoInterface:getDataDocument()
        end
        error(java_exception("Exception", "No Components Specified in ObjectConfig"), 0)
end

CustomizerUtil.instance = CustomizerUtil.new()

return CustomizerUtil

