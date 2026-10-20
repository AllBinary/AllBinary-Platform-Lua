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

local BasicArrayListResetablePool = require("org.allbinary.logic.util.cache.BasicArrayListResetablePool")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")
local CacheableInterfaceFactoryInterface = require("org.allbinary.logic.util.cache.CacheableInterfaceFactoryInterface")
local PoolInterface = require("org.allbinary.logic.util.cache.PoolInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArrayRotationAnimationPool = {}
ImageArrayRotationAnimationPool.__index = ImageArrayRotationAnimationPool
ImageArrayRotationAnimationPool.className = "ImageArrayRotationAnimationPool"
setmetatable(ImageArrayRotationAnimationPool, {__index = BasicArrayListResetablePool})


function ImageArrayRotationAnimationPool.new(cacheableInterfaceFactoryInterface)
    local self = setmetatable(BasicArrayListResetablePool.new(cacheableInterfaceFactoryInterface), ImageArrayRotationAnimationPool)
        -- super(...) made self above
    return self
end


function ImageArrayRotationAnimationPool.getInstance()
        return ImageArrayRotationAnimationPool.IMAGE_ROTATION_ANIMATION_POOL
end


-- throws Exception
function ImageArrayRotationAnimationPool:remove(key)
        local cacheableInterface = BasicArrayListResetablePool.remove(self, key)
        local allBinaryImageRotationAnimationInfo = key
        local imageArrayRotationAnimationCacheable = (cacheableInterface)
        imageArrayRotationAnimationCacheable:setImageArray(allBinaryImageRotationAnimationInfo:getImageArray())
        return cacheableInterface
end

ImageArrayRotationAnimationPool.IMAGE_ROTATION_ANIMATION_POOL = ImageArrayRotationAnimationPool.new(ImageArrayRotationAnimationCacheableInterfaceFactory.new())

return ImageArrayRotationAnimationPool

