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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationRobotChangeEvent = {}
InputAutomationRobotChangeEvent.__index = InputAutomationRobotChangeEvent
InputAutomationRobotChangeEvent.className = "InputAutomationRobotChangeEvent"

function InputAutomationRobotChangeEvent:_init_fields()
    self.inputAutomationRobotInterfaceWrapper = nil
end


function InputAutomationRobotChangeEvent.new(inputAutomationRobotInterfaceWrapper)
    local self = setmetatable({}, InputAutomationRobotChangeEvent)
    self:_init_fields()
        self:setInputAutomationRobotInterfaceWrapper(inputAutomationRobotInterfaceWrapper)
    return self
end


function InputAutomationRobotChangeEvent:getInputAutomationRobotInterfaceWrapper()
        return self.inputAutomationRobotInterfaceWrapper
end


function InputAutomationRobotChangeEvent:setInputAutomationRobotInterfaceWrapper(inputAutomationRobotInterfaceWrapper)
        self.inputAutomationRobotInterfaceWrapper = inputAutomationRobotInterfaceWrapper
end

return InputAutomationRobotChangeEvent

