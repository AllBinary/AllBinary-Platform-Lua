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
-- package bundle.input.automation.robot

local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
local OSGIServiceInterface = require("org.allbinary.osgi.OSGIServiceInterface")

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
local InputAutomationRobotServiceInterface = {}
InputAutomationRobotServiceInterface.__index = InputAutomationRobotServiceInterface
InputAutomationRobotServiceInterface.className = "InputAutomationRobotServiceInterface"
setmetatable(InputAutomationRobotServiceInterface, {__index = OSGIServiceInterface})


function InputAutomationRobotServiceInterface:getInputRobotInterfaceArray()
    error("abstract method getInputRobotInterfaceArray")
end

return InputAutomationRobotServiceInterface

