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

local StdUtil = {}
package.loaded["org.allbinary.logic.StdUtil"] = StdUtil

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
local JsProperty = java_lazy("jsinterop.annotations.JsProperty")
local JsMethod = java_lazy("jsinterop.annotations.JsMethod")
local ABHashMap = java_lazy("org.allbinary.util.ABHashMap")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local ABStack = java_lazy("org.allbinary.util.ABStack")
local ABVector = java_lazy("org.allbinary.util.ABVector")

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
-- class table StdUtil is declared before the requires
StdUtil.__index = StdUtil
StdUtil.className = "StdUtil"
StdUtil.javaClassName = "org.allbinary.logic.StdUtil"

function StdUtil:_init_fields()
    self.EMPTY_VECTOR = self:createVector()
    self.NULL_TABLE = self:createHashtable()
    self.NULL_MAP = self:createHashMap()
end

function StdUtil._jinit(self)
    StdUtil._init_fields(self)
    return self
end

function StdUtil.new()
    return StdUtil._jinit(setmetatable({}, StdUtil))
end


function StdUtil.getInstance()
        return StdUtil.instance_f
end


function StdUtil:createStack()
        return ABStack.new()
end


function StdUtil:createVector()
        return ABVector.new()
end


function StdUtil:createHashtable()
        return ABHashtable.new()
end


function StdUtil:createHashMap()
        return ABHashMap.new()
end

StdUtil.instance_f = StdUtil.new()

return StdUtil

