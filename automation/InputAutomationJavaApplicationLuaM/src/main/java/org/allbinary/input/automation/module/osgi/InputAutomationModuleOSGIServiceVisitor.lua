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

local InputAutomationModuleService = require("bundle.input.automation.module.InputAutomationModuleService")
local InputAutomationJFrame = require("org.allbinary.input.automation.InputAutomationJFrame")
local InputAutomationConfigurationUtil = require("org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = require("org.allbinary.osgi.OSGIServiceInterface")
local OSGIServiceVisitorInterface = require("org.allbinary.osgi.OSGIServiceVisitorInterface")
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

local InputAutomationModuleOSGIServiceVisitor = {}
InputAutomationModuleOSGIServiceVisitor.__index = InputAutomationModuleOSGIServiceVisitor
InputAutomationModuleOSGIServiceVisitor.className = "InputAutomationModuleOSGIServiceVisitor"

function InputAutomationModuleOSGIServiceVisitor:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end


function InputAutomationModuleOSGIServiceVisitor.new()
    local self = setmetatable({}, InputAutomationModuleOSGIServiceVisitor)
    self:_init_fields()
    return self
end


function InputAutomationModuleOSGIServiceVisitor:visit(anyType)
        return self:visit(anyType)
end


-- Java overloaded method: Lua keeps the last definition
function InputAutomationModuleOSGIServiceVisitor:visit(osgiServiceInterface)
        local try_ok, try_error = pcall(function()
            local inputAutomationModuleService = osgiServiceInterface
            local inputAutomationModuleInterfaceArray = inputAutomationModuleService:getInputAutomationModuleInterfaceArray()
            for index = 0, (inputAutomationModuleInterfaceArray.n or #inputAutomationModuleInterfaceArray) - 1 do
                InputAutomationJFrame.getInstance():onAdd(InputAutomationConfigurationUtil.getChangeEvent(inputAutomationModuleInterfaceArray[index + 1]))
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "visit", e)
            return false
        end
end

return InputAutomationModuleOSGIServiceVisitor

