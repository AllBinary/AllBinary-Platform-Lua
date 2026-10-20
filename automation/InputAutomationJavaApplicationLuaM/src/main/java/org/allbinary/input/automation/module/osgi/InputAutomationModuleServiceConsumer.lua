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
-- package org.allbinary.input.automation.module.osgi

local BundleContext = require("org.osgi.framework.BundleContext")
local InputAutomationModuleServiceInterface = require("bundle.input.automation.module.InputAutomationModuleServiceInterface")
local InputAutomationServiceConsumer = require("org.allbinary.osgi.service.InputAutomationServiceConsumer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationModuleServiceConsumer = {}
InputAutomationModuleServiceConsumer.__index = InputAutomationModuleServiceConsumer
InputAutomationModuleServiceConsumer.className = "InputAutomationModuleServiceConsumer"
setmetatable(InputAutomationModuleServiceConsumer, {__index = InputAutomationServiceConsumer})


function InputAutomationModuleServiceConsumer.new(bundleContext)
    local self = setmetatable(InputAutomationServiceConsumer.new(InputAutomationModuleServiceInterface:getName(), bundleContext, InputAutomationModuleOSGIServiceVisitor.new()), InputAutomationModuleServiceConsumer)
        -- super(...) made self above
    return self
end

return InputAutomationModuleServiceConsumer

