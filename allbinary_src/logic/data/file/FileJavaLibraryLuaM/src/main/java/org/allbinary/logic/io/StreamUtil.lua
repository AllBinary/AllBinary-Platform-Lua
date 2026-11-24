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

local StreamUtil = {}
package.loaded["org.allbinary.logic.io.StreamUtil"] = StreamUtil

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local Closeable = require("java.io.Closeable")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table StreamUtil is declared before the requires
StreamUtil.__index = StreamUtil
StreamUtil.className = "StreamUtil"
StreamUtil.javaClassName = "org.allbinary.logic.io.StreamUtil"

function StreamUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function StreamUtil.getInstance()
        return StreamUtil.instance_f
end


function StreamUtil._jinit(self)
    StreamUtil._init_fields(self)
    return self
end

function StreamUtil.new(...)
    local self = setmetatable({}, StreamUtil)
    StreamUtil._jinit(self, ...)
    return self
end


-- throws Exception
function StreamUtil:get(inputStream, outputStream, buffer)
        local len = 0
        while true do
            len = inputStream:read(buffer, 0, (buffer.n or #buffer))
            if len ~= -1 then
            else
                break
            end
            outputStream:write(buffer, 0, len)
        end
        return outputStream
end


-- throws Exception
function StreamUtil:getByteArray(inputStream, outputStream2, byteArray)
        local outputStream = outputStream2
        local try_ok, try_error, try_value = pcall(function()
            self:get(inputStream, outputStream, byteArray)
            do return "__jreturn", outputStream:toByteArray() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        do -- finally
            self:close(outputStream)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function StreamUtil:close(closeable)
        local try_ok, try_error, try_value = pcall(function()
            if closeable ~= nil then
                closeable:close()
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CLOSE, e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

StreamUtil.instance_f = StreamUtil.new()

return StreamUtil

