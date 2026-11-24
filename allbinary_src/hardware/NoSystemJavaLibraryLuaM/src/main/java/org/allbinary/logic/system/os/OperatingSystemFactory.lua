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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    self.genericOperatingSystem = NoOperatingSystem.NO_OPERATING_SYSTEM
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
        local commonStrings = CommonStrings.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local osString = tostring(StringMaker.new():append("OperatingSystem Info: "):append(tostring(self.genericOperatingSystem)))
            print(osString)
            self.logUtil:putF(osString, self, commonStrings.GET_INSTANCE)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.genericOperatingSystem
end

OperatingSystemFactory.instance_f = OperatingSystemFactory.new()

return OperatingSystemFactory

