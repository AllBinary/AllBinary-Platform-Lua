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
-- package org.allbinary.media.image.io

local IIOImageCacheableFactory = {}
package.loaded["org.allbinary.media.image.io.IIOImageCacheableFactory"] = IIOImageCacheableFactory

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

local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")
local CacheableInterfaceFactoryInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface")
local IIOImageCacheable = java_lazy("org.allbinary.media.image.io.IIOImageCacheable")

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

-- class table IIOImageCacheableFactory is declared before the requires
IIOImageCacheableFactory.__index = IIOImageCacheableFactory
IIOImageCacheableFactory.className = "IIOImageCacheableFactory"
IIOImageCacheableFactory.javaClassName = "org.allbinary.media.image.io.IIOImageCacheableFactory"
IIOImageCacheableFactory.java_implements = " CacheableInterfaceFactoryInterface "
IIOImageCacheableFactory.java_interfaces = function() return {CacheableInterfaceFactoryInterface} end


function IIOImageCacheableFactory._jinit(self)
    return self
end

function IIOImageCacheableFactory.new(...)
    local self = setmetatable({}, IIOImageCacheableFactory)
    IIOImageCacheableFactory._jinit(self, ...)
    return self
end


function IIOImageCacheableFactory:getInstance(key)
        return IIOImageCacheable.new(key)
end

return IIOImageCacheableFactory

