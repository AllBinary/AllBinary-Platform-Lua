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
-- package org.allbinary.media.image.comparison.motion

local ConstrainedMotionRectanglesResultsCacheSingleton = {}
package.loaded["org.allbinary.media.image.comparison.motion.ConstrainedMotionRectanglesResultsCacheSingleton"] = ConstrainedMotionRectanglesResultsCacheSingleton

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CacheInterface = java_lazy("org.allbinary.logic.util.cache.CacheInterface")
local CacheInterfaceFactory = java_lazy("org.allbinary.logic.util.cache.CacheInterfaceFactory")
local CachePolicyFactory = java_lazy("org.allbinary.logic.util.cache.CachePolicyFactory")
local CacheTypeFactory = java_lazy("org.allbinary.logic.util.cache.CacheTypeFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table ConstrainedMotionRectanglesResultsCacheSingleton is declared before the requires
ConstrainedMotionRectanglesResultsCacheSingleton.__index = ConstrainedMotionRectanglesResultsCacheSingleton
ConstrainedMotionRectanglesResultsCacheSingleton.className = "ConstrainedMotionRectanglesResultsCacheSingleton"
ConstrainedMotionRectanglesResultsCacheSingleton.javaClassName = "org.allbinary.media.image.comparison.motion.ConstrainedMotionRectanglesResultsCacheSingleton"

function ConstrainedMotionRectanglesResultsCacheSingleton:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ConstrainedMotionRectanglesResultsCacheSingleton._jinit(self)
    ConstrainedMotionRectanglesResultsCacheSingleton._init_fields(self)
    return self
end

function ConstrainedMotionRectanglesResultsCacheSingleton.new(...)
    local self = setmetatable({}, ConstrainedMotionRectanglesResultsCacheSingleton)
    ConstrainedMotionRectanglesResultsCacheSingleton._jinit(self, ...)
    return self
end


function ConstrainedMotionRectanglesResultsCacheSingleton.getInstance()
        return ConstrainedMotionRectanglesResultsCacheSingleton.cacheInterface
end

ConstrainedMotionRectanglesResultsCacheSingleton.cacheInterface = nil


do -- Java static initializer
        local logUtil = LogUtil.getInstance()
        local commonStrings = CommonStrings.getInstance()
        local STATIC_BLOCK = "Static Block"
        local instance = "MotionRectanglesResultsCacheSingleton"
        local try_ok, try_error, try_value = pcall(function()
            logUtil:putF(commonStrings.START, instance, STATIC_BLOCK)
            ConstrainedMotionRectanglesResultsCacheSingleton.cacheInterface = CacheInterfaceFactory.getInstance(CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().ONE_MINUTE_FIVE_MAX)
            logUtil:putF(commonStrings.END, instance, STATIC_BLOCK)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            logUtil:put(commonStrings.EXCEPTION, instance, STATIC_BLOCK, e)
        end
end

return ConstrainedMotionRectanglesResultsCacheSingleton

