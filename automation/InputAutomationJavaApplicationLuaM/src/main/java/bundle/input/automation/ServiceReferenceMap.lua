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

-- local Collection = require("java.util.Collection")
-- local Map = require("java.util.Map")
-- local Set = require("java.util.Set")
local ServiceReference = require("org.osgi.framework.ServiceReference")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ServiceReferenceMap = {}
ServiceReferenceMap.__index = ServiceReferenceMap
ServiceReferenceMap.className = "ServiceReferenceMap"

function ServiceReferenceMap:_init_fields()
    self.serviceReference = nil
end


function ServiceReferenceMap.new(serviceReference)
    local self = setmetatable({}, ServiceReferenceMap)
    self:_init_fields()
        self.serviceReference = serviceReference
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

