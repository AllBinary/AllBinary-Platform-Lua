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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = require("org.allbinary.graphics.Anchor")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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

local ImageCopyUtil = {}
ImageCopyUtil.__index = ImageCopyUtil
ImageCopyUtil.className = "ImageCopyUtil"

function ImageCopyUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageCreationUtil = ImageCreationUtil.getInstance()
    self.anchor = Anchor.TOP_LEFT
end


function ImageCopyUtil.getInstance()
        return ImageCopyUtil.instance
end


function ImageCopyUtil.new()
    local self = setmetatable({}, ImageCopyUtil)
    self:_init_fields()
    return self
end


-- throws Exception
function ImageCopyUtil:createImageForRotation(originalImage)
        return self:createImage(originalImage)
end


-- throws Exception
function ImageCopyUtil:createImage(originalImage)
        local image = self.imageCreationUtil:createImageWH(originalImage:getWidth(), originalImage:getHeight())
        if image:isMutable() then
            image:getGraphics():drawImage(originalImage, 0, 0, self.anchor)
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end


-- throws Exception
function ImageCopyUtil:createImageScale(originalImage, canvasScale, resize)
        local newWidth = java_int((originalImage:getWidth() * canvasScale))
        local newHeight = java_int((originalImage:getHeight() * canvasScale))
        if resize then
            if newWidth < newHeight then
                newWidth = newHeight
            end
            if newHeight < newWidth then
                newHeight = newWidth
            end
        end
        local image = self.imageCreationUtil:createImageWH(newWidth, newHeight)
        if image:isMutable() then
            local halfWidthDelta = (newWidth - originalImage:getWidth()) / 2
            local halfHeightDelta = (newHeight - originalImage:getHeight()) / 2
            local graphics = image:getGraphics()
            graphics:drawImage(originalImage, halfWidthDelta, halfHeightDelta, self.anchor)
            return image
        else
            error(java_exception("Exception", "Not Mutable"), 0)
        end
end

ImageCopyUtil.instance = ImageCopyUtil.new()

return ImageCopyUtil

