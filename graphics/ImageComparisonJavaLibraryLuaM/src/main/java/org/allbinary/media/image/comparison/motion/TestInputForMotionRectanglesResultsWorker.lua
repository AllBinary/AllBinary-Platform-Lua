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

-- local Rectangle = require("java.awt.Rectangle")
-- local InputEvent = require("java.awt.event.InputEvent")
-- local KeyEvent = require("java.awt.event.KeyEvent")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local TempInputRobotNames = require("org.allbinary.input.automation.robot.TempInputRobotNames")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local MotionRectanglesResultsListener = require("org.allbinary.media.image.comparison.motion.MotionRectanglesResultsListener")

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

local TestInputForMotionRectanglesResultsWorker = {}
TestInputForMotionRectanglesResultsWorker.__index = TestInputForMotionRectanglesResultsWorker
TestInputForMotionRectanglesResultsWorker.className = "TestInputForMotionRectanglesResultsWorker"

function TestInputForMotionRectanglesResultsWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.index = 0
    self.running = false
    self.motionRectanglesVector = nil
end


function TestInputForMotionRectanglesResultsWorker.new()
    local self = setmetatable({}, TestInputForMotionRectanglesResultsWorker)
    self:_init_fields()
        self.motionRectanglesVector = BasicArrayListD.new()
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
        local try_ok, try_error = pcall(function()
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
                    if inputRobotInterface:getName():compareTo(TempInputRobotNames.DX_NAME) == 0 then
                        inputRobotInterface:mousePress(InputEvent.BUTTON1_MASK)
                        java_sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON1_MASK)
                        inputRobotInterface:mousePress(InputEvent.BUTTON2_MASK)
                        java_sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON2_MASK)
                        inputRobotInterface:mousePress(InputEvent.BUTTON3_MASK)
                        java_sleep(300)
                        inputRobotInterface:mouseRelease(InputEvent.BUTTON3_MASK)
                        inputRobotInterface:keyPress(KeyEvent.VK_1)
                        java_sleep(300)
                        inputRobotInterface:keyRelease(KeyEvent.VK_1)
                        inputRobotInterface:keyPress(KeyEvent.VK_2)
                        java_sleep(300)
                        inputRobotInterface:keyRelease(KeyEvent.VK_2)
                        inputRobotInterface:keyPress(KeyEvent.VK_3)
                        java_sleep(300)
                        inputRobotInterface:keyRelease(KeyEvent.VK_3)
                        inputRobotInterface:keyPress(KeyEvent.VK_4)
                        java_sleep(300)
                        inputRobotInterface:keyRelease(KeyEvent.VK_4)
                        inputRobotInterface:keyPress(KeyEvent.VK_F1)
                        java_sleep(300)
                        inputRobotInterface:keyRelease(KeyEvent.VK_F1)
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
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.RUN, e)
        end
end

return TestInputForMotionRectanglesResultsWorker

