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

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local StringReader = require("java.io.StringReader")
-- local StringWriter = require("java.io.StringWriter")
-- local Writer = require("java.io.Writer")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
-- local OutputKeys = require("javax.xml.transform.OutputKeys")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local DOMSource = require("javax.xml.transform.dom.DOMSource")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = require("org.allbinary.logic.java.bool.BooleanFactory")
local CharacterSetData = require("org.allbinary.logic.java.characters.CharacterSetData")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local InputSource = require("org.xml.sax.InputSource")

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

local XmlDocumentHelper = {}
XmlDocumentHelper.__index = XmlDocumentHelper
XmlDocumentHelper.className = "XmlDocumentHelper"

function XmlDocumentHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.INDENT_NUMBER = "indent-number"
    self.transformer = nil
end


function XmlDocumentHelper.getInstance()
        return XmlDocumentHelper.instance
end


function XmlDocumentHelper.new()
    local self = setmetatable({}, XmlDocumentHelper)
    self:_init_fields()
        self:init(4, true)
    return self
end


function XmlDocumentHelper:init(indent, ignoreDeclaration)
        local try_ok, try_error = pcall(function()
            local booleanFactory = BooleanFactory.getInstance()
            local transformerFactory = TransformerFactory.newInstance()
            transformerFactory:setAttribute(self.INDENT_NUMBER, indent)
            self.transformer = transformerFactory:newTransformer()
            self.transformer:setOutputProperty(OutputKeys.ENCODING, CharacterSetData.getInstance().UTF_8)
            self.transformer:setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, (function() if ignoreDeclaration then return booleanFactory.YES else return booleanFactory.NO end end)())
            self.transformer:setOutputProperty(OutputKeys.INDENT, booleanFactory.YES)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.INIT, e)
        end
end


-- throws Exception
function XmlDocumentHelper:format(xmlString)
        local src = InputSource.new(StringReader.new(xmlString))
        local document = DocumentBuilderFactory.newInstance():newDocumentBuilder():parse(src)
        local out = StringWriter.new()
        self.transformer:transform(DOMSource.new(document), StreamResult.new(out))
        return tostring(out)
end


-- throws Exception
function XmlDocumentHelper.toString(document)
        local try_ok, try_error = pcall(function()
            local domSource = DOMSource.new(document)
            local byteArrayOutputStream = java_byte_array_output_stream()
            local streamResult = StreamResult.new(byteArrayOutputStream)
            local copyTransformerFactory = TransformerFactory.newInstance()
            local copyTransformer = copyTransformerFactory:newTransformer()
            copyTransformer:transform(domSource, streamResult)
            return tostring(byteArrayOutputStream)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

XmlDocumentHelper.instance = XmlDocumentHelper.new()

return XmlDocumentHelper

