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

local InputRobotInterface = {}
package.loaded["org.allbinary.input.automation.robot.InputRobotInterface"] = InputRobotInterface

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
-- local Color = require("java.awt.Color")
-- local Point = require("java.awt.Point")
-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local HelpSet = require("javax.help.HelpSet")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

-- Java interface
-- class table InputRobotInterface is declared before the requires
InputRobotInterface.__index = InputRobotInterface
InputRobotInterface.className = "InputRobotInterface"
InputRobotInterface.javaClassName = "org.allbinary.input.automation.robot.InputRobotInterface"


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


function InputRobotInterface:mouseMove_j2(x, y)
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


function InputRobotInterface:mouseMove_j1(point)
    error("abstract method mouseMove")
end
function InputRobotInterface:mouseMove(...)
    local count = select("#", ...)
    if count == 2 then return self:mouseMove_j2(...) end
    if count == 1 then return self:mouseMove_j1(...) end
    error("No method mouseMove takes " .. count .. " arguments")
end
InputRobotInterface.mouseMove__jdispatcher = InputRobotInterface.mouseMove


-- throws Exception
function InputRobotInterface:mouseMoveToTarget_j1(rectangle)
    error("abstract method mouseMoveToTarget")
end


-- throws Exception
function InputRobotInterface:mouseMoveToTarget_j3(rectangle, x, y)
    error("abstract method mouseMoveToTarget")
end
function InputRobotInterface:mouseMoveToTarget(...)
    local count = select("#", ...)
    if count == 1 then return self:mouseMoveToTarget_j1(...) end
    if count == 3 then return self:mouseMoveToTarget_j3(...) end
    error("No method mouseMoveToTarget takes " .. count .. " arguments")
end
InputRobotInterface.mouseMoveToTarget__jdispatcher = InputRobotInterface.mouseMoveToTarget

return InputRobotInterface

