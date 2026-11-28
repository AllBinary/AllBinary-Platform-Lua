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

local NameSpaceRequestParams = {}
package.loaded["org.allbinary.logic.communication.http.request.NameSpaceRequestParams"] = NameSpaceRequestParams

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

local HashMap = java_lazy("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local NameSpaceRequestParam = java_lazy("org.allbinary.logic.communication.http.request.NameSpaceRequestParam")
local NameSpaceRequestParamData = java_lazy("org.allbinary.logic.communication.http.request.NameSpaceRequestParamData")

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
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

--containing string values and other hashmaps of the like
-- class table NameSpaceRequestParams is declared before the requires
NameSpaceRequestParams.__index = NameSpaceRequestParams
NameSpaceRequestParams.className = "NameSpaceRequestParams"
NameSpaceRequestParams.javaClassName = "org.allbinary.logic.communication.http.request.NameSpaceRequestParams"
setmetatable(NameSpaceRequestParams, {__index = RequestParams})

function NameSpaceRequestParams:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function NameSpaceRequestParams._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return NameSpaceRequestParams._new0(self, ...)
    elseif count == 1 then return NameSpaceRequestParams._new1(self, ...)
    end
    error("No constructor of NameSpaceRequestParams takes " .. count .. " arguments")
end

function NameSpaceRequestParams.new(...)
    local self = setmetatable({}, NameSpaceRequestParams)
    NameSpaceRequestParams._jinit(self, ...)
    return self
end

function NameSpaceRequestParams._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) then return NameSpaceRequestParams._new1_1(self, ...) end
    return NameSpaceRequestParams._new1_2(self, ...)
end


function NameSpaceRequestParams._new0(self)
    java_super_init(RequestParams, self)
    NameSpaceRequestParams._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("Constructing empty", self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function NameSpaceRequestParams._new1_1(self, httpServletRequest)
    java_super_init(RequestParams, self, httpServletRequest)
    NameSpaceRequestParams._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF("Constructing from HttpServletRequest", self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function NameSpaceRequestParams._new1_2(self, pageContext)
    java_super_init(RequestParams, self, pageContext)
    NameSpaceRequestParams._init_fields(self)
        -- super(...) made self above
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
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
java_overload(NameSpaceRequestParams, "createPackageNode", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "HashMap")) end)


-- throws Exception
function NameSpaceRequestParams:createPackageMultiNode(document, nameSpaceRequestParam, packageName, packagePropertiesHashMap)
        local beginIndex = ((string.find(packageName, "[", 1, true) or 0) - 1)
        local indexValue = string.sub(packageName, (beginIndex + 1) + 1, #packageName - 1)
        local multiElementPackage = string.sub(packageName, (0) + 1, beginIndex)
        local selectedValue = nameSpaceRequestParam:getValue()
        local propertyValue = packagePropertiesHashMap:get(DomData.VALUE)
        if not rawequal(((propertyValue < NameSpaceRequestParamData.VALUE and -1) or (propertyValue > NameSpaceRequestParamData.VALUE and 1) or 0), 0) then
            selectedValue = propertyValue
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("\nAppending Multinode Element: ") .. require("allbinary_java").to_string(multiElementPackage)) .. require("allbinary_java").to_string("[")) .. require("allbinary_java").to_string(indexValue)) .. require("allbinary_java").to_string("] ")) .. require("allbinary_java").to_string(selectedValue), self, "createPackageMultiNode")
        end
        local nextNode = ModDomHelper.createNameValueNodes(document, multiElementPackage, selectedValue)
        local indexNode = ModDomHelper.createTextNode(document, DomData.INDEX, indexValue)
        nextNode:appendChild(indexNode)
        return nextNode
end
java_overload(NameSpaceRequestParams, "createPackageMultiNode", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or java_is(java_a2, "NameSpaceRequestParam")) and (java_a3 == nil or type(java_a3) == "string") and (java_a4 == nil or java_is(java_a4, "HashMap")) end)


