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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PoolType = {}
PoolType.__index = PoolType
PoolType.className = "PoolType"

function PoolType:_init_fields()
    self.cacheType = nil
end


function PoolType.new(cacheType)
    local self = setmetatable({}, PoolType)
    self:_init_fields()
        self.cacheType = cacheType
    return self
end


function PoolType:getCacheType()
        return self.cacheType
end


function PoolType:toString()
        local POOL_TYPE = "PoolType: "
        return POOL_TYPE .. tostring(self:getCacheType())
end
PoolType.__tostring = function(self) return self:toString() end

return PoolType

