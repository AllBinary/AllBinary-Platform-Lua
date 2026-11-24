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
-- package org.allbinary

local TsUtil = {}
package.loaded["org.allbinary.TsUtil"] = TsUtil

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

-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local Form = require("javax.microedition.lcdui.Form")
-- local InvalidRecordIDException = require("javax.microedition.rms.InvalidRecordIDException")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
-- local RecordStoreException = require("javax.microedition.rms.RecordStoreException")
-- local RecordStoreNotOpenException = require("javax.microedition.rms.RecordStoreNotOpenException")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")

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

local function java_instanceof(object, class)
    class = java_real(class)
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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--J2ME
-- class table TsUtil is declared before the requires
TsUtil.__index = TsUtil
TsUtil.className = "TsUtil"
TsUtil.javaClassName = "org.allbinary.TsUtil"

function TsUtil._jinit(self)
    return self
end

function TsUtil.new()
    return TsUtil._jinit(setmetatable({}, TsUtil))
end


function TsUtil.getInstance()
        return TsUtil.instance_f
end


function TsUtil:hashCode(anyType)
        return anyType:hashCode()
end


-- throws InterruptedException
function TsUtil:waitFor(any, timeoutMillis)
        local anyType = any
        anyType:wait(timeoutMillis)
end


-- throws RecordStoreNotOpenException, InvalidRecordIDException, RecordStoreException
function TsUtil:getRecord(anyType, recordId)
        local recordStore = anyType
        local data = nil
        do -- synchronized (self)
            data = java_typed_array("B", java_new_array(0, recordStore:getRecordSize(recordId)))
            recordStore:getRecord(recordId, data, 0)
        end
        return (function() if (data.n or #data) < 1 then return NullUtil.getInstance().NULL_BYTE_ARRAY else return data end end)()
end


function TsUtil:compareTo(a, b)
        return ((a < b and -1) or (a > b and 1) or 0)
end


function TsUtil:equalIgnoreCase(a, b)
        return (string.lower(a) == string.lower(b))
end


function TsUtil:equalsNotstring(anyType, object2)
        return anyType:equals(object2)
end


function TsUtil:toNumberFromChar(value)
        return string.byte(value)
end


function TsUtil:toNumber(value)
        return value
end


function TsUtil:getByteArray(string_)
        return {string.byte(string_, 1, -1)}
end


function TsUtil:isItemListener(owner)
        if java_instanceof(owner, Form) then
            return true
        else
            return false
        end
end


function TsUtil:printAvailableMethods(anyType)
end


function TsUtil:gc()
        collectgarbage()
end

TsUtil.instance_f = TsUtil.new()

return TsUtil