-- throws Exception
function NameSpaceRequestParams:getRootNode(rootElementPackage, packagePropertiesHashMap, document)
        local rootNode = DomSearchHelper.getNodeNoThrow(rootElementPackage, document:getChildNodes())
        if rawequal(rootNode, nil) then
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("\nAppending Document Root: ") .. require("allbinary_java").to_string("\nElementName: ")) .. require("allbinary_java").to_string(rootElementPackage)) .. require("allbinary_java").to_string("\nProperties: ")) .. require("allbinary_java").to_string(tostring(packagePropertiesHashMap)), self, "getRootNode")
            end
            local node = self:createPackageNode(document, rootElementPackage, packagePropertiesHashMap)
            document:appendChild(node)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF(require("allbinary_java").to_string("\nAppended Document Created: ") .. require("allbinary_java").to_string(XmlDocumentHelper.toString(document)), self, "getRootNode")
            end
            return node
        else
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF("\nUsing Existing Root Node", self, "getRootNode")
            end
            return rootNode
        end
end
java_overload(NameSpaceRequestParams, "getRootNode", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "HashMap")) and (java_a3 == nil or java_is(java_a3, "Document")) end)


-- throws Exception
function NameSpaceRequestParams:addNewProperties(document, node, nextPackagePropertiesHashMap)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(tostring(StringMaker.new():append("\nAdding Any New Properties: "):append(tostring(nextPackagePropertiesHashMap)):append("\nto node: "):append(node:getNodeName())), self, "addNewProperties")
        end
        local propertyNameSet = nextPackagePropertiesHashMap:keySet()
        local propertyNameSetArray = propertyNameSet:toArray()
        local size = (propertyNameSetArray.n or #propertyNameSetArray)
        for index = 0, size - 1 do
            local nextPropertyName = propertyNameSetArray[index + 1]
            local propertyValue = StringUtil.getInstance():getNonNull(nextPackagePropertiesHashMap:get(nextPropertyName))
            local valueNode = DomSearchHelper.getNodeNoThrow(nextPropertyName, node:getChildNodes())
            if not rawequal(valueNode, nil) then
                local existingElementNodeTextNodeValue = DomNodeHelper.getTextNodeValue(valueNode)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("\nIf property: \"") .. require("allbinary_java").to_string(nextPropertyName)) .. require("allbinary_java").to_string(" is the same as:\n")) .. require("allbinary_java").to_string("Node: ")) .. require("allbinary_java").to_string(node:getNodeName())) .. require("allbinary_java").to_string(" then: ")) .. require("allbinary_java").to_string(propertyValue)) .. require("allbinary_java").to_string("==")) .. require("allbinary_java").to_string(existingElementNodeTextNodeValue), self, "addNewProperties")
                end
                if not rawequal(((propertyValue < existingElementNodeTextNodeValue and -1) or (propertyValue > existingElementNodeTextNodeValue and 1) or 0), 0) then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                        self.logUtil:putF("At least one Property from NameSpaceRequest Package was different from Node", self, "addNewProperties")
                    end
                    error(require("java.lang.Exception").new("Property Modifications Should Not Occur"), 0)
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Adding a new Property: ") .. require("allbinary_java").to_string(nextPropertyName)) .. require("allbinary_java").to_string("=")) .. require("allbinary_java").to_string(propertyValue), self, "addNewProperties")
                end
                local newPropertyNode = ModDomHelper.createTextNode(document, nextPropertyName, propertyValue)
                node:appendChild(newPropertyNode)
            end
        end
        return node
end
java_overload(NameSpaceRequestParams, "addNewProperties", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or java_is(java_a2, "Node")) and (java_a3 == nil or java_is(java_a3, "HashMap")) end)


