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
-- package org.allbinary.logic.io

local LineReader = {}
package.loaded["org.allbinary.logic.io.LineReader"] = LineReader

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

-- local DataInputStream = require("java.io.DataInputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table LineReader is declared before the requires
LineReader.__index = LineReader
LineReader.className = "LineReader"
LineReader.javaClassName = "org.allbinary.logic.io.LineReader"

function LineReader:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.fileName == nil then self.fileName = nil end
    if self.string_ == nil then self.string_ = nil end
    self.index = 0
    if self.idFile == nil then self.idFile = nil end
    if self.idData == nil then self.idData = nil end
end


function LineReader._jinit(self, fileName)
    LineReader._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            local bytes = java_typed_array("B", java_new_array(0, 100000))
            self.fileName = fileName
            self.idFile = AbFileInputStream.new(fileName)
            self.idFile:read(bytes)
            self.string_ = string.char(table.unpack(bytes))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put("File: " .. fileName, self, "LineReader", e)
            do
            end
        end
    return self
end

function LineReader.new(...)
    local self = setmetatable({}, LineReader)
    LineReader._jinit(self, ...)
    return self
end


function LineReader:hasNext()
        local try_ok, try_error, try_value = pcall(function()
            local nextIndex = ((string.find(self.string_, CommonSeps.getInstance().NEW_LINE, (self.index) + 1, true) or 0) - 1)
            if nextIndex == -1 then
                do return "__jreturn", false end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "hasNext", e)
            do
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function LineReader:next()
        local try_ok, try_error, try_value = pcall(function()
            local nextIndex = ((string.find(self.string_, CommonSeps.getInstance().NEW_LINE, (self.index) + 1, true) or 0) - 1)
            if nextIndex == -1 then
                error(require("java.lang.Exception").new("next() should have been called first"), 0)
            end
            local temp = string.sub(self.string_, (self.index) + 1, nextIndex)
            self.index = nextIndex + 1
            do return "__jreturn", temp end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "next", e)
            do
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return LineReader

