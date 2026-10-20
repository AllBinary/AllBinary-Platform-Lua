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

local BufferedImageFrameCacheable = {}
BufferedImageFrameCacheable.__index = BufferedImageFrameCacheable
BufferedImageFrameCacheable.className = "BufferedImageFrameCacheable"

function BufferedImageFrameCacheable:_init_fields()
    self.frame = nil
    self.bufferedImage = nil
end


function BufferedImageFrameCacheable.new(bufferedImage, frame)
    local self = setmetatable({}, BufferedImageFrameCacheable)
    self:_init_fields()
        self.frame = frame
        self:setBufferedImage(bufferedImage)
    return self
end


function BufferedImageFrameCacheable:getKey()
        return self.frame
end


function BufferedImageFrameCacheable:getBufferedImage()
        return self.bufferedImage
end


function BufferedImageFrameCacheable:setBufferedImage(bufferedImage)
        self.bufferedImage = bufferedImage
end


function BufferedImageFrameCacheable:getFrame()
        return self.frame
end


function BufferedImageFrameCacheable:setFrame(frame)
        self.frame = frame
end


function BufferedImageFrameCacheable:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(" Frame: ")
        stringBuffer:appendlong(self:getFrame())
        return tostring(stringBuffer)
end
BufferedImageFrameCacheable.__tostring = function(self) return self:toString() end

return BufferedImageFrameCacheable

