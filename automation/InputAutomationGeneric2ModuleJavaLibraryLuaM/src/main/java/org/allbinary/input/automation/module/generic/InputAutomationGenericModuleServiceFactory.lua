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

local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local InputAutomationModuleServiceFactory = require("org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationGenericModuleServiceFactory = {}
InputAutomationGenericModuleServiceFactory.__index = InputAutomationGenericModuleServiceFactory
InputAutomationGenericModuleServiceFactory.className = "InputAutomationGenericModuleServiceFactory"
setmetatable(InputAutomationGenericModuleServiceFactory, {__index = InputAutomationModuleServiceFactory})

function InputAutomationGenericModuleServiceFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function InputAutomationGenericModuleServiceFactory.new()
    local self = setmetatable(InputAutomationModuleServiceFactory.new(), InputAutomationGenericModuleServiceFactory)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local inputAutomationModuleInterfaceArray = java_new_array(nil, 1)
            inputAutomationModuleInterfaceArray[1] = GenericModuleFactory.new()
            self:setInputAutomationModuleInterfaceArray(inputAutomationModuleInterfaceArray)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function InputAutomationGenericModuleServiceFactory.getInstance()
        return InputAutomationGenericModuleServiceFactory.inputAutomationGenericModuleServiceFactory
end

InputAutomationGenericModuleServiceFactory.inputAutomationGenericModuleServiceFactory = InputAutomationGenericModuleServiceFactory.new()

return InputAutomationGenericModuleServiceFactory

