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
-- package org.allbinary.input.automation.module.game.test

-- local swing = require("javax.swing")
local AbstractInputAutomationFactory = require("org.allbinary.input.automation.module.AbstractInputAutomationFactory")
local InputAutomationModuleData = require("org.allbinary.input.automation.module.InputAutomationModuleData")
local BlankModuleConfigurationJPanel = require("org.allbinary.input.automation.module.configuration.BlankModuleConfigurationJPanel")
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

local TestModuleFactory = {}
TestModuleFactory.__index = TestModuleFactory
TestModuleFactory.className = "TestModuleFactory"
setmetatable(TestModuleFactory, {__index = AbstractInputAutomationFactory})

function TestModuleFactory:_init_fields()
    self.blankModuleConfigurationJPanel = nil
end


function TestModuleFactory.new()
    local self = setmetatable(AbstractInputAutomationFactory.new(TestModuleFactory.NAME, BlankModuleConfigurationJPanel.new()), TestModuleFactory)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TestModuleFactory:getName()
        return TestModuleFactory.NAME
end


function TestModuleFactory:getConfigurationJPanel()
        return self.blankModuleConfigurationJPanel
end


-- throws Exception
function TestModuleFactory:getInstance()
        return nil
end

TestModuleFactory.NAME = "Test New Game" .. tostring(InputAutomationModuleData.MODULE_NAME_END)

return TestModuleFactory

