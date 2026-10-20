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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

--This is mainly for network communications.
local SecondaryThreadPool = {}
SecondaryThreadPool.__index = SecondaryThreadPool
SecondaryThreadPool.className = "SecondaryThreadPool"
setmetatable(SecondaryThreadPool, {__index = ThreadPool})


function SecondaryThreadPool.getInstance()
        return SecondaryThreadPool.instance
end


function SecondaryThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable(ThreadPool.new(poolName, numThreads, priority), SecondaryThreadPool)
        -- super(...) made self above
    return self
end


function SecondaryThreadPool:runTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(StringUtil.getInstance():toString(task)):appendlong(java_int(math.floor(os.time() * 1000)))), self, self.threadPoolStrings.ADD_TASK)
        ThreadPool.runTask(self, task)
end


function SecondaryThreadPool:startTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(self.threadPoolStrings.START_TASK):append(StringUtil.getInstance():toString(task)):appendlong(java_int(math.floor(os.time() * 1000)))), self, self.commonStrings.RUN)
end


function SecondaryThreadPool:completedTask(task)
        self.logUtil:putF(tostring(StringMaker.new():append(self.threadPoolStrings.COMPLETE_TASK):append(StringUtil.getInstance():toString(task)):appendlong(java_int(math.floor(os.time() * 1000)))), self, self.commonStrings.RUN)
end

SecondaryThreadPool.instance = SecondaryThreadPool.new("Secondary", 1, ThreadPool.NORMAL_PRIORITY)

return SecondaryThreadPool

