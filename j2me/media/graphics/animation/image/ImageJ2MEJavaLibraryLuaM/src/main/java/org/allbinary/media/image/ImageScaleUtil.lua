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
-- package org.allbinary.media.image

local ImageScaleUtil = {}
package.loaded["org.allbinary.media.image.ImageScaleUtil"] = ImageScaleUtil

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")

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

-- class table ImageScaleUtil is declared before the requires
ImageScaleUtil.__index = ImageScaleUtil
ImageScaleUtil.className = "ImageScaleUtil"
ImageScaleUtil.javaClassName = "org.allbinary.media.image.ImageScaleUtil"


function ImageScaleUtil.getInstance()
        return ImageScaleUtil.instance_f
end


function ImageScaleUtil._jinit(self)
    return self
end

function ImageScaleUtil.new(...)
    local self = setmetatable({}, ImageScaleUtil)
    ImageScaleUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ImageScaleUtil:createImage2(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached)
        return self:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true)
end


-- throws Exception
function ImageScaleUtil:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, mutable)
        return originalImage
end

ImageScaleUtil.instance_f = ImageScaleUtil.new()

return ImageScaleUtil

