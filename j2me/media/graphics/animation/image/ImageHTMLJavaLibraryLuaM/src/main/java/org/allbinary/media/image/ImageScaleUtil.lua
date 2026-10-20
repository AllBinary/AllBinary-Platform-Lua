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
local Anchor = require("org.allbinary.graphics.Anchor")
local ImageCache = require("org.allbinary.image.ImageCache")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local PlaynImmutableImage = require("org.microemu.device.playn.PlaynImmutableImage")
local PlaynMutableImage = require("org.microemu.device.playn.PlaynMutableImage")
local CanvasImage = require("playn.core.CanvasImage")
local CanvasSurface = require("playn.core.CanvasSurface")

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

local ImageScaleUtil = {}
ImageScaleUtil.__index = ImageScaleUtil
ImageScaleUtil.className = "ImageScaleUtil"


function ImageScaleUtil.getInstance()
        return ImageScaleUtil.instance
end


function ImageScaleUtil.new()
    local self = setmetatable({}, ImageScaleUtil)
    return self
end


-- throws Exception
function ImageScaleUtil:createImage2(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached)
        return self:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, true)
end


-- throws Exception
function ImageScaleUtil:createImage3(imageCache, originalImage, scaleNominatorX, scaleDenominatorX, scaleNominatorY, scaleDenominatorY, cached, mutable)
        local scaleX = scaleNominatorX / scaleDenominatorX
        local scaleY = scaleNominatorY / scaleDenominatorY
        return self:createImage(imageCache, originalImage, scaleX, scaleY, cached)
end


-- throws Exception
function ImageScaleUtil:createImage(imageCache, originalImage, scaleX, scaleY, cached)
        return self:createImageInternal(originalImage, scaleX, scaleY)
end


-- throws Exception
function ImageScaleUtil:createImageInternal(originalImage, scaleX, scaleY)
        local image = ImageCreationUtil.getInstance():getInstance(java_int((originalImage:getWidth() * scaleX)), java_int((originalImage:getHeight() * scaleY)))
        if image:isMutable() then
            local originalPlayNImage = nil
            if originalImage:isMutable() then
                local originalHTMLImage = originalImage
                originalPlayNImage = originalHTMLImage:getImage()
            else
                local originalHTMLImage = originalImage
                originalPlayNImage = originalHTMLImage:getImage()
            end
            local htmlImage = image
            local canvasImage = htmlImage:getImage()
            local canvasSurface = htmlImage:getCanvasSurface(canvasImage)
            canvasSurface:drawImage(originalPlayNImage, 0, 0, image:getWidth(), image:getHeight(), 0, 0, originalPlayNImage:width(), originalPlayNImage:height())
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end

ImageScaleUtil.instance = ImageScaleUtil.new()

return ImageScaleUtil

