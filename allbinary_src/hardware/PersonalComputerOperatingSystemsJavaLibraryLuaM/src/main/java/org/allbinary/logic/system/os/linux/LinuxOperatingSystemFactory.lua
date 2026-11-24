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
-- package org.allbinary.logic.system.os.linux

local LinuxOperatingSystemFactory = {}
package.loaded["org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory"] = LinuxOperatingSystemFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local NoOperatingSystem = java_lazy("org.allbinary.logic.system.os.NoOperatingSystem")
local OperatingSystems = java_lazy("org.allbinary.logic.system.os.OperatingSystems")
local SystemProperties = java_lazy("org.allbinary.logic.system.os.SystemProperties")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LinuxOS = java_lazy("org.allbinary.logic.system.os.linux.LinuxOS")

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

-- class table LinuxOperatingSystemFactory is declared before the requires
LinuxOperatingSystemFactory.__index = LinuxOperatingSystemFactory
LinuxOperatingSystemFactory.className = "LinuxOperatingSystemFactory"
LinuxOperatingSystemFactory.javaClassName = "org.allbinary.logic.system.os.linux.LinuxOperatingSystemFactory"

function LinuxOperatingSystemFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function LinuxOperatingSystemFactory.getInstance()
        return LinuxOperatingSystemFactory.instance_f
end


function LinuxOperatingSystemFactory._jinit(self)
    LinuxOperatingSystemFactory._init_fields(self)
    return self
end

function LinuxOperatingSystemFactory.new(...)
    local self = setmetatable({}, LinuxOperatingSystemFactory)
    LinuxOperatingSystemFactory._jinit(self, ...)
    return self
end


function LinuxOperatingSystemFactory:getOperatingSystemInstance()
        local try_ok, try_error, try_value = pcall(function()
            local operatingSystems = OperatingSystems.getInstance()
            local osName = SystemProperties.getInstance():getName()
            local operatingSystemInterface = nil
            if ((osName < operatingSystems.LINUX and -1) or (osName > operatingSystems.LINUX and 1) or 0) == 0 then
                operatingSystemInterface = LinuxOS.new()
            else
                if operatingSystems:isUnknownSpecificOSAllowed() then
                    operatingSystemInterface = LinuxOS.new()
                else
                    error(require("java.lang.Exception").new("Specific Linux OS Not Supported: " .. osName), 0)
                end
            end
            do return "__jreturn", operatingSystemInterface end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().FACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
            end
            return NoOperatingSystem.NO_OPERATING_SYSTEM
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

LinuxOperatingSystemFactory.instance_f = LinuxOperatingSystemFactory.new()

return LinuxOperatingSystemFactory

