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
-- package org.allbinary.logic.visual.transform.data

local TransformHttpRequestDocument = {}
package.loaded["org.allbinary.logic.visual.transform.data.TransformHttpRequestDocument"] = TransformHttpRequestDocument

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

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local DomDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local AcceptableResponseGenerator = java_lazy("org.allbinary.logic.communication.http.AcceptableResponseGenerator")
local WeblisketSession = java_lazy("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = java_lazy("org.allbinary.logic.control.search.SearchRequest")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local TransformDocumentInterface = require("org.allbinary.logic.visual.transform.data.TransformDocumentInterface")

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

-- class table TransformHttpRequestDocument is declared before the requires
TransformHttpRequestDocument.__index = TransformHttpRequestDocument
TransformHttpRequestDocument.className = "TransformHttpRequestDocument"
TransformHttpRequestDocument.javaClassName = "org.allbinary.logic.visual.transform.data.TransformHttpRequestDocument"
TransformHttpRequestDocument.java_implements = " TransformDocumentInterface "
TransformHttpRequestDocument.java_interfaces = function() return {TransformDocumentInterface} end

function TransformHttpRequestDocument:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.baseNode == nil then self.baseNode = nil end
    if self.document == nil then self.document = nil end
end

function TransformHttpRequestDocument._jinit(self, ...)
    local count = select("#", ...)
    if count == 2 then return TransformHttpRequestDocument._new2(self, ...)
    elseif count == 1 then return TransformHttpRequestDocument._new1(self, ...)
    end
    error("No constructor of TransformHttpRequestDocument takes " .. count .. " arguments")
end

function TransformHttpRequestDocument.new(...)
    local self = setmetatable({}, TransformHttpRequestDocument)
    TransformHttpRequestDocument._jinit(self, ...)
    return self
end


function TransformHttpRequestDocument._new2(self, pageContext, weblisketSession)
    TransformHttpRequestDocument._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            local contentType = AcceptableResponseGenerator.getInstance():get(pageContext:getRequest())
            self.document = DomDocumentHelper.create()
            local contentTypeNode = self.document:createElement(contentType)
            local languageTypeNode = self.document:createElement(TransformHttpRequestDocument.language)
            local localTypeNode = self.document:createElement(TransformHttpRequestDocument.local_)
            self.baseNode = localTypeNode
            languageTypeNode:appendChild(localTypeNode)
            contentTypeNode:appendChild(languageTypeNode)
            self.document:appendChild(contentTypeNode)
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:putF(self:log(), self, self.commonStrings.CONSTRUCTOR)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end


function TransformHttpRequestDocument._new1(self, searchRequest)
    TransformHttpRequestDocument._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            local contentType = searchRequest:getContentType()
            self.document = DomDocumentHelper.create()
            local contentTypeNode = self.document:createElement(contentType)
            local languageTypeNode = self.document:createElement(TransformHttpRequestDocument.language)
            local localTypeNode = self.document:createElement(TransformHttpRequestDocument.local_)
            self.baseNode = localTypeNode
            languageTypeNode:appendChild(localTypeNode)
            contentTypeNode:appendChild(languageTypeNode)
            self.document:appendChild(contentTypeNode)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
            end
            error(e, 0)
        end
    return self
end


function TransformHttpRequestDocument:getBaseNode()
        return self.baseNode
end


function TransformHttpRequestDocument:getDoc()
        return self.document
end


-- throws Exception
function TransformHttpRequestDocument:log()
        local stringBuffer = StringMaker.new()
        if not rawequal(self.baseNode, nil) then
            stringBuffer:append("BaseNode: ")
            stringBuffer:append(self.baseNode:getNodeName())
        else
            stringBuffer:append("Log-Error: BaseNode is Null")
        end
        stringBuffer:append("\nDocument: ")
        stringBuffer:append(XmlDocumentHelper.toString(self.document))
        return tostring(stringBuffer)
end

TransformHttpRequestDocument.language = "en"
TransformHttpRequestDocument.local_ = "US"

return TransformHttpRequestDocument

