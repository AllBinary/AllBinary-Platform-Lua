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

local JvmStatisticsData = {}
JvmStatisticsData.__index = JvmStatisticsData
JvmStatisticsData.className = "JvmStatisticsData"


function JvmStatisticsData.new()
    local self = setmetatable({}, JvmStatisticsData)
        -- super(...) made self above
    return self
end

JvmStatisticsData.JVM_STATISTICS = "JVM_STATISTICS_"
JvmStatisticsData.NAME = tostring(JvmStatisticsData.JVM_STATISTICS) .. "NAME"
JvmStatisticsData.TOTAL_MEMORY_BYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "TOTAL_MEMORY_BYTES"
JvmStatisticsData.TOTAL_MEMORY_KILOBYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "TOTAL_MEMORY_KILOBYTES"
JvmStatisticsData.TOTAL_MEMORY_MEGABYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "TOTAL_MEMORY_MEGABYTES"
JvmStatisticsData.FREE_MEMORY_BYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "FREE_MEMORY_BYTES"
JvmStatisticsData.FREE_MEMORY_KILOBYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "FREE_MEMORY_KILOBYTES"
JvmStatisticsData.FREE_MEMORY_MEGABYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "FREE_MEMORY_MEGABYTES"
JvmStatisticsData.MAX_MEMORY_BYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "MAX_MEMORY_BYTES"
JvmStatisticsData.MAX_MEMORY_KILOBYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "MAX_MEMORY_KILOBYTES"
JvmStatisticsData.MAX_MEMORY_MEGABYTES = tostring(JvmStatisticsData.JVM_STATISTICS) .. "MAX_MEMORY_MEGABYTES"
JvmStatisticsData.NUMBER_OF_THREADS = tostring(JvmStatisticsData.JVM_STATISTICS) .. "NUMBER_OF_THREADS"

return JvmStatisticsData

