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

local TsUtil = require("org.allbinary.logic.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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
    self.logFormatUtil = LogFormatUtil.getInstance()
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
        local specialMessage = log:getSpecialMessage()
        local anyType = log:getObject()
        local functionName = log:getFunctionName()
        local exception = log:getThrowable()
        self:put(specialMessage, anyType, functionName, exception)
end


function LogUtil:putF(specialMessage, anyType, functionName)
        local className = CommonStrings.getInstance().EMPTY
        if getmetatable(anyType).className ~= nil then
            className = tostring(tostring(StringMaker.new():append(getmetatable(anyType).className):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(anyType)))))
        end
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        io.write(tostring(LogUtil.LOG_SUCCESS))
        print(message)
end


function LogUtil:putFS(specialMessage, className, functionName)
        className = tostring(tostring(StringMaker.new():append(className):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(self.anyType)))))
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        io.write(tostring(LogUtil.LOG_SUCCESS))
        print(message)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local className = CommonStrings.getInstance().EMPTY
        if getmetatable(anyType).className ~= nil then
            className = tostring(tostring(StringMaker.new():append(getmetatable(anyType).className):append(CommonSeps.getInstance().COLON):append(string.format("%x", TsUtil.getInstance():hashCode(anyType)))))
        end
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        io.write(tostring(LogUtil.LOG_SUCCESS))
        print(message)
end

LogUtil.instance = LogUtil.new()
LogUtil.LOG_SUCCESS = "org.allbinary: "

return LogUtil

