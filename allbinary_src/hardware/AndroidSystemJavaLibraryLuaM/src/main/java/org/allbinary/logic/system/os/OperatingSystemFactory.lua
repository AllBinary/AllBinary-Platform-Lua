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
-- package org.allbinary.logic.system.os

local AndroidOperatingSystemFactory = require("org.allbinary.logic.system.os.android.AndroidOperatingSystemFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local OperatingSystemFactory = {}
OperatingSystemFactory.__index = OperatingSystemFactory
OperatingSystemFactory.className = "OperatingSystemFactory"

function OperatingSystemFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.genericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM
    self.hasDetected = false
end


function OperatingSystemFactory.getInstance()
        return OperatingSystemFactory.instance
end


function OperatingSystemFactory.new()
    local self = setmetatable({}, OperatingSystemFactory)
    self:_init_fields()
    return self
end


function OperatingSystemFactory:getOperatingSystemInstance()
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error = pcall(function()
            local systemProperties = SystemProperties.getInstance()
            local osName = systemProperties:getName()
            if not self.hasDetected then
                self.hasDetected = true
                if ((string.find(osName, OperatingSystems.getInstance().ANDROID, 1, true) or 0) - 1) >= 0 then
                    self.logUtil:putF("Found a Android OS", self, commonStrings.GET_INSTANCE)
                    self.genericOperatingSystem = AndroidOperatingSystemFactory.getInstance():getOperatingSystemInstance()
                    self.logUtil:putF(tostring(StringMaker.new():append("Operating System Info: "):append(tostring(self.genericOperatingSystem))), self, commonStrings.GET_INSTANCE)
                elseif ((string.find(osName, OperatingSystems.getInstance().HARMONY, 1, true) or 0) - 1) >= 0 then
                    self.logUtil:putF("Found a Harmony OS", self, commonStrings.GET_INSTANCE)
                    self.genericOperatingSystem = AndroidOperatingSystemFactory.getInstance():getOperatingSystemInstance()
                    self.logUtil:putF(tostring(StringMaker.new():append("Operating System Info: "):append(tostring(self.genericOperatingSystem))), self, commonStrings.GET_INSTANCE)
                else
                    error(java_exception("Exception", tostring(StringMaker.new():append("OS Not Supported: "):append(osName))), 0)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.genericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.genericOperatingSystem
end

OperatingSystemFactory.instance = OperatingSystemFactory.new()

return OperatingSystemFactory

