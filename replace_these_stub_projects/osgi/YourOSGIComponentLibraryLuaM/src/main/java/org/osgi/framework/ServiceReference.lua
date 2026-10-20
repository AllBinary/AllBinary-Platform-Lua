-- Generated Code Do Not Modify
-- package org.osgi.framework

-- java.lang.Comparable has no Lua module
local Comparable = {}

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
local ServiceReference = {}
ServiceReference.__index = ServiceReference
ServiceReference.className = "ServiceReference"
setmetatable(ServiceReference, {__index = Comparable})


function ServiceReference:getProperty(key)
    error("abstract method getProperty")
end


function ServiceReference:getPropertyKeys()
    error("abstract method getPropertyKeys")
end

return ServiceReference

