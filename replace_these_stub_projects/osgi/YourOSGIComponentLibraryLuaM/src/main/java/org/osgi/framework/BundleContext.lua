-- Generated Code Do Not Modify
-- package org.osgi.framework

-- local Dictionary = require("java.util.Dictionary")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local BundleContext = {}
BundleContext.__index = BundleContext
BundleContext.className = "BundleContext"


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

