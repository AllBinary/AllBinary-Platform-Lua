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
-- package org.allbinary.logic.visual.dhtml.style.css

local CssElementView = {}
package.loaded["org.allbinary.logic.visual.dhtml.style.css.CssElementView"] = CssElementView

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
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CssPropertiesValidationFactory = java_lazy("org.allbinary.logic.visual.dhtml.style.css.property.CssPropertiesValidationFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local CssElementData = java_lazy("org.allbinary.logic.visual.dhtml.style.css.CssElementData")
local CssElementsValidationFactory = java_lazy("org.allbinary.logic.visual.dhtml.style.css.CssElementsValidationFactory")

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

-- class table CssElementView is declared before the requires
CssElementView.__index = CssElementView
CssElementView.className = "CssElementView"
CssElementView.javaClassName = "org.allbinary.logic.visual.dhtml.style.css.CssElementView"
CssElementView.java_implements = " DomNodeInterface "
CssElementView.java_interfaces = function() return {DomNodeInterface} end

function CssElementView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.TITLE = "title"
    self.DESCRIPTION = "description"
    if self.value == nil then self.value = nil end
    if self.title == nil then self.title = nil end
    if self.description == nil then self.description = nil end
    if self.cssElementVector == nil then self.cssElementVector = nil end
    if self.cssPropertyVector == nil then self.cssPropertyVector = nil end
end

function CssElementView._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return CssElementView._new0(self, ...)
    elseif count == 1 then return CssElementView._new1(self, ...)
    end
    error("No constructor of CssElementView takes " .. count .. " arguments")
end

function CssElementView.new(...)
    local self = setmetatable({}, CssElementView)
    CssElementView._jinit(self, ...)
    return self
end


function CssElementView._new0(self)
    CssElementView._init_fields(self)
        self.cssPropertyVector = BasicArrayListD.new()
        local stringUtil = StringUtil.getInstance()
        self.title = stringUtil.EMPTY_STRING
        self.description = stringUtil.EMPTY_STRING
        self.value = stringUtil.EMPTY_STRING
    return self
end


function CssElementView._new1(self, node)
    CssElementView._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            local valueNode = DomSearchHelper.getNode(DomData.VALUE, node:getChildNodes())
            self.value = DomNodeHelper.getTextNodeValue(valueNode)
            local titleValueNode = DomSearchHelper.getNodeNoThrow(self.TITLE, node:getChildNodes())
            if not rawequal(titleValueNode, nil) then
                self.title = DomNodeHelper.getTextNodeValue(titleValueNode)
            else
                local stringUtil = StringUtil.getInstance()
                self.title = stringUtil.EMPTY_STRING
            end
            local descriptionValueNode = DomSearchHelper.getNodeNoThrow(self.DESCRIPTION, node:getChildNodes())
            if not rawequal(descriptionValueNode, nil) then
                self.description = DomNodeHelper.getTextNodeValue(descriptionValueNode)
            else
                self.description = StringUtil.getInstance().EMPTY_STRING
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(tostring(StringMaker.new():append("Value: "):append(self.value):append("\nTitle: "):append(self.title):append("\nDescription: "):append(self.description)), self, self.commonStrings.CONSTRUCTOR)
            end
            local cssElementStyleNodeVector = DomSearchHelper.getAllNodes(CssElementData.getInstance().NAME, node:getChildNodes())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF(require("allbinary_java").to_string("Child Css Elements: ") .. require("allbinary_java").to_string(cssElementStyleNodeVector:size()), self, "CssElementView()")
            end
            self.cssElementVector = CssElementsValidationFactory.getInstance(cssElementStyleNodeVector)
            local nodeList = node:getChildNodes()
            self.cssPropertyVector = CssPropertiesValidationFactory.getInstance(nodeList)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(tostring(StringMaker.new():append("Value: "):append(self.value):append("\nTitle: "):append(self.title):append("\nDescription: "):append(self.description)), self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(require("java.lang.Exception").new("CssElementView"), 0)
        end
    return self
end


function CssElementView:getValue()
        return self.value
end


function CssElementView:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(DomData.VALUE, self.value)
        hashMap:put(self.TITLE, self.title)
        hashMap:put(self.DESCRIPTION, self.description)
        return hashMap
end


-- throws Exception
function CssElementView:toXmlNode(document)
        local hashMap = self:toHashMap()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("CssView HashMap: ") .. require("allbinary_java").to_string(tostring(hashMap)), self, "toXmlNode")
        end
        local node = ModDomHelper.createNodeWithValueNodes(document, CssElementData.getInstance().NAME, hashMap)
        local size = self.cssPropertyVector:size()
        for index = 0, size - 1 do
            local cssPropertyDomNodeInterface = self.cssPropertyVector:get(index)
            node:appendChild(cssPropertyDomNodeInterface:toXmlNode(document))
        end
        local size2 = self.cssElementVector:size()
        for index = 0, size2 - 1 do
            local cssElementDomNodeInterface = self.cssElementVector:get(index)
            node:appendChild(cssElementDomNodeInterface:toXmlNode(document))
        end
        return node
end

return CssElementView

