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
    self.LABEL = "org.allbinary"
    self.LOG_SUCCESS = "org.allbinary: "
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
        if log ~= nil then
            self:put(specialMessage, anyType, functionName, exception)
        end
end


function LogUtil:putF(specialMessage, anyType, functionName)
end


function LogUtil:putFS(specialMessage, className, functionName)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local className = self.LABEL
        className = getmetatable(anyType).className
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        android.util.Log:i(self.LABEL, self.LOG_SUCCESS .. message)
end

LogUtil.instance = LogUtil.new()

return LogUtil

