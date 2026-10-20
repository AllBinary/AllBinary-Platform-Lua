-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.platform

local StdUtil = require("org.allbinary.logic.StdUtil")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ThreedObjResources = {}
ThreedObjResources.__index = ThreedObjResources
ThreedObjResources.className = "ThreedObjResources"

function ThreedObjResources:_init_fields()
    self.hashtable = StdUtil.getInstance():createHashtable()
end

function ThreedObjResources.new()
    local self = setmetatable({}, ThreedObjResources)
    self:_init_fields()
    return self
end


function ThreedObjResources.getInstance()
        return ThreedObjResources.instance
end


function ThreedObjResources:get(resourceName)
        local resourceName2 = self.hashtable:get(resourceName)
        if resourceName2 ~= nil then
            return resourceName2
        end
        return resourceName
end

ThreedObjResources.instance = ThreedObjResources.new()

return ThreedObjResources

