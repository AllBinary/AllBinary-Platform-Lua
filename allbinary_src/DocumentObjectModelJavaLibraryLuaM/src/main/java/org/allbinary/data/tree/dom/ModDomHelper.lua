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

-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local ClassUtil = require("org.allbinary.logic.java.anyType.clazz.ClassUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

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
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

local ModDomHelper = {}
ModDomHelper.__index = ModDomHelper
ModDomHelper.className = "ModDomHelper"


function ModDomHelper.new()
    local self = setmetatable({}, ModDomHelper)
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
function ModDomHelper.createNameValueNodes(document, elementName, nameText, valueText)
        local newNode = document:createElement(elementName)
        newNode:appendChild(ModDomHelper.createNameNode(document, nameText))
        newNode:appendChild(ModDomHelper.createValueNode(document, valueText))
        return newNode
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNameValueNodes(document, elementNameAndNameText, valueText)
        local newNode = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, elementNameAndNameText, valueText)
        return newNode
end


-- throws Exception
function ModDomHelper.createNameValueIndexNodes(document, elementNameAndNameText, index, valueText)
        local newNode = ModDomHelper.createNameValueNodes(document, elementNameAndNameText, valueText)
        newNode:appendChild(ModDomHelper.createIndexNode(document, index))
        return newNode
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNameValueNodes(document, rootNode, hashMap)
        local node = document:createElement(rootNode)
        return ModDomHelper.createNameValueNodes(document, node, hashMap)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNameValueNodes(document, node, hashMap)
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
                error(java_exception("Exception", "HashMap value is the wrong instance and is: " .. tostring(ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE))), 0)
            end
        end
        return node
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNameValueNodes(document, rootNodeName, duplicateNodeName, valueVector)
        local stringUtil = StringUtil.getInstance()
        local node = document:createElement(rootNodeName)
        local size = valueVector:size()
        for i = 0, size - 1 do
            local value = stringUtil:getNonNull(valueVector:get(i))
            node:appendChild(ModDomHelper.createNameValueNodes(document, duplicateNodeName, value))
        end
        return node
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNameValueIndexNodes(document, rootNodeName, duplicateNodeName, valueVector)
        local stringUtil = StringUtil.getInstance()
        local node = document:createElement(rootNodeName)
        local size = valueVector:size()
        for index = 0, size - 1 do
            local value = stringUtil:getNonNull(valueVector:get(index))
            node:appendChild(ModDomHelper.createNameValueIndexNodes(document, duplicateNodeName, index, value))
        end
        return node
end


-- throws Exception
function ModDomHelper.createNodeWithValueNodes(document, rootNode, hashMap)
        local node = document:createElement(rootNode)
        return ModDomHelper.createNodeWithValueNodes(document, node, hashMap)
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function ModDomHelper.createNodeWithValueNodes(document, node, hashMap)
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

return ModDomHelper

