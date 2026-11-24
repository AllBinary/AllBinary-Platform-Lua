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
-- package org.allbinary.logic.communication.java.vm.stats

local JvmStatistics = {}
package.loaded["org.allbinary.logic.communication.java.vm.stats.JvmStatistics"] = JvmStatistics

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

-- class table JvmStatistics is declared before the requires
JvmStatistics.__index = JvmStatistics
JvmStatistics.className = "JvmStatistics"
JvmStatistics.javaClassName = "org.allbinary.logic.communication.java.vm.stats.JvmStatistics"

function JvmStatistics:_init_fields()
    if self.runtime == nil then self.runtime = nil end
end


function JvmStatistics._jinit(self)
    JvmStatistics._init_fields(self)
        self.runtime = require("java.lang.Runtime").getRuntime()
    return self
end

function JvmStatistics.new(...)
    local self = setmetatable({}, JvmStatistics)
    JvmStatistics._jinit(self, ...)
    return self
end


function JvmStatistics:getFreeMemoryBytes()
        return self.runtime:freeMemory()
end


function JvmStatistics:getFreeMemoryKilobytes()
        return java_idiv(self:getFreeMemoryBytes(), 1024)
end


function JvmStatistics:getFreeMemoryMegabytes()
        return java_idiv(self:getFreeMemoryKilobytes(), 1024)
end


function JvmStatistics:getMaxMemoryBytes()
        return self.runtime:maxMemory()
end


function JvmStatistics:getMaxMemoryKilobytes()
        return java_idiv(self:getMaxMemoryBytes(), 1024)
end


function JvmStatistics:getMaxMemoryMegabytes()
        return java_idiv(self:getMaxMemoryKilobytes(), 1024)
end


function JvmStatistics:getTotalMemoryBytes()
        return self.runtime:totalMemory()
end


function JvmStatistics:getTotalMemoryKilobytes()
        return java_idiv(self:getTotalMemoryBytes(), 1024)
end


function JvmStatistics:getTotalMemoryMegabytes()
        return java_idiv(self:getTotalMemoryKilobytes(), 1024)
end


function JvmStatistics:getFreeMemoryBytesLong()
        return self:getFreeMemoryBytes()
end


function JvmStatistics:getFreeMemoryKilobytesLong()
        return self:getFreeMemoryKilobytes()
end


function JvmStatistics:getFreeMemoryMegabytesLong()
        return self:getFreeMemoryMegabytes()
end


function JvmStatistics:getMaxMemoryBytesLong()
        return self:getMaxMemoryBytes()
end


function JvmStatistics:getMaxMemoryKilobytesLong()
        return self:getMaxMemoryKilobytes()
end


function JvmStatistics:getMaxMemoryMegabytesLong()
        return self:getMaxMemoryMegabytes()
end


function JvmStatistics:getTotalMemoryBytesLong()
        return self:getTotalMemoryBytes()
end


function JvmStatistics:getTotalMemoryKilobytesLong()
        return self:getTotalMemoryKilobytes()
end


function JvmStatistics:getTotalMemoryMegabytesLong()
        return self:getTotalMemoryMegabytes()
end


function JvmStatistics:getFreeMemoryBytesString()
        return tostring(self:getFreeMemoryBytesLong())
end


function JvmStatistics:getFreeMemoryKilobytesString()
        return tostring(self:getFreeMemoryKilobytesLong())
end


function JvmStatistics:getFreeMemoryMegabytesString()
        return tostring(self:getFreeMemoryMegabytesLong())
end


function JvmStatistics:getMaxMemoryBytesString()
        return tostring(self:getMaxMemoryBytesLong())
end


function JvmStatistics:getMaxMemoryKilobytesString()
        return tostring(self:getMaxMemoryKilobytesLong())
end


function JvmStatistics:getMaxMemoryMegabytesString()
        return tostring(self:getMaxMemoryMegabytesLong())
end


function JvmStatistics:getTotalMemoryBytesString()
        return tostring(self:getTotalMemoryBytesLong())
end


function JvmStatistics:getTotalMemoryKilobytesString()
        return tostring(self:getTotalMemoryKilobytesLong())
end


function JvmStatistics:getTotalMemoryMegabytesString()
        return tostring(self:getTotalMemoryMegabytesLong())
end


function JvmStatistics:getNumberOfThreads()
        return require("java.lang.Thread").activeCount()
end


function JvmStatistics:getNumberOfThreadsLong()
        return self:getNumberOfThreads()
end


function JvmStatistics:getNumberOfThreadsString()
        return tostring(self:getNumberOfThreadsLong())
end


function JvmStatistics:collectGarbage()
        self.runtime:gc()
end

return JvmStatistics

