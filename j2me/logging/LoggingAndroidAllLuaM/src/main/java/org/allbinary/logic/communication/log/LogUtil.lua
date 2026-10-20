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
local TsUtil = require("org.allbinary.TsUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")

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
    self.commonSeps = CommonSeps.getInstance()
    self.logFormatUtil = LogFormatUtil.getInstance()
    self.LABEL = "org.allbinary"
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
        self:put(specialMessage, anyType, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function LogUtil:putFS(specialMessage, string, functionName)
        self:putS(specialMessage, string, functionName, NullUtil.getInstance().NULL_OBJECT)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local className = self.LABEL
        className = tostring(tostring(StringMaker.new():append(getmetatable(anyType).className):append(self.commonSeps.COLON):append(string.format("%x", TsUtil.getInstance():hashCode(anyType)))))
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        android.util.Log:i(self.LABEL, message)
end


function LogUtil:putS(specialMessage, string, functionName, exception)
        local className = self.LABEL
        className = tostring(tostring(StringMaker.new():append(string):append(self.commonSeps.COLON):append(string.format("%x", TsUtil.getInstance():hashCode(string)))))
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        android.util.Log:i(self.LABEL, message)
end

LogUtil.instance = LogUtil.new()

return LogUtil

