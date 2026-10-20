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
-- package org.allbinary.media.image.cache

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CachePolicyFactory = require("org.allbinary.logic.util.cache.CachePolicyFactory")
local PoolInterface = require("org.allbinary.logic.util.cache.PoolInterface")
local PoolInterfaceFactory = require("org.allbinary.logic.util.cache.PoolInterfaceFactory")
local PoolTypeFactory = require("org.allbinary.logic.util.cache.PoolTypeFactory")
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

local BufferedImagePoolSingleton = {}
BufferedImagePoolSingleton.__index = BufferedImagePoolSingleton
BufferedImagePoolSingleton.className = "BufferedImagePoolSingleton"


function BufferedImagePoolSingleton.new()
    local self = setmetatable({}, BufferedImagePoolSingleton)
    return self
end


function BufferedImagePoolSingleton.getInstance()
        return BufferedImagePoolSingleton.poolInterface
end

BufferedImagePoolSingleton.poolInterface = nil


do -- Java static initializer
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local STATIC_BLOCK = "Static Block"
        local instance = "BufferedImagePoolSingleton"
        local try_ok, try_error = pcall(function()
            logUtil:putF(commonStrings.START, instance, STATIC_BLOCK)
            BufferedImagePoolSingleton.poolInterface = PoolInterfaceFactory.getInstance(BufferedImageCacheableFactory.new(), PoolTypeFactory.getInstance().VECTOR_POOL, CachePolicyFactory.getInstance().MAX_TIME_THOUSAND_MAX)
            logUtil:putF(commonStrings.END, instance, STATIC_BLOCK)
        end)
        if not try_ok then
            local e = try_error
            logUtil:put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e)
        end
end

return BufferedImagePoolSingleton

