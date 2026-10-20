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
-- package org.allbinary.osgi

local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BundleContext = require("org.osgi.framework.BundleContext")
local NullServiceReferenceFactory = require("org.osgi.framework.NullServiceReferenceFactory")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local ServiceRegistration = require("org.osgi.framework.ServiceRegistration")

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

local OSGIActivatorUtil = {}
OSGIActivatorUtil.__index = OSGIActivatorUtil
OSGIActivatorUtil.className = "OSGIActivatorUtil"


function OSGIActivatorUtil.new()
    local self = setmetatable({}, OSGIActivatorUtil)
    return self
end


-- throws Exception
function OSGIActivatorUtil.registerAsService(bundleContext, anyType, serviceName)
        OSGIActivatorUtil.registerAsService(bundleContext, anyType, serviceName, StdUtil.getInstance():createHashtable())
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function OSGIActivatorUtil.registerAsService(bundleContext, anyType, serviceName, properties)
        local serviceRegistration = bundleContext:registerService(serviceName, anyType, properties)
        local serviceReference = serviceRegistration:getReference()
        serviceReference = bundleContext:getServiceReference(serviceName)
        if serviceReference == NullServiceReferenceFactory.getInstance().NULL_SERVICE_REFERENCE then
            error(java_exception("Exception", "No Such Service Reference"), 0)
        end
end

return OSGIActivatorUtil

