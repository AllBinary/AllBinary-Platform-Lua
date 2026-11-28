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

local LogUtil = {}
package.loaded["org.allbinary.logic.communication.log.LogUtil"] = LogUtil

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Log = java_lazy("org.allbinary.logic.communication.log.Log")
local LogFormatUtil = java_lazy("org.allbinary.logic.communication.log.LogFormatUtil")

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
-- class table LogUtil is declared before the requires
LogUtil.__index = LogUtil
LogUtil.className = "LogUtil"
LogUtil.javaClassName = "org.allbinary.logic.communication.log.LogUtil"

function LogUtil:_init_fields()
    self.logFormatUtil = LogFormatUtil.getInstance()
    self.LOG_SUCCESS = "org.allbinary: "
end


function LogUtil.getInstance()
        return LogUtil.instance_f
end


function LogUtil._jinit(self)
    LogUtil._init_fields(self)
    return self
end

function LogUtil.new(...)
    local self = setmetatable({}, LogUtil)
    LogUtil._jinit(self, ...)
    return self
end


function LogUtil:putL(log)
        local specialMessage = log:getSpecialMessage()
        local anyType = log:getObject()
        local functionName = log:getFunctionName()
        local exception = log:getThrowable()
        self:put(specialMessage, anyType, functionName, exception)
end


function LogUtil:putF(specialMessage, anyType, functionName)
        local className = CommonStrings.getInstance().EMPTY
        if not rawequal((getmetatable(anyType).javaClassName or getmetatable(anyType).className), nil) then
            className = tostring(tostring(StringMaker.new():append((getmetatable(anyType).javaClassName or getmetatable(anyType).className)):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(anyType)))))
        end
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        io.write(tostring(self.LOG_SUCCESS))
        print(message)
end


function LogUtil:putFS(specialMessage, className, functionName)
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        io.write(tostring(self.LOG_SUCCESS))
        print(message)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local className = CommonStrings.getInstance().EMPTY
        if not rawequal((getmetatable(anyType).javaClassName or getmetatable(anyType).className), nil) then
            local hashCodeValue = TsUtil.getInstance():hashCode(anyType)
            local hexString = string.format("%x", hashCodeValue)
            className = tostring(tostring(StringMaker.new():append((getmetatable(anyType).javaClassName or getmetatable(anyType).className)):append(CommonSeps.getInstance().COLON):append(hexString)))
        end
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        io.write(tostring(self.LOG_SUCCESS))
        print(message)
end

LogUtil.instance_f = LogUtil.new()

return LogUtil

