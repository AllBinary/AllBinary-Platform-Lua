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

local Bitmap = require("android.graphics.Bitmap")
local Canvas = require("android.graphics.Canvas")
local Matrix = require("android.graphics.Matrix")
-- local Image = require("javax.microedition.lcdui.Image")
-- local NullImage = require("javax.microedition.lcdui.NullImage")
local Anchor = require("org.allbinary.graphics.Anchor")
local ImageCache = require("org.allbinary.image.ImageCache")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local AndroidImageInterface = require("org.microemu.android.device.AndroidImageInterface")

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

function ImageScaleUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.anchor = Anchor.TOP_LEFT
    self.imageBasicArrayList = BasicArrayListD.new()
    self.scaledImageBasicArrayList = BasicArrayListD.new()
    self.scaleXBasicArrayList = BasicArrayListD.new()
    self.scaleYBasicArrayList = BasicArrayListD.new()
end


function ImageScaleUtil.getInstance()
        return ImageScaleUtil.instance
end


function ImageScaleUtil.new()
    local self = setmetatable({}, ImageScaleUtil)
    self:_init_fields()
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
        local originalAndroidImage = originalImage
        local originalBitmap = originalAndroidImage:getBitmap()
        local width = java_int((originalBitmap:getWidth() * scaleX))
        local height = java_int((originalBitmap:getHeight() * scaleY))
        local index = self.imageBasicArrayList:indexOf(originalImage)
        local alreadyAvailable = false
        if index >= 0 then
            local scaleX2Float = self.scaleXBasicArrayList:get(index)
            local scaleX2 = (scaleX2Float + 0.0)
            local scaleY2Float = self.scaleYBasicArrayList:get(index)
            local scaleY2 = (scaleY2Float + 0.0)
            if scaleX2 == scaleX and scaleY2 == scaleY then
                alreadyAvailable = true
            end
        end
        if alreadyAvailable then
            return self.scaledImageBasicArrayList:get(index)
        else
            local scaledImage = self:getScaledImage(imageCache, originalImage, scaleX, scaleY, width, height, cached)
            self.imageBasicArrayList:add(originalImage)
            self.scaledImageBasicArrayList:add(scaledImage)
            self.scaleXBasicArrayList:add(scaleX)
            self.scaleYBasicArrayList:add(scaleY)
            return scaledImage
        end
end


-- throws Exception
function ImageScaleUtil:getScaledImage(imageCache, originalImage, scaleX, scaleY, width, height, cached)
        local image = NullImage.NULL_IMAGE
        if cached then
            image = imageCache:get(getmetatable(self).className, width, height)
        else
            image = imageCache:get(self.commonStrings.CREATE_IMAGE, width, height)
        end
        if image:isMutable() then
            local matrix = Matrix.new()
            self:scale(image, matrix, scaleX, scaleY)
            image:getGraphics():drawImage(originalImage, 0, 0, self.anchor)
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end


function ImageScaleUtil:scale(image, matrix, scaleX, scaleY)
        matrix:setScale(scaleX, scaleY)
        local canvas = (image):getCanvas()
        canvas:concat(matrix)
end

ImageScaleUtil.instance = ImageScaleUtil.new()

return ImageScaleUtil

