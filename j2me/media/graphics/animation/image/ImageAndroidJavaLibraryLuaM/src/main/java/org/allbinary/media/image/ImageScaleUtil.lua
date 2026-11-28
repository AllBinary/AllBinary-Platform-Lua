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

local ImageScaleUtil = {}
package.loaded["org.allbinary.media.image.ImageScaleUtil"] = ImageScaleUtil

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

local Bitmap = java_lazy("android.graphics.Bitmap")
local Canvas = java_lazy("android.graphics.Canvas")
local Matrix = java_lazy("android.graphics.Matrix")
local Image = java_lazy("javax.microedition.lcdui.Image")
local NullImage = java_lazy("javax.microedition.lcdui.NullImage")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local ImageCache = java_lazy("org.allbinary.image.ImageCache")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local AndroidImageInterface = java_lazy("org.microemu.android.device.AndroidImageInterface")

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

-- class table ImageScaleUtil is declared before the requires
ImageScaleUtil.__index = ImageScaleUtil
ImageScaleUtil.className = "ImageScaleUtil"
ImageScaleUtil.javaClassName = "org.allbinary.media.image.ImageScaleUtil"

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
        return ImageScaleUtil.instance_f
end


function ImageScaleUtil._jinit(self)
    ImageScaleUtil._init_fields(self)
    return self
end

function ImageScaleUtil.new(...)
    local self = setmetatable({}, ImageScaleUtil)
    ImageScaleUtil._jinit(self, ...)
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
            if rawequal(scaleX2, scaleX) and rawequal(scaleY2, scaleY) then
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
            image = imageCache:get((getmetatable(self).javaClassName or getmetatable(self).className), width, height)
        else
            image = imageCache:get(self.commonStrings.CREATE_IMAGE, width, height)
        end
        if image:isMutable() then
            local matrix = Matrix.new()
            self:scale(image, matrix, scaleX, scaleY)
            image:getGraphics():drawImage(originalImage, 0, 0, self.anchor)
            return image
        else
            error(require("java.lang.Exception").new("Not Mutable"), 0)
        end
end


function ImageScaleUtil:scale(image, matrix, scaleX, scaleY)
        matrix:setScale(scaleX, scaleY)
        local canvas = (image):getCanvas()
        canvas:concat(matrix)
end

ImageScaleUtil.instance_f = ImageScaleUtil.new()

return ImageScaleUtil

