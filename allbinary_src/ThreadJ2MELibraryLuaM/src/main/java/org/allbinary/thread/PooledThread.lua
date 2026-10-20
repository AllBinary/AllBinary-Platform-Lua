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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
-- java.lang.Thread has no Lua module
local Thread = {}
Thread.__index = Thread
Thread.className = "Thread"
function Thread.new() return setmetatable({}, Thread) end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PooledThread = {}
PooledThread.__index = PooledThread
PooledThread.className = "PooledThread"
setmetatable(PooledThread, {__index = Thread})

function PooledThread:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
    self.threadPool = nil
    self.INTERRUPT_EXCEPTION = "Exit InterruptedException"
end


function PooledThread.new(threadPool)
    local self = setmetatable(Thread.new(threadPool:createName()), PooledThread)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(self.commonStrings.CONSTRUCTOR, self, self.commonStrings.CONSTRUCTOR)
        self.threadPool = threadPool
    return self
end


function PooledThread:run()
        self.threadPool:threadStarted()
        while true do
            local task2 = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
            local try_ok, try_error = pcall(function()
                task2 = self.threadPool:getTask()
                self.threadPool.runningTask = true
                self.threadPool:startTask(task2)
            end)
            if not try_ok then
                local ex = try_error
                local logUtil = LogUtil.getInstance()
                logUtil:putF(self.INTERRUPT_EXCEPTION, self, self.commonStrings.RUN)
                break
            end
            if task2 == self.threadObjectUtil.NULL_PRIORITY_RUNNABLE then
                break
            end
            local try_ok, try_error = pcall(function()
                task2:run()
                self.threadPool:completedTask(task2)
                self.threadPool.runningTask = false
            end)
            if not try_ok then
                local e = try_error
                local logUtil = LogUtil.getInstance()
                logUtil:put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(StringUtil.getInstance():toString(task2))), self, self.commonStrings.RUN, e)
            end
        end
        self.threadPool:threadStopped()
end

return PooledThread