-- throws Exception
function NameSpaceRequestParams:isElementValueTextNodeEqual(nextPackagePropertiesHashMap, node)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("\nComparing the value property in: ") .. require("allbinary_java").to_string(tostring(nextPackagePropertiesHashMap))) .. require("allbinary_java").to_string("\nto node child leaves of node: ")) .. require("allbinary_java").to_string(node:getNodeName()), self, "isElementValueTextNodeEqual")
        end
        local propertyValue = nextPackagePropertiesHashMap:get(DomData.VALUE)
        local valueNode = DomSearchHelper.getNodeNoThrow(DomData.VALUE, node:getChildNodes())
        if not rawequal(valueNode, nil) then
            local existingElementNodeTextNodeValue = DomNodeHelper.getTextNodeValue(valueNode)
            if rawequal(((propertyValue < existingElementNodeTextNodeValue and -1) or (propertyValue > existingElementNodeTextNodeValue and 1) or 0), 0) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Value Node is the same", self, "isElementValueTextNodeEqual")
                end
                return true
            end
        else
            return true
        end
        return false
end
java_overload(NameSpaceRequestParams, "isElementValueTextNodeEqual", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "Node")) end)


-- throws Exception
function NameSpaceRequestParams:isElementValueTextNodeUnique(nextPackagePropertiesHashMap, elementNodeVector)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("\nComparing Properties of: ") .. require("allbinary_java").to_string(elementNodeVector:size())) .. require("allbinary_java").to_string(" Nodes"), self, "isElementValueTextNodeUnique")
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
java_overload(NameSpaceRequestParams, "isElementValueTextNodeUnique", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) and (java_a2 == nil or java_is(java_a2, "BasicArrayList")) end)


