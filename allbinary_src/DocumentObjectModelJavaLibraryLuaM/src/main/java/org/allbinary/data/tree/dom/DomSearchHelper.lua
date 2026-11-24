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

local DomSearchHelper = {}
package.loaded["org.allbinary.data.tree.dom.DomSearchHelper"] = DomSearchHelper

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
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

-- class table DomSearchHelper is declared before the requires
DomSearchHelper.__index = DomSearchHelper
DomSearchHelper.className = "DomSearchHelper"
DomSearchHelper.javaClassName = "org.allbinary.data.tree.dom.DomSearchHelper"


function DomSearchHelper._jinit(self)
    return self
end

function DomSearchHelper.new(...)
    local self = setmetatable({}, DomSearchHelper)
    DomSearchHelper._jinit(self, ...)
    return self
end


function DomSearchHelper.getNodeNoThrow(nodeName, nodeList)
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            if node:getNodeName():compareTo(nodeName) == 0 then
                return node
            end
        end
        return nil
end


-- throws Exception
function DomSearchHelper.getNode(nodeName, nodeList)
        local node = DomSearchHelper.getNodeNoThrow(nodeName, nodeList)
        if node ~= nil then
            return node
        else
            error(require("java.lang.Exception").new(nodeName .. " Node Not Found in search"), 0)
        end
end


-- throws Exception
function DomSearchHelper.getChildNodeList(nodeName, nodeList)
        local node = DomSearchHelper.getNode(nodeName, nodeList)
        return node:getChildNodes()
end


-- throws Exception
function DomSearchHelper.getAllNodes(nodeName, nodeList)
        local vector = DomSearchHelper.getAllNodesNoThrow(nodeName, nodeList)
        if vector == nil then
            error(require("java.lang.Exception").new(nodeName .. " Node Not Found in search"), 0)
        else
            return vector
        end
end


function DomSearchHelper.getAllNodesNoThrow(nodeName, nodeList)
        local nodeVector = BasicArrayListD.new()
        local numberOfNodes = nodeList:getLength()
        for index = 0, numberOfNodes - 1 do
            local node = nodeList:item(index)
            if node:getNodeName():compareTo(nodeName) == 0 then
                nodeVector:add(node)
            end
        end
        return nodeVector
end

return DomSearchHelper

