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
-- package org.allbinary.logic.communication.http.request

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local DomData = require("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = require("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = require("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")

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

local function java_instanceof(object, class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

--containing string values and other hashmaps of the like
local NameSpaceRequestParams = {}
NameSpaceRequestParams.__index = NameSpaceRequestParams
NameSpaceRequestParams.className = "NameSpaceRequestParams"
setmetatable(NameSpaceRequestParams, {__index = RequestParams})

function NameSpaceRequestParams:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function NameSpaceRequestParams.new(...)
    local count = select("#", ...)
    if count == 0 then return NameSpaceRequestParams._new0(...)
    elseif count == 1 then return NameSpaceRequestParams._new1(...)
    elseif count == 1 then return NameSpaceRequestParams._new1(...)
    end
end


function NameSpaceRequestParams._new0()
    local self = setmetatable(RequestParams.new(), NameSpaceRequestParams)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("Constructing empty", self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function NameSpaceRequestParams._new1(httpServletRequest)
    local self = setmetatable(RequestParams.new(httpServletRequest), NameSpaceRequestParams)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("Constructing from HttpServletRequest", self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function NameSpaceRequestParams._new1(pageContext)
    local self = setmetatable(RequestParams.new(pageContext), NameSpaceRequestParams)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("Constructing from PageContext", self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function NameSpaceRequestParams:createPackageNode(document, packageName, packagePropertiesHashMap)
        local node = document:createElement(packageName)
        local propertyKeySet = packagePropertiesHashMap:keySet()
        local propertyKeySetArray = propertyKeySet:toArray()
        local size = (propertyKeySetArray.n or #propertyKeySetArray)
        for index = 0, size - 1 do
            local propertyName = propertyKeySetArray[index + 1]
            local propertyValue = packagePropertiesHashMap:get(propertyName)
            local propertyNode = ModDomHelper.createTextNode(document, propertyName, propertyValue)
            node:appendChild(propertyNode)
        end
        return node
end


-- throws Exception
function NameSpaceRequestParams:createPackageMultiNode(document, nameSpaceRequestParam, packageName, packagePropertiesHashMap)
        local beginIndex = ((string.find(packageName, "[", 1, true) or 0) - 1)
        local indexValue = string.sub(packageName, (beginIndex + 1) + 1, #packageName - 1)
        local multiElementPackage = string.sub(packageName, (0) + 1, beginIndex)
        local selectedValue = nameSpaceRequestParam:getValue()
        local propertyValue = packagePropertiesHashMap:get(DomData.VALUE)
        if ((propertyValue < NameSpaceRequestParamData.VALUE and -1) or (propertyValue > NameSpaceRequestParamData.VALUE and 1) or 0) ~= 0 then
            selectedValue = propertyValue
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("\nAppending Multinode Element: " .. multiElementPackage .. "[" .. indexValue .. "] " .. selectedValue, self, "createPackageMultiNode")
        end
        local nextNode = ModDomHelper.createNameValueNodes(document, multiElementPackage, selectedValue)
        local indexNode = ModDomHelper.createTextNode(document, DomData.INDEX, indexValue)
        nextNode:appendChild(indexNode)
        return nextNode
end


-- throws Exception
function NameSpaceRequestParams:getRootNode(rootElementPackage, packagePropertiesHashMap, document)
        local rootNode = DomSearchHelper.getNodeNoThrow(rootElementPackage, document:getChildNodes())
        if rootNode == nil then
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nAppending Document Root: " .. "\nElementName: " .. rootElementPackage .. "\nProperties: " .. tostring(packagePropertiesHashMap), self, "getRootNode")
            end
            local node = self:createPackageNode(document, rootElementPackage, packagePropertiesHashMap)
            document:appendChild(node)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nAppended Document Created: " .. XmlDocumentHelper.toString(document), self, "getRootNode")
            end
            return node
        else
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nUsing Existing Root Node", self, "getRootNode")
            end
            return rootNode
        end
end


-- throws Exception
function NameSpaceRequestParams:addNewProperties(document, node, nextPackagePropertiesHashMap)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF(tostring(StringMaker.new():append("\nAdding Any New Properties: "):append(tostring(nextPackagePropertiesHashMap)):append("\nto node: "):append(node:getNodeName())), self, "addNewProperties")
        end
        local propertyNameSet = nextPackagePropertiesHashMap:keySet()
        local propertyNameSetArray = propertyNameSet:toArray()
        local size = (propertyNameSetArray.n or #propertyNameSetArray)
        for index = 0, size - 1 do
            local nextPropertyName = propertyNameSetArray[index + 1]
            local propertyValue = StringUtil.getInstance():getNonNull(nextPackagePropertiesHashMap:get(nextPropertyName))
            local valueNode = DomSearchHelper.getNodeNoThrow(nextPropertyName, node:getChildNodes())
            if valueNode ~= nil then
                local existingElementNodeTextNodeValue = DomNodeHelper.getTextNodeValue(valueNode)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("\nIf property: \"" .. nextPropertyName .. " is the same as:\n" .. "Node: " .. tostring(node:getNodeName()) .. " then: " .. propertyValue .. "==" .. existingElementNodeTextNodeValue, self, "addNewProperties")
                end
                if ((propertyValue < existingElementNodeTextNodeValue and -1) or (propertyValue > existingElementNodeTextNodeValue and 1) or 0) ~= 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                        self.logUtil:putF("At least one Property from NameSpaceRequest Package was different from Node", self, "addNewProperties")
                    end
                    error(java_exception("Exception", "Property Modifications Should Not Occur"), 0)
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Adding a new Property: " .. nextPropertyName .. "=" .. propertyValue, self, "addNewProperties")
                end
                local newPropertyNode = ModDomHelper.createTextNode(document, nextPropertyName, propertyValue)
                node:appendChild(newPropertyNode)
            end
        end
        return node
end


-- throws Exception
function NameSpaceRequestParams:isElementValueTextNodeEqual(nextPackagePropertiesHashMap, node)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("\nComparing the value property in: " .. tostring(nextPackagePropertiesHashMap) .. "\nto node child leaves of node: " .. tostring(node:getNodeName()), self, "isElementValueTextNodeEqual")
        end
        local propertyValue = nextPackagePropertiesHashMap:get(DomData.VALUE)
        local valueNode = DomSearchHelper.getNodeNoThrow(DomData.VALUE, node:getChildNodes())
        if valueNode ~= nil then
            local existingElementNodeTextNodeValue = DomNodeHelper.getTextNodeValue(valueNode)
            if ((propertyValue < existingElementNodeTextNodeValue and -1) or (propertyValue > existingElementNodeTextNodeValue and 1) or 0) == 0 then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Value Node is the same", self, "isElementValueTextNodeEqual")
                end
                return true
            end
        else
            return true
        end
        return false
end


-- throws Exception
function NameSpaceRequestParams:isElementValueTextNodeUnique(nextPackagePropertiesHashMap, elementNodeVector)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("\nComparing Properties of: " .. tostring(elementNodeVector:size()) .. " Nodes", self, "isElementValueTextNodeUnique")
        end
        local size = elementNodeVector:size()
        for index = 0, size - 1 do
            local existingElementNode = elementNodeVector:get(index)
            if self:isElementValueTextNodeEqual(nextPackagePropertiesHashMap, existingElementNode) then
                return index
            end
        end
        return -1
end


-- throws Exception
function NameSpaceRequestParams:addChildren(document, rootNode, nameSpaceRequestParam)
        local node = rootNode
        local packageVector = nameSpaceRequestParam:getPackages()
        local size = packageVector:size()
        for index = 1, size - 1 do
            local nextPackageName = packageVector:get(index)
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF(tostring(StringMaker.new():append("\nTrying to Add Child to Node: "):append(node:getNodeName()):append("\nwith new PackageName: "):append(nextPackageName)), self, "addChildren")
            end
            local nextPackagePropertiesHashMap = nameSpaceRequestParam:getPackageProperties(index)
            local elementNodeVector = DomSearchHelper.getAllNodesNoThrow(nextPackageName, node:getChildNodes())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nDocument Contains " .. tostring(elementNodeVector:size()) .. " Node(s) With Same Name", self, "addChildren")
            end
            local isElementValueTextNodeUniqueIndex = self:isElementValueTextNodeUnique(nextPackagePropertiesHashMap, elementNodeVector)
            if (elementNodeVector:size() == 0 or isElementValueTextNodeUniqueIndex == -1) and not (CommonSeps.getInstance().BRACKET_CLOSE == "" or string.sub(nextPackageName, -#CommonSeps.getInstance().BRACKET_CLOSE) == CommonSeps.getInstance().BRACKET_CLOSE) then
                local nextNode = self:createPackageNode(document, nextPackageName, nextPackagePropertiesHashMap)
                node:appendChild(nextNode)
                node = nextNode
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("\nAppended Package: " .. tostring(node:getNodeName()), self, "addChildren")
                    self.logUtil:putF("\nAppended Document Created: " .. XmlDocumentHelper.toString(document), self, "addChildren")
                end
            elseif (CommonSeps.getInstance().BRACKET_CLOSE == "" or string.sub(nextPackageName, -#CommonSeps.getInstance().BRACKET_CLOSE) == CommonSeps.getInstance().BRACKET_CLOSE) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Package is MultiNode: just append", self, "addChildren")
                end
                local nextNode = self:createPackageMultiNode(document, nameSpaceRequestParam, nextPackageName, nextPackagePropertiesHashMap)
                node:appendChild(nextNode)
                node = nextNode
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("\nAppended Multinode Element: " .. XmlDocumentHelper.toString(document), self, "addChildren")
                end
            else
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Value Node already exists: Now compare (properties to leaf nodes)", self, "addChildren")
                end
                local nodeNameDuplicateNode = elementNodeVector:get(isElementValueTextNodeUniqueIndex)
                node = self:addNewProperties(document, nodeNameDuplicateNode, nextPackagePropertiesHashMap)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    self.logUtil:putF("\nDuplicate Node Found: Moving to next child ^", self, "addChildre")
                end
            end
        end
        return document
end


-- throws Exception
function NameSpaceRequestParams:addNameSpace(key, value, document)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF(tostring(StringMaker.new():append("NameSpace key: "):append(key):append(" Value: "):append(value)), self, "addNameSpace")
        end
        local nameSpaceRequestParam = NameSpaceRequestParam.new(key, value)
        local packageVector = nameSpaceRequestParam:getPackages()
        local size = packageVector:size()
        for index = 0, size - 1 do
            local packageName = packageVector:get(index)
            local packagePropertiesHashMap = nameSpaceRequestParam:getPackageProperties(packageVector:indexOf(packageName))
            local rootNode = self:getRootNode(packageName, packagePropertiesHashMap, document)
            if index < size - 1 then
                return self:addChildren(document, rootNode, nameSpaceRequestParam)
            end
        end
        return document
end


-- throws Exception
function NameSpaceRequestParams:toHashMap()
        local document = DomDocumentHelper.create()
        local hashMap = StdUtil.getInstance():createHashMap()
        local keys = self:getMap():keySet()
        local keyArray = keys:toArray()
        local keySize = (keyArray.n or #keyArray)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("NameSpace Request Size: " .. tostring(keys:size()), self, "toHashMap")
        end
        for i = 0, keySize - 1 do
            local key = keyArray[i + 1]
            local anyType = self:getMap():get(key)
            local className = getmetatable(anyType).className
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                self.logUtil:putF("Request Param Class: " .. className, self, "toHashMap")
            end
            if java_instanceof(self:getMap():get(key), String) then
                local value = self:getMap():get(key)
                if ((string.find(key, NameSpaceRequestParamData.NAME, 1, true) or 0) - 1) < 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                        self.logUtil:putF("Not NameSpace key: " .. key .. " Value: " .. value, self, "toHashMap()")
                    end
                    hashMap:put(tostring(key), tostring(value))
                else
                    document = self:addNameSpace(tostring(key), tostring(value), document)
                end
            elseif java_instanceof(self:getMap():get(key), table) then
                local values = self:getMap():get(key)
                if ((string.find(key, NameSpaceRequestParamData.NAME, 1, true) or 0) - 1) < 0 then
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                        self.logUtil:putF("Not NameSpace key: " .. key .. " Value: " .. tostring(values[1]), self, "toHashMap()")
                    end
                    hashMap:put(tostring(key), tostring(values[1]))
                else
                    document = self:addNameSpace(tostring(key), tostring(values[1]), document)
                end
            end
        end
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
            self.logUtil:putF("NameSpaceRequestParams: " .. tostring(self:getMap()) .. "\ntoHashMap(): " .. tostring(hashMap) .. "\nDocument Created: " .. XmlDocumentHelper.toString(document), self, "toHashMap()")
        end
        hashMap:put(NameSpaceRequestParamData.DOCUMENT, document)
        return hashMap
end

return NameSpaceRequestParams

