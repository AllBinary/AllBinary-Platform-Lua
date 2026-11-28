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
-- package org.allbinary.logic.java.exception

local ExceptionUtil = {}
package.loaded["org.allbinary.logic.java.exception.ExceptionUtil"] = ExceptionUtil

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
local PrintStream = java_lazy("java.io.PrintStream")

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
-- class table ExceptionUtil is declared before the requires
ExceptionUtil.__index = ExceptionUtil
ExceptionUtil.className = "ExceptionUtil"
ExceptionUtil.javaClassName = "org.allbinary.logic.java.exception.ExceptionUtil"

function ExceptionUtil:_init_fields()
    self.NONE = "No Stack Trace"
end


function ExceptionUtil.getInstance()
        return ExceptionUtil.instance_f
end


function ExceptionUtil._jinit(self)
    ExceptionUtil._init_fields(self)
    return self
end

function ExceptionUtil.new(...)
    local self = setmetatable({}, ExceptionUtil)
    ExceptionUtil._jinit(self, ...)
    return self
end


function ExceptionUtil:getStackTrace(e)
        if not rawequal(e, nil) then
            local byteArrayOutputStream = require("java.io.ByteArrayOutputStream").new()
            local printStream = PrintStream.new(byteArrayOutputStream)
            e:printStackTrace(printStream)
            local output = tostring(byteArrayOutputStream)
            return tostring(output)
        end
        return self.NONE
end

ExceptionUtil.instance_f = ExceptionUtil.new()
ExceptionUtil.PRETEND_EXCEPTION = require("java.lang.Exception").new("Not Really An Exception")

return ExceptionUtil

