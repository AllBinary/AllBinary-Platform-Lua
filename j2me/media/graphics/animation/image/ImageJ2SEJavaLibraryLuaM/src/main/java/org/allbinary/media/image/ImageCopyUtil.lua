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

local ImageCopyUtil = {}
package.loaded["org.allbinary.media.image.ImageCopyUtil"] = ImageCopyUtil

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local J2SEImmutableImage = java_lazy("org.microemu.device.j2se.J2SEImmutableImage")
local ImageCreationUtil = java_lazy("org.allbinary.media.image.ImageCreationUtil")
local ImageUtil = java_lazy("org.allbinary.media.image.ImageUtil")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table ImageCopyUtil is declared before the requires
ImageCopyUtil.__index = ImageCopyUtil
ImageCopyUtil.className = "ImageCopyUtil"
ImageCopyUtil.javaClassName = "org.allbinary.media.image.ImageCopyUtil"

function ImageCopyUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.imageUtil = ImageUtil.getInstance()
    self.imageCreationUtil = ImageCreationUtil.getInstance()
    self.anchor = Anchor.TOP_LEFT
end


function ImageCopyUtil.getInstance()
        return ImageCopyUtil.instance_f
end


function ImageCopyUtil._jinit(self)
    ImageCopyUtil._init_fields(self)
    return self
end

function ImageCopyUtil.new(...)
    local self = setmetatable({}, ImageCopyUtil)
    ImageCopyUtil._jinit(self, ...)
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
            error(require("java.lang.Exception").new("Not Mutable"), 0)
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
        local originalBufferedImage = self.imageUtil:getBufferedImage(originalImage)
        local bufferedImage = self.imageUtil:createBufferedImageWithLargerCanvas(originalBufferedImage, newWidth, newHeight)
        local image = J2SEImmutableImage.new(bufferedImage)
        return image
end

ImageCopyUtil.instance_f = ImageCopyUtil.new()

return ImageCopyUtil

