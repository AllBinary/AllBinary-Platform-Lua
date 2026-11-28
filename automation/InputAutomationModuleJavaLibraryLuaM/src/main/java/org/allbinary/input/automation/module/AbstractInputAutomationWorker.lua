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

local AbstractInputAutomationWorker = {}
package.loaded["org.allbinary.input.automation.module.AbstractInputAutomationWorker"] = AbstractInputAutomationWorker

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

local CaptureWorkerInterface = java_lazy("org.allbinary.input.media.image.capture.CaptureWorkerInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local ImageComparisonWorker = java_lazy("org.allbinary.media.image.comparison.ImageComparisonWorker")
local MotionRectanglesWorker = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesWorker")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local RunnableInterface = java_lazy("org.allbinary.thread.RunnableInterface")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local InputAutomationActionInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationActionInterface")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_sleep(milliseconds)
    local finish = os.clock() + milliseconds / 1000
    while os.clock() < finish do end
end

-- class table AbstractInputAutomationWorker is declared before the requires
AbstractInputAutomationWorker.__index = AbstractInputAutomationWorker
AbstractInputAutomationWorker.className = "AbstractInputAutomationWorker"
AbstractInputAutomationWorker.javaClassName = "org.allbinary.input.automation.module.AbstractInputAutomationWorker"
AbstractInputAutomationWorker.java_implements = " RunnableInterface "
AbstractInputAutomationWorker.java_interfaces = function() return {RunnableInterface} end

function AbstractInputAutomationWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.index == nil then self.index = 0 end
    if self.running == nil then self.running = false end
    if self.inputAutomationActionInterface == nil then self.inputAutomationActionInterface = nil end
    if self.captureWorkerInterface == nil then self.captureWorkerInterface = nil end
    if self.imageComparisonWorker == nil then self.imageComparisonWorker = nil end
    if self.motionRectanglesWorker == nil then self.motionRectanglesWorker = nil end
    if self.captureThread == nil then self.captureThread = nil end
end


function AbstractInputAutomationWorker._jinit(self, inputAutomationActionInterface)
    AbstractInputAutomationWorker._init_fields(self)
    return self
end

function AbstractInputAutomationWorker.new(...)
    local self = setmetatable({}, AbstractInputAutomationWorker)
    AbstractInputAutomationWorker._jinit(self, ...)
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
        if not rawequal(self.captureThread, nil) and (self.captureThread:isAlive() or self:getCaptureWorker():isRunning() or self:getMotionRectanglesWorker():isRunning() or self:getImageComparisonWorker():isRunning()) then
            return true
        end
        return false
end


-- throws Exception
function AbstractInputAutomationWorker:startDataWorkers()
        if not (self:isAnyDataWorkerRunning()) then
            self.captureThread = require("java.lang.Thread").new(self:getCaptureWorker())
            self.logUtil:putF(require("allbinary_java").to_string("Starting CaptureWorkers - Need more images - Thread State: ") .. require("allbinary_java").to_string(tostring(self.captureThread:getState())), self, "startCaptureWorkers")
            self.captureThread:start()
        end
end


-- throws Exception
function AbstractInputAutomationWorker:waitForDataWorkers()
        while self:isAnyDataWorkerRunning() do
            self.logUtil:putF("Waiting", self, self.commonStrings.RUN)
            require("java.lang.Thread").sleep(250)
        end
end


-- throws Exception
function AbstractInputAutomationWorker:stopDataWorkers()
        self:getCaptureWorker():setRunning(false)
end


-- throws Exception
function AbstractInputAutomationWorker:process()
        error(require("java.lang.RuntimeException").new(), 0)
end


function AbstractInputAutomationWorker:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            while self:isRunning() do
                timeHelper:setStartTimeTNT()
                self:process()
                self.index = self.index + 1
                self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT()) .. require("allbinary_java").to_string(" Index: ")) .. require("allbinary_java").to_string(self.index), self, self.commonStrings.RUN)
            end
            self:stopDataWorkers()
            self:waitForDataWorkers()
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

