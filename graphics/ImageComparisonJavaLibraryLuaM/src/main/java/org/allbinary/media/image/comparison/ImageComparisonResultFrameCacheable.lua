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
-- package org.allbinary.media.image.comparison

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

local ImageComparisonResultFrameCacheable = {}
ImageComparisonResultFrameCacheable.__index = ImageComparisonResultFrameCacheable
ImageComparisonResultFrameCacheable.className = "ImageComparisonResultFrameCacheable"

function ImageComparisonResultFrameCacheable:_init_fields()
    self.frame = nil
    self.imageComparisonResult = nil
end


function ImageComparisonResultFrameCacheable.new(imageComparisonResult, frame)
    local self = setmetatable({}, ImageComparisonResultFrameCacheable)
    self:_init_fields()
        self:setImageComparisonResult(imageComparisonResult)
        self.frame = frame
    return self
end


function ImageComparisonResultFrameCacheable:getKey()
        return self.frame
end


function ImageComparisonResultFrameCacheable:getFrame()
        return self.frame
end


function ImageComparisonResultFrameCacheable:setFrame(frame)
        self.frame = frame
end


function ImageComparisonResultFrameCacheable:getImageComparisonResult()
        return self.imageComparisonResult
end


function ImageComparisonResultFrameCacheable:setImageComparisonResult(imageComparisonResult)
        self.imageComparisonResult = imageComparisonResult
end


function ImageComparisonResultFrameCacheable:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(getmetatable(self).className)
        stringBuffer:append(" Frame: ")
        stringBuffer:appendlong(self:getFrame())
        return tostring(stringBuffer)
end
ImageComparisonResultFrameCacheable.__tostring = function(self) return self:toString() end

return ImageComparisonResultFrameCacheable

