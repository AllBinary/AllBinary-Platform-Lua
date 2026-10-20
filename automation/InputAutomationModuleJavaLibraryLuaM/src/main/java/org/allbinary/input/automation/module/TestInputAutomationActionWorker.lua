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

-- local Set = require("java.util.Set")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ImageComparatorConstraintsInterface = require("org.allbinary.media.image.comparison.ImageComparatorConstraintsInterface")
local MotionRectangleConstraintsInterface = require("org.allbinary.media.image.comparison.motion.MotionRectangleConstraintsInterface")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local AbstractInputAutomationWorker = require("org.allbinary.input.automation.module.AbstractInputAutomationWorker")

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

local TestInputAutomationActionWorker = {}
TestInputAutomationActionWorker.__index = TestInputAutomationActionWorker
TestInputAutomationActionWorker.className = "TestInputAutomationActionWorker"
setmetatable(TestInputAutomationActionWorker, {__index = AbstractInputAutomationWorker})

function TestInputAutomationActionWorker:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.sleep = nil
end


function TestInputAutomationActionWorker.new(sleep, inputAutomationActionInterface, imageComparatorConstraintsInterface, motionRectangleConstraintsInterface)
    local self = setmetatable(AbstractInputAutomationWorker.new(inputAutomationActionInterface), TestInputAutomationActionWorker)
    self:_init_fields()
        -- super(...) made self above
        self.logUtil:putF("BasicTestAttackWorder", self, self.commonStrings.CONSTRUCTOR)
        self.sleep = sleep
    return self
end


-- throws Exception
function TestInputAutomationActionWorker:processBetweenWorkers()
        java_sleep(2000)
end


-- throws Exception
function TestInputAutomationActionWorker:process()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        local hashtable = InputRobotFactory.getInstance():get()
        local set = hashtable:keySet()
        local inputTypeNameArray = set:toArray()
        local size = (inputTypeNameArray.n or #inputTypeNameArray)
        for index = 0, size - 1 do
            local inputTypeNameString = inputTypeNameArray[index + 1]
            local robot = hashtable:get(inputTypeNameString)
            if self.sleep > 0 then
                java_sleep(self.sleep)
            end
        end
end

return TestInputAutomationActionWorker

