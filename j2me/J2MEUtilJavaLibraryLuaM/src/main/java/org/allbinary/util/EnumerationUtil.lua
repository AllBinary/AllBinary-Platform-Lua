-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.util

local EnumerationUtil = {}
package.loaded["org.allbinary.util.EnumerationUtil"] = EnumerationUtil

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

local JsType = java_lazy("jsinterop.annotations.JsType")
local Enumeration = java_lazy("java.util.Enumeration")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

--ArkTs does not have this.  So this is for the ArkTs build.
-- class table EnumerationUtil is declared before the requires
EnumerationUtil.__index = EnumerationUtil
EnumerationUtil.className = "EnumerationUtil"
EnumerationUtil.javaClassName = "org.allbinary.util.EnumerationUtil"

function EnumerationUtil._jinit(self)
    return self
end

function EnumerationUtil.new()
    return EnumerationUtil._jinit(setmetatable({}, EnumerationUtil))
end


function EnumerationUtil.getInstance()
        return EnumerationUtil.instance_f
end


function EnumerationUtil:hasMoreElements(enumeration)
        return enumeration:hasMoreElements()
end


function EnumerationUtil:nextElement(enumeration)
        return enumeration:nextElement()
end


function EnumerationUtil:getAsArray(enumeration)
        local basicArrayList = BasicArrayListD.new()
        while self:hasMoreElements(enumeration) do
            basicArrayList:add(self:nextElement(enumeration))
        end
        return basicArrayList:toArray()
end

EnumerationUtil.instance_f = EnumerationUtil.new()

return EnumerationUtil

