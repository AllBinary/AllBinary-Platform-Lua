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

local Paint = require("android.graphics.Paint")
local PorterDuff = require("android.graphics.PorterDuff")
local PorterDuffColorFilter = require("android.graphics.PorterDuffColorFilter")
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

function ImageModifierUtil:_init_fields()
    self.paint = Paint.new(Paint.ANTI_ALIAS_FLAG)
end

function ImageModifierUtil.new()
    local self = setmetatable({}, ImageModifierUtil)
    self:_init_fields()
    return self
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.new()
end


function ImageModifierUtil:setColor(unusedOriginalImage, image, imageIndex, basicColor)
        self.paint:setColorFilter(PorterDuffColorFilter.new(math.tointeger(basicColor // 1), PorterDuff.Mode.SRC_IN))
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
        self.paint:setColorFilter(PorterDuffColorFilter.new(math.tointeger(basicColor // 1), PorterDuff.Mode.SRC_IN))
end


function ImageModifierUtil:setAlpha(originalImage, image, imageIndex, alphaInt)
        if alphaInt ~= self.paint:getAlpha() then
            self.paint:setAlpha(alphaInt)
        end
end


function ImageModifierUtil:getImageArray(originalImageArray)
        return originalImageArray
end


function ImageModifierUtil:handleImage(imageArray, index, image)
end


function ImageModifierUtil:reset()
end

return ImageModifierUtil

