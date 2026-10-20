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

local Log = require("org.allbinary.logic.communication.log.Log")
local LogFactory = require("org.allbinary.logic.communication.log.LogFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local LinuxOperatingSystemFactory = require("org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory")
local SolarisOperatingSystemFactory = require("org.allbinary.logic.system.os.solaris.SolarisOperatingSystemFactory")
local WindowsOperatingSystemFactory = require("org.allbinary.logic.system.os.windows.WindowsOperatingSystemFactory")
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
    self.commonStrings = CommonStrings.getInstance()
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
        local try_ok, try_error = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            local systemProperties = SystemProperties.getInstance()
            local osName = systemProperties:getName()
            local osArch = systemProperties:getArch()
            local osVersion = systemProperties:getVersion()
            if not self.hasDetected then
                self.logUtil:putF("osName: " .. osName, self, self.commonStrings.GET_INSTANCE)
                self.hasDetected = true
                if ((string.find(osName, operatingSystems.LINUX, 1, true) or 0) - 1) >= 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                        self.logUtil:putF("Found a Linux OS", self, self.commonStrings.GET_INSTANCE)
                    end
                    self.genericOperatingSystem = LinuxOperatingSystemFactory.getInstance():getOperatingSystemInstance()
                elseif ((string.find(osName, operatingSystems.WINDOWS, 1, true) or 0) - 1) >= 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                        self.logUtil:putF("Found a Windows OS", self, self.commonStrings.GET_INSTANCE)
                    end
                    self.genericOperatingSystem = WindowsOperatingSystemFactory.getInstance():getOperatingSystemInstance()
                elseif ((string.find(osName, operatingSystems.SOLARIS, 1, true) or 0) - 1) >= 0 then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                        self.logUtil:putF("Found a Solaris OS", self, self.commonStrings.GET_INSTANCE)
                    end
                    self.genericOperatingSystem = SolarisOperatingSystemFactory.getInstance():getOperatingSystemInstance()
                else
                    error(java_exception("Exception", tostring(StringMaker.new():append("OS Not Supported: "):append(osName))), 0)
                end
                local log = LogFactory.getInstanceF(tostring(StringMaker.new():append("OperatingSystem Info: "):append(StringUtil.getInstance():toString(self.genericOperatingSystem))), self, self.commonStrings.GET_INSTANCE)
                print(tostring(log))
                self.logUtil:putL(log)
            end
            return self.genericOperatingSystem
        end)
        if not try_ok then
            local e = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            return NoOperatingSystem.NO_OPERATING_SYSTEM
        end
end

OperatingSystemFactory.instance = OperatingSystemFactory.new()

return OperatingSystemFactory

