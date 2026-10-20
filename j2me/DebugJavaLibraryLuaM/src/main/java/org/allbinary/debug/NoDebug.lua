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

local NoDebug = {}
NoDebug.__index = NoDebug
NoDebug.className = "NoDebug"

function NoDebug.new()
    local self = setmetatable({}, NoDebug)
    return self
end


function NoDebug.getInstance()
        return NoDebug.SINGLETON
end


function NoDebug:start()
end


function NoDebug:stop()
end


function NoDebug:getMaxTime()
        return 10000
end


function NoDebug:getStartTime()
        return 0
end


function NoDebug:isRunning()
        return false
end

NoDebug.SINGLETON = NoDebug.new()

return NoDebug

