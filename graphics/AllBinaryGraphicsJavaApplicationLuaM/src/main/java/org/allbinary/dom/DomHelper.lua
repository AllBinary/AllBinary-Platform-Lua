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
-- package org.allbinary.dom

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local File = require("java.io.File")
-- local DocumentBuilder = require("javax.xml.parsers.DocumentBuilder")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local DOMSource = require("javax.xml.transform.dom.DOMSource")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

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

local DomHelper = {}
DomHelper.__index = DomHelper
DomHelper.className = "DomHelper"

function DomHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function DomHelper.getInstance()
        return DomHelper.instance
end


function DomHelper.new()
    local self = setmetatable({}, DomHelper)
    self:_init_fields()
    return self
end


function DomHelper:createDocument()
        local try_ok, try_error = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:newDocument()
            return document
        end)
        if not try_ok then
            local e = try_error
            return nil
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DomHelper:createDocument(xmlFile)
        local try_ok, try_error = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(xmlFile)
            return document
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function DomHelper:toString(document)
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


-- throws Exception
function DomHelper:save(file, document)
        local try_ok, try_error = pcall(function()
            local copyTransformerFactory = TransformerFactory.newInstance()
            local copyTransformer = copyTransformerFactory:newTransformer()
            local domSource = DOMSource.new(document)
            file:createNewFile()
            local streamResult = StreamResult.new(file)
            copyTransformer:transform(domSource, streamResult)
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function DomHelper:getChildNodeList(nodeName, nodeList)
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            if node:getNodeName():compareTo(nodeName) == 0 then
                return node:getChildNodes()
            end
        end
        error(java_exception("Exception", nodeName .. " Node Not Found"), 0)
end


-- throws Exception
function DomHelper:getChildrenWithoutTextNodes(nodeName, nodeList)
        local list = BasicArrayListD.new()
        local childNodeList = self:getChildNodeList(nodeName, nodeList)
        local numberOfChildren = childNodeList:getLength()
        for index = 0, numberOfChildren - 1 do
            local node = childNodeList:item(index)
            if node:getNodeType() ~= Node.TEXT_NODE then
                list:add(node)
            end
        end
        return list
end


-- throws Exception
function DomHelper:getWithoutTextNodes(nodeList)
        local list = BasicArrayListD.new()
        local numberOfChildren = nodeList:getLength()
        for index = 0, numberOfChildren - 1 do
            local node = nodeList:item(index)
            if node:getNodeType() ~= Node.TEXT_NODE then
                list:add(node)
            end
        end
        return list
end


-- throws Exception
function DomHelper:searchNodeList(nodeName, nodeList)
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            self.logUtil:putF("NodeName: " .. tostring(node:getNodeName()), self, "searchNodeList")
            if node:getNodeName():compareTo(nodeName) == 0 then
                return node
            end
        end
        error(java_exception("Exception", nodeName .. " Node Not Found in search"), 0)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DomHelper:searchNodeList(nodeName, nodeList)
        local numberOfNodes = nodeList:size()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:get(index)
            self.logUtil:putF("NodeName: " .. tostring(node:getNodeName()), self, "searchNodeList")
            if node:getNodeName():compareTo(nodeName) == 0 then
                return node
            end
        end
        error(java_exception("Exception", nodeName .. " Node Not Found in search"), 0)
end

DomHelper.instance = DomHelper.new()

return DomHelper

