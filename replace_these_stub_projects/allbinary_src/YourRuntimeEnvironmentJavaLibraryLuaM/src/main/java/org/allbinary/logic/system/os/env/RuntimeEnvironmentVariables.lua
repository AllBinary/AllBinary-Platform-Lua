-- Generated Code Do Not Modify
-- package org.allbinary.logic.system.os.env

-- local BufferedReader = require("java.io.BufferedReader")
-- local InputStreamReader = require("java.io.InputStreamReader")
-- local Properties = require("java.util.Properties")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local GenericOperatingSystem = require("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = require("org.allbinary.logic.system.os.OperatingSystemFactory")
local OperatingSystems = require("org.allbinary.logic.system.os.OperatingSystems")
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

local RuntimeEnvironmentVariables = {}
RuntimeEnvironmentVariables.__index = RuntimeEnvironmentVariables
RuntimeEnvironmentVariables.className = "RuntimeEnvironmentVariables"

function RuntimeEnvironmentVariables:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function RuntimeEnvironmentVariables.new()
    local self = setmetatable({}, RuntimeEnvironmentVariables)
    self:_init_fields()
    return self
end


function RuntimeEnvironmentVariables:getTest1()
        return System.getProperty("java.java.home")
end


function RuntimeEnvironmentVariables:getVariable(var)
        local environmentVariables = self:get()
        return environmentVariables:getProperty(var)
end


function RuntimeEnvironmentVariables:get()
        local try_ok, try_error = pcall(function()
            local process = nil
            local environmentVariables = Properties.new()
            local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
            local osName = operatingSystemInterface:getName()
            local linuxCommand = "env"
            local windowsCommand = "cmd.exe /c set"
            local solarisCommand = linuxCommand
            local operatingSystems = OperatingSystems.getInstance()
            if ((osName < operatingSystems.LINUX and -1) or (osName > operatingSystems.LINUX and 1) or 0) == 0 then
                process = Runtime.getRuntime():exec(linuxCommand)
            elseif ((string.find(osName, operatingSystems.WINDOWS, 1, true) or 0) - 1) >= 0 then
                process = Runtime.getRuntime():exec(windowsCommand)
            elseif ((osName < operatingSystems.SOLARIS and -1) or (osName > operatingSystems.SOLARIS and 1) or 0) == 0 then
                process = Runtime.getRuntime():exec(solarisCommand)
            else
                error(java_exception("Exception"), 0)
            end
            local processInputStreamReader = InputStreamReader.new(process:getInputStream())
            local bufferedReader = BufferedReader.new(processInputStreamReader)
            local keyValuePair = nil
            while ((function() keyValuePair = bufferedReader:readLine() return keyValuePair end)()) ~= nil do
                local index = ((string.find(keyValuePair, "=", 1, true) or 0) - 1)
                local key = string.sub(keyValuePair, (0) + 1, index)
                local value = string.sub(keyValuePair, (index + 1) + 1)
                environmentVariables:put(key, value)
            end
            return environmentVariables
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "get()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:getTempDir()
        local try_ok, try_error = pcall(function()
            return System.getProperty("java.io.tmpdir")
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getTempDir()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:getLibraryPath()
        local try_ok, try_error = pcall(function()
            return System.getProperty("java.library.path")
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getLibraryPath()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:getClassPath()
        local try_ok, try_error = pcall(function()
            return System.getProperty("java.class.path")
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getClassPath()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:updateLibraryPath(libPath)
        local try_ok, try_error = pcall(function()
            local existingPath = self:getLibraryPath()
            System.setProperty("java.library.path", libPath .. ":" .. existingPath)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateLibraryPath()", e)
            end
        end
end


function RuntimeEnvironmentVariables:getUserHome()
        local try_ok, try_error = pcall(function()
            return System.getProperty("user.home")
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getUserHome()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:getUserDir()
        local try_ok, try_error = pcall(function()
            return System.getProperty("user.dir")
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getUserDir()", e)
            end
            return nil
        end
end


function RuntimeEnvironmentVariables:set()
        local try_ok, try_error = pcall(function()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "get()", e)
            end
        end
end


function RuntimeEnvironmentVariables:setVariable(var, val)
        local try_ok, try_error = pcall(function()
            local process = nil
            local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
            local operatingSystems = OperatingSystems.getInstance()
            local osName = operatingSystemInterface:getName()
            local windowsCommand = "cmd.exe /c set" .. var .. "=" .. val
            if ((osName < operatingSystems.LINUX and -1) or (osName > operatingSystems.LINUX and 1) or 0) == 0 then
                error(java_exception("Exception"), 0)
            elseif ((string.find(osName, operatingSystems.WINDOWS, 1, true) or 0) - 1) >= 0 then
                process = Runtime.getRuntime():exec(windowsCommand)
            elseif ((osName < operatingSystems.SOLARIS and -1) or (osName > operatingSystems.SOLARIS and 1) or 0) == 0 then
                error(java_exception("Exception"), 0)
            else
                error(java_exception("Exception"), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setVariable()", e)
            end
        end
end

return RuntimeEnvironmentVariables

