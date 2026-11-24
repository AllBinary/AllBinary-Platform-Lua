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
-- package org.allbinary.logic.system.hardware.components.linux

local Monitor = {}
package.loaded["org.allbinary.logic.system.hardware.components.linux.Monitor"] = Monitor

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

local HardwareComponentInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local MonitorInterface = java_lazy("org.allbinary.logic.system.hardware.components.interfaces.MonitorInterface")

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

-- class table Monitor is declared before the requires
Monitor.__index = Monitor
Monitor.className = "Monitor"
Monitor.javaClassName = "org.allbinary.logic.system.hardware.components.linux.Monitor"
Monitor.java_implements = " HardwareComponentInterface MonitorInterface "
Monitor.java_interfaces = function() return {HardwareComponentInterface, MonitorInterface} end

function Monitor:_init_fields()
    if self.data == nil then self.data = nil end
end


function Monitor._jinit(self, data)
    Monitor._init_fields(self)
        self.data = data
    return self
end

function Monitor.new(...)
    local self = setmetatable({}, Monitor)
    Monitor._jinit(self, ...)
    return self
end


function Monitor:compareTo(componentInterface)
        return true
end


function Monitor:toString()
        return self.data
end
Monitor.__tostring = function(self) return self:toString() end

return Monitor

