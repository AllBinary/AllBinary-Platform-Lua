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

local NullUtil = require("org.allbinary.logic.NullUtil")
local TimeStampUtil = require("org.allbinary.time.TimeStampUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local ExceptionUtil = require("org.allbinary.logic.java.exception.ExceptionUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local LogFormatUtil = {}
LogFormatUtil.__index = LogFormatUtil
LogFormatUtil.className = "LogFormatUtil"

function LogFormatUtil:_init_fields()
    self.timeStampUtil = TimeStampUtil.getInstance()
    self.commonSeps = CommonSeps.getInstance()
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
        return LogFormatUtil.instance
end


function LogFormatUtil.new()
    local self = setmetatable({}, LogFormatUtil)
    self:_init_fields()
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
        if exception ~= self.nullUtil.NULL_OBJECT then
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.LOG_ERROR)
            local exceptionAsString = tostring(exception)
            if exceptionAsString ~= nil then
                stringBuffer:append(exceptionAsString)
            else
                stringBuffer:append(self.EMPTY)
            end
            stringBuffer:append(self.STACK_TRACE)
            if exception ~= self.nullUtil.NULL_OBJECT then
                stringBuffer:append(self.exceptionUtil:getStackTrace(exception))
            else
                stringBuffer:append(self.stringUtil.NULL_STRING)
            end
            return tostring(stringBuffer)
        else
            return StringUtil.getInstance().EMPTY_STRING
        end
end

LogFormatUtil.instance = LogFormatUtil.new()

return LogFormatUtil

