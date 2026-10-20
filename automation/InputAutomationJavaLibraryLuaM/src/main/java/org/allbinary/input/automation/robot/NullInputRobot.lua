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
local AbstractInputRobot = require("org.allbinary.input.automation.AbstractInputRobot")
local PointFactory = require("org.allbinary.input.automation.PointFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
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

local NullInputRobot = {}
NullInputRobot.__index = NullInputRobot
NullInputRobot.className = "NullInputRobot"
setmetatable(NullInputRobot, {__index = AbstractInputRobot})

function NullInputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function NullInputRobot.new()
    local self = setmetatable(AbstractInputRobot.new(nil), NullInputRobot)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function NullInputRobot:getName()
        return NullInputRobot.NAME
end


function NullInputRobot:getHelpSet()
        return nil
end


function NullInputRobot:getMousePoint()
        return PointFactory.getInstance(0, 0)
end


function NullInputRobot:keyPress(keycode)
        self.logUtil:putF("KeyCode: " .. tostring(keycode), self, "keyPress")
end


function NullInputRobot:keyRelease(keycode)
        self.logUtil:putF("KeyCode: " .. tostring(keycode), self, "keyRelease")
end


function NullInputRobot:mouseMove(x, y)
        self.logUtil:putF("X: " .. tostring(x) .. " Y: " .. tostring(y), self, "mouseMove")
end


function NullInputRobot:mousePress(buttons)
        self.logUtil:putF("Buttons: " .. tostring(buttons), self, "mousePress")
end


function NullInputRobot:mouseRelease(buttons)
        self.logUtil:putF("Buttons: " .. tostring(buttons), self, "mouseRelease")
end


function NullInputRobot:createScreenCapture(screenRect)
        return nil
end


function NullInputRobot:delay(ms)
end


function NullInputRobot:getAutoDelay()
        return -1
end


function NullInputRobot:getPixelColor(x, y)
        return nil
end


function NullInputRobot:isAutoWaitForIdle()
        return false
end


function NullInputRobot:mouseWheel(wheelAmt)
end


function NullInputRobot:setAutoDelay(ms)
end


function NullInputRobot:setAutoWaitForIdle(isOn)
end


function NullInputRobot:toString()
        return "DirectXWindowsInputRobot"
end
NullInputRobot.__tostring = function(self) return self:toString() end


function NullInputRobot:waitForIdle()
end

NullInputRobot.LIBRARY_NAME = "null"
NullInputRobot.NAME = "NULL"

return NullInputRobot

