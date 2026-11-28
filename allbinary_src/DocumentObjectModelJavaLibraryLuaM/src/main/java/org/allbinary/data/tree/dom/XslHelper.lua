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
-- package org.allbinary.data.tree.dom

local XslHelper = {}
package.loaded["org.allbinary.data.tree.dom.XslHelper"] = XslHelper

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
local File = java_lazy("java.io.File")
-- local OutputStream = require("java.io.OutputStream")
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local Templates = require("javax.xml.transform.Templates")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local XmlDocumentHelper = java_lazy("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local Document = java_lazy("org.w3c.dom.Document")

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

--import org.allbinary.data.tree.dom.document.DomDocumentHelper;
-- class table XslHelper is declared before the requires
XslHelper.__index = XslHelper
XslHelper.className = "XslHelper"
XslHelper.javaClassName = "org.allbinary.data.tree.dom.XslHelper"


function XslHelper.getInstance()
        return XslHelper.instance_f
end


function XslHelper._jinit(self)
    return self
end

function XslHelper.new(...)
    local self = setmetatable({}, XslHelper)
    XslHelper._jinit(self, ...)
    return self
end


-- throws Exception
function XslHelper:translate_j3_1(xsltStreamSource, xmlStreamSource, streamResult)
        local try_ok, try_error, try_value = pcall(function()
            local transformerFactory = TransformerFactory.newInstance()
            local transformer = transformerFactory:newTransformer(xsltStreamSource)
            transformer:transform(xmlStreamSource, streamResult)
            do return "__jreturn", streamResult:getOutputStream() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function XslHelper:translate_j4(resolver, xsltStreamSource, xmlStreamSource, streamResult)
        local try_ok, try_error, try_value = pcall(function()
            local tFactory = TransformerFactory.newInstance()
            tFactory:setURIResolver(resolver)
            local transformer = tFactory:newTransformer(xsltStreamSource)
            transformer:transform(xmlStreamSource, streamResult)
            do return "__jreturn", streamResult:getOutputStream() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function XslHelper:translateTemplate(templates, xmlStreamSource)
        local try_ok, try_error, try_value = pcall(function()
            local outputStream = require("java.io.ByteArrayOutputStream").new()
            local streamResult = StreamResult.new(outputStream)
            templates:newTransformer():transform(xmlStreamSource, streamResult)
            do return "__jreturn", tostring(streamResult:getOutputStream()) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function XslHelper:translate_j2_1(xsltStreamSource, xmlDocument)
        local try_ok, try_error, try_value = pcall(function()
            local outputStream = require("java.io.ByteArrayOutputStream").new()
            do return "__jreturn", tostring(self:translate(xsltStreamSource, StreamSource.new(StringBufferInputStream.new(XmlDocumentHelper.toString(xmlDocument))), StreamResult.new(outputStream))) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function XslHelper:translate_j2_2(xsltStreamSource, xmlStreamSource)
        local try_ok, try_error, try_value = pcall(function()
            local outputStream = require("java.io.ByteArrayOutputStream").new()
            do return "__jreturn", tostring(self:translate(xsltStreamSource, xmlStreamSource, StreamResult.new(outputStream))) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function XslHelper:translate_j3_2(resolver, xsltStreamSource, xmlStreamSource)
        local try_ok, try_error, try_value = pcall(function()
            local outputStream = require("java.io.ByteArrayOutputStream").new()
            do return "__jreturn", tostring(self:translate(resolver, xsltStreamSource, xmlStreamSource, StreamResult.new(outputStream))) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function XslHelper:translate(...)
    local count = select("#", ...)
    if count == 3 then return self:translate_j3(...) end
    if count == 4 then return self:translate_j4(...) end
    if count == 2 then return self:translate_j2(...) end
    error("No method translate takes " .. count .. " arguments")
end
XslHelper.translate__jdispatcher = XslHelper.translate
function XslHelper:translate_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "StreamSource")) and (java_a2 == nil or java_is(java_a2, "StreamSource")) and (java_a3 == nil or java_is(java_a3, "StreamResult")) then return XslHelper.translate_j3_1(self, ...) end
    return XslHelper.translate_j3_2(self, ...)
end
function XslHelper:translate_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or java_is(java_a1, "StreamSource")) and (java_a2 == nil or java_is(java_a2, "Document")) then return XslHelper.translate_j2_1(self, ...) end
    return XslHelper.translate_j2_2(self, ...)
end


-- throws Exception
function XslHelper:export(outputFile, xsltFilePath, xmlDocument)
        local try_ok, try_error, try_value = pcall(function()
            outputFile:createNewFile()
            self:translate(StreamSource.new(xsltFilePath), StreamSource.new(StringBufferInputStream.new(XmlDocumentHelper.toString(xmlDocument))), StreamResult.new(outputFile))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
end

XslHelper.instance_f = XslHelper.new()

return XslHelper

