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

local ImageToRotationImageArrayUtil = {}
ImageToRotationImageArrayUtil.__index = ImageToRotationImageArrayUtil
ImageToRotationImageArrayUtil.className = "ImageToRotationImageArrayUtil"


function ImageToRotationImageArrayUtil.getInstance()
        return ImageToRotationImageArrayUtil.instance
end


function ImageToRotationImageArrayUtil.new()
    local self = setmetatable({}, ImageToRotationImageArrayUtil)
    return self
end


-- throws Exception
function ImageToRotationImageArrayUtil:generate(image, angleIncrement, totalAngle)
        local imageRotationUtil = ImageRotationUtil.getInstance()
        local totalFrames = java_idiv(totalAngle, angleIncrement)
        local imageArray = java_new_array(nil, totalFrames)
        imageArray[1] = image
        for index = 1, totalFrames - 1 do
            imageArray[index + 1] = imageRotationUtil:createRotatedImage(image, index * angleIncrement)
        end
        return imageArray
end

ImageToRotationImageArrayUtil.instance = ImageToRotationImageArrayUtil.new()

return ImageToRotationImageArrayUtil

