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
-- package org.allbinary.media.image.comparison.motion

local TestInputForMotionRectanglesResultsWorker = {}
package.loaded["org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker"] = TestInputForMotionRectanglesResultsWorker

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

-- local Rectangle = require("java.awt.Rectangle")
-- local InputEvent = require("java.awt.event.InputEvent")
-- local KeyEvent = require("java.awt.event.KeyEvent")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")
local TempInputRobotNames = java_lazy("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local MotionRectanglesResultsListener = require("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsListener")
local MotionRectangles = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectangles")
local MotionRectanglesResultsEvent = java_lazy("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsEvent")

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

-- class table TestInputForMotionRectanglesResultsWorker is declared before the requires
TestInputForMotionRectanglesResultsWorker.__index = TestInputForMotionRectanglesResultsWorker
TestInputForMotionRectanglesResultsWorker.className = "TestInputForMotionRectanglesResultsWorker"
TestInputForMotionRectanglesResultsWorker.javaClassName = "org.allbinary.media.image.comparison.motion.TestInputForMotionRectanglesResultsWorker"
TestInputForMotionRectanglesResultsWorker.java_implements = " MotionRectanglesResultsListener "
TestInputForMotionRectanglesResultsWorker.java_interfaces = function() return {MotionRectanglesResultsListener} end

function TestInputForMotionRectanglesResultsWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.index == nil then self.index = 0 end
    if self.running == nil then self.running = false end
    if self.motionRectanglesVector == nil then self.motionRectanglesVector = nil end
end


function TestInputForMotionRectanglesResultsWorker._jinit(self)
    TestInputForMotionRectanglesResultsWorker._init_fields(self)
        self.motionRectanglesVector = BasicArrayListD.new()
    return self
end

function TestInputForMotionRectanglesResultsWorker.new(...)
    local self = setmetatable({}, TestInputForMotionRectanglesResultsWorker)
    TestInputForMotionRectanglesResultsWorker._jinit(self, ...)
    return self
end


function TestInputForMotionRectanglesResultsWorker:getMotionRectanglesVector()
        return self.motionRectanglesVector
end


function TestInputForMotionRectanglesResultsWorker:onMotionRectanglesImageComparisonResultsEvent(motionRectanglesImageComparisonResultsEvent)
        self:getMotionRectanglesVector():add(motionRectanglesImageComparisonResultsEvent:getMotionRectangles())
        self:run()
end


function TestInputForMotionRectanglesResultsWorker:onEvent(allBinaryEventObject)
        self:onMotionRectanglesImageComparisonResultsEvent(allBinaryEventObject)
end


function TestInputForMotionRectanglesResultsWorker:isRunning()
        return self.running
end


function TestInputForMotionRectanglesResultsWorker:setRunning(running)
        self.running = running
end


function TestInputForMotionRectanglesResultsWorker:run()
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.RUN)
            self:setRunning(true)
            local timeHelper = TimeDelayHelper.new(1000)
            timeHelper:setStartTimeTNT()
            local motionRectangles = self:getMotionRectanglesVector():get(0)
            local motionRectangleVector = motionRectangles:getVector()
            if motionRectangleVector:size() > 0 then
                local rectangle = motionRectangleVector:get(0)
                local robotHashtable = InputRobotFactory.getInstance():get()
                local inputTypeNameArray = robotHashtable:keySet():toArray()
                local size = (inputTypeNameArray.n or #inputTypeNameArray)
                for index = 0, size - 1 do
                    local inputTypeNameString = inputTypeNameArray[index + 1]
                    local inputRobotInterface = robotHashtable:get(inputTypeNameString)
                    inputRobotInterface:mouseMoveToTarget(rectangle)
                    if rawequal(inputRobotInterface:getName():compareTo(TempInputRobotNames.DX_NAME), 0) then
                        inputRobotInterface:mousePress(InputEvent.BUTTON1_MASK)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON1_MASK)
                        inputRobotInterface:mousePress(InputEvent.BUTTON2_MASK)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON2_MASK)
                        inputRobotInterface:mousePress(InputEvent.BUTTON3_MASK)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON3_MASK)
                        inputRobotInterface:keyPress(49)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:keyRelease(49)
                        inputRobotInterface:keyPress(50)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:keyRelease(50)
                        inputRobotInterface:keyPress(51)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:keyRelease(51)
                        inputRobotInterface:keyPress(52)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:keyRelease(52)
                        inputRobotInterface:keyPress(112)
                        require("java.lang.Thread").sleep(300)
                        inputRobotInterface:keyRelease(112)
                    end
                end
            end
            self.index = self.index + 1
            self:getMotionRectanglesVector():remove(motionRectangles)
            self.logUtil:putF(CommonLabels.getInstance().ELAPSED + timeHelper:getElapsedTNT(), self, self.commonStrings.RUN)
            self.logUtil:putF(self.commonStrings.END, self, self.commonStrings.RUN)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return TestInputForMotionRectanglesResultsWorker

