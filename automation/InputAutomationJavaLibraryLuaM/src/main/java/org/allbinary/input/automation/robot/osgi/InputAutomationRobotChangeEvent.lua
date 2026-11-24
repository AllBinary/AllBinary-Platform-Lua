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
-- package org.allbinary.input.automation.robot.osgi

local InputAutomationRobotChangeEvent = {}
package.loaded["org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent"] = InputAutomationRobotChangeEvent

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

local InputAutomationRobotInterfaceWrapper = java_lazy("org.allbinary.input.automation.robot.osgi.InputAutomationRobotInterfaceWrapper")

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

-- class table InputAutomationRobotChangeEvent is declared before the requires
InputAutomationRobotChangeEvent.__index = InputAutomationRobotChangeEvent
InputAutomationRobotChangeEvent.className = "InputAutomationRobotChangeEvent"
InputAutomationRobotChangeEvent.javaClassName = "org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent"

function InputAutomationRobotChangeEvent:_init_fields()
    if self.inputAutomationRobotInterfaceWrapper == nil then self.inputAutomationRobotInterfaceWrapper = nil end
end


function InputAutomationRobotChangeEvent._jinit(self, inputAutomationRobotInterfaceWrapper)
    InputAutomationRobotChangeEvent._init_fields(self)
        self:setInputAutomationRobotInterfaceWrapper(inputAutomationRobotInterfaceWrapper)
    return self
end

function InputAutomationRobotChangeEvent.new(...)
    local self = setmetatable({}, InputAutomationRobotChangeEvent)
    InputAutomationRobotChangeEvent._jinit(self, ...)
    return self
end


function InputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper()
        return self.inputAutomationRobotInterfaceWrapper
end


function InputAutomationRobotChangeEvent:setInputAutomationRobotInterfaceWrapper(inputAutomationRobotInterfaceWrapper)
        self.inputAutomationRobotInterfaceWrapper = inputAutomationRobotInterfaceWrapper
end

return InputAutomationRobotChangeEvent

