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

local DomNodeListHelper = {}
package.loaded["org.allbinary.data.tree.dom.DomNodeListHelper"] = DomNodeListHelper

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
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local NodeList = java_lazy("org.w3c.dom.NodeList")
local DomNodeHelper = java_lazy("org.allbinary.data.tree.dom.DomNodeHelper")

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

-- class table DomNodeListHelper is declared before the requires
DomNodeListHelper.__index = DomNodeListHelper
DomNodeListHelper.className = "DomNodeListHelper"
DomNodeListHelper.javaClassName = "org.allbinary.data.tree.dom.DomNodeListHelper"

function DomNodeListHelper._jinit(self)
    return self
end

function DomNodeListHelper.new()
    return DomNodeListHelper._jinit(setmetatable({}, DomNodeListHelper))
end


function DomNodeListHelper.getVector(nodeList)
        local vector = BasicArrayListD.new()
        local size = nodeList:getLength()
        for index = 0, size - 1 do
            vector:add(DomNodeHelper.getTextNodeValue(nodeList:item(index)))
        end
        return vector
end

return DomNodeListHelper

