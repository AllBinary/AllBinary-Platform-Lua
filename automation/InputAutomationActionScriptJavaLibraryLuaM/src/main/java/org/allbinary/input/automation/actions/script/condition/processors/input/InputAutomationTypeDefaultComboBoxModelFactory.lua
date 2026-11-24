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

local InputAutomationTypeDefaultComboBoxModelFactory = {}
package.loaded["org.allbinary.input.automation.actions.script.condition.processors.input.InputAutomationTypeDefaultComboBoxModelFactory"] = InputAutomationTypeDefaultComboBoxModelFactory

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

-- local Set = require("java.util.Set")
-- local DefaultComboBoxModel = require("javax.swing.DefaultComboBoxModel")
local InputRobotFactory = java_lazy("org.allbinary.input.automation.robot.InputRobotFactory")

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

-- class table InputAutomationTypeDefaultComboBoxModelFactory is declared before the requires
InputAutomationTypeDefaultComboBoxModelFactory.__index = InputAutomationTypeDefaultComboBoxModelFactory
InputAutomationTypeDefaultComboBoxModelFactory.className = "InputAutomationTypeDefaultComboBoxModelFactory"
InputAutomationTypeDefaultComboBoxModelFactory.javaClassName = "org.allbinary.input.automation.actions.script.condition.processors.input.InputAutomationTypeDefaultComboBoxModelFactory"


function InputAutomationTypeDefaultComboBoxModelFactory._jinit(self)
    return self
end

function InputAutomationTypeDefaultComboBoxModelFactory.new(...)
    local self = setmetatable({}, InputAutomationTypeDefaultComboBoxModelFactory)
    InputAutomationTypeDefaultComboBoxModelFactory._jinit(self, ...)
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

