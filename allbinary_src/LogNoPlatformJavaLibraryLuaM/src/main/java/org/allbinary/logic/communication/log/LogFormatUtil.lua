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
-- package org.allbinary.logic.communication.log

local LogFormatUtil = {}
package.loaded["org.allbinary.logic.communication.log.LogFormatUtil"] = LogFormatUtil

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local ExceptionUtil = java_lazy("org.allbinary.logic.java.exception.ExceptionUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local TimeStampUtil = java_lazy("org.allbinary.time.TimeStampUtil")

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

--NoPlatform
-- class table LogFormatUtil is declared before the requires
LogFormatUtil.__index = LogFormatUtil
LogFormatUtil.className = "LogFormatUtil"
LogFormatUtil.javaClassName = "org.allbinary.logic.communication.log.LogFormatUtil"


function LogFormatUtil.getInstance()
        return LogFormatUtil.instance_f
end


function LogFormatUtil._jinit(self)
    return self
end

function LogFormatUtil.new(...)
    local self = setmetatable({}, LogFormatUtil)
    LogFormatUtil._jinit(self, ...)
    return self
end


function LogFormatUtil:get(className, functionName, specialMessage, exception)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LogFormatUtil:getS(className, functionName, specialMessage)
        error(require("java.lang.RuntimeException").new(), 0)
end


function LogFormatUtil:getO(exception)
        error(require("java.lang.RuntimeException").new(), 0)
end

LogFormatUtil.instance_f = LogFormatUtil.new()

return LogFormatUtil

