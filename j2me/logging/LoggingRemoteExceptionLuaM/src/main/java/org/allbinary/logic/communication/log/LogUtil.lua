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

-- local IOException = require("java.io.IOException")
local XmlRpcException = require("org.apache.xmlrpc.XmlRpcException")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local SpecialMessageUtil = require("org.allbinary.canvas.SpecialMessageUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")

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

--ActualPlatform
local LogUtil = {}
LogUtil.__index = LogUtil
LogUtil.className = "LogUtil"

function LogUtil:_init_fields()
    self.MESSAGE = "message"
    self.isFirstException = true
    self.timeDelayHelper = TimeDelayHelper.new(200000)
    self.abeClientInformation = nil
    self.stringBuffer = StringMaker.new()
end


function LogUtil.getInstance()
        return LogUtil.instance
end


function LogUtil.new()
    local self = setmetatable({}, LogUtil)
    self:_init_fields()
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


-- Java overloaded method: Lua keeps the last definition
function LogUtil:putF(specialMessage, className, functionName)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        if exception ~= nil then
            if getmetatable(exception).className:compareTo(XmlRpcException:getName()) == 0 then
                return
            end
            if getmetatable(exception).className:compareTo(IOException:getName()) == 0 then
                return
            end
            if self.isFirstException or self.timeDelayHelper:isTimeTNT() then
                local className = CommonStrings.getInstance().EMPTY
                self.isFirstException = false
                if anyType ~= nil and getmetatable(anyType).className ~= nil then
                    className = tostring(getmetatable(anyType).className)
                end
                local message = LogFormatUtil.getInstance():get(className, functionName, specialMessage, exception)
                local try_ok, try_error = pcall(function()
                    print("Eeeek")
                    if self.abeClientInformation == nil then
                        error(java_exception("RuntimeException"), 0)
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
                    print("Exception")
                    print(debug.traceback(tostring(e)))
                end
            end
        end
end

LogUtil.instance = LogUtil.new()

return LogUtil

