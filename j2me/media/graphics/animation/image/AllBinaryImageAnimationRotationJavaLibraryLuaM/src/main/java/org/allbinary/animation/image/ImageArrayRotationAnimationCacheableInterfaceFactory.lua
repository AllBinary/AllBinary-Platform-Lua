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
-- package org.allbinary.animation.image

local ImageArrayRotationAnimationCacheableInterfaceFactory = {}
package.loaded["org.allbinary.animation.image.ImageArrayRotationAnimationCacheableInterfaceFactory"] = ImageArrayRotationAnimationCacheableInterfaceFactory

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

local AnimationBehavior = java_lazy("org.allbinary.animation.AnimationBehavior")
local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")
local CacheableInterfaceFactoryInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface")
local ImageArrayRotationAnimationCacheable = java_lazy("org.allbinary.animation.image.ImageArrayRotationAnimationCacheable")

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

-- class table ImageArrayRotationAnimationCacheableInterfaceFactory is declared before the requires
ImageArrayRotationAnimationCacheableInterfaceFactory.__index = ImageArrayRotationAnimationCacheableInterfaceFactory
ImageArrayRotationAnimationCacheableInterfaceFactory.className = "ImageArrayRotationAnimationCacheableInterfaceFactory"
ImageArrayRotationAnimationCacheableInterfaceFactory.javaClassName = "org.allbinary.animation.image.ImageArrayRotationAnimationCacheableInterfaceFactory"
ImageArrayRotationAnimationCacheableInterfaceFactory.java_implements = " CacheableInterfaceFactoryInterface "
ImageArrayRotationAnimationCacheableInterfaceFactory.java_interfaces = function() return {CacheableInterfaceFactoryInterface} end

function ImageArrayRotationAnimationCacheableInterfaceFactory._jinit(self)
    return self
end

function ImageArrayRotationAnimationCacheableInterfaceFactory.new()
    return ImageArrayRotationAnimationCacheableInterfaceFactory._jinit(setmetatable({}, ImageArrayRotationAnimationCacheableInterfaceFactory))
end


-- throws Exception
function ImageArrayRotationAnimationCacheableInterfaceFactory:getInstance(key)
        return ImageArrayRotationAnimationCacheable.new(key, AnimationBehavior.getInstance())
end

return ImageArrayRotationAnimationCacheableInterfaceFactory

