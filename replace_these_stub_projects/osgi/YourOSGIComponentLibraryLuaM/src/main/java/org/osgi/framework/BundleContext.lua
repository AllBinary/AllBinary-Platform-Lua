-- Generated Code Do Not Modify
-- package org.osgi.framework

local BundleContext = {}
package.loaded["org.osgi.framework.BundleContext"] = BundleContext

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

-- local Dictionary = require("java.util.Dictionary")
local Bundle = java_lazy("org.osgi.framework.Bundle")
local BundleException = java_lazy("org.osgi.framework.BundleException")
local InvalidSyntaxException = java_lazy("org.osgi.framework.InvalidSyntaxException")
local ServiceReference = java_lazy("org.osgi.framework.ServiceReference")
local ServiceRegistration = java_lazy("org.osgi.framework.ServiceRegistration")

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

-- Java interface
-- class table BundleContext is declared before the requires
BundleContext.__index = BundleContext
BundleContext.className = "BundleContext"
BundleContext.javaClassName = "org.osgi.framework.BundleContext"


function BundleContext:getBundles()
    error("abstract method getBundles")
end


-- throws BundleException
function BundleContext:installBundle(location)
    error("abstract method installBundle")
end


function BundleContext:registerService(clazz, service, properties)
    error("abstract method registerService")
end


function BundleContext:getService(reference)
    error("abstract method getService")
end


-- throws InvalidSyntaxException
function BundleContext:getServiceReferences(clazz, filter)
    error("abstract method getServiceReferences")
end


function BundleContext:getServiceReference(clazz)
    error("abstract method getServiceReference")
end

return BundleContext

