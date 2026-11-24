-- Generated Code Do Not Modify
-- package org.osgi.framework

local ServiceReference = {}
package.loaded["org.osgi.framework.ServiceReference"] = ServiceReference

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

-- java.lang.Comparable has no Lua module
local Comparable = {}

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
-- class table ServiceReference is declared before the requires
ServiceReference.__index = ServiceReference
ServiceReference.className = "ServiceReference"
ServiceReference.javaClassName = "org.osgi.framework.ServiceReference"
setmetatable(ServiceReference, {__index = Comparable})
ServiceReference.java_interfaces = function() return {Comparable} end


function ServiceReference:getProperty(key)
    error("abstract method getProperty")
end


function ServiceReference:getPropertyKeys()
    error("abstract method getPropertyKeys")
end

return ServiceReference

