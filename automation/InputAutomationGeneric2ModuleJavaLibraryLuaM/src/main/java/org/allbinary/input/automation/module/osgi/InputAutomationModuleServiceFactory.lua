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

local Bundle = require("org.osgi.framework.Bundle")
local ServiceFactory = require("org.osgi.framework.ServiceFactory")
local ServiceRegistration = require("org.osgi.framework.ServiceRegistration")
local InputAutomationModuleService = require("bundle.input.automation.module.InputAutomationModuleService")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationModuleServiceFactory = {}
InputAutomationModuleServiceFactory.__index = InputAutomationModuleServiceFactory
InputAutomationModuleServiceFactory.className = "InputAutomationModuleServiceFactory"

function InputAutomationModuleServiceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputAutomationModuleInterfaceArray = nil
end


function InputAutomationModuleServiceFactory.new()
    local self = setmetatable({}, InputAutomationModuleServiceFactory)
    self:_init_fields()
    return self
end


function InputAutomationModuleServiceFactory:getService(bundle, registration)
        self.logUtil:putF(self.commonStrings.START, self, "getService")
        return InputAutomationModuleService.new(self:getInputAutomationModuleInterfaceArray())
end


function InputAutomationModuleServiceFactory:ungetService(bundle, registration, service)
end


function InputAutomationModuleServiceFactory:getInputAutomationModuleInterfaceArray()
        return self.inputAutomationModuleInterfaceArray
end


function InputAutomationModuleServiceFactory:setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray)
        self.inputAutomationModuleInterfaceArray = inputAutomationModuleInterfaceArray
end

return InputAutomationModuleServiceFactory

