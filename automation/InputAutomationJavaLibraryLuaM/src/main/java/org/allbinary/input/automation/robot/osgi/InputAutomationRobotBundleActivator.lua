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
-- package org.allbinary.input.automation.robot.osgi

local InputAutomationRobotBundleActivator = {}
package.loaded["org.allbinary.input.automation.robot.osgi.InputAutomationRobotBundleActivator"] = InputAutomationRobotBundleActivator

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
local InputAutomationRobotChangeListener = java_lazy("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local InputAutomationRobotServiceInterface = java_lazy("bundle.input.automation.robot.InputAutomationRobotServiceInterface")
local InputRobotInterface = java_lazy("org.allbinary.input.automation.robot.InputRobotInterface")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OSGIActivatorUtil = java_lazy("org.allbinary.osgi.OSGIActivatorUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local InputAutomationRobotChangeEvent = java_lazy("org.allbinary.input.automation.robot.osgi.InputAutomationRobotChangeEvent")
local InputAutomationRobotUtil = java_lazy("org.allbinary.input.automation.robot.osgi.InputAutomationRobotUtil")

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

-- class table InputAutomationRobotBundleActivator is declared before the requires
InputAutomationRobotBundleActivator.__index = InputAutomationRobotBundleActivator
InputAutomationRobotBundleActivator.className = "InputAutomationRobotBundleActivator"
InputAutomationRobotBundleActivator.javaClassName = "org.allbinary.input.automation.robot.osgi.InputAutomationRobotBundleActivator"
InputAutomationRobotBundleActivator.java_implements = " BundleActivator "
InputAutomationRobotBundleActivator.java_interfaces = function() return {BundleActivator} end

function InputAutomationRobotBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.inputRobotInterface == nil then self.inputRobotInterface = nil end
    if self.serviceFactory == nil then self.serviceFactory = nil end
end


function InputAutomationRobotBundleActivator._jinit(self)
    InputAutomationRobotBundleActivator._init_fields(self)
        self:init()
    return self
end

function InputAutomationRobotBundleActivator.new(...)
    local self = setmetatable({}, InputAutomationRobotBundleActivator)
    InputAutomationRobotBundleActivator._jinit(self, ...)
    return self
end


-- throws Exception
function InputAutomationRobotBundleActivator:init()
        error(require("java.lang.RuntimeException").new(), 0)
end


-- throws Exception
function InputAutomationRobotBundleActivator:registerAsService(bundleContext)
        OSGIActivatorUtil.registerAsService(bundleContext, self:getServiceFactory(), InputAutomationRobotServiceInterface:getName())
end


-- throws Exception
function InputAutomationRobotBundleActivator:getInputAutomationRobotChangeListener(context)
        local serviceReference = context:getServiceReference(InputAutomationRobotChangeListener:getName())
        if serviceReference ~= nil then
            local inputAutomationRobotChangeListener = context:getService(serviceReference)
            if inputAutomationRobotChangeListener == nil then
                error(require("java.lang.Exception").new("No Service For ServiceReference"), 0)
            end
            return inputAutomationRobotChangeListener
        else
            self.logUtil:putF("No ServiceReference: " .. InputAutomationRobotChangeListener:getName(), self, "getInputAutomationRobotChangeListener")
            return nil
        end
end


function InputAutomationRobotBundleActivator:addRobots(context)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "addRobots")
            local inputAutomationRobotChangeListener = self:getInputAutomationRobotChangeListener(context)
            if inputAutomationRobotChangeListener ~= nil then
                for index = 0, (self:getInputRobotInterface().n or #self:getInputRobotInterface()) - 1 do
                    local inputAutomationRobotChangeEvent = InputAutomationRobotUtil.getChangeEvent(self:getInputRobotInterface()[index + 1])
                    inputAutomationRobotChangeListener:onAdd(inputAutomationRobotChangeEvent)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "addModules")
        end
end


function InputAutomationRobotBundleActivator:removeRobots(context)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, "removeRobots")
            local inputAutomationRobotChangeListener = self:getInputAutomationRobotChangeListener(context)
            if inputAutomationRobotChangeListener ~= nil then
                for index = 0, (self:getInputRobotInterface().n or #self:getInputRobotInterface()) - 1 do
                    local inputAutomationRobotChangeEvent = InputAutomationRobotUtil.getChangeEvent(self:getInputRobotInterface()[index + 1])
                    inputAutomationRobotChangeListener:onRemove(inputAutomationRobotChangeEvent)
                end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "removeRobots")
        end
end


-- throws Exception
function InputAutomationRobotBundleActivator:start(context)
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START)
        self:addRobots(context)
        self:registerAsService(context)
end


-- throws Exception
function InputAutomationRobotBundleActivator:stop(context)
        self.logUtil:putF("Stop", self, self.commonStrings.START)
        self:removeRobots(context)
end


function InputAutomationRobotBundleActivator:getServiceFactory()
        return self.serviceFactory
end


function InputAutomationRobotBundleActivator:setServiceFactory(serviceObject)
        self.serviceFactory = serviceObject
end


function InputAutomationRobotBundleActivator:getInputRobotInterface()
        return self.inputRobotInterface
end


function InputAutomationRobotBundleActivator:setInputRobotInterface(inputRobotInterface)
        self.inputRobotInterface = inputRobotInterface
end

return InputAutomationRobotBundleActivator

