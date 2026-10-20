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

local BundleActivator = require("org.osgi.framework.BundleActivator")
local BundleContext = require("org.osgi.framework.BundleContext")
local ServiceFactory = require("org.osgi.framework.ServiceFactory")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local InputAutomationModuleServiceInterface = require("bundle.input.automation.module.InputAutomationModuleServiceInterface")
local InputAutomationConfigurationModuleChangeListener = require("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationConfigurationModuleChangeEvent = require("org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent")
local InputAutomationConfigurationUtil = require("org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil")
local InputAutomationModuleFactoryInterface = require("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIActivatorUtil = require("org.allbinary.osgi.OSGIActivatorUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local InputAutomationModuleBundleActivator = {}
InputAutomationModuleBundleActivator.__index = InputAutomationModuleBundleActivator
InputAutomationModuleBundleActivator.className = "InputAutomationModuleBundleActivator"

function InputAutomationModuleBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputAutomationModuleInterface = nil
    self.serviceFactory = nil
end


function InputAutomationModuleBundleActivator.new()
    local self = setmetatable({}, InputAutomationModuleBundleActivator)
    self:_init_fields()
        self:init()
    return self
end


-- throws Exception
function InputAutomationModuleBundleActivator:init()
        error(java_exception("RuntimeException"), 0)
end


-- throws Exception
function InputAutomationModuleBundleActivator:getInputAutomationConfigurationModuleChangeListener(context)
        local serviceReference = context:getServiceReference(InputAutomationConfigurationModuleChangeListener:getName())
        if serviceReference ~= nil then
            local inputAutomationConfigurationModuleChangeListener = context:getService(serviceReference)
            if inputAutomationConfigurationModuleChangeListener == nil then
                error(java_exception("Exception", "No Service For ServiceReference"), 0)
            end
            return inputAutomationConfigurationModuleChangeListener
        else
            self.logUtil:putF("No ServiceReference: " .. InputAutomationConfigurationModuleChangeListener:getName(), self, "addModules")
            return nil
        end
end


function InputAutomationModuleBundleActivator:addModules(context)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "addModules")
            local inputAutomationConfigurationModuleChangeListener = self:getInputAutomationConfigurationModuleChangeListener(context)
            if inputAutomationConfigurationModuleChangeListener ~= nil then
                for index = 0, (self:getInputAutomationModuleInterface().n or #self:getInputAutomationModuleInterface()) - 1 do
                    local inputAutomationConfigurationModuleChangeEvent = InputAutomationConfigurationUtil.getChangeEvent(self:getInputAutomationModuleInterface()[index + 1])
                    inputAutomationConfigurationModuleChangeListener:onAdd(inputAutomationConfigurationModuleChangeEvent)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "addModules")
        end
end


-- throws Exception
function InputAutomationModuleBundleActivator:registerAsService(bundleContext)
        OSGIActivatorUtil.registerAsService(bundleContext, self:getServiceFactory(), InputAutomationModuleServiceInterface:getName())
end


function InputAutomationModuleBundleActivator:removeModules(context)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "removeModules")
            local inputAutomationConfigurationModuleChangeListener = self:getInputAutomationConfigurationModuleChangeListener(context)
            if inputAutomationConfigurationModuleChangeListener ~= nil then
                for index = 0, (self:getInputAutomationModuleInterface().n or #self:getInputAutomationModuleInterface()) - 1 do
                    local inputAutomationConfigurationModuleChangeEvent = InputAutomationConfigurationUtil.getChangeEvent(self:getInputAutomationModuleInterface()[index + 1])
                    inputAutomationConfigurationModuleChangeListener:onRemove(inputAutomationConfigurationModuleChangeEvent)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "removeModules")
        end
end


-- throws Exception
function InputAutomationModuleBundleActivator:start(context)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START)
        self:addModules(context)
        self:registerAsService(context)
end


-- throws Exception
function InputAutomationModuleBundleActivator:stop(context)
        self.logUtil:putF(self.commonStrings.START, self, "stop")
        self:removeModules(context)
end


function InputAutomationModuleBundleActivator:getInputAutomationModuleInterface()
        return self.inputAutomationModuleInterface
end


function InputAutomationModuleBundleActivator:setInputAutomationModuleInterface(inputAutomationModuleInterface)
        self.inputAutomationModuleInterface = inputAutomationModuleInterface
end


function InputAutomationModuleBundleActivator:getServiceFactory()
        return self.serviceFactory
end


function InputAutomationModuleBundleActivator:setServiceFactory(serviceObject)
        self.serviceFactory = serviceObject
end

return InputAutomationModuleBundleActivator

