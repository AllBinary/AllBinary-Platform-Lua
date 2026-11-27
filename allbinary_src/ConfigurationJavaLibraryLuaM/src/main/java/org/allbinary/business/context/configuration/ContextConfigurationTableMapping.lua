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
-- package org.allbinary.business.context.configuration

local ContextConfigurationTableMapping = {}
package.loaded["org.allbinary.business.context.configuration.ContextConfigurationTableMapping"] = ContextConfigurationTableMapping

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local ContextConfigurationData = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationData")
local ContextConfigurationInterface = java_lazy("org.allbinary.business.context.configuration.ContextConfigurationInterface")

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

-- class table ContextConfigurationTableMapping is declared before the requires
ContextConfigurationTableMapping.__index = ContextConfigurationTableMapping
ContextConfigurationTableMapping.className = "ContextConfigurationTableMapping"
ContextConfigurationTableMapping.javaClassName = "org.allbinary.business.context.configuration.ContextConfigurationTableMapping"
ContextConfigurationTableMapping.java_implements = " TableMappingInterface "
ContextConfigurationTableMapping.java_interfaces = function() return {TableMappingInterface} end

function ContextConfigurationTableMapping:_init_fields()
    if self.contextConfigurationInterface == nil then self.contextConfigurationInterface = nil end
end


function ContextConfigurationTableMapping._jinit(self, contextConfigurationInterface)
    ContextConfigurationTableMapping._init_fields(self)
        self.contextConfigurationInterface = contextConfigurationInterface
    return self
end

function ContextConfigurationTableMapping.new(...)
    local self = setmetatable({}, ContextConfigurationTableMapping)
    ContextConfigurationTableMapping._jinit(self, ...)
    return self
end


function ContextConfigurationTableMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        return hashMap
end


-- throws Exception
function ContextConfigurationTableMapping:getKey()
        return ContextConfigurationData.getInstance().NAME
end


-- throws Exception
function ContextConfigurationTableMapping:toVector()
        local vector = BasicArrayListD.new()
        return vector
end

return ContextConfigurationTableMapping

