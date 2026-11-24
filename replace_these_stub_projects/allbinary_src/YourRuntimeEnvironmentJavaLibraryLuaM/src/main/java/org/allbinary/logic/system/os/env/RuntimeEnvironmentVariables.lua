-- Generated Code Do Not Modify
-- package org.allbinary.logic.system.os.env

local RuntimeEnvironmentVariables = {}
package.loaded["org.allbinary.logic.system.os.env.RuntimeEnvironmentVariables"] = RuntimeEnvironmentVariables

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

-- local BufferedReader = require("java.io.BufferedReader")
-- local InputStreamReader = require("java.io.InputStreamReader")
-- local Properties = require("java.util.Properties")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local OperatingSystemFactory = java_lazy("org.allbinary.logic.system.os.OperatingSystemFactory")
local OperatingSystems = java_lazy("org.allbinary.logic.system.os.OperatingSystems")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table RuntimeEnvironmentVariables is declared before the requires
RuntimeEnvironmentVariables.__index = RuntimeEnvironmentVariables
RuntimeEnvironmentVariables.className = "RuntimeEnvironmentVariables"
RuntimeEnvironmentVariables.javaClassName = "org.allbinary.logic.system.os.env.RuntimeEnvironmentVariables"

function RuntimeEnvironmentVariables:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function RuntimeEnvironmentVariables._jinit(self)
    RuntimeEnvironmentVariables._init_fields(self)
    return self
end

function RuntimeEnvironmentVariables.new(...)
    local self = setmetatable({}, RuntimeEnvironmentVariables)
    RuntimeEnvironmentVariables._jinit(self, ...)
    return self
end


function RuntimeEnvironmentVariables:getTest1()
        return require("java.lang.System").getProperty("java.java.home")
end


function RuntimeEnvironmentVariables:getVariable(var)
        local environmentVariables = self:get()
        return environmentVariables:getProperty(var)
end


function RuntimeEnvironmentVariables:get()
        local try_ok, try_error, try_value = pcall(function()
            local process = nil
            local environmentVariables = Properties.new()
            local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
            local osName = operatingSystemInterface:getName()
            local linuxCommand = "env"
            local windowsCommand = "cmd.exe /c set"
            local solarisCommand = linuxCommand
            local operatingSystems = OperatingSystems.getInstance()
            if ((osName < operatingSystems.LINUX and -1) or (osName > operatingSystems.LINUX and 1) or 0) == 0 then
                process = require("java.lang.Runtime").getRuntime():exec(linuxCommand)
            elseif ((string.find(osName, operatingSystems.WINDOWS, 1, true) or 0) - 1) >= 0 then
                process = require("java.lang.Runtime").getRuntime():exec(windowsCommand)
            elseif ((osName < operatingSystems.SOLARIS and -1) or (osName > operatingSystems.SOLARIS and 1) or 0) == 0 then
                process = require("java.lang.Runtime").getRuntime():exec(solarisCommand)
            else
                error(require("java.lang.Exception").new(), 0)
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
            do return "__jreturn", environmentVariables end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "get()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:getTempDir()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", require("java.lang.System").getProperty("java.io.tmpdir") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getTempDir()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:getLibraryPath()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", require("java.lang.System").getProperty("java.library.path") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getLibraryPath()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:getClassPath()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", require("java.lang.System").getProperty("java.class.path") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getClassPath()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:updateLibraryPath(libPath)
        local try_ok, try_error, try_value = pcall(function()
            local existingPath = self:getLibraryPath()
            require("java.lang.System").setProperty("java.library.path", libPath .. ":" .. existingPath)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "updateLibraryPath()", e)
            end
        end
end


function RuntimeEnvironmentVariables:getUserHome()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", require("java.lang.System").getProperty("user.home") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getUserHome()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:getUserDir()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", require("java.lang.System").getProperty("user.dir") end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getUserDir()", e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function RuntimeEnvironmentVariables:set()
        local try_ok, try_error, try_value = pcall(function()
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "get()", e)
            end
        end
end


function RuntimeEnvironmentVariables:setVariable(var, val)
        local try_ok, try_error, try_value = pcall(function()
            local process = nil
            local operatingSystemInterface = OperatingSystemFactory.getInstance():getOperatingSystemInstance()
            local operatingSystems = OperatingSystems.getInstance()
            local osName = operatingSystemInterface:getName()
            local windowsCommand = "cmd.exe /c set" .. var .. "=" .. val
            if ((osName < operatingSystems.LINUX and -1) or (osName > operatingSystems.LINUX and 1) or 0) == 0 then
                error(require("java.lang.Exception").new(), 0)
            elseif ((string.find(osName, operatingSystems.WINDOWS, 1, true) or 0) - 1) >= 0 then
                process = require("java.lang.Runtime").getRuntime():exec(windowsCommand)
            elseif ((osName < operatingSystems.SOLARIS and -1) or (osName > operatingSystems.SOLARIS and 1) or 0) == 0 then
                error(require("java.lang.Exception").new(), 0)
            else
                error(require("java.lang.Exception").new(), 0)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().OSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "setVariable()", e)
            end
        end
end

return RuntimeEnvironmentVariables

