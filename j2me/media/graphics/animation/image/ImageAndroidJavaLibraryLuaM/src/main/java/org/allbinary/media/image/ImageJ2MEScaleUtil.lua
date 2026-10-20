--
-- AllBinary Open License Version 1
-- Copyright (c) 2023 AllBinary
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

local ImageJ2MEScaleUtil = {}
ImageJ2MEScaleUtil.__index = ImageJ2MEScaleUtil
ImageJ2MEScaleUtil.className = "ImageJ2MEScaleUtil"


function ImageJ2MEScaleUtil.getInstance()
        return ImageJ2MEScaleUtil.instance
end


function ImageJ2MEScaleUtil.new()
    local self = setmetatable({}, ImageJ2MEScaleUtil)
    return self
end


-- throws Exception
function ImageJ2MEScaleUtil:scaleArray(images, width, height)
        for index = 0, (images.n or #images) - 1 do
            local image = images[index + 1]
            images[index + 1] = ImageScaleUtil.getInstance():createImage2(GameFeatureImageCacheFactory.getInstance(), image, (width + 0.0) / 2.0, (image:getWidth() + 0.0), (height + 0.0), (image:getHeight() + 0.0), false)
        end
        return images
end


-- throws Exception
function ImageJ2MEScaleUtil:scale(image, width, height)
        return ImageScaleUtil.getInstance():createImage2(GameFeatureImageCacheFactory.getInstance(), image, (width + 0.0), (image:getWidth() + 0.0), (height + 0.0), (image:getHeight() + 0.0), false)
end

ImageJ2MEScaleUtil.instance = ImageJ2MEScaleUtil.new()

return ImageJ2MEScaleUtil

