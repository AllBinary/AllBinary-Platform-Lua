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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local MouseInputAutomationProcessor = {}
MouseInputAutomationProcessor.__index = MouseInputAutomationProcessor
MouseInputAutomationProcessor.className = "MouseInputAutomationProcessor"


function MouseInputAutomationProcessor.new()
    local self = setmetatable({}, MouseInputAutomationProcessor)
    return self
end


-- throws Exception
function MouseInputAutomationProcessor.process(mouseActionScriptInputInterface)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        logUtil:putF(tostring(StringMaker.new():append("Start - Processing Mouse Input at: "):append(tostring(mouseActionScriptInputInterface:getPoint())):append(" clicks: "):appendint(java_int(mouseActionScriptInputInterface:getButtonClicks()))), "MouseInputAutomationProcessor", commonStrings.PROCESS)
        local inputRobotInterface = mouseActionScriptInputInterface:getInputRobotInterface()
        if mouseActionScriptInputInterface:getPoint().x ~= -1 and mouseActionScriptInputInterface:getPoint().y ~= -1 then
            inputRobotInterface:mouseMove(mouseActionScriptInputInterface:getPoint())
        end
        java_sleep(mouseActionScriptInputInterface:getTime())
        if mouseActionScriptInputInterface:getButtonClicks() ~= 0 then
            inputRobotInterface:mousePress(mouseActionScriptInputInterface:getButtonClicks())
            java_sleep(mouseActionScriptInputInterface:getTime())
            inputRobotInterface:mouseRelease(mouseActionScriptInputInterface:getButtonClicks())
        end
        java_sleep(mouseActionScriptInputInterface:getTime())
end

return MouseInputAutomationProcessor

