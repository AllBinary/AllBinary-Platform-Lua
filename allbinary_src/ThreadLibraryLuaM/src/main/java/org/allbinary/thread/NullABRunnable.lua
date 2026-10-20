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

local ABRunnable = require("org.allbinary.thread.ABRunnable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local NullABRunnable = {}
NullABRunnable.__index = NullABRunnable
NullABRunnable.className = "NullABRunnable"
setmetatable(NullABRunnable, {__index = ABRunnable})

function NullABRunnable.new()
    local self = setmetatable(ABRunnable.new(), NullABRunnable)
    return self
end


function NullABRunnable.getInstance()
        return NullABRunnable.instance
end


function NullABRunnable:isRunning()
        return false
end

NullABRunnable.instance = NullABRunnable.new()

return NullABRunnable

