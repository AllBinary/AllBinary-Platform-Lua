-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local ImageModifierUtil = {}
package.loaded["org.allbinary.media.image.ImageModifierUtil"] = ImageModifierUtil

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

-- local Image = require("javax.microedition.lcdui.Image")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")

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

-- class table ImageModifierUtil is declared before the requires
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"
ImageModifierUtil.javaClassName = "org.allbinary.media.image.ImageModifierUtil"

function ImageModifierUtil._jinit(self)
    return self
end

function ImageModifierUtil.new()
    return ImageModifierUtil._jinit(setmetatable({}, ImageModifierUtil))
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.instance_f
end


function ImageModifierUtil:setColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:setAlpha(originalImage, image, imageIndex, alphaInt)
end


function ImageModifierUtil:getImageArray(originalImageArray)
        return originalImageArray
end


function ImageModifierUtil:handleImage(imageArray, index, image)
end


function ImageModifierUtil:reset()
end

ImageModifierUtil.instance_f = ImageModifierUtil.new()

return ImageModifierUtil

