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
-- package org.allbinary.input.automation.configuration

local InputAutomationConfigurationUtil = {}
package.loaded["org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil"] = InputAutomationConfigurationUtil

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

local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local InputAutomationModuleConfiguration = java_lazy("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")
local InputAutomationConfigurationModuleChangeEvent = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent")

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

-- class table InputAutomationConfigurationUtil is declared before the requires
InputAutomationConfigurationUtil.__index = InputAutomationConfigurationUtil
InputAutomationConfigurationUtil.className = "InputAutomationConfigurationUtil"
InputAutomationConfigurationUtil.javaClassName = "org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil"


function InputAutomationConfigurationUtil._jinit(self)
    return self
end

function InputAutomationConfigurationUtil.new(...)
    local self = setmetatable({}, InputAutomationConfigurationUtil)
    InputAutomationConfigurationUtil._jinit(self, ...)
    return self
end


-- throws Exception
function InputAutomationConfigurationUtil.getChangeEvent(inputAutomationModuleInterface)
        local inputAutomationModuleConfiguration = InputAutomationModuleConfiguration.new(inputAutomationModuleInterface)
        local inputAutomationConfigurationModuleChangeEvent = InputAutomationConfigurationModuleChangeEvent.new(inputAutomationModuleConfiguration)
        return inputAutomationConfigurationModuleChangeEvent
end

return InputAutomationConfigurationUtil

