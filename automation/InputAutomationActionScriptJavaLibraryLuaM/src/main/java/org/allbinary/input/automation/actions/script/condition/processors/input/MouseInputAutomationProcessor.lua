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

local MouseInputAutomationProcessor = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.MouseInputAutomationProcessor"] = MouseInputAutomationProcessor

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

local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local MouseActionScriptInputInterface = java_lazy("org.allbinary.input.automation.actions.script.condition.processors.input.MouseActionScriptInputInterface")

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

-- class table MouseInputAutomationProcessor is declared before the requires
MouseInputAutomationProcessor.__index = MouseInputAutomationProcessor
MouseInputAutomationProcessor.className = "MouseInputAutomationProcessor"
MouseInputAutomationProcessor.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.MouseInputAutomationProcessor"


function MouseInputAutomationProcessor._jinit(self)
    return self
end

function MouseInputAutomationProcessor.new(...)
    local self = setmetatable({}, MouseInputAutomationProcessor)
    MouseInputAutomationProcessor._jinit(self, ...)
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

