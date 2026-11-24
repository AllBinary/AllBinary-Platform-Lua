-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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

local ImageModifierUtil = {}
package.loaded["org.allbinary.media.image.ImageModifierUtil"] = ImageModifierUtil

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = java_lazy("org.allbinary.graphics.Anchor")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local PlaynImage = java_lazy("org.microemu.device.playn.PlaynImage")
local ResourceCallbackStrings = java_lazy("org.microemu.device.ResourceCallbackStrings")
local Callback = java_lazy("playn.core.Callback")
local Canvas = java_lazy("playn.core.Canvas")
local CoreImage = java_lazy("playn.core.CoreImage")
local ImageImpl = java_lazy("playn.core.ImageImpl")
local HTMLPlaynUtil = java_lazy("playn.html.HTMLPlaynUtil")

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

-- class table ImageModifierUtil is declared before the requires
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"
ImageModifierUtil.javaClassName = "org.allbinary.media.image.ImageModifierUtil"
local ImageCopyCallback = {}
    ImageCopyCallback.__index = ImageCopyCallback
    ImageCopyCallback.className = "ImageCopyCallback"
    ImageCopyCallback.javaClassName = "org.allbinary.media.image.ImageModifierUtil$ImageCopyCallback"
    ImageCopyCallback.java_implements = " Callback "
    ImageCopyCallback.java_interfaces = function() return {Callback} end
    ImageModifierUtil.ImageCopyCallback = ImageCopyCallback

    function ImageCopyCallback:_init_fields()
        if self.imageModifierUtil == nil then self.imageModifierUtil = nil end
        if self.imageArray == nil then self.imageArray = nil end
        if self.index == nil then self.index = nil end
        if self.image == nil then self.image = nil end
        if self.image3 == nil then self.image3 = nil end
    end
    

    function ImageModifierUtil._jinit(self, imageModifierUtil, imageArray, index, image, image3)
        ImageModifierUtil._init_fields(self)
            self.imageModifierUtil = imageModifierUtil
            self.imageArray = imageArray
            self.index = index
            self.image = image
            self.image3 = image3
        return self
    end

    function ImageModifierUtil.new(...)
        local self = setmetatable({}, ImageModifierUtil)
        ImageModifierUtil._jinit(self, ...)
        return self
    end
    

    function ImageModifierUtil:onSuccess(resource)
            local logUtil = LogUtil.getInstance()
            local resourceCallbackStrings = self.imageModifierUtil.resourceCallbackStrings
            logUtil:putF(tostring(resourceCallbackStrings.DONE) .. self.image:getName(), self, resourceCallbackStrings.HANDLE_IMAGE)
            self.imageModifierUtil:copy(self.imageArray, self.index, self.image, self.image3)
    end
    

    function ImageModifierUtil:onFailure(e)
            local logUtil = LogUtil.getInstance()
            local resourceCallbackStrings = self.imageModifierUtil.resourceCallbackStrings
            logUtil:put(tostring(StringMaker.new():append(self.imageModifierUtil.commonStrings.EXCEPTION_LABEL):append(resourceCallbackStrings.ERROR):append(self.image:getName())), self, resourceCallbackStrings.HANDLE_IMAGE, e)
    end


function ImageModifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.resourceCallbackStrings = ResourceCallbackStrings.getInstance()
    self.playnUtil = HTMLPlaynUtil.getInstance()
    if self.alphaArray == nil then self.alphaArray = nil end
end

function ImageModifierUtil._jinit(self)
    ImageModifierUtil._init_fields(self)
    return self
end

function ImageModifierUtil.new()
    return ImageModifierUtil._jinit(setmetatable({}, ImageModifierUtil))
end


function ImageModifierUtil.getInstanceOrCreate()
        return ImageModifierUtil.new()
end


function ImageModifierUtil:setColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:changeColor(unusedOriginalImage, image, imageIndex, basicColor)
end


function ImageModifierUtil:setAlpha(originalImage, image, imageIndex, alpha)
        local alphaF = (alpha + 0.0)
        local alphaFloat = alphaF / 255.0
        self:setAlphaF(originalImage, image, imageIndex, alphaFloat)
end


function ImageModifierUtil:setAlphaF(originalImage, image, imageIndex, alpha)
        if self.alphaArray[imageIndex + 1] then
            self.alphaArray[imageIndex + 1] = false
            self:setAlpha2(originalImage, image, imageIndex, alpha)
        end
end


function ImageModifierUtil:setAlpha2(originalImage, image, imageIndex, alpha)
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local originalPlaynImage = (originalImage):getImage()
        local canvas = self.playnUtil:getCanvas(canvasImage)
        canvas:clear()
        canvas:setAlpha(alpha)
        canvas:draw(originalPlaynImage, 0, 0)
end


function ImageModifierUtil:setAlpha3(image, alpha)
        local alphaF = alpha
        local alphaFloat = alphaF / 255.0
        local htmlImage = image
        local canvasImage = htmlImage:getImage()
        local canvas = self.playnUtil:getCanvas(canvasImage)
        canvas:setAlpha(alphaFloat)
end


function ImageModifierUtil:getImageArray(originalImageArray)
        local size = (originalImageArray.n or #originalImageArray)
        self.alphaArray = java_new_array(false, size)
        local imageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            imageArray[index + 1] = originalImageArray[index + 1]
            self:handleImage(imageArray, index, originalImageArray[index + 1])
        end
        return imageArray
end


function ImageModifierUtil:handleImage(imageArray, index, image)
        local image3 = (image):getImage()
        if image3 ~= nil then
            if image3:isReady() or image3:width() + image3:height() <= 0 or image:getName() == self.resourceCallbackStrings.FROM_DATA then
                self:copy(imageArray, index, image, image3)
            else
                local callback = ImageCopyCallback.new(self, imageArray, index, image, image3)
                image3:addCallback(callback)
            end
        else
            self.logUtil:putF(self.resourceCallbackStrings.NULL + image:isMutable(), self, self.resourceCallbackStrings.HANDLE_IMAGE)
        end
end


function ImageModifierUtil:copy(imageArray, index, image, image3)
        local try_ok, try_error, try_value = pcall(function()
            local image2 = Image.createImageWH(java_int(image3:width()), java_int(image3:height()))
            local graphics = image2:getGraphics()
            graphics:drawImage(image, 0, 0, Anchor.TOP_LEFT)
            imageArray[index + 1] = image2
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:putF(self.commonStrings.EXCEPTION_LABEL + self.resourceCallbackStrings.DONE, self, self.resourceCallbackStrings.HANDLE_IMAGE)
        end
end


function ImageModifierUtil:reset()
        local size = (self.alphaArray.n or #self.alphaArray)
        for index = 0, size - 1 do
            self.alphaArray[index + 1] = true
        end
end

return ImageModifierUtil

