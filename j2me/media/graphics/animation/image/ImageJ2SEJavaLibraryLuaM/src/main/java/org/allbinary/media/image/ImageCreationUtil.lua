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

-- local Image = require("javax.microedition.lcdui.Image")
local GameFeatureImageCacheFactory = require("org.allbinary.image.GameFeatureImageCacheFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageCreationUtil = {}
ImageCreationUtil.__index = ImageCreationUtil
ImageCreationUtil.className = "ImageCreationUtil"


function ImageCreationUtil.getInstance()
        return ImageCreationUtil.instance
end


function ImageCreationUtil.new()
    local self = setmetatable({}, ImageCreationUtil)
    return self
end


-- throws Exception
function ImageCreationUtil:createImageWH(width, height)
        local image = GameFeatureImageCacheFactory.getInstance():get(getmetatable(self).className, width, height)
        return image
end


-- throws Exception
function ImageCreationUtil:createImage(width, height, maxScaleX, maxScaleY)
        local image = GameFeatureImageCacheFactory.getInstance():get(getmetatable(self).className, java_int(((width + 0.0) * maxScaleX)) + 1, java_int(((height + 0.0) * maxScaleY)) + 1)
        return image
end

ImageCreationUtil.instance = ImageCreationUtil.new()

return ImageCreationUtil

