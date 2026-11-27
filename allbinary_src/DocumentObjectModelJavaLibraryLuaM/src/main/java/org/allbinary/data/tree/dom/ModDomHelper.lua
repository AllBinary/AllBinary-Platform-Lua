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

local ModDomHelper = {}
package.loaded["org.allbinary.data.tree.dom.ModDomHelper"] = ModDomHelper

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
local ClassUtil = java_lazy("org.allbinary.logic.java.anyType.clazz.ClassUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local DomData = java_lazy("org.allbinary.data.tree.dom.DomData")

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

-- class table ModDomHelper is declared before the requires
ModDomHelper.__index = ModDomHelper
ModDomHelper.className = "ModDomHelper"
ModDomHelper.javaClassName = "org.allbinary.data.tree.dom.ModDomHelper"


function ModDomHelper._jinit(self)
    return self
end

function ModDomHelper.new(...)
    local self = setmetatable({}, ModDomHelper)
    ModDomHelper._jinit(self, ...)
    return self
end


-- throws Exception
function ModDomHelper.createTextNode(document, name, text)
        local newValueNode = document:createElement(name)
        local newValueTextNode = document:createTextNode(text)
        newValueNode:appendChild(newValueTextNode)
        return newValueNode
end


-- throws Exception
function ModDomHelper.createValueNode(document, text)
        return ModDomHelper.createTextNode(document, DomData.VALUE, text)
end


-- throws Exception
function ModDomHelper.createNameNode(document, text)
        return ModDomHelper.createTextNode(document, DomData.NAME, text)
end


-- throws Exception
function ModDomHelper.createIndexNode(document, index)
        return ModDomHelper.createTextNode(document, DomData.INDEX, tostring(index))
end


-- throws Exception
function ModDomHelper.createNameValueNodes_j4_1(document, elementName, nameText, valueText)
        local newNode = document:createElement(elementName)
        newNode:appendChild(ModDomHelper.createNameNode(document, nameText))
        newNode:appendChild(ModDomHelper.createValueNode(document, valueText))
        return newNode
end


-- throws Exception
function ModDomHelper.createNameValueNodes_j3_1(document, elementNameAndNameText, valueText)
        local newNode = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, elementNameAndNameText, valueText)
        return newNode
end


-- throws Exception
function ModDomHelper.createNameValueIndexNodes_j4_1(document, elementNameAndNameText, index, valueText)
        local newNode = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, valueText)
        newNode:appendChild(ModDomHelper.createIndexNode(document, index))
        return newNode
end


-- throws Exception
function ModDomHelper.createNameValueNodes_j3_2(document, rootNode, hashMap)
        local node = document:createElement(rootNode)
        return ModDomHelper.createNameValueNodes(document, node, hashMap)
end


-- throws Exception
function ModDomHelper.createNameValueNodes_j3_3(document, node, hashMap)
        local stringUtil = StringUtil.getInstance()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        for i = 0, size - 1 do
            local objectKey = keyArray[i + 1]
            local name = objectKey
            local anyType = hashMap:get(objectKey)
            if anyType == nil then
                local value = stringUtil.EMPTY_STRING
                node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
            elseif java_instanceof(anyType, String) then
                local value = stringUtil:getNonNull(anyType)
                node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
            elseif java_instanceof(anyType, HashMap) then
                node:appendChild(ModDomHelper.createNameValueNodes(document, name, hashMap))
            else
                error(require("java.lang.Exception").new("HashMap value is the wrong instance and is: " .. tostring(ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE))), 0)
            end
        end
        return node
end


-- throws Exception
function ModDomHelper.createNameValueNodes_j4_2(document, rootNodeName, duplicateNodeName, valueVector)
        local stringUtil = StringUtil.getInstance()
        local node = document:createElement(rootNodeName)
        local size = valueVector:size()
        for i = 0, size - 1 do
            local value = stringUtil:getNonNull(valueVector:get(i))
            node:appendChild(ModDomHelper.createNameValueNodes(document, duplicateNodeName, value))
        end
        return node
