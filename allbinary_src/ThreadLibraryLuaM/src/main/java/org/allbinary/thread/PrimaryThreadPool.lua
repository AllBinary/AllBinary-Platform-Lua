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

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
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

local PrimaryThreadPool = {}
PrimaryThreadPool.__index = PrimaryThreadPool
PrimaryThreadPool.className = "PrimaryThreadPool"
setmetatable(PrimaryThreadPool, {__index = ThreadPool})


function PrimaryThreadPool.getInstance()
        return PrimaryThreadPool.THREAD_POOL
end


function PrimaryThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable(ThreadPool.new(poolName, numThreads, priority), PrimaryThreadPool)
        -- super(...) made self above
    return self
end


function PrimaryThreadPool:runTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(StringUtil.getInstance():toString(task)):appendlong(java_int(math.floor(os.time() * 1000)))), self, self.threadPoolStrings.ADD_TASK)
        ThreadPool.runTask(self, task)
end


function PrimaryThreadPool:startTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(self.threadPoolStrings.START_TASK):append(StringUtil.getInstance():toString(task))), self, self.commonStrings.RUN)
end


function PrimaryThreadPool:completedTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(self.threadPoolStrings.COMPLETE_TASK):append(StringUtil.getInstance():toString(task))), self, self.commonStrings.RUN)
end

PrimaryThreadPool.THREAD_POOL = ThreadPool.new("Primary", 1, ThreadPool.NORMAL_PRIORITY)

return PrimaryThreadPool

