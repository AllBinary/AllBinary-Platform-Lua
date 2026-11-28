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

local JvmStatisticsData = {}
package.loaded["org.allbinary.logic.communication.java.vm.stats.JvmStatisticsData"] = JvmStatisticsData

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

-- class table JvmStatisticsData is declared before the requires
JvmStatisticsData.__index = JvmStatisticsData
JvmStatisticsData.className = "JvmStatisticsData"
JvmStatisticsData.javaClassName = "org.allbinary.logic.communication.java.vm.stats.JvmStatisticsData"


function JvmStatisticsData._jinit(self)
        -- super(...) made self above
    return self
end

function JvmStatisticsData.new(...)
    local self = setmetatable({}, JvmStatisticsData)
    JvmStatisticsData._jinit(self, ...)
    return self
end

JvmStatisticsData.JVM_STATISTICS = "JVM_STATISTICS_"
JvmStatisticsData.NAME = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("NAME")
JvmStatisticsData.TOTAL_MEMORY_BYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("TOTAL_MEMORY_BYTES")
JvmStatisticsData.TOTAL_MEMORY_KILOBYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("TOTAL_MEMORY_KILOBYTES")
JvmStatisticsData.TOTAL_MEMORY_MEGABYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("TOTAL_MEMORY_MEGABYTES")
JvmStatisticsData.FREE_MEMORY_BYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("FREE_MEMORY_BYTES")
JvmStatisticsData.FREE_MEMORY_KILOBYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("FREE_MEMORY_KILOBYTES")
JvmStatisticsData.FREE_MEMORY_MEGABYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("FREE_MEMORY_MEGABYTES")
JvmStatisticsData.MAX_MEMORY_BYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("MAX_MEMORY_BYTES")
JvmStatisticsData.MAX_MEMORY_KILOBYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("MAX_MEMORY_KILOBYTES")
JvmStatisticsData.MAX_MEMORY_MEGABYTES = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("MAX_MEMORY_MEGABYTES")
JvmStatisticsData.NUMBER_OF_THREADS = require("allbinary_java").to_string(JvmStatisticsData.JVM_STATISTICS) .. require("allbinary_java").to_string("NUMBER_OF_THREADS")

return JvmStatisticsData

