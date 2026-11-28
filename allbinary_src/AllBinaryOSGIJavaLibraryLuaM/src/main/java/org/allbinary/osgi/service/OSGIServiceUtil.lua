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

local OSGIServiceUtil = {}
package.loaded["org.allbinary.osgi.service.OSGIServiceUtil"] = OSGIServiceUtil

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local BundleContext = java_lazy("org.osgi.framework.BundleContext")
local ServiceReference = java_lazy("org.osgi.framework.ServiceReference")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local OSGIServiceInterface = java_lazy("org.allbinary.osgi.OSGIServiceInterface")

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

-- class table OSGIServiceUtil is declared before the requires
OSGIServiceUtil.__index = OSGIServiceUtil
OSGIServiceUtil.className = "OSGIServiceUtil"
OSGIServiceUtil.javaClassName = "org.allbinary.osgi.service.OSGIServiceUtil"

function OSGIServiceUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OSGIServiceUtil.getInstance()
        return OSGIServiceUtil.instance_f
end


function OSGIServiceUtil._jinit(self)
    OSGIServiceUtil._init_fields(self)
    return self
end

function OSGIServiceUtil.new(...)
    local self = setmetatable({}, OSGIServiceUtil)
    OSGIServiceUtil._jinit(self, ...)
    return self
end


-- throws Exception
function OSGIServiceUtil:getServicesObjectVector(bundleContext, serviceReferences)
        local vector = BasicArrayListD.new()
        if not rawequal(serviceReferences, nil) then
            local size = (serviceReferences.n or #serviceReferences)
            self.logUtil:putF(require("allbinary_java").to_string("Service References: ") .. require("allbinary_java").to_string(size), self, "getServicesObjectVector")
            for index = 0, size - 1 do
                local serviceReference = serviceReferences[index + 1]
                if not rawequal(serviceReference, nil) then
                    local osgiServiceInterface = bundleContext:getService(serviceReference)
                    if rawequal(osgiServiceInterface, nil) then
                        error(require("java.lang.Exception").new("No Service For Reference"), 0)
                    end
                    vector:add(osgiServiceInterface)
                end
            end
        end
        return vector
end

OSGIServiceUtil.instance_f = OSGIServiceUtil.new()

return OSGIServiceUtil