-- throws Exception
function NameSpaceRequestParams:addChildren(document, rootNode, nameSpaceRequestParam)
        local node = rootNode
        local packageVector = nameSpaceRequestParam:getPackages()
        local size = packageVector:size()
        for index = 1, size - 1 do
            local nextPackageName = packageVector:get(index)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF(tostring(StringMaker.new():append("\nTrying to Add Child to Node: "):append(node:getNodeName()):append("\nwith new PackageName: "):append(nextPackageName)), self, "addChildren")
            end
            local nextPackagePropertiesHashMap = nameSpaceRequestParam:getPackageProperties(index)
            local elementNodeVector = DomSearchHelper.getAllNodesNoThrow(nextPackageName, node:getChildNodes())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string("\nDocument Contains ") .. require("allbinary_java").to_string(elementNodeVector:size())) .. require("allbinary_java").to_string(" Node(s) With Same Name"), self, "addChildren")
            end
            local isElementValueTextNodeUniqueIndex = self:isElementValueTextNodeUnique(nextPackagePropertiesHashMap, elementNodeVector)
            if (rawequal(elementNodeVector:size(), 0) or rawequal(isElementValueTextNodeUniqueIndex, -1)) and not ((CommonSeps.getInstance().BRACKET_CLOSE == "" or string.sub(nextPackageName, -#CommonSeps.getInstance().BRACKET_CLOSE) == CommonSeps.getInstance().BRACKET_CLOSE)) then
                local nextNode = self:createPackageNode(document, nextPackageName, nextPackagePropertiesHashMap)
                node:appendChild(nextNode)
                node = nextNode
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF(require("allbinary_java").to_string("\nAppended Package: ") .. require("allbinary_java").to_string(node:getNodeName()), self, "addChildren")
                    self.logUtil:putF(require("allbinary_java").to_string("\nAppended Document Created: ") .. require("allbinary_java").to_string(XmlDocumentHelper.toString(document)), self, "addChildren")
                end
            elseif (CommonSeps.getInstance().BRACKET_CLOSE == "" or string.sub(nextPackageName, -#CommonSeps.getInstance().BRACKET_CLOSE) == CommonSeps.getInstance().BRACKET_CLOSE) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Package is MultiNode: just append", self, "addChildren")
                end
                local nextNode = self:createPackageMultiNode(document, nameSpaceRequestParam, nextPackageName, nextPackagePropertiesHashMap)
                node:appendChild(nextNode)
                node = nextNode
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF(require("allbinary_java").to_string("\nAppended Multinode Element: ") .. require("allbinary_java").to_string(XmlDocumentHelper.toString(document)), self, "addChildren")
                end
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF("Value Node already exists: Now compare (properties to leaf nodes)", self, "addChildren")
                end
                local nodeNameDuplicateNode = elementNodeVector:get(isElementValueTextNodeUniqueIndex)
                node = self:addNewProperties(document, nodeNameDuplicateNode, nextPackagePropertiesHashMap)
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                    self.logUtil:putF("\nDuplicate Node Found: Moving to next child ^", self, "addChildre")
                end
            end
        end
        return document
end
java_overload(NameSpaceRequestParams, "addChildren", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or java_is(java_a2, "Node")) and (java_a3 == nil or java_is(java_a3, "NameSpaceRequestParam")) end)


-- throws Exception
function NameSpaceRequestParams:addNameSpace(key, value, document)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
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
java_overload(NameSpaceRequestParams, "addNameSpace", 3, function(java_a1, java_a2, java_a3) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "Document")) end)


-- throws Exception
function NameSpaceRequestParams:toHashMap()
        local document = DomDocumentHelper.create()
        local hashMap = StdUtil.getInstance():createHashMap()
        local keys = self:getMap():keySet()
        local keyArray = keys:toArray()
        local keySize = (keyArray.n or #keyArray)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(require("allbinary_java").to_string("NameSpace Request Size: ") .. require("allbinary_java").to_string(keys:size()), self, "toHashMap")
        end
        for i = 0, keySize - 1 do
            local key = keyArray[i + 1]
            local anyType = self:getMap():get(key)
            local className = (getmetatable(anyType).javaClassName or getmetatable(anyType).className)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                self.logUtil:putF(require("allbinary_java").to_string("Request Param Class: ") .. require("allbinary_java").to_string(className), self, "toHashMap")
            end
            if java_instanceof(self:getMap():get(key), String) then
                local value = self:getMap():get(key)
                if ((string.find(key, NameSpaceRequestParamData.NAME, 1, true) or 0) - 1) < 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Not NameSpace key: ") .. require("allbinary_java").to_string(key)) .. require("allbinary_java").to_string(" Value: ")) .. require("allbinary_java").to_string(value), self, "toHashMap()")
                    end
                    hashMap:put(tostring(key), tostring(value))
                else
                    document = self:addNameSpace(tostring(key), tostring(value), document)
                end
            elseif java_instanceof(self:getMap():get(key), table) then
                local values = self:getMap():get(key)
                if ((string.find(key, NameSpaceRequestParamData.NAME, 1, true) or 0) - 1) < 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
                        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Not NameSpace key: ") .. require("allbinary_java").to_string(key)) .. require("allbinary_java").to_string(" Value: ")) .. require("allbinary_java").to_string(values[1]), self, "toHashMap()")
                    end
                    hashMap:put(tostring(key), tostring(values[1]))
                else
                    document = self:addNameSpace(tostring(key), tostring(values[1]), document)
                end
            end
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("NameSpaceRequestParams: ") .. require("allbinary_java").to_string(tostring(self:getMap()))) .. require("allbinary_java").to_string("\ntoHashMap(): ")) .. require("allbinary_java").to_string(tostring(hashMap))) .. require("allbinary_java").to_string("\nDocument Created: ")) .. require("allbinary_java").to_string(XmlDocumentHelper.toString(document)), self, "toHashMap()")
        end
        hashMap:put(NameSpaceRequestParamData.DOCUMENT, document)
        return hashMap
end
java_overload(NameSpaceRequestParams, "toHashMap", 0)

return NameSpaceRequestParams

