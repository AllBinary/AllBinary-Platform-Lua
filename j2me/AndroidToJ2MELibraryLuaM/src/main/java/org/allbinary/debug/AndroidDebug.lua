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
-- package org.allbinary.debug

local Debug = require("android.os.Debug")
local DebugInterface = require("org.allbinary.debug.DebugInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AndroidDebug = {}
AndroidDebug.__index = AndroidDebug
AndroidDebug.className = "AndroidDebug"

function AndroidDebug:_init_fields()
    self.startTime = Long.MAX_VALUE
    self.running = false
    self.bufferSize = 32 * 1024 * 1024
end

function AndroidDebug.new()
    local self = setmetatable({}, AndroidDebug)
    self:_init_fields()
    return self
end


function AndroidDebug:start()
        self:setStartTime(math.floor(os.time() * 1000))
        Debug.startMethodTracing("trace", self.bufferSize)
        self:setRunning(true)
end


function AndroidDebug:stop()
        self.startTime = Long.MAX_VALUE
        Debug.stopMethodTracing()
        self:setRunning(false)
end


function AndroidDebug:getMaxTime()
        return 120000
end


function AndroidDebug:setStartTime(startTime)
        self.startTime = startTime
end


function AndroidDebug:getStartTime()
        return self.startTime
end


function AndroidDebug:setRunning(running)
        self.running = running
end


function AndroidDebug:isRunning()
        return self.running
end

return AndroidDebug

