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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local Node = require("org.w3c.dom.Node")
local NodeList = require("org.w3c.dom.NodeList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DomNodeHelper = {}
DomNodeHelper.__index = DomNodeHelper
DomNodeHelper.className = "DomNodeHelper"


function DomNodeHelper.new()
    local self = setmetatable({}, DomNodeHelper)
    return self
end


function DomNodeHelper.getFirstChildElement(parentNode)
        local node = parentNode:getFirstChild()
        if node ~= nil and node:getNodeType() ~= Node.ELEMENT_NODE then
            local nodeList = parentNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                node = nodeList:item(index)
                if node:getNodeType() == 1 then
                    break
                end
            end
        end
        return node
end


function DomNodeHelper.getTextNodeValue(node)
        local nodeTextNode = node:getFirstChild()
        if nodeTextNode ~= nil then
            return nodeTextNode:getNodeValue()
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function DomNodeHelper.getTextNodeValue(nodeName, nodeList)
        local node = DomSearchHelper.getNode(nodeName, nodeList)
        return DomNodeHelper.getTextNodeValue(node)
end


function DomNodeHelper.getTextNodesValue(node)
        local stringBuffer = StringMaker.new()
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local nodeTextNode = nodeList:item(index)
            if nodeTextNode:getNodeType() == Node.TEXT_NODE then
                if nodeTextNode ~= nil then
                    stringBuffer:append(nodeTextNode:getNodeValue())
                end
            end
        end
        return tostring(stringBuffer)
end

return DomNodeHelper

