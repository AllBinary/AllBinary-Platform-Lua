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

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local AutomaticCacheInterfaceFactory = require("org.allbinary.logic.util.cache.AutomaticCacheInterfaceFactory")
local CachePolicyFactory = require("org.allbinary.logic.util.cache.CachePolicyFactory")
local CacheTypeFactory = require("org.allbinary.logic.util.cache.CacheTypeFactory")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorCacheFactory = {}
ColorCacheFactory.__index = ColorCacheFactory
ColorCacheFactory.className = "ColorCacheFactory"


function ColorCacheFactory.new()
    local self = setmetatable({}, ColorCacheFactory)
    return self
end


function ColorCacheFactory.getInstance()
        return ColorCacheFactory.cacheInterface
end

ColorCacheFactory.cacheInterface = nil


do -- Java static initializer
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local STATIC_BLOCK = "Static Block"
        local try_ok, try_error = pcall(function()
            logUtil:putF(commonStrings.START, ColorCacheFactory, STATIC_BLOCK)
            ColorCacheFactory.cacheInterface = AutomaticCacheInterfaceFactory.getInstance(ColorCacheableFactory.new(), CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX)
            logUtil:putF(commonStrings.END, ColorCacheFactory, STATIC_BLOCK)
        end)
        if not try_ok then
            local e = try_error
            logUtil:put(commonStrings.EXCEPTION, ColorCacheFactory, STATIC_BLOCK, e)
        end
end

return ColorCacheFactory

