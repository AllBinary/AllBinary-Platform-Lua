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

local OperatingSystemFactory = {}
package.loaded["org.allbinary.logic.system.os.OperatingSystemFactory"] = OperatingSystemFactory

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

local Log = java_lazy("org.allbinary.logic.communication.log.Log")
local LogFactory = java_lazy("org.allbinary.logic.communication.log.LogFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LinuxOperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory")
local SolarisOperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.solaris.SolarisOperatingSystemFactory")
local WindowsOperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.windows.WindowsOperatingSystemFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table OperatingSystemFactory is declared before the requires
OperatingSystemFactory.__index = OperatingSystemFactory
OperatingSystemFactory.className = "OperatingSystemFactory"
OperatingSystemFactory.javaClassName = "org.allbinary.logic.system.os.OperatingSystemFactory"

function OperatingSystemFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.genericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM
    self.hasDetected = false
end


function OperatingSystemFactory.getInstance()
        return OperatingSystemFactory.instance_f
end


function OperatingSystemFactory._jinit(self)
    OperatingSystemFactory._init_fields(self)
    return self
end

function OperatingSystemFactory.new(...)
    local self = setmetatable({}, OperatingSystemFactory)
    OperatingSystemFactory._jinit(self, ...)
    return self
end


function OperatingSystemFactory:getOperatingSystemInstance()
        local try_ok, try_error, try_value = pcall(function()
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
                    error(require("java.lang.Exception").new(tostring(StringMaker.new():append("OS Not Supported: "):append(osName))), 0)
                end
                local log = LogFactory.getInstanceF(tostring(StringMaker.new():append("OperatingSystem Info: "):append(StringUtil.getInstance():toString(self.genericOperatingSystem))), self, self.commonStrings.GET_INSTANCE)
                print(tostring(log))
                self.logUtil:putL(log)
            end
            do return "__jreturn", self.genericOperatingSystem end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            return NoOperatingSystem.NO_OPERATING_SYSTEM
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

OperatingSystemFactory.instance_f = OperatingSystemFactory.new()

return OperatingSystemFactory

