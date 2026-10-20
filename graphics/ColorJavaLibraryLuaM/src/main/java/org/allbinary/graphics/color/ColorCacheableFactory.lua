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
-- package org.allbinary.graphics.color

local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")
local CacheableInterfaceFactoryInterface = require("org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorCacheableFactory = {}
ColorCacheableFactory.__index = ColorCacheableFactory
ColorCacheableFactory.className = "ColorCacheableFactory"


function ColorCacheableFactory.new()
    local self = setmetatable({}, ColorCacheableFactory)
    return self
end


function ColorCacheableFactory:getInstance(key)
        return ColorCacheable.new(key)
end

return ColorCacheableFactory

