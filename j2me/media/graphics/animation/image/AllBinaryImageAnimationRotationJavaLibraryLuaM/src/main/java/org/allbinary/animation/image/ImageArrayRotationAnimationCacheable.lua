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

local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")
local AdjustedImageArrayRotationAnimation = require("org.allbinary.animation.image.AdjustedImageArrayRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArrayRotationAnimationCacheable = {}
ImageArrayRotationAnimationCacheable.__index = ImageArrayRotationAnimationCacheable
ImageArrayRotationAnimationCacheable.className = "ImageArrayRotationAnimationCacheable"
setmetatable(ImageArrayRotationAnimationCacheable, {__index = AdjustedImageArrayRotationAnimation})


function ImageArrayRotationAnimationCacheable.new(anyType, animationBehavior)
    local self = setmetatable(AdjustedImageArrayRotationAnimation.new((anyType):getImageArray(), (anyType):getAngleInfoP(), (anyType):getTotalAngle(), (anyType):getDx(), (anyType):getDy(), animationBehavior), ImageArrayRotationAnimationCacheable)
        -- super(...) made self above
    return self
end


function ImageArrayRotationAnimationCacheable:getKey()
        return NullUtil.getInstance().NULL_OBJECT
end


function ImageArrayRotationAnimationCacheable:toString()
        return StringUtil.getInstance().EMPTY_STRING
end
ImageArrayRotationAnimationCacheable.__tostring = function(self) return self:toString() end

return ImageArrayRotationAnimationCacheable

