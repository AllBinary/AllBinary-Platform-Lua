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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")
local JvmStatistics = require("org.allbinary.logic.communication.java.vm.stats.JvmStatistics")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local JvmStatisticsMapping = {}
JvmStatisticsMapping.__index = JvmStatisticsMapping
JvmStatisticsMapping.className = "JvmStatisticsMapping"
setmetatable(JvmStatisticsMapping, {__index = JvmStatistics})


function JvmStatisticsMapping.new()
    local self = setmetatable(JvmStatistics.new(), JvmStatisticsMapping)
        -- super(...) made self above
    return self
end


function JvmStatisticsMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(JvmStatisticsData.FREE_MEMORY_BYTES, self:getFreeMemoryBytesString())
        hashMap:put(JvmStatisticsData.FREE_MEMORY_KILOBYTES, self:getFreeMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.FREE_MEMORY_MEGABYTES, self:getFreeMemoryMegabytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_BYTES, self:getMaxMemoryBytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_KILOBYTES, self:getMaxMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.MAX_MEMORY_MEGABYTES, self:getMaxMemoryMegabytesString())
        hashMap:put(JvmStatisticsData.NUMBER_OF_THREADS, self:getNumberOfThreadsString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_BYTES, self:getTotalMemoryBytesString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_KILOBYTES, self:getTotalMemoryKilobytesString())
        hashMap:put(JvmStatisticsData.TOTAL_MEMORY_MEGABYTES, self:getTotalMemoryMegabytesString())
        return hashMap
end


-- throws Exception
function JvmStatisticsMapping:getKey()
        return JvmStatisticsData.NAME
end


-- throws Exception
function JvmStatisticsMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self:getFreeMemoryBytesString())
        vector:add(self:getFreeMemoryKilobytesString())
        vector:add(self:getFreeMemoryMegabytesString())
        vector:add(self:getMaxMemoryBytesString())
        vector:add(self:getMaxMemoryKilobytesString())
        vector:add(self:getMaxMemoryMegabytesString())
        vector:add(self:getNumberOfThreadsString())
        vector:add(self:getTotalMemoryBytesString())
        vector:add(self:getTotalMemoryKilobytesString())
        vector:add(self:getTotalMemoryMegabytesString())
        return vector
end

return JvmStatisticsMapping

