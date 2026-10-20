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

-- local BufferedImage = require("java.awt.image.BufferedImage")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CacheableInterface = require("org.allbinary.logic.util.cache.CacheableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BufferedImageCacheable = {}
BufferedImageCacheable.__index = BufferedImageCacheable
BufferedImageCacheable.className = "BufferedImageCacheable"

function BufferedImageCacheable:_init_fields()
    self.key = nil
    self.bufferedImage = nil
end


function BufferedImageCacheable.new(key)
    local self = setmetatable({}, BufferedImageCacheable)
    self:_init_fields()
        self.key = key
        self:setBufferedImage(BufferedImage.new(key:getWidth(), key:getHeight(), key:getType()))
    return self
end


function BufferedImageCacheable:getKey()
        return self.key
end


function BufferedImageCacheable:getBufferedImage()
        return self.bufferedImage
end


function BufferedImageCacheable:setBufferedImage(bufferedImage)
        self.bufferedImage = bufferedImage
end


function BufferedImageCacheable:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(" ")
        stringBuffer:append(tostring(self:getKey()))
        return tostring(stringBuffer)
end
BufferedImageCacheable.__tostring = function(self) return self:toString() end

return BufferedImageCacheable

