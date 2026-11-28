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

local CustomizerUtil = {}
package.loaded["views.business.context.modules.storefront.customizer.CustomizerUtil"] = CustomizerUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local TransformInfoEntity = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntity")
local TransformInfoEntityBuilder = java_lazy("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local TransformInfo = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfo")
local TransformInfoHttpInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoObjectConfigInterface = java_lazy("org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface")
local Document = java_lazy("org.w3c.dom.Document")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table CustomizerUtil is declared before the requires
CustomizerUtil.__index = CustomizerUtil
CustomizerUtil.className = "CustomizerUtil"
CustomizerUtil.javaClassName = "views.business.context.modules.storefront.customizer.CustomizerUtil"

function CustomizerUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function CustomizerUtil.getInstance()
        return CustomizerUtil.instance_f
end


function CustomizerUtil._jinit(self)
    CustomizerUtil._init_fields(self)
    return self
end

function CustomizerUtil.new(...)
    local self = setmetatable({}, CustomizerUtil)
    CustomizerUtil._jinit(self, ...)
    return self
end


-- throws Exception
function CustomizerUtil:getTransformInfoInterfaceToCustomize(customizerTransformInfoInterface, transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(customizerTransformInfoInterface:getName()), self, "getTransformInfoInterfaceToCustomize()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local viewName = transformInfoInterface:getName()
        local httpTransformInfoInterface = customizerTransformInfoInterface
        local customizedTransformInfoInterface = transformInfoEntityInterface:get(viewName, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        return customizedTransformInfoInterface
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigComponentNodesToCustomize(customizerTransformInfoInterface, transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(customizerTransformInfoInterface:getName()), self, "getTransformInfoObjectConfigComponentNodesToCustomize()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local viewName = transformInfoInterface:getName()
        local httpTransformInfoInterface = customizerTransformInfoInterface
        local customizedTransformInfoInterface = transformInfoEntityInterface:get(viewName, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
        return self:getTransformInfoObjectConfigComponentNodes(customizedTransformInfoInterface)
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigComponentNodes(transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "getTransformInfoObjectConfigComponentNodes()")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        return transformInfoObjectConfigInterface:getTransforms()
end


-- throws Exception
function CustomizerUtil:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "getTransformInfoObjectConfigComponentNodes()")
        end
        local transformInfoObjectConfigInterface = transformInfoInterface:getObjectConfigInterface()
        return transformInfoObjectConfigInterface:getGroupTransforms()
end


-- throws Exception
function CustomizerUtil:insert(transformInfoInterface, domNodeInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "insert()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        local allViewsToBeModified = self:getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface)
        local document = DomDocumentHelper.create()
        document:appendChild(domNodeInterface:toXmlNode(document))
        local documentString = XmlDocumentHelper.toString(document)
        local stringBuffer = StringMaker.new()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
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
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                stringBuffer:delete(0, stringBuffer:length())
                stringBuffer:append(transformInfoInterface:getName())
                stringBuffer:append(" is modifying view: ")
                stringBuffer:append(viewNameOfViewToBeModified)
                self.logUtil:putF(tostring(stringBuffer), self, "insert()")
            end
            local httpTransformInfoInterface = transformInfoInterface
            local specifiedTransformInfoInterface = transformInfoEntityInterface:get(viewNameOfViewToBeModified, httpTransformInfoInterface:getPropertiesHashMap(), httpTransformInfoInterface:getPageContext())
            if rawequal(specifiedTransformInfoInterface, nil) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    stringBuffer:delete(0, stringBuffer:length())
                    stringBuffer:append(transformInfoInterface:getName())
                    stringBuffer:append(" is unable to add data to view: ")
                    stringBuffer:append(viewNameOfViewToBeModified)
                    stringBuffer:append(" since it does not exist")
                    self.logUtil:putF(tostring(stringBuffer), self, "insert()")
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(transformInfoInterface:getName()) .. require("allbinary_java").to_string(" is adding data to view: ")) .. require("allbinary_java").to_string(viewNameOfViewToBeModified), self, "insert()")
                end
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
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
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(specifiedTransformInfoInterface:getName()), self, "write()")
        end
        local transformInfoEntityInterface = TransformInfoEntityBuilder.getInstance()
        specifiedTransformInfoInterface:setData(documentString)
        transformInfoEntityInterface:update(specifiedTransformInfoInterface:toHashMap())
end


-- throws Exception
function CustomizerUtil:getViewDataForComponentsInObjectConfig(transformInfoInterface)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("View Name: ") .. require("allbinary_java").to_string(transformInfoInterface:getName()), self, "getViewDataForComponentsInObjectConfig()")
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
        error(require("java.lang.Exception").new("No Components Specified in ObjectConfig"), 0)
end

CustomizerUtil.instance_f = CustomizerUtil.new()

return CustomizerUtil

