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

local InputAutomationModuleBundleActivator = {}
package.loaded["org.allbinary.input.automation.module.osgi.InputAutomationModuleBundleActivator"] = InputAutomationModuleBundleActivator

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

local BundleActivator = java_lazy("org.osgi.framework.BundleActivator")
local BundleContext = java_lazy("org.osgi.framework.BundleContext")
local ServiceFactory = java_lazy("org.osgi.framework.ServiceFactory")
local ServiceReference = java_lazy("org.osgi.framework.ServiceReference")
local InputAutomationModuleServiceInterface = java_lazy("bundle.input.automation.module.InputAutomationModuleServiceInterface")
local InputAutomationConfigurationModuleChangeListener = java_lazy("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationConfigurationModuleChangeEvent = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationModuleChangeEvent")
local InputAutomationConfigurationUtil = java_lazy("org.allbinary.input.automation.configuration.InputAutomationConfigurationUtil")
local InputAutomationModuleFactoryInterface = java_lazy("org.allbinary.input.automation.module.InputAutomationModuleFactoryInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OSGIActivatorUtil = java_lazy("org.allbinary.osgi.OSGIActivatorUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table InputAutomationModuleBundleActivator is declared before the requires
InputAutomationModuleBundleActivator.__index = InputAutomationModuleBundleActivator
InputAutomationModuleBundleActivator.className = "InputAutomationModuleBundleActivator"
InputAutomationModuleBundleActivator.javaClassName = "org.allbinary.input.automation.module.osgi.InputAutomationModuleBundleActivator"
InputAutomationModuleBundleActivator.java_implements = " BundleActivator "
InputAutomationModuleBundleActivator.java_interfaces = function() return {BundleActivator} end

function InputAutomationModuleBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.inputAutomationModuleInterface == nil then self.inputAutomationModuleInterface = nil end
    if self.serviceFactory == nil then self.serviceFactory = nil end
end


function InputAutomationModuleBundleActivator._jinit(self)
    InputAutomationModuleBundleActivator._init_fields(self)
        self:init()
    return self
end

function InputAutomationModuleBundleActivator.new(...)
    local self = setmetatable({}, InputAutomationModuleBundleActivator)
    InputAutomationModuleBundleActivator._jinit(self, ...)
    return self
end


-- throws Exception
function InputAutomationModuleBundleActivator:init()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function InputAutomationModuleBundleActivator:getInputAutomationConfigurationModuleChangeListener(context)
        local serviceReference = context:getServiceReference(InputAutomationConfigurationModuleChangeListener:getName())
        if serviceReference ~= nil then
            local inputAutomationConfigurationModuleChangeListener = context:getService(serviceReference)
            if inputAutomationConfigurationModuleChangeListener == nil then
                error(require("java.lang.Exception").new("No Service For ServiceReference"), 0)
            end
            return inputAutomationConfigurationModuleChangeListener
        else
            self.logUtil:putF("No ServiceReference: " .. InputAutomationConfigurationModuleChangeListener:getName(), self, "addModules")
            return nil
        end
end


function InputAutomationModuleBundleActivator:addModules(context)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "addModules")
        end
end


-- throws Exception
function InputAutomationModuleBundleActivator:registerAsService(bundleContext)
        OSGIActivatorUtil.registerAsService(bundleContext, self:getServiceFactory(), InputAutomationModuleServiceInterface:getName())
end


function InputAutomationModuleBundleActivator:removeModules(context)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
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

