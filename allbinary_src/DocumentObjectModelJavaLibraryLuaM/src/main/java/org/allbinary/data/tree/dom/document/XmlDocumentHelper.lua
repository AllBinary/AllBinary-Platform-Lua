-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.data.tree.dom.document

local XmlDocumentHelper = {}
package.loaded["org.allbinary.data.tree.dom.document.XmlDocumentHelper"] = XmlDocumentHelper

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
local StringReader = java_lazy("java.io.StringReader")
-- local StringWriter = require("java.io.StringWriter")
-- local Writer = require("java.io.Writer")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
-- local OutputKeys = require("javax.xml.transform.OutputKeys")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerConfigurationException = require("javax.xml.transform.TransformerConfigurationException")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local DOMSource = require("javax.xml.transform.dom.DOMSource")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local CharacterSetData = java_lazy("org.allbinary.logic.java.characters.CharacterSetData")
local Document = java_lazy("org.w3c.dom.Document")
local InputSource = java_lazy("org.xml.sax.InputSource")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- class table XmlDocumentHelper is declared before the requires
XmlDocumentHelper.__index = XmlDocumentHelper
XmlDocumentHelper.className = "XmlDocumentHelper"
XmlDocumentHelper.javaClassName = "org.allbinary.data.tree.dom.document.XmlDocumentHelper"

function XmlDocumentHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.INDENT_NUMBER = "indent-number"
    if self.indent == nil then self.indent = 0 end
    if self.ignoreDeclaration == nil then self.ignoreDeclaration = false end
end


function XmlDocumentHelper.getInstance()
        return XmlDocumentHelper.instance_f
end


function XmlDocumentHelper._jinit(self)
    XmlDocumentHelper._init_fields(self)
        self:init(4, true)
    return self
end

function XmlDocumentHelper.new(...)
    local self = setmetatable({}, XmlDocumentHelper)
    XmlDocumentHelper._jinit(self, ...)
    return self
end


function XmlDocumentHelper:init(indent, ignoreDeclaration)
        self.indent = indent
        self.ignoreDeclaration = ignoreDeclaration
end


-- throws TransformerConfigurationException
function XmlDocumentHelper:createTransformer_j2(indent, ignoreDeclaration)
        local booleanFactory = BooleanFactory.getInstance()
        local transformerFactory = TransformerFactory.newInstance()
        transformerFactory:setAttribute(self.INDENT_NUMBER, indent)
        local transformer = transformerFactory:newTransformer()
        transformer:setOutputProperty(OutputKeys.ENCODING, CharacterSetData.getInstance().UTF_8)
        transformer:setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, (function() if ignoreDeclaration then return booleanFactory.YES else return booleanFactory.NO end end)())
        transformer:setOutputProperty(OutputKeys.INDENT, booleanFactory.YES)
        return transformer
end


-- throws TransformerConfigurationException
function XmlDocumentHelper:createTransformer_j0()
        local currentIndent = 0
        local currentIgnoreDeclaration = false
        do -- synchronized (self)
            currentIndent = self.indent
            currentIgnoreDeclaration = self.ignoreDeclaration
        end
        return self:createTransformer(currentIndent, currentIgnoreDeclaration)
end
function XmlDocumentHelper:createTransformer(...)
    local count = select("#", ...)
    if count == 2 then return self:createTransformer_j2(...) end
    if count == 0 then return self:createTransformer_j0(...) end
    error("No method createTransformer takes " .. count .. " arguments")
end
XmlDocumentHelper.createTransformer__jdispatcher = XmlDocumentHelper.createTransformer


-- throws Exception
function XmlDocumentHelper:format(xmlString)
        return self:formatWithTransformer(xmlString, self:createTransformer())
end


-- throws Exception
function XmlDocumentHelper:formatWithTransformer(xmlString, transformer)
        local src = InputSource.new(StringReader.new(xmlString))
        local document = DocumentBuilderFactory.newInstance():newDocumentBuilder():parse(src)
        local out = StringWriter.new()
        transformer:transform(DOMSource.new(document), StreamResult.new(out))
        return tostring(out)
end


-- throws Exception
function XmlDocumentHelper.toString(document)
        local try_ok, try_error, try_value = pcall(function()
            local domSource = DOMSource.new(document)
            local byteArrayOutputStream = require("java.io.ByteArrayOutputStream").new()
            local streamResult = StreamResult.new(byteArrayOutputStream)
            local copyTransformerFactory = TransformerFactory.newInstance()
            local copyTransformer = copyTransformerFactory:newTransformer()
            copyTransformer:transform(domSource, streamResult)
            do return "__jreturn", tostring(byteArrayOutputStream) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

XmlDocumentHelper.instance_f = XmlDocumentHelper.new()

return XmlDocumentHelper

