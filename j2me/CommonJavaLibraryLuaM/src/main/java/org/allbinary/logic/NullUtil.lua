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
-- package org.allbinary.logic

local NullUtil = {}
package.loaded["org.allbinary.logic.NullUtil"] = NullUtil

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

--ActualPlatform
-- class table NullUtil is declared before the requires
NullUtil.__index = NullUtil
NullUtil.className = "NullUtil"
NullUtil.javaClassName = "org.allbinary.logic.NullUtil"

function NullUtil:_init_fields()
    self.NULL_OBJECT = {}
    self.NULL_CLASS = getmetatable(self.NULL_OBJECT)
    self.NULL_OBJECT_ARRAY = java_new_array(nil, 0)
    self.NULL_CHAR_ARRAY = java_new_array("\0", 0)
    self.NULL_BYTE_ARRAY = java_typed_array("B", java_new_array(0, 0))
    self.NULL_SHORT_ARRAY_ARRAY = java_new_array(0, 0, 0)
    self.NULL_INT_ARRAY = java_typed_array("I", java_new_array(0, 0))
    self.NULL_INT_ARRAY_ARRAY = java_new_array(0, 0, 0)
    self.NULL_INT_ARRAY_ARRAY_ARRAY = java_new_array(0, 0, 0, 0)
    self.NULL_FLOAT_ARRAY = java_typed_array("F", java_new_array(0.0, 0))
end

function NullUtil._jinit(self)
    NullUtil._init_fields(self)
    return self
end

function NullUtil.new()
    return NullUtil._jinit(setmetatable({}, NullUtil))
end


function NullUtil.getInstance()
        return NullUtil.instance_f
end

NullUtil.instance_f = NullUtil.new()

return NullUtil

