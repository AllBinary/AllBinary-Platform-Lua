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

local DomNodeHelper = {}
package.loaded["org.allbinary.data.tree.dom.DomNodeHelper"] = DomNodeHelper

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local Node = java_lazy("org.w3c.dom.Node")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")

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

-- class table DomNodeHelper is declared before the requires
DomNodeHelper.__index = DomNodeHelper
DomNodeHelper.className = "DomNodeHelper"
DomNodeHelper.javaClassName = "org.allbinary.data.tree.dom.DomNodeHelper"


function DomNodeHelper._jinit(self)
    return self
end

function DomNodeHelper.new(...)
    local self = setmetatable({}, DomNodeHelper)
    DomNodeHelper._jinit(self, ...)
    return self
end


function DomNodeHelper.getFirstChildElement(parentNode)
        local node = parentNode:getFirstChild()
        if not rawequal(node, nil) and not rawequal(node:getNodeType(), Node.ELEMENT_NODE) then
            local nodeList = parentNode:getChildNodes()
            for index = 0, nodeList:getLength() - 1 do
                node = nodeList:item(index)
                if rawequal(node:getNodeType(), 1) then
                    break
                end
            end
        end
        return node
end


function DomNodeHelper.getTextNodeValue_j1(node)
        local nodeTextNode = node:getFirstChild()
        if not rawequal(nodeTextNode, nil) then
            return nodeTextNode:getNodeValue()
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end


-- throws Exception
function DomNodeHelper.getTextNodeValue_j2(nodeName, nodeList)
        local node = DomSearchHelper.getNode(nodeName, nodeList)
        return DomNodeHelper.getTextNodeValue(node)
end
function DomNodeHelper.getTextNodeValue(...)
    local count = select("#", ...)
    if count == 1 then return DomNodeHelper.getTextNodeValue_j1(...) end
    if count == 2 then return DomNodeHelper.getTextNodeValue_j2(...) end
    error("No method getTextNodeValue takes " .. count .. " arguments")
end
DomNodeHelper.getTextNodeValue__jdispatcher = DomNodeHelper.getTextNodeValue


function DomNodeHelper.getTextNodesValue(node)
        local stringBuffer = StringMaker.new()
        local nodeList = node:getChildNodes()
        for index = 0, nodeList:getLength() - 1 do
            local nodeTextNode = nodeList:item(index)
            if rawequal(nodeTextNode:getNodeType(), Node.TEXT_NODE) then
                if not rawequal(nodeTextNode, nil) then
                    stringBuffer:append(nodeTextNode:getNodeValue())
                end
            end
        end
        return tostring(stringBuffer)
end

return DomNodeHelper

