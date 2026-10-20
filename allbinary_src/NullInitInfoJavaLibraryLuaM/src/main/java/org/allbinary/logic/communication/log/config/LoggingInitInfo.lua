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
-- package org.allbinary.logic.communication.log.config

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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

local LoggingInitInfo = {}
LoggingInitInfo.__index = LoggingInitInfo
LoggingInitInfo.className = "LoggingInitInfo"


function LoggingInitInfo.new()
    local self = setmetatable({}, LoggingInitInfo)
    return self
end


-- throws Exception
function LoggingInitInfo.write()
        local try_ok, try_error = pcall(function()
            LoggingInitInfo.hasRead = false
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


-- throws Exception
function LoggingInitInfo.read()
        local try_ok, try_error = pcall(function()
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end


function LoggingInitInfo.setHasRead(value)
        LoggingInitInfo.hasRead = value
end


-- throws Exception
function LoggingInitInfo.updateIfNeeded()
        if not LoggingInitInfo.hasRead then
            LoggingInitInfo.read()
            LoggingInitInfo.hasRead = true
            if LoggingInitInfo.logConfigInfoList == nil then
                error(java_exception("Exception", "Read Failed"), 0)
            end
        end
end


function LoggingInitInfo:isValid()
        local try_ok, try_error = pcall(function()
            return true
        end)
        if not try_ok then
            local e = try_error
            return false
        end
end


function LoggingInitInfo.set(logConfigInfoList)
        LoggingInitInfo.logConfigInfoList = logConfigInfoList
end


-- throws Exception
function LoggingInitInfo.get()
        LoggingInitInfo.updateIfNeeded()
        return LoggingInitInfo.logConfigInfoList
end


-- throws Exception
function LoggingInitInfo.getTypeList()
        LoggingInitInfo.updateIfNeeded()
        local allLogTypeVector = BasicArrayListD.new()
        local size = LoggingInitInfo.logConfigInfoList:size()
        for index = 0, size - 1 do
            local logConfigInfo = LoggingInitInfo.logConfigInfoList.objectArray[index + 1]
            local logTypeVector = logConfigInfo:getTypeVector()
            if logConfigInfo:isEnabled() then
                allLogTypeVector:addAllList(logTypeVector)
            end
        end
        return allLogTypeVector
end


-- throws Exception
function LoggingInitInfo:getNumberOfLogConfigs()
        return LoggingInitInfo.logConfigInfoList:size()
end


function LoggingInitInfo:toString()
        local try_ok, try_error = pcall(function()
            return nil
        end)
        if not try_ok then
            local e = try_error
            return "Error"
        end
end
LoggingInitInfo.__tostring = function(self) return self:toString() end

LoggingInitInfo.logConfigInfoList = nil
LoggingInitInfo.hasRead = false

return LoggingInitInfo

