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

local ServiceReferenceMap = {}
package.loaded["bundle.input.automation.ServiceReferenceMap"] = ServiceReferenceMap

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

-- local Collection = require("java.util.Collection")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local ServiceReference = java_lazy("org.osgi.framework.ServiceReference")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

-- class table ServiceReferenceMap is declared before the requires
ServiceReferenceMap.__index = ServiceReferenceMap
ServiceReferenceMap.className = "ServiceReferenceMap"
ServiceReferenceMap.javaClassName = "bundle.input.automation.ServiceReferenceMap"
ServiceReferenceMap.java_implements = " Map "
ServiceReferenceMap.java_interfaces = function() return {Map} end

function ServiceReferenceMap:_init_fields()
    if self.serviceReference == nil then self.serviceReference = nil end
end


function ServiceReferenceMap._jinit(self, serviceReference)
    ServiceReferenceMap._init_fields(self)
        self.serviceReference = serviceReference
    return self
end

function ServiceReferenceMap.new(...)
    local self = setmetatable({}, ServiceReferenceMap)
    ServiceReferenceMap._jinit(self, ...)
    return self
end


function ServiceReferenceMap:size()
        return -1
end


function ServiceReferenceMap:isEmpty()
        return false
end


function ServiceReferenceMap:containsKey(key)
        return false
end


function ServiceReferenceMap:containsValue(value)
        return false
end


function ServiceReferenceMap:get(key)
        return self.serviceReference:getProperty(key)
end


function ServiceReferenceMap:put(key, value)
        return nil
end


function ServiceReferenceMap:remove(key)
        return nil
end


function ServiceReferenceMap:putAll(m)
end


function ServiceReferenceMap:clear()
end


function ServiceReferenceMap:keySet()
        local keyStringArray = self.serviceReference:getPropertyKeys()
        return nil
end


function ServiceReferenceMap:values()
        return nil
end


function ServiceReferenceMap:entrySet()
        return nil
end


function ServiceReferenceMap.toString(map)
        local stringBuffer = StringMaker.new()
        return tostring(stringBuffer)
end

return ServiceReferenceMap

