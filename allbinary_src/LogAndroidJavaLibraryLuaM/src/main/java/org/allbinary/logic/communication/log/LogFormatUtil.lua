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
-- class table LogFormatUtil is declared before the requires
LogFormatUtil.__index = LogFormatUtil
LogFormatUtil.className = "LogFormatUtil"
LogFormatUtil.javaClassName = "org.allbinary.logic.communication.log.LogFormatUtil"

function LogFormatUtil:_init_fields()
    self.timeStampUtil = TimeStampUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.NONE = "None"
    self.LOG_ERROR = "\nLog-Error: "
    self.EMPTY = "Empty"
    self.STACK_TRACE = "\nStack Trace: "
    self.TIME = "Time: "
    self.CLASS_NAME = self.commonSeps.SPACE
    self.FUNCTION_CALL = CommonLabels.getInstance().COLON_SEP
    self.SPECIAL_MESSAGE = "> "
    self.stringUtil = StringUtil.getInstance()
    self.exceptionUtil = ExceptionUtil.getInstance()
    self.nullUtil = NullUtil.getInstance()
end


function LogFormatUtil.getInstance()
        return LogFormatUtil.instance_f
end


function LogFormatUtil._jinit(self)
    LogFormatUtil._init_fields(self)
    return self
end

function LogFormatUtil.new(...)
    local self = setmetatable({}, LogFormatUtil)
    LogFormatUtil._jinit(self, ...)
    return self
end


function LogFormatUtil:get(className, functionName, specialMessage, exception)
        local stringBuffer = self:getF(className, functionName)
        stringBuffer:append(self:getO(exception))
        stringBuffer:append(self.SPECIAL_MESSAGE)
        stringBuffer:append(specialMessage)
        stringBuffer:append(self.commonSeps.NEW_LINE)
        return tostring(stringBuffer)
end


function LogFormatUtil:getS(className, functionName, specialMessage)
        local stringBuffer = self:getF(className, functionName)
        stringBuffer:append(self.SPECIAL_MESSAGE)
        stringBuffer:append(specialMessage)
        stringBuffer:append(self.commonSeps.NEW_LINE)
        return tostring(stringBuffer)
end


function LogFormatUtil:getF(className, functionName)
        if rawequal(functionName, nil) then
            functionName = self.NONE
        end
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.TIME)
        stringBuffer:append(self.timeStampUtil:getAsString())
        stringBuffer:append(self.CLASS_NAME)
        stringBuffer:append(className)
        stringBuffer:append(self.FUNCTION_CALL)
        stringBuffer:append(functionName)
        return stringBuffer
end


function LogFormatUtil:getO(exception)
        if not rawequal(exception, self.nullUtil.NULL_OBJECT) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.LOG_ERROR)
            local exceptionAsString = tostring(exception)
            if not rawequal(exceptionAsString, nil) then
                stringBuffer:append(exceptionAsString)
            else
                stringBuffer:append(self.EMPTY)
            end
            stringBuffer:append(self.STACK_TRACE)
            if not rawequal(exception, self.nullUtil.NULL_OBJECT) then
                stringBuffer:append(self.exceptionUtil:getStackTrace(exception))
            else
                stringBuffer:append(self.stringUtil.NULL_STRING)
            end
            return tostring(stringBuffer)
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end

LogFormatUtil.instance_f = LogFormatUtil.new()

return LogFormatUtil

