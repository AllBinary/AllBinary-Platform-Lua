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
-- package org.allbinary.logic.system.os.android

local AndroidOperatingSystemFactory = {}
package.loaded["org.allbinary.logic.system.os.android.AndroidOperatingSystemFactory"] = AndroidOperatingSystemFactory

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

local TsUtil = java_lazy("org.allbinary.TsUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local GenericOperatingSystem = java_lazy("org.allbinary.logic.system.os.GenericOperatingSystem")
local NoOperatingSystem = java_lazy("org.allbinary.logic.system.os.NoOperatingSystem")
local OperatingSystems = java_lazy("org.allbinary.logic.system.os.OperatingSystems")
local SystemProperties = java_lazy("org.allbinary.logic.system.os.SystemProperties")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local AndroidOS = java_lazy("org.allbinary.logic.system.os.android.AndroidOS")

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

-- class table AndroidOperatingSystemFactory is declared before the requires
AndroidOperatingSystemFactory.__index = AndroidOperatingSystemFactory
AndroidOperatingSystemFactory.className = "AndroidOperatingSystemFactory"
AndroidOperatingSystemFactory.javaClassName = "org.allbinary.logic.system.os.android.AndroidOperatingSystemFactory"

function AndroidOperatingSystemFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.tsUtil = TsUtil.getInstance()
end


function AndroidOperatingSystemFactory.getInstance()
        return AndroidOperatingSystemFactory.instance_f
end


function AndroidOperatingSystemFactory._jinit(self)
    AndroidOperatingSystemFactory._init_fields(self)
    return self
end

function AndroidOperatingSystemFactory.new(...)
    local self = setmetatable({}, AndroidOperatingSystemFactory)
    AndroidOperatingSystemFactory._jinit(self, ...)
    return self
end


-- throws Exception
function AndroidOperatingSystemFactory:getOperatingSystemInstance()
        local try_ok, try_error, try_value = pcall(function()
            local GenericOperatingSystem = nil
            local systemProperties = SystemProperties.getInstance()
            local osName = systemProperties:getName()
            if rawequal(self.tsUtil:compareTo(osName, OperatingSystems.getInstance().ANDROID), 0) then
                GenericOperatingSystem = AndroidOS.new()
            else
                if OperatingSystems.getInstance():isUnknownSpecificOSAllowed() then
                    GenericOperatingSystem = AndroidOS.new()
                else
                    error(require("java.lang.Exception").new(require("allbinary_java").to_string("Specific Android OS Not Supported: ") .. require("allbinary_java").to_string(osName)), 0)
                end
            end
            do return "__jreturn", GenericOperatingSystem end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put("Failed to get OperatingSystem returning NoOperatingSystem", self, commonStrings.GET_INSTANCE, e)
            return NoOperatingSystem.NO_OPERATING_SYSTEM
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AndroidOperatingSystemFactory.instance_f = AndroidOperatingSystemFactory.new()

return AndroidOperatingSystemFactory

