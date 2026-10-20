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

local SWT = require("org.eclipse.swt.SWT")
local Canvas = require("org.eclipse.swt.widgets.Canvas")
local Composite = require("org.eclipse.swt.widgets.Composite")
local GC = require("org.eclipse.swt.graphics.GC")
local ImageData = require("org.eclipse.swt.graphics.ImageData")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local PaintEvent = require("org.eclipse.swt.events.PaintEvent")
local PaintListener = require("org.eclipse.swt.events.PaintListener")
local Transform = require("org.eclipse.swt.graphics.Transform")
local Display = require("org.eclipse.swt.widgets.Display")
local BareMain = require("org.microemu.app.BareMain")

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

local ImageUtil = {}
ImageUtil.__index = ImageUtil
ImageUtil.className = "ImageUtil"

function ImageUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.commonSeps = CommonSeps.getInstance()
    self.IIOIMAGE_POOL_NAME = "IIOIMAGE_POOL_NAME"
    self.CREATE_BUFFERED_IMAGE = "createBufferedImage"
end


function ImageUtil.getInstance()
        return ImageUtil.instance
end


function ImageUtil.new()
    local self = setmetatable({}, ImageUtil)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CONSTRUCTOR, e)
        end
    return self
end


function ImageUtil:create(width, height)
        local display = BareMain.shell:getDisplay()
        return Image.new(display, width, height)
end


-- throws Exception
function ImageUtil:createBufferedImage(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        local imageData = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            imageData = bufferedImage:getImageData()
            local newWidth = java_int((imageData.width * percent / 100))
            local newHeight = java_int((imageData.height * percent / 100))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage2(bufferedImageArray, percent, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        local bufferedImage = nil
        local imageData = nil
        for index = 0, size - 1 do
            bufferedImage = bufferedImageArray[index + 1]
            imageData = bufferedImage:getImageData()
            local newWidth = java_int((imageData.width * percent))
            local newHeight = java_int((imageData.height * percent))
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage3(bufferedImageArray, width, height, scale)
        local size = (bufferedImageArray.n or #bufferedImageArray)
        local scaledBufferedImageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            scaledBufferedImageArray[index + 1] = self:createBufferedImage5(bufferedImageArray[index + 1], width, height, scale)
        end
        return scaledBufferedImageArray
end


-- throws Exception
function ImageUtil:createBufferedImage4(bufferedImage, newWidth, newHeight)
        return self:createBufferedImage5(bufferedImage, newWidth, newHeight, true)
end


-- throws Exception
function ImageUtil:createBufferedImage5(bufferedImage, newWidth, newHeight, scale)
        return self:createBufferedImage6(bufferedImage, newWidth, newHeight, scale, false)
end


-- throws Exception
function ImageUtil:createBufferedImage6(bufferedImage, newWidth, newHeight, scale, allowTranslate)
        local imageData = bufferedImage:getImageData()
        local width = imageData.width
        local height = imageData.height
        local d_newWidth = (newWidth + 0.0)
        local d_newHeight = (newHeight + 0.0)
        local widthRatio = d_newWidth / width
        local heightRatio = d_newHeight / height
        local ratioX = 1.0
        local ratioY = 1.0
        if scale then
            ratioX = widthRatio
            ratioY = heightRatio
        end
        self.logUtil:putF(tostring(StringMaker.new():appendfloat(width):append(self.commonSeps.FORWARD_SLASH):appendfloat(height):append(self.commonSeps.COLON):appendint(newWidth):append(self.commonSeps.FORWARD_SLASH):appendint(newHeight):append(self.commonSeps.COLON):appendfloat(widthRatio):append(self.commonSeps.FORWARD_SLASH):appendfloat(heightRatio)), self, self.CREATE_BUFFERED_IMAGE)
        local dx = 0.0
        local dy = 0.0
        if not scale and allowTranslate then
            dx = ((newWidth + 0.0) - width) / 2.0
            dy = ((newHeight + 0.0) - height) / 2.0
            self.logUtil:putF(tostring(StringMaker.new():append("Translate dx: "):appendfloat(dx):append(" dy: "):appendfloat(dy)), self, self.CREATE_BUFFERED_IMAGE)
        end
        local newBufferedImage = Image.new(BareMain.shell:getDisplay(), newWidth, newHeight)
        local gc = GC.new(newBufferedImage)
        local affineTransform = Transform.new(gc:getDevice())
        affineTransform:scale(ratioX, ratioY)
        affineTransform:translate(dx, dy)
        gc:setTransform(affineTransform)
        gc:setAntialias(SWT.ON)
        gc:setInterpolation(SWT.HIGH)
        gc:drawImage(bufferedImage, 0, 0, bufferedImage:getBounds().width, bufferedImage:getBounds().height, 0, 0, newWidth, newHeight)
        gc:dispose()
        return newBufferedImage
end


function ImageUtil:drawTransformedImage(image, parent, dx, dy, width, height)
        local imageCanvas = Canvas.new(parent, SWT.NONE)
        imageCanvas:addPaintListener((function()
            local o = PaintListener.new and PaintListener.new() or setmetatable({}, {__index = PaintListener})
            

            function o:paintControl(event)
                local gc = event.gc
                local affineTransform = Transform.new(gc:getDevice())
                affineTransform:translate(dx, dy)
                gc:setAntialias(SWT.ON)
                gc:setInterpolation(SWT.HIGH)
                gc:drawImage(image, 0, 0, image:getBounds().width, image:getBounds().height, 0, 0, width, height)
            end
            return o
        end)())
        return imageCanvas
end


function ImageUtil:toString(bufferedImage)
        local commonLabels = CommonLabels.getInstance()
        local stringBuffer = StringMaker.new()
        local imageData = bufferedImage:getImageData()
        stringBuffer:append(" org.eclipse.swt.graphics.Image: ")
        stringBuffer:append(commonLabels.WIDTH_LABEL)
        stringBuffer:appendint(java_int(imageData.width))
        stringBuffer:append(commonLabels.HEIGHT_LABEL)
        stringBuffer:appendint(java_int(imageData.height))
        stringBuffer:append(" Type: ")
        stringBuffer:appendint(java_int(imageData.type))
        return tostring(stringBuffer)
end

ImageUtil.instance = ImageUtil.new()

return ImageUtil

