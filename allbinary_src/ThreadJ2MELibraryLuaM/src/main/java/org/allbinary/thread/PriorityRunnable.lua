-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.thread

-- java.lang.Runnable has no Lua module
local Runnable = {}

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
local PriorityRunnable = {}
PriorityRunnable.__index = PriorityRunnable
PriorityRunnable.className = "PriorityRunnable"
setmetatable(PriorityRunnable, {__index = Runnable})


function PriorityRunnable:getPriority()
    error("abstract method getPriority")
end


function PriorityRunnable:isDone()
    error("abstract method isDone")
end


function PriorityRunnable:reset()
    error("abstract method reset")
end

return PriorityRunnable

