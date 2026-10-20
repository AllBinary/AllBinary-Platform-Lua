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

-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = require("org.allbinary.logic.StdUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ContextConfigurationTableMapping = {}
ContextConfigurationTableMapping.__index = ContextConfigurationTableMapping
ContextConfigurationTableMapping.className = "ContextConfigurationTableMapping"

function ContextConfigurationTableMapping:_init_fields()
    self.contextConfigurationInterface = nil
end


function ContextConfigurationTableMapping.new(contextConfigurationInterface)
    local self = setmetatable({}, ContextConfigurationTableMapping)
    self:_init_fields()
        self.contextConfigurationInterface = contextConfigurationInterface
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

