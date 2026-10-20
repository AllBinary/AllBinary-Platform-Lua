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

-- local Image = require("javax.microedition.lcdui.Image")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageModifierUtil = {}
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"

function ImageModifierUtil.new()
    local self = setmetatable({}, ImageModifierUtil)
    return self
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.instance
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

ImageModifierUtil.instance = ImageModifierUtil.new()

return ImageModifierUtil

