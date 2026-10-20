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
local ExceptionUtil = require("org.allbinary.logic.java.exception.ExceptionUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local TimeStampUtil = require("org.allbinary.time.TimeStampUtil")

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
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--NoPlatform
local LogFormatUtil = {}
LogFormatUtil.__index = LogFormatUtil
LogFormatUtil.className = "LogFormatUtil"


function LogFormatUtil.getInstance()
        return LogFormatUtil.instance
end


function LogFormatUtil.new()
    local self = setmetatable({}, LogFormatUtil)
    return self
end


function LogFormatUtil:get(className, functionName, specialMessage, exception)
        error(java_exception("RuntimeException"), 0)
end


function LogFormatUtil:getS(className, functionName, specialMessage)
        error(java_exception("RuntimeException"), 0)
end


function LogFormatUtil:getO(exception)
        error(java_exception("RuntimeException"), 0)
end

LogFormatUtil.instance = LogFormatUtil.new()

return LogFormatUtil

