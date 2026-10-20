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

local InputAutomationModuleConfiguration = require("org.allbinary.input.automation.module.configuration.InputAutomationModuleConfiguration")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationConfigurationModuleChangeEvent = {}
InputAutomationConfigurationModuleChangeEvent.__index = InputAutomationConfigurationModuleChangeEvent
InputAutomationConfigurationModuleChangeEvent.className = "InputAutomationConfigurationModuleChangeEvent"

function InputAutomationConfigurationModuleChangeEvent:_init_fields()
    self.inputAutomationModuleConfiguration = nil
end


function InputAutomationConfigurationModuleChangeEvent.new(inputAutomationModuleConfiguration)
    local self = setmetatable({}, InputAutomationConfigurationModuleChangeEvent)
    self:_init_fields()
        self:setInputAutomationModuleConfiguration(inputAutomationModuleConfiguration)
    return self
end


function InputAutomationConfigurationModuleChangeEvent:getInputAutomationModuleConfiguration()
        return self.inputAutomationModuleConfiguration
end


function InputAutomationConfigurationModuleChangeEvent:setInputAutomationModuleConfiguration(inputAutomationModuleConfiguration)
        self.inputAutomationModuleConfiguration = inputAutomationModuleConfiguration
end

return InputAutomationConfigurationModuleChangeEvent

