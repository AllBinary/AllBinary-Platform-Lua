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
-- package org.allbinary.util

local HashtableUtil = {}
package.loaded["org.allbinary.util.HashtableUtil"] = HashtableUtil

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

local Enumeration = java_lazy("java.util.Enumeration")
local JsType = java_lazy("jsinterop.annotations.JsType")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListS = java_lazy("org.allbinary.util.BasicArrayListS")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")

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

-- class table HashtableUtil is declared before the requires
HashtableUtil.__index = HashtableUtil
HashtableUtil.className = "HashtableUtil"
HashtableUtil.javaClassName = "org.allbinary.util.HashtableUtil"

function HashtableUtil:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
end

function HashtableUtil._jinit(self)
    HashtableUtil._init_fields(self)
    return self
end

function HashtableUtil.new()
    return HashtableUtil._jinit(setmetatable({}, HashtableUtil))
end


function HashtableUtil.getInstance()
        return HashtableUtil.instance_f
end


function HashtableUtil:putAll(fromHashtable, hashtable)
        local enumeration = fromHashtable:keys()
        local keyCanBeNull = nil
        local valueCanBeNull = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            keyCanBeNull = self.enumerationUtil:nextElement(enumeration)
            valueCanBeNull = hashtable:get(keyCanBeNull)
            if rawequal(valueCanBeNull, nil) then
            else
                hashtable:put(keyCanBeNull, valueCanBeNull)
            end
        end
end


function HashtableUtil:getKeysAsArray(hashtable)
        local objectArray = java_new_array(nil, hashtable:size())
        local index = 0
        local enumeration = hashtable:keys()
        while self.enumerationUtil:hasMoreElements(enumeration) do
            objectArray[(function() local value = index index = value + 1 return value end)() + 1] = self.enumerationUtil:nextElement(enumeration)
        end
        return objectArray
end


function HashtableUtil:getKeysAsList(hashtable)
        local list = BasicArrayListS.new(hashtable:size())
        local enumeration = hashtable:keys()
        while self.enumerationUtil:hasMoreElements(enumeration) do
            list:add(self.enumerationUtil:nextElement(enumeration))
        end
        return list
end

HashtableUtil.instance_f = HashtableUtil.new()

return HashtableUtil

