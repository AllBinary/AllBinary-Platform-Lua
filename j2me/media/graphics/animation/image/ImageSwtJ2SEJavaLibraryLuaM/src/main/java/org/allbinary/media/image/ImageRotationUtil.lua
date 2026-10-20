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
local Features = require("org.allbinary.game.configuration.feature.Features")
local OpenGLFeatureFactory = require("org.allbinary.graphics.opengles.OpenGLFeatureFactory")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local GC = require("org.eclipse.swt.graphics.GC")
local SwtImmutableImage = require("org.microemu.device.swt.SwtImmutableImage")
local SwtMutableImage = require("org.microemu.device.swt.SwtMutableImage")

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
    self.imageSwtRotationUtil = ImageSwtRotationUtil.getInstance()
    self.features = Features.getInstance()
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
        local originalImage2 = originalImage
        if self.features:isFeature(OpenGLFeatureFactory.getInstance().OPENGL) then
            if image:getType() >= OpenGLESImage.TYPE then
                local openGLESImage = (image)
                openGLESImage.openGLESImageProperties.angle = totalAngle
                return
            else
                PreLogUtil.put("OpenGL but image is: " .. tostring(image) .. " type: " .. tostring(image:getType()), self, "rotateImage")
            end
        end
        local originalSwtImage = (originalImage2:getImage())
        local gc = nil
        local copySwtImage = nil
        if image:isMutable() then
            local swtImage = image
            copySwtImage = swtImage:getImage()
            gc = swtImage:getGc()
            self.imageSwtRotationUtil:rotateImage(originalSwtImage, copySwtImage, gc, totalAngle)
        else
            PreLogUtil.put("No rotation for: " .. tostring(image), self, "rotateImage")
        end
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        return originalImage
end

ImageRotationUtil.instance = ImageRotationUtil.new()

return ImageRotationUtil

