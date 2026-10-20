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
local PlaynImmutableImage = require("org.microemu.device.playn.PlaynImmutableImage")
local PlaynMutableImage = require("org.microemu.device.playn.PlaynMutableImage")
local Canvas = require("playn.core.Canvas")
local CoreImage = require("playn.core.CoreImage")
local ImageImpl = require("playn.core.ImageImpl")
local HTMLPlaynUtil = require("playn.html.HTMLPlaynUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
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

local ImageRotationUtil = {}
ImageRotationUtil.__index = ImageRotationUtil
ImageRotationUtil.className = "ImageRotationUtil"

function ImageRotationUtil:_init_fields()
    self.playnUtil = HTMLPlaynUtil.getInstance()
end


function ImageRotationUtil.getInstance()
        return ImageRotationUtil.instance
end


function ImageRotationUtil.new()
    local self = setmetatable({}, ImageRotationUtil)
    self:_init_fields()
    return self
end


function ImageRotationUtil:rotateImage(originalImage, image, totalAngle)
        if image:isMutable() then
            local htmlImage = image
            local canvasImage = htmlImage:getImage()
            local canvas = self.playnUtil:getCanvas(canvasImage)
            canvas:save()
            canvas:clear()
            canvas:translate(originalImage:getWidth() / 2, originalImage:getHeight() / 2)
            local image2 = self:rotateImageCanvasSurface(originalImage, image, canvas, totalAngle)
            self:drawImage(originalImage, image, canvas)
            canvas:restore()
            return image2
        else
            return nil
        end
end


function ImageRotationUtil:rotateImageCanvasSurfaceClear(originalImage, image, canvasSurface, totalAngle)
        if image:isMutable() then
            canvasSurface:translate(-originalImage:getWidth() / 2, -originalImage:getHeight() / 2)
            canvasSurface:clear()
            canvasSurface:translate(originalImage:getWidth() / 2, originalImage:getHeight() / 2)
            return self:rotateImageCanvasSurface(originalImage, image, canvasSurface, totalAngle)
        else
            return nil
        end
end


function ImageRotationUtil:rotateImageCanvasSurface(originalImage, image, canvasSurface, totalAngle)
        if image:isMutable() then
            canvasSurface:rotate((math.rad(totalAngle) + 0.0))
            return image
        else
            return nil
        end
end


function ImageRotationUtil:drawImage(originalImage, image, canvasSurface)
        local originalPlayNImage = nil
        if originalImage:isMutable() then
            local originalHTMLImage = originalImage
            originalPlayNImage = originalHTMLImage:getImage()
        else
            local originalHTMLImage = originalImage
            originalPlayNImage = originalHTMLImage:getImage()
        end
        canvasSurface:draw(originalPlayNImage, -originalImage:getWidth() / 2, -originalImage:getHeight() / 2)
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        local image = ImageCreationUtil.getInstance():createImageWH(originalImage:getWidth(), originalImage:getHeight())
        local rotatedImage = self:rotateImage(originalImage, image, rotationInDegrees)
        if rotatedImage == nil then
            error(java_exception("Exception", "Not Mutable"), 0)
        end
        return rotatedImage
end

ImageRotationUtil.instance = ImageRotationUtil.new()

return ImageRotationUtil

