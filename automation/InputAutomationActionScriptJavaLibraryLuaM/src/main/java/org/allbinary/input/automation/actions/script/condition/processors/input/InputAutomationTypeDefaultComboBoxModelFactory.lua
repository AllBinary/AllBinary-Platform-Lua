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
-- package org.allbinary.input.automation.actions.script.condition.processors.input

-- local Set = require("java.util.Set")
-- local swing = require("javax.swing")
local InputRobotFactory = require("org.allbinary.input.automation.robot.InputRobotFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationTypeDefaultComboBoxModelFactory = {}
InputAutomationTypeDefaultComboBoxModelFactory.__index = InputAutomationTypeDefaultComboBoxModelFactory
InputAutomationTypeDefaultComboBoxModelFactory.className = "InputAutomationTypeDefaultComboBoxModelFactory"


function InputAutomationTypeDefaultComboBoxModelFactory.new()
    local self = setmetatable({}, InputAutomationTypeDefaultComboBoxModelFactory)
    return self
end


-- throws Exception
function InputAutomationTypeDefaultComboBoxModelFactory.getInstance()
        local defaultComboBoxModel = DefaultComboBoxModel.new()
        local set = InputRobotFactory.getInstance():get():keySet()
        local nameArray = set:toArray()
        local size = (nameArray.n or #nameArray)
        for index = 0, size - 1 do
            defaultComboBoxModel:addElement(nameArray[index + 1])
        end
        return defaultComboBoxModel
end

return InputAutomationTypeDefaultComboBoxModelFactory

