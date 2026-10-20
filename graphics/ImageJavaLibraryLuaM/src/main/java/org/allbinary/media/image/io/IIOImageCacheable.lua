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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local IIOImage = require("javax.imageio.IIOImage")
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

local IIOImageCacheable = {}
IIOImageCacheable.__index = IIOImageCacheable
IIOImageCacheable.className = "IIOImageCacheable"

function IIOImageCacheable:_init_fields()
    self.key = nil
    self.iioImage = nil
end


function IIOImageCacheable.new(key)
    local self = setmetatable({}, IIOImageCacheable)
    self:_init_fields()
        self.key = key
    return self
end


function IIOImageCacheable:getKey()
        return self.key
end


function IIOImageCacheable:setBufferedImage(bufferedImage)
        self:setIioImage(IIOImage.new(bufferedImage, nil, nil))
end


function IIOImageCacheable:getIioImage()
        return self.iioImage
end


function IIOImageCacheable:setIioImage(iioImage)
        self.iioImage = iioImage
end


function IIOImageCacheable:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(" Reusable IIOImage")
        return tostring(stringBuffer)
end
IIOImageCacheable.__tostring = function(self) return self:toString() end

return IIOImageCacheable

