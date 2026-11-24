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

local ColorCacheFactory = {}
package.loaded["org.allbinary.graphics.color.ColorCacheFactory"] = ColorCacheFactory

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
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")
local AutomaticCacheInterfaceFactory = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterfaceFactory")
local CachePolicyFactory = java_lazy("org.allbinary.logic.util.cache.CachePolicyFactory")
local CacheTypeFactory = java_lazy("org.allbinary.logic.util.cache.CacheTypeFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local ColorCacheableFactory = java_lazy("org.allbinary.graphics.color.ColorCacheableFactory")

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

-- class table ColorCacheFactory is declared before the requires
ColorCacheFactory.__index = ColorCacheFactory
ColorCacheFactory.className = "ColorCacheFactory"
ColorCacheFactory.javaClassName = "org.allbinary.graphics.color.ColorCacheFactory"


function ColorCacheFactory._jinit(self)
    return self
end

function ColorCacheFactory.new(...)
    local self = setmetatable({}, ColorCacheFactory)
    ColorCacheFactory._jinit(self, ...)
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
        local try_ok, try_error, try_value = pcall(function()
            logUtil:putF(commonStrings.START, ColorCacheFactory, STATIC_BLOCK)
            ColorCacheFactory.cacheInterface = AutomaticCacheInterfaceFactory.getInstance(ColorCacheableFactory.new(), CacheTypeFactory.getInstance().CACHE, CachePolicyFactory.getInstance().THIRTY_MINUTES_TEN_THOUSAND_MAX)
            logUtil:putF(commonStrings.END, ColorCacheFactory, STATIC_BLOCK)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            logUtil:put(commonStrings.EXCEPTION, ColorCacheFactory, STATIC_BLOCK, e)
        end
end

return ColorCacheFactory

