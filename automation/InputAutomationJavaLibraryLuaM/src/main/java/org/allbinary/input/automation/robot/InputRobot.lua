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

local InputRobot = {}
package.loaded["org.allbinary.input.automation.robot.InputRobot"] = InputRobot

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

-- local Robot = require("java.awt.Robot")
-- local GraphicsDevice = require("java.awt.GraphicsDevice")
-- local MouseInfo = require("java.awt.MouseInfo")
-- local Point = require("java.awt.Point")
-- local Rectangle = require("java.awt.Rectangle")
-- local Color = require("java.awt.Color")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local HelpSet = require("javax.help.HelpSet")
local PointHelper = java_lazy("org.allbinary.input.automation.PointHelper")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table InputRobot is declared before the requires
InputRobot.__index = InputRobot
InputRobot.className = "InputRobot"
InputRobot.javaClassName = "org.allbinary.input.automation.robot.InputRobot"
InputRobot.java_implements = " InputRobotInterface "
InputRobot.java_interfaces = function() return {InputRobotInterface} end

function InputRobot:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.robot == nil then self.robot = nil end
end


function InputRobot._jinit(self, graphicsDevice)
    InputRobot._init_fields(self)
        self.robot = Robot.new(graphicsDevice)
    return self
end

function InputRobot.new(...)
    local self = setmetatable({}, InputRobot)
    InputRobot._jinit(self, ...)
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
function InputRobot:mouseMoveToTarget_j3(rectangle, x, y)
        local point = PointHelper.getCenterPoint(rectangle)
        self.robot:mouseMove(point.x + x, point.y + y)
        local message = tostring(StringMaker.new():append("Moved Mouse To: x: "):appendint(java_int(point.x)):append(" y: "):appendint(java_int(point.y)):append(" in the middle of: "):append(StringUtil.getInstance():toString(rectangle)))
        self.logUtil:putF(message, self, "moveMouseToTarget")
end


function InputRobot:mouseMove_j1(point)
        self:mouseMove(point.x, point.y)
end


function InputRobot:mouseMove_j2_1(x, y)
        self.robot:mouseMove(x, y)
        local message = tostring(StringMaker.new():append("Moved Mouse To: x: "):appendint(x):append(" y: "):appendint(y))
        self.logUtil:putF(message, self, "moveMouse")
end


-- throws Exception
function InputRobot:mouseMoveToTarget_j1(rectangle)
        self:mouseMoveToTarget(rectangle, 0, 0)
end
function InputRobot:mouseMoveToTarget(...)
    local count = select("#", ...)
    if count == 3 then return self:mouseMoveToTarget_j3(...) end
    if count == 1 then return self:mouseMoveToTarget_j1(...) end
    error("No method mouseMoveToTarget takes " .. count .. " arguments")
end
InputRobot.mouseMoveToTarget__jdispatcher = InputRobot.mouseMoveToTarget


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


function InputRobot:mouseMove_j2_2(x, y)
        self.robot:mouseMove(x, y)
end
function InputRobot:mouseMove(...)
    local count = select("#", ...)
    if count == 1 then return self:mouseMove_j1(...) end
    if count == 2 then return self:mouseMove_j2(...) end
    error("No method mouseMove takes " .. count .. " arguments")
end
InputRobot.mouseMove__jdispatcher = InputRobot.mouseMove
function InputRobot:mouseMove_j2(...)
    local java_a1, java_a2 = ...
    if true and math.type(java_a1) == "integer" and math.type(java_a2) == "integer" then return InputRobot.mouseMove_j2_1(self, ...) end
    return InputRobot.mouseMove_j2_2(self, ...)
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

