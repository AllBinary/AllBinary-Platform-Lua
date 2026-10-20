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
local StdUtil = require("org.allbinary.logic.StdUtil")
local BundleContext = require("org.osgi.framework.BundleContext")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = require("org.allbinary.osgi.OSGIServiceInterface")

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

local OSGIServiceUtil = {}
OSGIServiceUtil.__index = OSGIServiceUtil
OSGIServiceUtil.className = "OSGIServiceUtil"

function OSGIServiceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OSGIServiceUtil.getInstance()
        return OSGIServiceUtil.instance
end


function OSGIServiceUtil.new()
    local self = setmetatable({}, OSGIServiceUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function OSGIServiceUtil:getServicesObjectVector(bundleContext, serviceReferences)
        local vector = BasicArrayListD.new()
        if serviceReferences ~= nil then
            local size = (serviceReferences.n or #serviceReferences)
            self.logUtil:putF("Service References: " .. tostring(size), self, "getServicesObjectVector")
            for index = 0, size - 1 do
                local serviceReference = serviceReferences[index + 1]
                if serviceReference ~= nil then
                    local osgiServiceInterface = bundleContext:getService(serviceReference)
                    if osgiServiceInterface == nil then
                        error(java_exception("Exception", "No Service For Reference"), 0)
                    end
                    vector:add(osgiServiceInterface)
                end
            end
        end
        return vector
end

OSGIServiceUtil.instance = OSGIServiceUtil.new()

return OSGIServiceUtil

