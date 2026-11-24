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

local ImageRotationUtil = {}
package.loaded["org.allbinary.media.image.ImageRotationUtil"] = ImageRotationUtil

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

-- local Image = require("javax.microedition.lcdui.Image")
local PlaynImmutableImage = java_lazy("org.microemu.device.playn.PlaynImmutableImage")
local PlaynMutableImage = java_lazy("org.microemu.device.playn.PlaynMutableImage")
local CanvasImage = java_lazy("playn.core.CanvasImage")
local CanvasSurface = java_lazy("playn.core.CanvasSurface")
local ImageCreationUtil = java_lazy("org.allbinary.media.image.ImageCreationUtil")

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

-- class table ImageRotationUtil is declared before the requires
ImageRotationUtil.__index = ImageRotationUtil
ImageRotationUtil.className = "ImageRotationUtil"
ImageRotationUtil.javaClassName = "org.allbinary.media.image.ImageRotationUtil"


function ImageRotationUtil.getInstance()
        return ImageRotationUtil.instance_f
end


function ImageRotationUtil._jinit(self)
    return self
end

function ImageRotationUtil.new(...)
    local self = setmetatable({}, ImageRotationUtil)
    ImageRotationUtil._jinit(self, ...)
    return self
end


-- throws Exception
function ImageRotationUtil:createRotatedImage(originalImage, rotationInDegrees)
        local image = ImageCreationUtil.getInstance():getInstance(originalImage:getWidth(), originalImage:getHeight())
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
            canvasSurface:translate(originalPlayNImage:width() / 2, originalPlayNImage:height() / 2)
            canvasSurface:rotate((math.rad(rotationInDegrees) + 0.0))
            canvasSurface:drawImage(originalPlayNImage, -originalPlayNImage:width() / 2, -originalPlayNImage:height() / 2)
            return image
        else
            error(require("java.lang.Exception").new("Not Mutable"), 0)
        end
end

ImageRotationUtil.instance_f = ImageRotationUtil.new()

return ImageRotationUtil

