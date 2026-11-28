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

local InputAutomationBundleActivator = {}
package.loaded["bundle.input.automation.InputAutomationBundleActivator"] = InputAutomationBundleActivator

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
local InputAutomationConfigurationModuleChangeListener = java_lazy("bundle.input.automation.module.configuration.InputAutomationConfigurationModuleChangeListener")
local InputAutomationRobotChangeListener = java_lazy("bundle.input.automation.robot.InputAutomationRobotChangeListener")
local InputAutomationJFrame = java_lazy("org.allbinary.input.automation.InputAutomationJFrame")
local InputAutomationModuleServiceConsumer = java_lazy("org.allbinary.input.automation.module.osgi.InputAutomationModuleServiceConsumer")
local InputAutomationNewBundleRunnable = java_lazy("org.allbinary.input.automation.module.osgi.InputAutomationNewBundleRunnable")
local InputAutomationServiceFactory = java_lazy("org.allbinary.input.automation.osgi.InputAutomationServiceFactory")
local InputAutomationRobotServiceConsumer = java_lazy("org.allbinary.input.automation.robot.osgi.InputAutomationRobotServiceConsumer")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OSGIActivatorUtil = java_lazy("org.allbinary.osgi.OSGIActivatorUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local InputAutomationBundleActivatorListenerInterface = require("bundle.input.automation.InputAutomationBundleActivatorListenerInterface")

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

-- class table InputAutomationBundleActivator is declared before the requires
InputAutomationBundleActivator.__index = InputAutomationBundleActivator
InputAutomationBundleActivator.className = "InputAutomationBundleActivator"
InputAutomationBundleActivator.javaClassName = "bundle.input.automation.InputAutomationBundleActivator"
InputAutomationBundleActivator.java_implements = " BundleActivator InputAutomationBundleActivatorListenerInterface "
InputAutomationBundleActivator.java_interfaces = function() return {BundleActivator, InputAutomationBundleActivatorListenerInterface} end

function InputAutomationBundleActivator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function InputAutomationBundleActivator._jinit(self)
    InputAutomationBundleActivator._init_fields(self)
    return self
end

function InputAutomationBundleActivator.new()
    return InputAutomationBundleActivator._jinit(setmetatable({}, InputAutomationBundleActivator))
end


function InputAutomationBundleActivator.getBundleContext()
        return InputAutomationBundleActivator.bundleContext
end


-- throws Exception
function InputAutomationBundleActivator:start(bundleContext)
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.START)
            InputAutomationBundleActivator.bundleContext = bundleContext
            InputAutomationBundleActivator.moduleManagementThread = require("java.lang.Thread").new(InputAutomationNewBundleRunnable.new(self))
            InputAutomationBundleActivator.moduleManagementThread:start()
            InputAutomationJFrame.create(self)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.START, e)
            error(e, 0)
        end
end


-- throws Exception
function InputAutomationBundleActivator:registerAsService()
        OSGIActivatorUtil.registerAsService(self:getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationConfigurationModuleChangeListener.javaClassName)
        OSGIActivatorUtil.registerAsService(self:getBundleContext(), InputAutomationServiceFactory.getInstance(), InputAutomationRobotChangeListener.javaClassName)
end


-- throws Exception
function InputAutomationBundleActivator:useServices()
        InputAutomationRobotServiceConsumer.new(self:getBundleContext()):process()
        InputAutomationModuleServiceConsumer.new(self:getBundleContext()):process()
end


-- throws Exception
function InputAutomationBundleActivator:stop(context)
        self.logUtil:putF(self.commonStrings.START, self, "stop")
        if not rawequal(InputAutomationJFrame.getInstance(), nil) then
            InputAutomationJFrame.destroy()
        else
            self.logUtil:putF("Nothing to stop", self, "stop")
        end
end

InputAutomationBundleActivator.moduleManagementThread = nil
InputAutomationBundleActivator.bundleContext = nil

return InputAutomationBundleActivator

