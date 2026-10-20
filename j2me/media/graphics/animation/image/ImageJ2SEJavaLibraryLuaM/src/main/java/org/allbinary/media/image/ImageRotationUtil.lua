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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local Image = require("javax.microedition.lcdui.Image")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local J2SEImmutableImage = require("org.microemu.device.j2se.J2SEImmutableImage")
local J2SEMutableImage = require("org.microemu.device.j2se.J2SEMutableImage")

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
    self.imageJ2SERotationUtil = ImageJ2SERotationUtil.getInstance()
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
            local j2seImage = image
            local newBufferedImage = j2seImage:getImage()
            local originalAwtImage = nil
            if originalImage:isMutable() then
                local originalJ2SEImage = originalImage
                originalAwtImage = originalJ2SEImage:getImage()
            else
                local originalJ2SEImage = originalImage
                originalAwtImage = originalJ2SEImage:getImage()
            end
            self.imageJ2SERotationUtil:rotateImage(originalAwtImage, newBufferedImage, totalAngle)
        else
            PreLogUtil.putOE("Not Mutable", self, "getRotatedImage", java_exception("Exception"))
        end
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        local image = ImageCreationUtil.getInstance():createImageWH(originalImage:getWidth(), originalImage:getHeight())
        if image:isMutable() then
            local originalAwtImage = nil
            if originalImage:isMutable() then
                local originalJ2SEImage = originalImage
                originalAwtImage = originalJ2SEImage:getImage()
            else
                local originalJ2SEImage = originalImage
                originalAwtImage = originalJ2SEImage:getImage()
            end
            local j2seImage = image
            local newBufferedImage = j2seImage:getImage()
            local bufferedImage = self.imageJ2SERotationUtil:createRotatedImage(originalAwtImage, newBufferedImage, rotationInDegrees)
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end

ImageRotationUtil.instance = ImageRotationUtil.new()

return ImageRotationUtil

