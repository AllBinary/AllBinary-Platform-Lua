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

local CachePolicy = {}
CachePolicy.__index = CachePolicy
CachePolicy.className = "CachePolicy"

function CachePolicy:_init_fields()
    self.name = nil
    self.maxTime = 0
    self.maxSize = 0
end


function CachePolicy.new(name, maxTime, maxSize)
    local self = setmetatable({}, CachePolicy)
    self:_init_fields()
        self.name = name
        self:setMaxTime(maxTime)
        self:setMaxSize(maxSize)
    return self
end


function CachePolicy:getMaxTime()
        return self.maxTime
end


function CachePolicy:setMaxTime(maxTime)
        self.maxTime = maxTime
end


function CachePolicy:getMaxSize()
        return self.maxSize
end


function CachePolicy:setMaxSize(maxSize)
        self.maxSize = maxSize
end


function CachePolicy:getName()
        return self.name
end

return CachePolicy

