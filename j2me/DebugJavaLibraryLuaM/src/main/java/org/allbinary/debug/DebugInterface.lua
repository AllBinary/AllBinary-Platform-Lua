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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local DebugInterface = {}
DebugInterface.__index = DebugInterface
DebugInterface.className = "DebugInterface"


function DebugInterface:start()
    error("abstract method start")
end


function DebugInterface:stop()
    error("abstract method stop")
end


function DebugInterface:getStartTime()
    error("abstract method getStartTime")
end


function DebugInterface:getMaxTime()
    error("abstract method getMaxTime")
end


function DebugInterface:isRunning()
    error("abstract method isRunning")
end

return DebugInterface

