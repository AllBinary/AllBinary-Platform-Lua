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
-- package org.allbinary.input.automation.module

local CaptureWorkerInterface = require("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageComparisonWorker = require("org.allbinary.media.image.comparison.ImageComparisonWorker")
local MotionRectanglesWorker = require("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

local AbstractInputAutomationWorker = {}
AbstractInputAutomationWorker.__index = AbstractInputAutomationWorker
AbstractInputAutomationWorker.className = "AbstractInputAutomationWorker"

function AbstractInputAutomationWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.index = 0
    self.running = false
    self.inputAutomationActionInterface = nil
    self.captureWorkerInterface = nil
    self.imageComparisonWorker = nil
    self.motionRectanglesWorker = nil
    self.captureThread = nil
end


function AbstractInputAutomationWorker.new(inputAutomationActionInterface)
    local self = setmetatable({}, AbstractInputAutomationWorker)
    self:_init_fields()
    return self
end


-- throws Exception
function AbstractInputAutomationWorker:setThread(thread)
end


function AbstractInputAutomationWorker:isRunning()
        return self.running
end


function AbstractInputAutomationWorker:setRunning(running)
        self.running = running
end


function AbstractInputAutomationWorker:isAnyDataWorkerRunning()
        if self.captureThread ~= nil and (self.captureThread:isAlive() or self:getCaptureWorker():isRunning() or self:getMotionRectanglesWorker():isRunning() or self:getImageComparisonWorker():isRunning()) then
            return true
        end
        return false
end


-- throws Exception
function AbstractInputAutomationWorker:startDataWorkers()
        if not self:isAnyDataWorkerRunning() then
            self.captureThread = Thread.new(self:getCaptureWorker())
            self.logUtil:putF("Starting CaptureWorkers - Need more images - Thread State: " .. tostring(self.captureThread:getState()), self, "startCaptureWorkers")
            self.captureThread:start()
        end
end


-- throws Exception
function AbstractInputAutomationWorker:waitForDataWorkers()
        while self:isAnyDataWorkerRunning() do
            self.logUtil:putF("Waiting", self, self.commonStrings.RUN)
            java_sleep(250)
        end
end


-- throws Exception
function AbstractInputAutomationWorker:stopDataWorkers()
        self:getCaptureWorker():setRunning(false)
end


-- throws Exception
function AbstractInputAutomationWorker:process()
        error(java_exception("RuntimeException"), 0)
end


function AbstractInputAutomationWorker:run()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                self:process()
                self.index = self.index + 1
                self.logUtil:putF(tostring(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT()) .. " Index: " .. tostring(self.index), self, self.commonStrings.RUN)
            end
            self:stopDataWorkers()
            self:waitForDataWorkers()
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end


function AbstractInputAutomationWorker:getInputAutomationActionInterface()
        return self.inputAutomationActionInterface
end


function AbstractInputAutomationWorker:setInputAutomationActionInterface(inputAutomationActionInterface)
        self.inputAutomationActionInterface = inputAutomationActionInterface
end


function AbstractInputAutomationWorker:getCaptureWorker()
        return self.captureWorkerInterface
end


function AbstractInputAutomationWorker:setCaptureWorker(captureWorkerInterface)
        self.captureWorkerInterface = captureWorkerInterface
end


function AbstractInputAutomationWorker:getImageComparisonWorker()
        return self.imageComparisonWorker
end


function AbstractInputAutomationWorker:setImageComparisonWorker(imageComparisonWorker)
        self.imageComparisonWorker = imageComparisonWorker
end


function AbstractInputAutomationWorker:getMotionRectanglesWorker()
        return self.motionRectanglesWorker
end


function AbstractInputAutomationWorker:setMotionRectanglesWorker(motionRectanglesWorker)
        self.motionRectanglesWorker = motionRectanglesWorker
end

return AbstractInputAutomationWorker

