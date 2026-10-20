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

local RunnableInterface = require("org.allbinary.thread.RunnableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABRunnable = {}
ABRunnable.__index = ABRunnable
ABRunnable.className = "ABRunnable"

function ABRunnable:_init_fields()
    self.running = false
end

function ABRunnable.new()
    local self = setmetatable({}, ABRunnable)
    self:_init_fields()
    return self
end


function ABRunnable:setThread(thread)
end


function ABRunnable:isRunning()
        return self.running
end


function ABRunnable:setRunning(running)
        self.running = running
end


function ABRunnable:run()
end


function ABRunnable:getType()
        return -1
end

return ABRunnable