end
function ModDomHelper.createNameValueNodes(...)
    local count = select("#", ...)
    if count == 4 then return ModDomHelper.createNameValueNodes_j4(...) end
    if count == 3 then return ModDomHelper.createNameValueNodes_j3(...) end
    error("No method createNameValueNodes takes " .. count .. " arguments")
end
ModDomHelper.createNameValueNodes__jdispatcher = ModDomHelper.createNameValueNodes
function ModDomHelper.createNameValueNodes_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") and (java_a4 == nil or type(java_a4) == "string") then return ModDomHelper.createNameValueNodes_j4_1(...) end
    return ModDomHelper.createNameValueNodes_j4_2(...)
end
function ModDomHelper.createNameValueNodes_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or type(java_a3) == "string") then return ModDomHelper.createNameValueNodes_j3_1(...) end
    if true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "HashMap")) then return ModDomHelper.createNameValueNodes_j3_2(...) end
    return ModDomHelper.createNameValueNodes_j3_3(...)
end


-- throws Exception
function ModDomHelper.createNameValueIndexNodes_j4_2(document, rootNodeName, duplicateNodeName, valueVector)
        local stringUtil = StringUtil.getInstance()
        local node = document:createElement(rootNodeName)
        local size = valueVector:size()
        for index = 0, size - 1 do
            local value = stringUtil:getNonNull(valueVector:get(index))
            node:appendChild(ModDomHelper.createNameValueIndexNodes(document, duplicateNodeName, index, value))
        end
        return node
end
function ModDomHelper.createNameValueIndexNodes(...)
    local count = select("#", ...)
    if count == 4 then return ModDomHelper.createNameValueIndexNodes_j4(...) end
    error("No method createNameValueIndexNodes takes " .. count .. " arguments")
end
ModDomHelper.createNameValueIndexNodes__jdispatcher = ModDomHelper.createNameValueIndexNodes
function ModDomHelper.createNameValueIndexNodes_j4(...)
    local java_a1, java_a2, java_a3, java_a4 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and math.type(java_a3) == "integer" and (java_a4 == nil or type(java_a4) == "string") then return ModDomHelper.createNameValueIndexNodes_j4_1(...) end
    return ModDomHelper.createNameValueIndexNodes_j4_2(...)
end


-- throws Exception
function ModDomHelper.createNodeWithValueNodes_j3_1(document, rootNode, hashMap)
        local node = document:createElement(rootNode)
        return ModDomHelper.createNodeWithValueNodes(document, node, hashMap)
end


-- throws Exception
function ModDomHelper.createNodeWithValueNodes_j3_2(document, node, hashMap)
        local stringUtil = StringUtil.getInstance()
        local keySet = hashMap:keySet()
        local keyArray = keySet:toArray()
        local size = (keyArray.n or #keyArray)
        for i = 0, size - 1 do
            local name = keyArray[i + 1]
            local anyType = hashMap:get(name)
            local value = stringUtil:getNonNull(anyType)
            node:appendChild(ModDomHelper.createTextNode(document, name, value))
        end
        return node
end
function ModDomHelper.createNodeWithValueNodes(...)
    local count = select("#", ...)
    if count == 3 then return ModDomHelper.createNodeWithValueNodes_j3(...) end
    error("No method createNodeWithValueNodes takes " .. count .. " arguments")
end
ModDomHelper.createNodeWithValueNodes__jdispatcher = ModDomHelper.createNodeWithValueNodes
function ModDomHelper.createNodeWithValueNodes_j3(...)
    local java_a1, java_a2, java_a3 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Document")) and (java_a2 == nil or type(java_a2) == "string") and (java_a3 == nil or java_is(java_a3, "HashMap")) then return ModDomHelper.createNodeWithValueNodes_j3_1(...) end
    return ModDomHelper.createNodeWithValueNodes_j3_2(...)
end

return ModDomHelper

