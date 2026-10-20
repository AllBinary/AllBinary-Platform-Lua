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
-- package org.allbinary.input.automation.robot

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local HelpSet = require("javax.help.HelpSet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local InputRobotInterface = {}
InputRobotInterface.__index = InputRobotInterface
InputRobotInterface.className = "InputRobotInterface"


function InputRobotInterface:getName()
    error("abstract method getName")
end


function InputRobotInterface:getHelpSet()
    error("abstract method getHelpSet")
end


function InputRobotInterface:createScreenCapture(screenRect)
    error("abstract method createScreenCapture")
end


function InputRobotInterface:delay(ms)
    error("abstract method delay")
end


function InputRobotInterface:getAutoDelay()
    error("abstract method getAutoDelay")
end


function InputRobotInterface:getPixelColor(x, y)
    error("abstract method getPixelColor")
end


function InputRobotInterface:isAutoWaitForIdle()
    error("abstract method isAutoWaitForIdle")
end


function InputRobotInterface:keyPress(keycode)
    error("abstract method keyPress")
end


function InputRobotInterface:keyRelease(keycode)
    error("abstract method keyRelease")
end


function InputRobotInterface:getMousePoint()
    error("abstract method getMousePoint")
end


function InputRobotInterface:mouseMove(x, y)
    error("abstract method mouseMove")
end


function InputRobotInterface:mousePress(buttons)
    error("abstract method mousePress")
end


function InputRobotInterface:mouseRelease(buttons)
    error("abstract method mouseRelease")
end


function InputRobotInterface:mouseWheel(wheelAmt)
    error("abstract method mouseWheel")
end


function InputRobotInterface:setAutoDelay(ms)
    error("abstract method setAutoDelay")
end


function InputRobotInterface:setAutoWaitForIdle(isOn)
    error("abstract method setAutoWaitForIdle")
end


function InputRobotInterface:toString()
    error("abstract method toString")
end
InputRobotInterface.__tostring = function(self) return self:toString() end


function InputRobotInterface:waitForIdle()
    error("abstract method waitForIdle")
end


-- Java overloaded method: Lua keeps the last definition
function InputRobotInterface:mouseMove(point)
    error("abstract method mouseMove")
end


-- throws Exception
function InputRobotInterface:mouseMoveToTarget(rectangle)
    error("abstract method mouseMoveToTarget")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function InputRobotInterface:mouseMoveToTarget(rectangle, x, y)
    error("abstract method mouseMoveToTarget")
end

return InputRobotInterface

