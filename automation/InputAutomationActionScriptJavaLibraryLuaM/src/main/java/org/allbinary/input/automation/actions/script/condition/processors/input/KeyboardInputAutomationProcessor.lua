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
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

local KeyboardInputAutomationProcessor = {}
KeyboardInputAutomationProcessor.__index = KeyboardInputAutomationProcessor
KeyboardInputAutomationProcessor.className = "KeyboardInputAutomationProcessor"


function KeyboardInputAutomationProcessor.new()
    local self = setmetatable({}, KeyboardInputAutomationProcessor)
    return self
end


-- throws Exception
function KeyboardInputAutomationProcessor.process(keyActionScriptInputInterface)
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        logUtil:putF(tostring(CommonLabels.getInstance().START) .. tostring(keyActionScriptInputInterface), "KeyInputAutomationProcessor", commonStrings.PROCESS)
        local inputRobotInterface = keyActionScriptInputInterface:getInputRobotInterface()
        local integer = keyActionScriptInputInterface:getKeyArray()
        if keyActionScriptInputInterface:getDelayBetweenKeys() == 0 then
            for index = 0, (keyActionScriptInputInterface:getKeyArray().n or #keyActionScriptInputInterface:getKeyArray()) - 1 do
                if keyActionScriptInputInterface:isPress() then
                    inputRobotInterface:keyPress(integer[index + 1])
                end
            end
            java_sleep(keyActionScriptInputInterface:getTime())
            for index = (keyActionScriptInputInterface:getKeyArray().n or #keyActionScriptInputInterface:getKeyArray()) - 1, 0, -1 do
                if keyActionScriptInputInterface:isRelease() then
                    inputRobotInterface:keyRelease(integer[index + 1])
                end
            end
        else
            for index = 0, (keyActionScriptInputInterface:getKeyArray().n or #keyActionScriptInputInterface:getKeyArray()) - 1 do
                if keyActionScriptInputInterface:isPress() then
                    inputRobotInterface:keyPress(integer[index + 1])
                end
                java_sleep(keyActionScriptInputInterface:getTime())
                if keyActionScriptInputInterface:isRelease() then
                    inputRobotInterface:keyRelease(integer[index + 1])
                end
                local timeHelper = TimeDelayHelper.new(keyActionScriptInputInterface:getDelayBetweenKeys())
                local toLong = 0
                while not timeHelper:isTimeTNT() or toLong > 6000 do
                    toLong = toLong + 1
                    java_sleep(50)
                end
            end
        end
end

return KeyboardInputAutomationProcessor

