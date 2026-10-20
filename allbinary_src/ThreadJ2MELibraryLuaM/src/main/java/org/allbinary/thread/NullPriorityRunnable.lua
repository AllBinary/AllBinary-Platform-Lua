-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local PriorityRunnable = require("org.allbinary.thread.PriorityRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullPriorityRunnable = {}
NullPriorityRunnable.__index = NullPriorityRunnable
NullPriorityRunnable.className = "NullPriorityRunnable"

function NullPriorityRunnable.new()
    local self = setmetatable({}, NullPriorityRunnable)
    return self
end


function NullPriorityRunnable:getPriority()
        return 0
end


function NullPriorityRunnable:isDone()
        return true
end


function NullPriorityRunnable:reset()
end


function NullPriorityRunnable:run()
end

return NullPriorityRunnable

