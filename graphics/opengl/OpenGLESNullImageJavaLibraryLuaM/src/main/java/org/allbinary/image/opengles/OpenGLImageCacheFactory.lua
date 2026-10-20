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
-- package org.allbinary.image.opengles

local ImageCache = require("org.allbinary.image.ImageCache")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--OpenGLESNullImageJavaLibrary
local OpenGLImageCacheFactory = {}
OpenGLImageCacheFactory.__index = OpenGLImageCacheFactory
OpenGLImageCacheFactory.className = "OpenGLImageCacheFactory"

function OpenGLImageCacheFactory.new()
    local self = setmetatable({}, OpenGLImageCacheFactory)
    return self
end


function OpenGLImageCacheFactory.getInstance()
        return OpenGLImageCacheFactory.IMAGE_CACHE
end


function OpenGLImageCacheFactory.init()
        if OpenGLImageCacheFactory.IMAGE_CACHE == nil then
        end
end

OpenGLImageCacheFactory.IMAGE_CACHE = ImageCache.NULL_IMAGE_CACHE

return OpenGLImageCacheFactory

