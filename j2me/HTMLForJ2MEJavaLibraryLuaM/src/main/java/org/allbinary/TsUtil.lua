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

-- local Displayable = require("javax.microedition.lcdui.Displayable")
-- local Form = require("javax.microedition.lcdui.Form")
-- local InvalidRecordIDException = require("javax.microedition.rms.InvalidRecordIDException")
-- local RecordStore = require("javax.microedition.rms.RecordStore")
-- local RecordStoreException = require("javax.microedition.rms.RecordStoreException")
-- local RecordStoreNotOpenException = require("javax.microedition.rms.RecordStoreNotOpenException")
local NullUtil = require("org.allbinary.logic.NullUtil")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_instanceof(object, class)
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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--HTML
local TsUtil = {}
TsUtil.__index = TsUtil
TsUtil.className = "TsUtil"

function TsUtil.new()
    local self = setmetatable({}, TsUtil)
    return self
end


function TsUtil.getInstance()
        return TsUtil.instance
end


function TsUtil:hashCode(anyType)
        return anyType:hashCode()
end


-- throws InterruptedException
function TsUtil:waitFor(any, timeoutMillis)
        error(java_exception("RuntimeException"), 0)
end


-- throws RecordStoreNotOpenException, InvalidRecordIDException, RecordStoreException
function TsUtil:getRecord(anyType, recordId)
        local recordStore = anyType
        local data = nil
        do -- synchronized (self)
            data = java_new_array(0, recordStore:getRecordSize(recordId))
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


function TsUtil:getByteArray(string)
        return {string.byte(string, 1, -1)}
end


function TsUtil:isItemListener(owner)
        if java_instanceof(owner, Form) then
            return true
        else
            return false
        end
end


function TsUtil:gc()
end

TsUtil.instance = TsUtil.new()

return TsUtil

