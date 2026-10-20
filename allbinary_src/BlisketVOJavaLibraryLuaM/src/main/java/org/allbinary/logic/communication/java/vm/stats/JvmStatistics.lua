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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JvmStatistics = {}
JvmStatistics.__index = JvmStatistics
JvmStatistics.className = "JvmStatistics"

function JvmStatistics:_init_fields()
    self.runtime = nil
end


function JvmStatistics.new()
    local self = setmetatable({}, JvmStatistics)
    self:_init_fields()
        self.runtime = Runtime.getRuntime()
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
        return Thread.activeCount()
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

