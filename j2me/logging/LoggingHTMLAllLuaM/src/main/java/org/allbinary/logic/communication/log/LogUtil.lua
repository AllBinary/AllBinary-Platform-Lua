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

local CommonStrings = require("org.allbinary.string.CommonStrings")
local PlayN = require("playn.core.PlayN")

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
    self.LOG_SUCCESS = "org.allbinary: "
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
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        PlayN.log():debug(self.LOG_SUCCESS .. message)
end


function LogUtil:putFS(specialMessage, className, functionName)
        local message = self.logFormatUtil:getS(className, functionName, specialMessage)
        PlayN.log():debug(self.LOG_SUCCESS .. message)
end


function LogUtil:put(specialMessage, anyType, functionName, exception)
        local className = PreLogUtil.getClassName(anyType)
        if className == nil then
            className = CommonStrings.getInstance().EMPTY
        end
        local message = self.logFormatUtil:get(className, functionName, specialMessage, exception)
        if exception ~= nil then
            PlayN.log():error(self.LOG_SUCCESS .. message, exception)
        else
            PlayN.log():debug(self.LOG_SUCCESS .. message)
        end
end

LogUtil.instance = LogUtil.new()

return LogUtil

