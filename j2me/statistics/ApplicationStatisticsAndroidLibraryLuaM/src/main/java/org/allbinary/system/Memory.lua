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
-- package org.allbinary.system

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--ActualPlatform
local Memory = {}
Memory.__index = Memory
Memory.className = "Memory"

function Memory.new()
    local self = setmetatable({}, Memory)
    return self
end


function Memory.getInfo()
        local stringBuffer = StringMaker.new()
        local maxUtilizedMemoryAvailable = Runtime.getRuntime():maxMemory()
        local memoryUsed = Runtime.getRuntime():totalMemory()
        stringBuffer:append("APK Memory: Available: ")
        stringBuffer:appendlong(maxUtilizedMemoryAvailable)
        stringBuffer:append("/")
        stringBuffer:appendlong(java_int(Runtime.getRuntime():maxMemory()))
        stringBuffer:append(" Used: ")
        stringBuffer:appendlong(memoryUsed)
        stringBuffer:append(" Free: ")
        stringBuffer:appendlong(maxUtilizedMemoryAvailable - memoryUsed)
        stringBuffer:append("/")
        stringBuffer:appendlong(java_int(Runtime.getRuntime():maxMemory() - memoryUsed))
        return tostring(stringBuffer)
end

return Memory

