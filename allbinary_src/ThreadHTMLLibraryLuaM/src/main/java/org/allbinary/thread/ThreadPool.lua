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

local ThreadPool = {}
package.loaded["org.allbinary.thread.ThreadPool"] = ThreadPool

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local PriorityRunnable = java_lazy("org.allbinary.thread.PriorityRunnable")
local ThreadObjectUtil = java_lazy("org.allbinary.thread.ThreadObjectUtil")
local ThreadPoolStrings = java_lazy("org.allbinary.thread.ThreadPoolStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ThreadPool is declared before the requires
ThreadPool.__index = ThreadPool
ThreadPool.className = "ThreadPool"
ThreadPool.javaClassName = "org.allbinary.thread.ThreadPool"

function ThreadPool:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.NULL_RUNNABLE = NullRunnable.getInstance()
    self.threadPoolStrings = ThreadPoolStrings.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
    if self.isAlive == nil then self.isAlive = false end
    self.taskQueue = BasicArrayListD.new()
    if self.numThreads == nil then self.numThreads = 0 end
    if self.runningTask == nil then self.runningTask = false end
    self.currentPriorityRunnable = self.threadObjectUtil.NULL_PRIORITY_RUNNABLE
end


function ThreadPool._jinit(self, poolName, numThreads, priority)
    ThreadPool._init_fields(self)
    return self
end

function ThreadPool.new(...)
    local self = setmetatable({}, ThreadPool)
    ThreadPool._jinit(self, ...)
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
            if not self.currentPriorityRunnable == self.threadObjectUtil.NULL_PRIORITY_RUNNABLE then
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

