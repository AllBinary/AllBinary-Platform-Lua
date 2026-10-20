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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local PlaynImage = require("org.microemu.device.playn.PlaynImage")
local ResourceCallbackStrings = require("org.microemu.device.ResourceCallbackStrings")
local Callback = require("playn.core.Callback")
local Canvas = require("playn.core.Canvas")
local CoreImage = require("playn.core.CoreImage")
local ImageImpl = require("playn.core.ImageImpl")
local HTMLPlaynUtil = require("playn.html.HTMLPlaynUtil")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local ImageModifierUtil = {}
ImageModifierUtil.__index = ImageModifierUtil
ImageModifierUtil.className = "ImageModifierUtil"

function ImageModifierUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.resourceCallbackStrings = ResourceCallbackStrings.getInstance()
    self.playnUtil = HTMLPlaynUtil.getInstance()
    self.alphaArray = nil
end

function ImageModifierUtil.new()
    local self = setmetatable({}, ImageModifierUtil)
    self:_init_fields()
    return self
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
                local callback = (function()
                    local o = Callback.new and Callback.new() or setmetatable({}, {__index = Callback})
                    

                    function o:onSuccess(resource)
                        local logUtil = LogUtil.getInstance()
                        logUtil:putF(tostring(self.resourceCallbackStrings.DONE) .. image:getName(), self, self.resourceCallbackStrings.HANDLE_IMAGE)
                        self:copy(imageArray, index, image, image3)
                    end
                    

                    function o:onFailure(e)
                        local logUtil = LogUtil.getInstance()
                        logUtil:put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(self.resourceCallbackStrings.ERROR):append(image:getName())), self, self.resourceCallbackStrings.HANDLE_IMAGE, e)
                    end
                    return o
                end)()
                image3:addCallback(callback)
            end
        else
            self.logUtil:putF(self.resourceCallbackStrings.NULL + image:isMutable(), self, self.resourceCallbackStrings.HANDLE_IMAGE)
        end
end


function ImageModifierUtil:copy(imageArray, index, image, image3)
        local try_ok, try_error = pcall(function()
            local image2 = Image.createImageWH(java_int(image3:width()), java_int(image3:height()))
            local graphics = image2:getGraphics()
            graphics:drawImage(image, 0, 0, Anchor.TOP_LEFT)
            imageArray[index + 1] = image2
        end)
        if not try_ok then
            local e = try_error
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

