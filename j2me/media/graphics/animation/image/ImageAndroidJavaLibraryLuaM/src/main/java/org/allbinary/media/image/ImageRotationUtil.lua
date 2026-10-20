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
local Bitmap = require("android.graphics.Bitmap")
local Canvas = require("android.graphics.Canvas")
local Matrix = require("android.graphics.Matrix")
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

local ImageRotationUtil = {}
ImageRotationUtil.__index = ImageRotationUtil
ImageRotationUtil.className = "ImageRotationUtil"

function ImageRotationUtil:_init_fields()
    self.matrix = Matrix.new()
    self.anchor = Anchor.TOP_LEFT
end


function ImageRotationUtil.getInstance()
        return ImageRotationUtil.instance
end


function ImageRotationUtil.new()
    local self = setmetatable({}, ImageRotationUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        local image = ImageCreationUtil.getInstance():createImageWH(originalImage:getWidth(), originalImage:getHeight())
        if image:isMutable() then
            local bitmap = (image):getBitmap()
            local width = bitmap:getWidth()
            local height = bitmap:getHeight()
            self.matrix:setRotate((rotationInDegrees + 0.0), ((((width) // (1 << (1)))) + 0.0), ((((height) // (1 << (1)))) + 0.0))
            local canvas = (image):getCanvas()
            canvas:concat(self.matrix)
            image:getGraphics():drawImage(originalImage, 0, 0, self.anchor)
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end

ImageRotationUtil.instance = ImageRotationUtil.new()

return ImageRotationUtil

