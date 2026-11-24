-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.logic

local VectorUtil = {}
package.loaded["org.allbinary.logic.VectorUtil"] = VectorUtil

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

local Vector = java_lazy("java.util.Vector")
local JsType = java_lazy("jsinterop.annotations.JsType")

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

-- class table VectorUtil is declared before the requires
VectorUtil.__index = VectorUtil
VectorUtil.className = "VectorUtil"
VectorUtil.javaClassName = "org.allbinary.logic.VectorUtil"

function VectorUtil._jinit(self)
    return self
end

function VectorUtil.new()
    return VectorUtil._jinit(setmetatable({}, VectorUtil))
end


function VectorUtil.getInstance()
        return VectorUtil.instance_f
end


function VectorUtil:getSize(anyType)
        local vector = anyType
        return vector:size()
end


function VectorUtil:elementAt(anyType, index)
        local vector = anyType
        return vector:elementAt(index)
end

VectorUtil.instance_f = VectorUtil.new()

return VectorUtil

