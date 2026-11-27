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

-- local IOException = require("java.io.IOException")
local XmlRpcException = java_lazy("org.apache.xmlrpc.XmlRpcException")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local SpecialMessageUtil = java_lazy("org.allbinary.canvas.SpecialMessageUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local Log = java_lazy("org.allbinary.logic.communication.log.Log")
local LogFormatUtil = java_lazy("org.allbinary.logic.communication.log.LogFormatUtil")
local XmlRpcRemoteLogClient = java_lazy("org.allbinary.logic.communication.log.XmlRpcRemoteLogClient")

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
-- class table LogUtil is declared before the requires
LogUtil.__index = LogUtil
LogUtil.className = "LogUtil"
LogUtil.javaClassName = "org.allbinary.logic.communication.log.LogUtil"

function LogUtil:_init_fields()
    self.MESSAGE = "message"
    self.isFirstException = true
    self.timeDelayHelper = TimeDelayHelper.new(200000)
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
    self.stringBuffer = StringMaker.new()
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
        if log == nil then
            return
        end
        local specialMessage = log:getSpecialMessage()
        local anyType = log:getObject()
        local functionName = log:getFunctionName()
        local exception = log:getThrowable()
        self:put(specialMessage, anyType, functionName, exception)
end


function LogUtil:putF(specialMessage, anyType, functionName)
end


function LogUtil:putFS(specialMessage, className, functionName)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        if exception ~= nil then
            if (getmetatable(exception).javaClassName or getmetatable(exception).className):compareTo(XmlRpcException:getName()) == 0 then
                return
            end
            if (getmetatable(exception).javaClassName or getmetatable(exception).className):compareTo(IOException:getName()) == 0 then
                return
            end
            if self.isFirstException or self.timeDelayHelper:isTimeTNT() then
                local className = CommonStrings.getInstance().EMPTY
                self.isFirstException = false
                if anyType ~= nil and (getmetatable(anyType).javaClassName or getmetatable(anyType).className) ~= nil then
                    className = tostring((getmetatable(anyType).javaClassName or getmetatable(anyType).className))
                end
                local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
                local try_ok, try_error, try_value = pcall(function()
                    print("Eeeek")
                    if self.abeClientInformation == nil then
                        error(require("java.lang.RuntimeException").new(), 0)
                    end
                    local hashtable = self.abeClientInformation:toHashtable()
                    self.stringBuffer:delete(0, self.stringBuffer:length())
                    self.stringBuffer:append(message)
                    self.stringBuffer:append(CommonSeps.getInstance().SPACE)
                    self.stringBuffer:append(SpecialMessageUtil.getInstance():get())
                    hashtable:put(self.MESSAGE, tostring(self.stringBuffer))
                    XmlRpcRemoteLogClient.new(self.abeClientInformation):get(hashtable)
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    print("Exception")
                    print(debug.traceback(tostring(e)))
                end
            end
        end
end

LogUtil.instance_f = LogUtil.new()

return LogUtil

