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
local PointHelper = require("org.allbinary.input.automation.PointHelper")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputRobot = {}
InputRobot.__index = InputRobot
InputRobot.className = "InputRobot"

function InputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.robot = nil
end


function InputRobot.new(graphicsDevice)
    local self = setmetatable({}, InputRobot)
    self:_init_fields()
        self.robot = Robot.new(graphicsDevice)
    return self
end


function InputRobot:getName()
        return InputRobot.NAME
end


function InputRobot:getHelpSet()
        return nil
end


function InputRobot:getMousePoint()
        local point = MouseInfo.getPointerInfo():getLocation()
        return point
end


-- throws Exception
function InputRobot:mouseMoveToTarget(rectangle, x, y)
        local point = PointHelper.getCenterPoint(rectangle)
        self.robot:mouseMove(point.x + x, point.y + y)
        local message = tostring(StringMaker.new():append("Moved Mouse To: x: "):appendint(java_int(point.x)):append(" y: "):appendint(java_int(point.y)):append(" in the middle of: "):append(StringUtil.getInstance():toString(rectangle)))
        self.logUtil:putF(message, self, "moveMouseToTarget")
end


function InputRobot:mouseMove(point)
        self:mouseMove(point.x, point.y)
end


-- Java overloaded method: Lua keeps the last definition
function InputRobot:mouseMove(x, y)
        self.robot:mouseMove(x, y)
        local message = tostring(StringMaker.new():append("Moved Mouse To: x: "):appendint(x):append(" y: "):appendint(y))
        self.logUtil:putF(message, self, "moveMouse")
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function InputRobot:mouseMoveToTarget(rectangle)
        self:mouseMoveToTarget(rectangle, 0, 0)
end


function InputRobot:createScreenCapture(screenRect)
        return self.robot:createScreenCapture(screenRect)
end


function InputRobot:delay(ms)
        self.robot:delay(ms)
end


function InputRobot:getAutoDelay()
        return self.robot:getAutoDelay()
end


function InputRobot:getPixelColor(x, y)
        return self.robot:getPixelColor(x, y)
end


function InputRobot:isAutoWaitForIdle()
        return self.robot:isAutoWaitForIdle()
end


function InputRobot:keyPress(keycode)
        self.robot:keyPress(keycode)
end


function InputRobot:keyRelease(keycode)
        self.robot:keyRelease(keycode)
end


-- Java overloaded method: Lua keeps the last definition
function InputRobot:mouseMove(x, y)
        self.robot:mouseMove(x, y)
end


function InputRobot:mousePress(buttons)
        self.robot:mousePress(buttons)
end


function InputRobot:mouseRelease(buttons)
        self.robot:mouseRelease(buttons)
end


function InputRobot:mouseWheel(wheelAmt)
        self.robot:mouseWheel(wheelAmt)
end


function InputRobot:setAutoDelay(ms)
        self.robot:setAutoDelay(ms)
end


function InputRobot:setAutoWaitForIdle(isOn)
        self.robot:setAutoWaitForIdle(isOn)
end


function InputRobot:toString()
        return tostring(self.robot)
end
InputRobot.__tostring = function(self) return self:toString() end


function InputRobot:waitForIdle()
        self.robot:waitForIdle()
end


function InputRobot:on()
end


function InputRobot:off()
end

InputRobot.NAME = "Java Robot"

return InputRobot

