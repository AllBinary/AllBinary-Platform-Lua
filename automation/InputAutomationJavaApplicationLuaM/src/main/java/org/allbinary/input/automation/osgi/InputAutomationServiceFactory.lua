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
-- package org.allbinary.input.automation.osgi

local Bundle = require("org.osgi.framework.Bundle")
local ServiceFactory = require("org.osgi.framework.ServiceFactory")
local ServiceRegistration = require("org.osgi.framework.ServiceRegistration")
local InputAutomationJFrame = require("org.allbinary.input.automation.InputAutomationJFrame")
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

local InputAutomationServiceFactory = {}
InputAutomationServiceFactory.__index = InputAutomationServiceFactory
InputAutomationServiceFactory.className = "InputAutomationServiceFactory"

function InputAutomationServiceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function InputAutomationServiceFactory.new()
    local self = setmetatable({}, InputAutomationServiceFactory)
    self:_init_fields()
    return self
end


function InputAutomationServiceFactory.getInstance()
        return InputAutomationServiceFactory.inputAutomationServiceFactory
end


function InputAutomationServiceFactory:getService(bundle, registration)
        self.logUtil:putF(self.commonStrings.START, self, "getService")
        return InputAutomationJFrame.getInstance()
end


function InputAutomationServiceFactory:ungetService(bundle, registration, service)
end

InputAutomationServiceFactory.inputAutomationServiceFactory = InputAutomationServiceFactory.new()

return InputAutomationServiceFactory

