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
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicArrayListUtil = require("org.allbinary.util.BasicArrayListUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreadPool = {}
ThreadPool.__index = ThreadPool
ThreadPool.className = "ThreadPool"

function ThreadPool:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.NULL_RUNNABLE = NullRunnable.getInstance()
    self.threadPoolStrings = ThreadPoolStrings.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
    self.poolName = nil
    self.priority = nil
    self.isAlive = false
    self.taskQueue = BasicArrayListUtil.getInstance():getImmutableInstance()
    self.threadID = 0
    self.numThreads = nil
    self.runningTask = false
end


function ThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable({}, ThreadPool)
    self:_init_fields()
        self.poolName = poolName
        self.priority = priority
        self.numThreads = numThreads
    return self
end


function ThreadPool:init()
        if not self.isAlive then
            self.isAlive = true
            self.taskQueue = BasicArrayListD.new()
            local pooledThread = nil
            for i = 0, self.numThreads - 1 do
                pooledThread = PooledThread.new(self)
                pooledThread:setPriority(self.priority)
                pooledThread:start()
            end
        end
end


-- throws Exception
function ThreadPool:runAPriorityTask()
        error(java_exception("RuntimeException"), 0)
end


function ThreadPool:runTaskWithPriority(task)
        do -- synchronized (self)
            if not self.isAlive then
                self:init()
            end
            if task ~= nil then
                local size = self.taskQueue:size()
                local runnable = nil
                local lowerPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
                for index = 0, size - 1 do
                    runnable = self.taskQueue:get(index)
                    if runnable:getPriority() > task:getPriority() then
                        lowerPriorityRunnable = runnable
                        break
                    end
                end
                if lowerPriorityRunnable == self.threadObjectUtil.NULL_PRIORITY_RUNNABLE then
                    self.taskQueue:add(task)
                else
                    local index = self.taskQueue:indexOf(lowerPriorityRunnable)
                    self.taskQueue:addAt(index, task)
                end
                self:notify()
            end
        end
end


function ThreadPool:runTask(task)
        do -- synchronized (self)
            if not self.isAlive then
                self:init()
            end
            if task ~= nil then
                self.taskQueue:add(task)
                self:notify()
            end
        end
end


-- throws InterruptedException
function ThreadPool:getTask()
        do -- synchronized (self)
            while self.taskQueue:size() == 0 do
                if not self.isAlive then
                    return self.NULL_RUNNABLE
                end
                self:wait()
            end
            local runnable = self.taskQueue:removeAt(0)
            return runnable
        end
end


function ThreadPool:clear()
        do -- synchronized (self)
            if self.isAlive then
                self.taskQueue:clear()
            end
        end
end


function ThreadPool:close()
        do -- synchronized (self)
            if self.isAlive then
                self.isAlive = false
                self.taskQueue:clear()
            end
        end
end


function ThreadPool:join()
        do -- synchronized (self)
            self.isAlive = false
            self.taskQueue:clear()
            self:notifyAll()
        end
end


function ThreadPool:isBusy()
        if not self.isAlive then
            return false
        end
        if self.taskQueue:size() > 0 then
            return true
        end
        if self.runningTask then
            return true
        end
        return false
end


function ThreadPool:threadStarted()
end


function ThreadPool:threadStopped()
        if self.numThreads == 1 then
            self.isAlive = false
            self.taskQueue:clear()
        end
end


function ThreadPool:startTask(task)
end


function ThreadPool:completedTask(task)
end


function ThreadPool:createName()
        return tostring(StringMaker.new():append(self.poolName):append(ThreadPool.ROOT_NAME):appendint((function() local value = self.threadID self.threadID = value + 1 return value end)()))
end

ThreadPool.ROOT_NAME = "-PooledThread-"
ThreadPool.NORMAL_PRIORITY = Thread.NORM_PRIORITY

return ThreadPool

