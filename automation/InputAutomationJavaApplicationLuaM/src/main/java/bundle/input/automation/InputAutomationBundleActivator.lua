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
-- package bundle.input.automation

local BundleActivator = require("org.osgi.framework.BundleActivator")
local BundleContext = require("org.osgi.framework.BundleContext")
local InputAutomationConfigurationModuleChangeListener = require("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationRobotChangeListener = require("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local InputAutomationJFrame = require("org.allbinary.input.automation.InputAutomationJFrame")
local InputAutomationModuleServiceConsumer = require("org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceConsumer")
local InputAutomationNewBundleRunnable = require("org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable")
local InputAutomationServiceFactory = require("org.allbinary.input.automation.osgi.InputAutomationServiceFactory")
local InputAutomationRobotServiceConsumer = require("org.allbinary.input.automation.robot.osgi.InputAutomationRobotServiceConsumer")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIActivatorUtil = require("org.allbinary.osgi.OSGIActivatorUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local InputAutomationBundleActivatorListenerInterface = require("bundle.input.automation.InputAutomationBundleActivatorListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InputAutomationBundleActivator = {}
InputAutomationBundleActivator.__index = InputAutomationBundleActivator
InputAutomationBundleActivator.className = "InputAutomationBundleActivator"

function InputAutomationBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function InputAutomationBundleActivator.new()
    local self = setmetatable({}, InputAutomationBundleActivator)
    self:_init_fields()
    return self
end


function InputAutomationBundleActivator.getBundleContext()
        return InputAutomationBundleActivator.bundleContext
end


-- throws Exception
function InputAutomationBundleActivator:start(bundleContext)
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START)
            self.bundleContext = bundleContext
            InputAutomationBundleActivator.moduleManagementThread = Thread.new(InputAutomationNewBundleRunnable.new(self))
            InputAutomationBundleActivator.moduleManagementThread:start()
            InputAutomationJFrame.create(self)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START, e)
            error(e, 0)
        end
end


-- throws Exception
function InputAutomationBundleActivator:registerAsService()
        OSGIActivatorUtil.registerAsService(self:getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationConfigurationModuleChangeListener:getName())
        OSGIActivatorUtil.registerAsService(self:getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationRobotChangeListener:getName())
end


-- throws Exception
function InputAutomationBundleActivator:useServices()
        InputAutomationRobotServiceConsumer.new(self:getBundleContext()):process()
        InputAutomationModuleServiceConsumer.new(self:getBundleContext()):process()
end


-- throws Exception
function InputAutomationBundleActivator:stop(context)
        self.logUtil:putF(self.commonStrings.START, self, "stop")
        if InputAutomationJFrame.getInstance() ~= nil then
            InputAutomationJFrame.destroy()
        else
            self.logUtil:putF("Nothing to stop", self, "stop")
        end
end

InputAutomationBundleActivator.moduleManagementThread = nil
InputAutomationBundleActivator.bundleContext = nil

return InputAutomationBundleActivator

