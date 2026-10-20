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
-- package org.allbinary.thread

local ThreadPool = require("org.allbinary.thread.ThreadPool")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--This is mainly for network communications.
local PathFindingThreadPool = {}
PathFindingThreadPool.__index = PathFindingThreadPool
PathFindingThreadPool.className = "PathFindingThreadPool"
setmetatable(PathFindingThreadPool, {__index = ThreadPool})


function PathFindingThreadPool.getInstance()
        return PathFindingThreadPool.instance
end


function PathFindingThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable(ThreadPool.new(poolName, numThreads, ThreadPool.NORMAL_PRIORITY), PathFindingThreadPool)
        -- super(...) made self above
    return self
end


function PathFindingThreadPool:runTaskWithPriority(task)
        ThreadPool.runTaskWithPriority(self, task)
end


function PathFindingThreadPool:runTask(task)
        ThreadPool.runTask(self, task)
end


function PathFindingThreadPool:startTask(task)
end


function PathFindingThreadPool:completedTask(task)
end

PathFindingThreadPool.instance = PathFindingThreadPool.new("PathFinding", 1, 1)

return PathFindingThreadPool

