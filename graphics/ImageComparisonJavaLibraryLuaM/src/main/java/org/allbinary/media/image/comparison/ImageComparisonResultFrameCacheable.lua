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

local ImageComparisonResultFrameCacheable = {}
package.loaded["org.allbinary.media.image.comparison.ImageComparisonResultFrameCacheable"] = ImageComparisonResultFrameCacheable

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

local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CacheableInterface = java_lazy("org.allbinary.logic.util.cache.CacheableInterface")
local ImageComparisonResult = java_lazy("org.allbinary.media.image.comparison.ImageComparisonResult")

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

-- class table ImageComparisonResultFrameCacheable is declared before the requires
ImageComparisonResultFrameCacheable.__index = ImageComparisonResultFrameCacheable
ImageComparisonResultFrameCacheable.className = "ImageComparisonResultFrameCacheable"
ImageComparisonResultFrameCacheable.javaClassName = "org.allbinary.media.image.comparison.ImageComparisonResultFrameCacheable"
ImageComparisonResultFrameCacheable.java_implements = " CacheableInterface "
ImageComparisonResultFrameCacheable.java_interfaces = function() return {CacheableInterface} end

function ImageComparisonResultFrameCacheable:_init_fields()
    if self.frame == nil then self.frame = nil end
    if self.imageComparisonResult == nil then self.imageComparisonResult = nil end
end


function ImageComparisonResultFrameCacheable._jinit(self, imageComparisonResult, frame)
    ImageComparisonResultFrameCacheable._init_fields(self)
        self:setImageComparisonResult(imageComparisonResult)
        self.frame = frame
    return self
end

function ImageComparisonResultFrameCacheable.new(...)
    local self = setmetatable({}, ImageComparisonResultFrameCacheable)
    ImageComparisonResultFrameCacheable._jinit(self, ...)
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
        stringBuffer:append((getmetatable(self).javaClassName or getmetatable(self).className))
        stringBuffer:append(" Frame: ")
        stringBuffer:appendlong(self:getFrame())
        return tostring(stringBuffer)
end
ImageComparisonResultFrameCacheable.__tostring = function(self) return self:toString() end

return ImageComparisonResultFrameCacheable

