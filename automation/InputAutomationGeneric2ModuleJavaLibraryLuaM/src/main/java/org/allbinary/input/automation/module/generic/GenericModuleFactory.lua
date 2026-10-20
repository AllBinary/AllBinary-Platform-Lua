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
-- package org.allbinary.input.automation.module.generic

local AbstractInputAutomationFactory = require("org.allbinary.input.automation.module.AbstractInputAutomationFactory")
local InputAutomationActionInterface = require("org.allbinary.input.automation.module.InputAutomationActionInterface")
local InputAutomationModuleData = require("org.allbinary.input.automation.module.InputAutomationModuleData")
local GenericModuleConfigurationJPanel = require("org.allbinary.input.automation.module.generic.configuration.GenericModuleConfigurationJPanel")
local GenericProfile = require("org.allbinary.input.automation.module.generic.configuration.profile.GenericProfile")
local NoImageComparatorConstraints = require("org.allbinary.input.automation.module.generic.constraints.NoImageComparatorConstraints")
local NoMotionRectangleConstraints = require("org.allbinary.input.automation.module.generic.constraints.NoMotionRectangleConstraints")
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

local GenericModuleFactory = {}
GenericModuleFactory.__index = GenericModuleFactory
GenericModuleFactory.className = "GenericModuleFactory"
setmetatable(GenericModuleFactory, {__index = AbstractInputAutomationFactory})


function GenericModuleFactory.new()
    local self = setmetatable(AbstractInputAutomationFactory.new(GenericModuleFactory.NAME, GenericModuleConfigurationJPanel.new()), GenericModuleFactory)
        -- super(...) made self above
    return self
end


-- throws Exception
function GenericModuleFactory:getInstance()
        local genericProfile = (self:getConfigurationJPanel()):getSelectedGenericProfile()
        local inputAutomationActionInterface = GenericInputAutomationAction.new()
        return GenericInputAutomationWorker.new(inputAutomationActionInterface, genericProfile, NoMotionRectangleConstraints.new(), NoImageComparatorConstraints.new())
end

GenericModuleFactory.NAME = "Generic" .. tostring(InputAutomationModuleData.MODULE_NAME_END)

return GenericModuleFactory

