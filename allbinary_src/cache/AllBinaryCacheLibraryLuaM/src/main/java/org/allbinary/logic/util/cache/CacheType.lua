-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2007 AllBinary 
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
-- package org.allbinary.logic.util.cache

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

local CacheType = {}
CacheType.__index = CacheType
CacheType.className = "CacheType"

function CacheType:_init_fields()
    self.vendor = nil
    self.type = nil
end


function CacheType.new(vendor, type)
    local self = setmetatable({}, CacheType)
    self:_init_fields()
        self.vendor = vendor
        self.type = type
    return self
end


function CacheType:getVendor()
        return self.vendor
end


function CacheType:getType()
        return self.type
end


function CacheType:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("CacheType: Vendor: ")
        stringBuffer:append(self:getVendor())
        stringBuffer:append(" Type: ")
        stringBuffer:append(self:getType())
        return tostring(stringBuffer)
end
CacheType.__tostring = function(self) return self:toString() end

return CacheType

