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
-- package org.allbinary.input.automation.module

-- local HelpSet = require("javax.help.HelpSet")
-- local swing = require("javax.swing")
local RunnableInterface = require("org.allbinary.thread.RunnableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationModuleFactoryInterface = {}
InputAutomationModuleFactoryInterface.__index = InputAutomationModuleFactoryInterface
InputAutomationModuleFactoryInterface.className = "InputAutomationModuleFactoryInterface"

function InputAutomationModuleFactoryInterface.new()
    local self = setmetatable({}, InputAutomationModuleFactoryInterface)
    return self
end


function InputAutomationModuleFactoryInterface:getName()
        return nil
end


function InputAutomationModuleFactoryInterface:getConfigurationJPanel()
        return nil
end


function InputAutomationModuleFactoryInterface:getHelpSet()
        return nil
end


-- throws Exception
function InputAutomationModuleFactoryInterface:getInstance()
        return nil
end

return InputAutomationModuleFactoryInterface

