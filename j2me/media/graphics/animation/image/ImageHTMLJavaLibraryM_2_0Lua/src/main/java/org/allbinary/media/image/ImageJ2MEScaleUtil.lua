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

local ImageJ2MEScaleUtil = {}
package.loaded["org.allbinary.media.image.ImageJ2MEScaleUtil"] = ImageJ2MEScaleUtil

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

local Image = java_lazy("javax.microedition.lcdui.Image")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PlaynImmutableImage = java_lazy("org.microemu.device.playn.PlaynImmutableImage")
local PlaynMutableImage = java_lazy("org.microemu.device.playn.PlaynMutableImage")
local Canvas = java_lazy("playn.core.Canvas")
local CoreImage = java_lazy("playn.core.CoreImage")
local ImageImpl = java_lazy("playn.core.ImageImpl")
local PlayN = java_lazy("playn.core.PlayN")
local HtmlGraphics = java_lazy("playn.html.HtmlGraphics")
local HtmlImage = java_lazy("playn.html.HtmlImage")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table ImageJ2MEScaleUtil is declared before the requires
ImageJ2MEScaleUtil.__index = ImageJ2MEScaleUtil
ImageJ2MEScaleUtil.className = "ImageJ2MEScaleUtil"
ImageJ2MEScaleUtil.javaClassName = "org.allbinary.media.image.ImageJ2MEScaleUtil"

function ImageJ2MEScaleUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function ImageJ2MEScaleUtil.getInstance()
        return ImageJ2MEScaleUtil.instance_f
end


function ImageJ2MEScaleUtil._jinit(self)
    ImageJ2MEScaleUtil._init_fields(self)
    return self
end

function ImageJ2MEScaleUtil.new(...)
    local self = setmetatable({}, ImageJ2MEScaleUtil)
    ImageJ2MEScaleUtil._jinit(self, ...)
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
        local scaledImage = Image.createImageWH(width, height)
        local htmlImage = scaledImage
        local scaledPlayNImage = htmlImage:getImage()
        local canvas = (PlayN.getInstance():graphics()):get(scaledPlayNImage)
        canvas:drawScale(originalPlayNImage, 0, 0, scaledImage:getWidth(), scaledImage:getHeight(), 0, 0, image:getWidth(), image:getHeight())
        return scaledImage
end

ImageJ2MEScaleUtil.instance_f = ImageJ2MEScaleUtil.new()

return ImageJ2MEScaleUtil

