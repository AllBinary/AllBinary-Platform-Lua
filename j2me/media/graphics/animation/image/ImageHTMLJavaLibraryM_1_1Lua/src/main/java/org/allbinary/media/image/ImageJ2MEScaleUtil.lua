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
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PlaynImmutableImage = require("org.microemu.device.playn.PlaynImmutableImage")
local PlaynMutableImage = require("org.microemu.device.playn.PlaynMutableImage")
local CanvasImage = require("playn.core.CanvasImage")
local CanvasSurface = require("playn.core.CanvasSurface")

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

function ImageJ2MEScaleUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageJ2MEScaleUtil.getInstance()
        return ImageJ2MEScaleUtil.instance
end


function ImageJ2MEScaleUtil.new()
    local self = setmetatable({}, ImageJ2MEScaleUtil)
    self:_init_fields()
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
        local originalPlayNImage = nil
        if image:isMutable() then
            local originalHTMLImage = image
            originalPlayNImage = originalHTMLImage:getImage()
        else
            local originalHTMLImage = image
            originalPlayNImage = originalHTMLImage:getImage()
        end
        local scaledImage = Image.createImage(width, height)
        local htmlImage = scaledImage
        local canvasImage = htmlImage:getImage()
        local canvasSurface = htmlImage:getCanvasSurface(canvasImage)
        canvasSurface:drawImage(originalPlayNImage, 0, 0, scaledImage:getWidth(), scaledImage:getHeight(), 0, 0, image:getWidth(), image:getHeight())
        return scaledImage
end

ImageJ2MEScaleUtil.instance = ImageJ2MEScaleUtil.new()

return ImageJ2MEScaleUtil

