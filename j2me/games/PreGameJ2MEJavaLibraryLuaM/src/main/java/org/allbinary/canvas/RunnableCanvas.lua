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
-- package org.allbinary.canvas

-- local CommandListener = require("javax.microedition.lcdui.CommandListener")
local TsUtil = require("org.allbinary.TsUtil")
local NullWaitGameRunnable = require("org.allbinary.game.displayable.canvas.NullWaitGameRunnable")
local MyCanvas = require("org.allbinary.graphics.displayable.MyCanvas")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StdUtil = require("org.allbinary.logic.StdUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local NullThread = require("org.allbinary.thread.NullThread")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local ThreadObjectUtil = require("org.allbinary.thread.ThreadObjectUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local RunnableCanvas = {}
RunnableCanvas.__index = RunnableCanvas
RunnableCanvas.className = "RunnableCanvas"
setmetatable(RunnableCanvas, {__index = MyCanvas})

function RunnableCanvas:_init_fields()
    self.nullUtil = NullUtil.getInstance()
    self.stdUtil = StdUtil.getInstance()
    self.systemWrapper = ABSystemWrapper.getInstance()
    self.tsUtil = TsUtil.getInstance()
    self.thread = NullThread.NULL_THREAD
    self.currentThread = NullThread.NULL_THREAD
    self.running = false
    self.loopTimeHelper = TimeDelayHelper.new(NullWaitGameRunnable.getInstance().WAIT)
    self.runnableCanvasRefreshHelper = Processor.getInstance()
    self.commonLabels = CommonLabels.getInstance()
    self.threadObjectUtil = ThreadObjectUtil.getInstance()
    self.SET_RUNNING = "setRunning"
    self.IS_RUNNING = "isRunning"
    self.THREAD = "Thread: "
    self.NOT_EQUAL = " != "
    self.PAUSE_SLEEP = "pause sleep"
    self.START_PAUSE = "start pause - game thread sleep at: "
    self.END_PAUSE = "end pause - game thread sleep at: "
    self.PROCESS_LOOP_SLEEP = "processLoopSleep"
    self.pauseWait = 0
    self.notified = false
end


function RunnableCanvas.new(commandListener, childNameList, hasParam)
    local self = setmetatable(MyCanvas.new(CommonStrings.getInstance().UNKNOWN, childNameList), RunnableCanvas)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF(tostring(StringMaker.new():append("RunnableCanvas delay: "):appendint(java_int(self.loopTimeHelper.delay))), self, self.commonStrings.CONSTRUCTOR)
        self.runnableCanvasRefreshHelper = RunnableCanvasRefreshHelper.new(self)
        if commandListener ~= nil then
            self:initCommands(commandListener)
        elseif hasParam then
            self.logUtil:putF("commandListener was null", self, "initCommands")
        end
    return self
end


function RunnableCanvas:initCommands(cmdListener)
        self.logUtil:putF(self.commonStrings.NOT_IMPLEMENTED, self, "initCommands")
end


function RunnableCanvas:isMainCanvas()
        if self:getCustomCommandListener() ~= nil then
            return true
        else
            return false
        end
end


function RunnableCanvas:setThread(thread)
        self.thread = thread
end


function RunnableCanvas:setRunning(running)
        self.running = running
        if not self.running then
            self.thread = NullThread.NULL_THREAD
            do -- synchronized (self)
                self.threadObjectUtil:notifyObject(self)
            end
        end
        self.logUtil:putF(tostring(StringMaker.new():append(self.IS_RUNNING):appendboolean(self.running)), self, self.SET_RUNNING)
end


function RunnableCanvas:isRunning()
        if self.thread == self.currentThread then
            return self.running
        else
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.THREAD)
            if self.thread ~= nil then
                stringBuffer:append(tostring(self.thread))
            end
            stringBuffer:append(self.NOT_EQUAL)
            if self.currentThread ~= nil then
                stringBuffer:append(StringUtil.getInstance():toString(self.currentThread))
            end
            self.logUtil:putF(tostring(stringBuffer), self, self.IS_RUNNING)
            return false
        end
end


function RunnableCanvas:getLoopTimeHelperP()
        return self.loopTimeHelper
end


function RunnableCanvas:setWait(wait)
        self.loopTimeHelper.delay = wait
        self.pauseWait = wait * 3
        self.logUtil:putF(tostring(StringMaker.new():append("setWait - delay: "):appendint(java_int(self.loopTimeHelper.delay))), self, self.commonStrings.CONSTRUCTOR)
end


function RunnableCanvas:getWait()
        return self.loopTimeHelper.delay
end


function RunnableCanvas:setCurrentThread()
        self.currentThread = Thread.currentThread()
end


function RunnableCanvas:setCurrentThreadFake()
        self.currentThread = self.thread
end


function RunnableCanvas:showNotify()
        local try_ok, try_error = pcall(function()
            self:stopWaiting()
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "showNotify", e)
        end
end


-- throws Exception
function RunnableCanvas:stopWaiting()
        self.notified = true
        do -- synchronized (self)
            self.threadObjectUtil:notifyObject(self)
        end
        self:repaint()
end


-- throws Exception
function RunnableCanvas:waitOnNotify(wait)
        if not self.notified then
            if wait > 0 then
                self.threadObjectUtil:waitObjectFor(self, wait)
            else
                self.threadObjectUtil:waitObject(self)
            end
        end
end


-- throws Exception
function RunnableCanvas:processSleep()
        java_sleep(self.pauseWait)
end


function RunnableCanvas:isPausable()
        return false
end


-- throws Exception
function RunnableCanvas:processGameSleep(sleep)
        java_sleep(sleep)
end


-- throws Exception
function RunnableCanvas:processLoopSleep()
        self.runnableCanvasRefreshHelper:process()
        if self:isPaused() then
            local stringMaker = StringMaker.new()
            if self:isRunning() and not self:isSingleThread() then
                stringMaker:delete(0, stringMaker:length())
                local currentTimeMillis = self.systemWrapper:currentTimeMillis()
                self.logUtil:putF(tostring(stringMaker:append(self.START_PAUSE):appendlong(currentTimeMillis):append(self.PAUSE_SLEEP):appendlong(self.pauseWait)), self, self.PROCESS_LOOP_SLEEP)
                while self:isPaused() and self:isRunning() and not self:isSingleThread() do
                    self:processSleep()
                    if not self:isPausable() then
                        stringMaker:delete(0, stringMaker:length())
                        self.logUtil:putF(tostring(stringMaker:append(self.END_PAUSE):appendlong(currentTimeMillis)), self, self.PROCESS_LOOP_SLEEP)
                        return
                    end
                end
            end
        end
        local elapsedTime = self.loopTimeHelper:getElapsedTNT()
        local wait = java_int(self.loopTimeHelper.delay)
        if elapsedTime > wait then
            elapsedTime = wait
        else
            self:processGameSleep(wait - elapsedTime)
        end
end


function RunnableCanvas:isSingleThread()
        return false
end


function RunnableCanvas:run()
        self:setCurrentThread()
end


-- throws Exception
function RunnableCanvas:end2()
end


function RunnableCanvas:getType()
        return -1
end

return RunnableCanvas

