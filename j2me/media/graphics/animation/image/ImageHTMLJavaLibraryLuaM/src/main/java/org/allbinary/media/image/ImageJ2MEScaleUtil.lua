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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

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
        local scaledImages = java_new_array(nil, (images.n or #images))
        do
            local index = (images.n or #images)
            while (function() index = index - 1 return index end)() >= 0 do
            scaledImages[index + 1] = self:scale(images[index + 1], width, height)
            end
        end
        return scaledImages
end


-- throws Exception
function ImageJ2MEScaleUtil:scale(image, width, height)
        return image
end

ImageJ2MEScaleUtil.instance = ImageJ2MEScaleUtil.new()

return ImageJ2MEScaleUtil

