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

local BundleActivator = require("org.osgi.framework.BundleActivator")
local BundleContext = require("org.osgi.framework.BundleContext")
local ServiceFactory = require("org.osgi.framework.ServiceFactory")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local InputAutomationRobotChangeListener = require("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local InputAutomationRobotServiceInterface = require("bundle.input.automation.robot.InputAutomationRobotServiceInterface")
local InputRobotInterface = require("org.allbinary.input.automation.robot.InputRobotInterface")
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

local InputAutomationRobotBundleActivator = {}
InputAutomationRobotBundleActivator.__index = InputAutomationRobotBundleActivator
InputAutomationRobotBundleActivator.className = "InputAutomationRobotBundleActivator"

function InputAutomationRobotBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.inputRobotInterface = nil
    self.serviceFactory = nil
end


function InputAutomationRobotBundleActivator.new()
    local self = setmetatable({}, InputAutomationRobotBundleActivator)
    self:_init_fields()
        self:init()
    return self
end


-- throws Exception
function InputAutomationRobotBundleActivator:init()
        error(java_exception("RuntimeException"), 0)
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
                error(java_exception("Exception", "No Service For ServiceReference"), 0)
            end
            return inputAutomationRobotChangeListener
        else
            self.logUtil:putF("No ServiceReference: " .. InputAutomationRobotChangeListener:getName(), self, "getInputAutomationRobotChangeListener")
            return nil
        end
end


function InputAutomationRobotBundleActivator:addRobots(context)
        local try_ok, try_error = pcall(function()
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
            self.logUtil:putF(self.commonStrings.EXCEPTION, self, "addModules")
        end
end


function InputAutomationRobotBundleActivator:removeRobots(context)
        local try_ok, try_error = pcall(function()
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

