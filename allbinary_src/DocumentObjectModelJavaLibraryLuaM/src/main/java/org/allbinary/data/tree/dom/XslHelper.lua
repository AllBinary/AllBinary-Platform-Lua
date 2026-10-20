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

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local File = require("java.io.File")
-- local OutputStream = require("java.io.OutputStream")
-- local StringBufferInputStream = require("java.io.StringBufferInputStream")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local URIResolver = require("javax.xml.transform.URIResolver")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local Document = require("org.w3c.dom.Document")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
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

--import org.allbinary.data.tree.dom.document.DomDocumentHelper;
local XslHelper = {}
XslHelper.__index = XslHelper
XslHelper.className = "XslHelper"


function XslHelper.getInstance()
        return XslHelper.instance
end


function XslHelper.new()
    local self = setmetatable({}, XslHelper)
    return self
end


-- throws Exception
function XslHelper:translate(xsltStreamSource, xmlStreamSource, streamResult)
        local try_ok, try_error = pcall(function()
            local transformerFactory = TransformerFactory.newInstance()
            local transformer = transformerFactory:newTransformer(xsltStreamSource)
            transformer:transform(xmlStreamSource, streamResult)
            return streamResult:getOutputStream()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function XslHelper:translate(resolver, xsltStreamSource, xmlStreamSource, streamResult)
        local try_ok, try_error = pcall(function()
            local tFactory = TransformerFactory.newInstance()
            tFactory:setURIResolver(resolver)
            local transformer = tFactory:newTransformer(xsltStreamSource)
            transformer:transform(xmlStreamSource, streamResult)
            return streamResult:getOutputStream()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function XslHelper:translate(xsltStreamSource, xmlDocument)
        local try_ok, try_error = pcall(function()
            local outputStream = java_byte_array_output_stream()
            return tostring(self:translate(xsltStreamSource, StreamSource.new(StringBufferInputStream.new(XmlDocumentHelper.toString(xmlDocument))), StreamResult.new(outputStream)))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function XslHelper:translate(xsltStreamSource, xmlStreamSource)
        local try_ok, try_error = pcall(function()
            local outputStream = java_byte_array_output_stream()
            return tostring(self:translate(xsltStreamSource, xmlStreamSource, StreamResult.new(outputStream)))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function XslHelper:translate(resolver, xsltStreamSource, xmlStreamSource)
        local try_ok, try_error = pcall(function()
            local outputStream = java_byte_array_output_stream()
            return tostring(self:translate(resolver, xsltStreamSource, xmlStreamSource, StreamResult.new(outputStream)))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function XslHelper:export(outputFile, xsltFilePath, xmlDocument)
        local try_ok, try_error = pcall(function()
            outputFile:createNewFile()
            self:translate(StreamSource.new(xsltFilePath), StreamSource.new(StringBufferInputStream.new(XmlDocumentHelper.toString(xmlDocument))), StreamResult.new(outputFile))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

XslHelper.instance = XslHelper.new()

return XslHelper

