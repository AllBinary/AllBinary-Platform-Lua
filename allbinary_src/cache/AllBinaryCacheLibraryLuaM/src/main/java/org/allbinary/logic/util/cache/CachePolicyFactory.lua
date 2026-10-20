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

local CachePolicyFactory = {}
CachePolicyFactory.__index = CachePolicyFactory
CachePolicyFactory.className = "CachePolicyFactory"

function CachePolicyFactory:_init_fields()
    self.NAME = "lru"
    self.MAX_TIME_THOUSAND_MAX = CachePolicy.new(self.NAME, Long.MAX_VALUE, 1000)
    self.THIRTY_MINUTES_TEN_THOUSAND_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 30, 10000)
    self.THIRTY_MINUTES_FIFTY_THOUSAND_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 30, 100000)
    self.ONE_MINUTE_FIVE_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 5)
    self.ONE_MINUTE_TEN_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 10)
    self.ONE_MINUTE_ONE_HUNDRED_MAX = CachePolicy.new(self.NAME, 1000 * 60 * 1, 100)
end

function CachePolicyFactory.new()
    local self = setmetatable({}, CachePolicyFactory)
    self:_init_fields()
    return self
end


function CachePolicyFactory.getInstance()
        return CachePolicyFactory.instance
end

CachePolicyFactory.instance = CachePolicyFactory.new()

return CachePolicyFactory

