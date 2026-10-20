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
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

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
    self.isAlive = false
    self.taskQueue = BasicArrayListD.new()
    self.numThreads = 0
    self.runningTask = false
    self.currentPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
end


function ThreadPool.new(poolName, numThreads, priority)
    local self = setmetatable({}, ThreadPool)
    self:_init_fields()
    return self
end


-- throws Exception
function ThreadPool:runAPriorityTask()
        if not self.currentPriorityRunnable:isDone() then
            self.currentPriorityRunnable:run()
        else
            local runnable = self:getTask()
            if runnable == self.NULL_RUNNABLE then
                return
            end
            self.currentPriorityRunnable = runnable
            if not (self.currentPriorityRunnable == self.threadObjectUtil.NULL_PRIORITY_RUNNABLE) then
                self.currentPriorityRunnable:reset()
                self.currentPriorityRunnable:run()
            end
        end
end


-- throws Exception
function ThreadPool:runATask()
        local runnable = self:getTask()
        if runnable ~= nil then
            runnable:run()
        end
end


function ThreadPool:init()
        if not self.isAlive then
            self.isAlive = true
            self.taskQueue = BasicArrayListD.new()
        end
end


function ThreadPool:runTaskWithPriority(task)
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
        end
end


function ThreadPool:runTask(task)
        if not self.isAlive then
            self:init()
        end
        if task ~= nil then
            self.taskQueue:add(task)
        end
end


-- throws InterruptedException
function ThreadPool:getTask()
        if self.taskQueue:isEmpty() then
            return self.NULL_RUNNABLE
        end
        return self.taskQueue:removeAt(0)
end


function ThreadPool:clear()
        self.taskQueue:clear()
end


function ThreadPool:close()
        if self.isAlive then
            self.isAlive = false
            self.taskQueue:clear()
            self.currentPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
        end
end


function ThreadPool:join()
        self.isAlive = false
        self.taskQueue:clear()
        self.currentPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
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
            self.currentPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
        end
end


function ThreadPool:startTask(task)
end


function ThreadPool:completedTask(task)
end

ThreadPool.NORMAL_PRIORITY = 5

return ThreadPool

