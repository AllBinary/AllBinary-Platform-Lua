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
-- package org.allbinary.osgi.service

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BundleContext = require("org.osgi.framework.BundleContext")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = require("org.allbinary.osgi.OSGIServiceInterface")
local OSGIServiceVisitorInterface = require("org.allbinary.osgi.OSGIServiceVisitorInterface")
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

local InputAutomationServiceConsumer = {}
InputAutomationServiceConsumer.__index = InputAutomationServiceConsumer
InputAutomationServiceConsumer.className = "InputAutomationServiceConsumer"

function InputAutomationServiceConsumer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.osgiServiceUtil = OSGIServiceUtil.getInstance()
    self.registryName = nil
    self.bundleContext = nil
    self.osgiServiceVisitorInterface = nil
end


function InputAutomationServiceConsumer.new(registryName, bundleContext, osgiServiceVisitorInterface)
    local self = setmetatable({}, InputAutomationServiceConsumer)
    self:_init_fields()
        self:setRegistryName(registryName)
        self:setBundleContext(bundleContext)
        self:setOsgiServiceVisitorInterface(osgiServiceVisitorInterface)
    return self
end


-- throws Exception
function InputAutomationServiceConsumer:process()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
        local vector = self.osgiServiceUtil:getServicesObjectVector(self:getBundleContext(), self:getServiceReferences())
        self.logUtil:putF("Processing " .. tostring(vector:size()) .. " Services", self, self.commonStrings.PROCESS)
        local size = vector:size()
        local osgiServiceInterface = nil
        for index = 0, size - 1 do
            osgiServiceInterface = vector:get(index)
            if not self:getOsgiServiceVisitorInterface():visit(osgiServiceInterface) then
                error(java_exception("Exception", "Unable to process service: " .. tostring(osgiServiceInterface)), 0)
            end
        end
end


-- throws Exception
function InputAutomationServiceConsumer:getServiceReferences()
        return self:getBundleContext():getServiceReferences(self:getRegistryName(), nil)
end


function InputAutomationServiceConsumer:getBundleContext()
        return self.bundleContext
end


function InputAutomationServiceConsumer:setBundleContext(aBundleContext)
        self.bundleContext = aBundleContext
end


function InputAutomationServiceConsumer:getRegistryName()
        return self.registryName
end


function InputAutomationServiceConsumer:setRegistryName(registryName)
        self.registryName = registryName
end


function InputAutomationServiceConsumer:getOsgiServiceVisitorInterface()
        return self.osgiServiceVisitorInterface
end


function InputAutomationServiceConsumer:setOsgiServiceVisitorInterface(osgiServiceVisitorInterface)
        self.osgiServiceVisitorInterface = osgiServiceVisitorInterface
end

return InputAutomationServiceConsumer

