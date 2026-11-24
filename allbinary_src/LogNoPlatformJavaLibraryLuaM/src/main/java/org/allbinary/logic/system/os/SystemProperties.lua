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

local SystemProperties = {}
package.loaded["org.allbinary.logic.system.os.SystemProperties"] = SystemProperties

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

--NoPlatform
-- class table SystemProperties is declared before the requires
SystemProperties.__index = SystemProperties
SystemProperties.className = "SystemProperties"
SystemProperties.javaClassName = "org.allbinary.logic.system.os.SystemProperties"


function SystemProperties.getInstance()
        return SystemProperties.instance_f
end


function SystemProperties._jinit(self)
    return self
end

function SystemProperties.new(...)
    local self = setmetatable({}, SystemProperties)
    SystemProperties._jinit(self, ...)
    return self
end


function SystemProperties:getName()
        error(require("java.lang.RuntimeException").new(), 0)
end


function SystemProperties:getArch()
        error(require("java.lang.RuntimeException").new(), 0)
end


function SystemProperties:getVersion()
        error(require("java.lang.RuntimeException").new(), 0)
end


function SystemProperties:getUserHomePath()
        error(require("java.lang.RuntimeException").new(), 0)
end

SystemProperties.instance_f = SystemProperties.new()

return SystemProperties

