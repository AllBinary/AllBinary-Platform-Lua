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

local ImageCreationUtil = {}
package.loaded["org.allbinary.media.image.ImageCreationUtil"] = ImageCreationUtil

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
local GameFeatureImageCacheFactory = java_lazy("org.allbinary.image.GameFeatureImageCacheFactory")

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

-- class table ImageCreationUtil is declared before the requires
ImageCreationUtil.__index = ImageCreationUtil
ImageCreationUtil.className = "ImageCreationUtil"
ImageCreationUtil.javaClassName = "org.allbinary.media.image.ImageCreationUtil"


function ImageCreationUtil.getInstance()
        return ImageCreationUtil.instance_f
end


function ImageCreationUtil._jinit(self)
    return self
end

function ImageCreationUtil.new(...)
    local self = setmetatable({}, ImageCreationUtil)
    ImageCreationUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ImageCreationUtil:createImageWH(width, height)
        local image = GameFeatureImageCacheFactory.getInstance():get((getmetatable(self).javaClassName or getmetatable(self).className), width, height)
        return image
end


-- throws Exception
function ImageCreationUtil:createImage(width, height, maxScaleX, maxScaleY)
        local image = GameFeatureImageCacheFactory.getInstance():get((getmetatable(self).javaClassName or getmetatable(self).className), java_int(((width + 0.0) * maxScaleX)) + 1, java_int(((height + 0.0) * maxScaleY)) + 1)
        return image
end

ImageCreationUtil.instance_f = ImageCreationUtil.new()

return ImageCreationUtil

