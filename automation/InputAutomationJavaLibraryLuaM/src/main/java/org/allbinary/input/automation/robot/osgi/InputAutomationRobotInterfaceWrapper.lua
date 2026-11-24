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

local InputAutomationRobotInterfaceWrapper = {}
package.loaded["org.allbinary.input.automation.robot.osgi.InputAutomationRobotInterfaceWrapper"] = InputAutomationRobotInterfaceWrapper

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

-- class table InputAutomationRobotInterfaceWrapper is declared before the requires
InputAutomationRobotInterfaceWrapper.__index = InputAutomationRobotInterfaceWrapper
InputAutomationRobotInterfaceWrapper.className = "InputAutomationRobotInterfaceWrapper"
InputAutomationRobotInterfaceWrapper.javaClassName = "org.allbinary.input.automation.robot.osgi.InputAutomationRobotInterfaceWrapper"

function InputAutomationRobotInterfaceWrapper:_init_fields()
    if self.inputRobotInterface == nil then self.inputRobotInterface = nil end
end


function InputAutomationRobotInterfaceWrapper._jinit(self, inputRobotInterface)
    InputAutomationRobotInterfaceWrapper._init_fields(self)
        self:setInputRobotInterface(inputRobotInterface)
    return self
end

function InputAutomationRobotInterfaceWrapper.new(...)
    local self = setmetatable({}, InputAutomationRobotInterfaceWrapper)
    InputAutomationRobotInterfaceWrapper._jinit(self, ...)
    return self
end


function InputAutomationRobotInterfaceWrapper:getInputRobotInterface()
        return self.inputRobotInterface
end


function InputAutomationRobotInterfaceWrapper:setInputRobotInterface(inputRobotInterface)
        self.inputRobotInterface = inputRobotInterface
end

return InputAutomationRobotInterfaceWrapper

