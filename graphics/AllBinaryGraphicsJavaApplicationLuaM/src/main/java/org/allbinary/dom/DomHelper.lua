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

local DomHelper = {}
package.loaded["org.allbinary.dom.DomHelper"] = DomHelper

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
-- local DocumentBuilder = require("javax.xml.parsers.DocumentBuilder")
-- local DocumentBuilderFactory = require("javax.xml.parsers.DocumentBuilderFactory")
-- local Transformer = require("javax.xml.transform.Transformer")
-- local TransformerFactory = require("javax.xml.transform.TransformerFactory")
-- local DOMSource = require("javax.xml.transform.dom.DOMSource")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")

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

-- class table DomHelper is declared before the requires
DomHelper.__index = DomHelper
DomHelper.className = "DomHelper"
DomHelper.javaClassName = "org.allbinary.dom.DomHelper"

function DomHelper:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function DomHelper.getInstance()
        return DomHelper.instance_f
end


function DomHelper._jinit(self)
    DomHelper._init_fields(self)
    return self
end

function DomHelper.new(...)
    local self = setmetatable({}, DomHelper)
    DomHelper._jinit(self, ...)
    return self
end


function DomHelper:createDocument_j0()
        local try_ok, try_error, try_value = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:newDocument()
            do return "__jreturn", document end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function DomHelper:createDocument_j1(xmlFile)
        local try_ok, try_error, try_value = pcall(function()
            local factory = DocumentBuilderFactory.newInstance()
            local builder = factory:newDocumentBuilder()
            local document = builder:parse(xmlFile)
            do return "__jreturn", document end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function DomHelper:createDocument(...)
    local count = select("#", ...)
    if count == 0 then return self:createDocument_j0(...) end
    if count == 1 then return self:createDocument_j1(...) end
    error("No method createDocument takes " .. count .. " arguments")
end
DomHelper.createDocument__jdispatcher = DomHelper.createDocument


-- throws Exception
function DomHelper:toString(document)
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


-- throws Exception
function DomHelper:save(file, document)
        local try_ok, try_error, try_value = pcall(function()
            local copyTransformerFactory = TransformerFactory.newInstance()
            local copyTransformer = copyTransformerFactory:newTransformer()
            local domSource = DOMSource.new(document)
            file:createNewFile()
            local streamResult = StreamResult.new(file)
            copyTransformer:transform(domSource, streamResult)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
end


-- throws Exception
function DomHelper:getChildNodeList(nodeName, nodeList)
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            if rawequal(node:getNodeName():compareTo(nodeName), 0) then
                return node:getChildNodes()
            end
        end
        error(require("java.lang.Exception").new(require("allbinary_java").to_string(nodeName) .. require("allbinary_java").to_string(" Node Not Found")), 0)
end


-- throws Exception
function DomHelper:getChildrenWithoutTextNodes(nodeName, nodeList)
        local list = BasicArrayListD.new()
        local childNodeList = self:getChildNodeList(nodeName, nodeList)
        local numberOfChildren = childNodeList:getLength()
        for index = 0, numberOfChildren - 1 do
            local node = childNodeList:item(index)
            if not rawequal(node:getNodeType(), Node.TEXT_NODE) then
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
            if not rawequal(node:getNodeType(), Node.TEXT_NODE) then
                list:add(node)
            end
        end
        return list
end


-- throws Exception
function DomHelper:searchNodeList_j2_1(nodeName, nodeList)
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            self.logUtil:putF(require("allbinary_java").to_string("NodeName: ") .. require("allbinary_java").to_string(node:getNodeName()), self, "searchNodeList")
            if rawequal(node:getNodeName():compareTo(nodeName), 0) then
                return node
            end
        end
        error(require("java.lang.Exception").new(require("allbinary_java").to_string(nodeName) .. require("allbinary_java").to_string(" Node Not Found in search")), 0)
end


-- throws Exception
function DomHelper:searchNodeList_j2_2(nodeName, nodeList)
        local numberOfNodes = nodeList:size()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:get(index)
            self.logUtil:putF(require("allbinary_java").to_string("NodeName: ") .. require("allbinary_java").to_string(node:getNodeName()), self, "searchNodeList")
            if rawequal(node:getNodeName():compareTo(nodeName), 0) then
                return node
            end
        end
        error(require("java.lang.Exception").new(require("allbinary_java").to_string(nodeName) .. require("allbinary_java").to_string(" Node Not Found in search")), 0)
end
function DomHelper:searchNodeList(...)
    local count = select("#", ...)
    if count == 2 then return self:searchNodeList_j2(...) end
    error("No method searchNodeList takes " .. count .. " arguments")
end
DomHelper.searchNodeList__jdispatcher = DomHelper.searchNodeList
function DomHelper:searchNodeList_j2(...)
    local java_a1, java_a2 = ...
    if true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or java_is(java_a2, "NodeList")) then return DomHelper.searchNodeList_j2_1(self, ...) end
    return DomHelper.searchNodeList_j2_2(self, ...)
end

DomHelper.instance_f = DomHelper.new()

return DomHelper

