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
-- package org.allbinary.emulator.device

-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local SWT = require("org.eclipse.swt.SWT")
local ImageData = require("org.eclipse.swt.graphics.ImageData")
local ImageLoader = require("org.eclipse.swt.graphics.ImageLoader")
local SwtMutableImage = require("org.microemu.device.swt.SwtMutableImage")
local AvianUtil = require("org.allbinary.AvianUtil")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local OpenGLCapabilities = require("org.allbinary.graphics.opengles.OpenGLCapabilities")
local PreResourceImageUtil = require("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local TrueTypeFontUtilBase = require("org.allbinary.emulator.device.TrueTypeFontUtilBase")

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

--TTF
local TrueTypeFontUtil = {}
TrueTypeFontUtil.__index = TrueTypeFontUtil
TrueTypeFontUtil.className = "TrueTypeFontUtil"
setmetatable(TrueTypeFontUtil, {__index = TrueTypeFontUtilBase})

function TrueTypeFontUtil:_init_fields()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    self.widthFloatArray = nil
    self.fontImage = OpenGLESImage.NULL_OPENGL_IMAGE
    self.widthScale = nil
end


function TrueTypeFontUtil.getInstance()
        return TrueTypeFontUtil.instance
end


function TrueTypeFontUtil.new()
    local self = setmetatable(TrueTypeFontUtilBase.new(2), TrueTypeFontUtil)
    self:_init_fields()
        -- super(...) made self above
        if AvianUtil.isAvian() then
            self.widthFloatArray = {1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 961.0, 961.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 952.0, 952.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0, 1504.0}
        else
            self.widthFloatArray = {1504.0, 967.0, 527.0, 961.0, 957.0, 1087.0, 920.0, 954.0, 973.0, 961.0, 955.0, 1296.0, 1013.0, 1106.0, 1167.0, 815.0, 815.0, 1216.0, 1110.0, 170.0, 520.0, 1056.0, 815.0, 1448.0, 1142.0, 1345.0, 927.0, 1345.0, 1030.0, 920.0, 1096.0, 1119.0, 1219.0, 1841.0, 1166.0, 1147.0, 1005.0, 879.0, 965.0, 792.0, 964.0, 927.0, 753.0, 1034.0, 916.0, 196.0, 469.0, 877.0, 166.0, 1563.0, 916.0, 1007.0, 965.0, 964.0, 631.0, 777.0, 649.0, 917.0, 1026.0, 1548.0, 993.0, 1028.0, 795.0, 241.0, 798.0, 241.0, 905.0, 1477.0, 393.0, 961.0, 555.0, 1029.0, 1010.0, 1378.0, 952.0, 463.0, 463.0, 926.0, 961.0, 491.0, 930.0, 457.0, 457.0, 644.0, 643.0, 326.0, 186.0, 1219.0, 241.0, 1599.0, 961.0, 302.0, 711.0, 961.0, 961.0, 710.0, 141.0, 1504.0, 1504.0}
        end
        self.widthScale = (function() if (self.scale == 2) then return 1.2 else return 1.0 end end)()
    return self
end


function TrueTypeFontUtil:getFontBitmapGL(gl, filename, cellSize, basicColor)
        local try_ok, try_error = pcall(function()
            if self.fontImage == OpenGLESImage.NULL_OPENGL_IMAGE then
                local canvasStrings = CanvasStrings.getInstance()
                local openGLCapabilities = OpenGLCapabilities.getInstance()
                if openGLCapabilities:isTextureSizeValid(1024) and self.scale == 2 then
                    local FONT_ATLAS_1024 = "/font_1024.png"
                    local image = Image.createImage(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_1024))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                elseif openGLCapabilities:isTextureSizeValid(512) then
                    local FONT_ATLAS_512 = "/font_512.png"
                    local image = Image.createImage(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_512))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                else
                    local FONT_ATLAS_512 = "/font_512.png"
                    local image = Image.createImage(ResourceUtil.getInstance():getResourceAsStream(FONT_ATLAS_512))
                    image:setName(canvasStrings.FONT_ATLAS)
                    self.fontImage = self.preResourceImageUtil:encapsulate(image)
                end
                return self.fontImage
            else
                return self.fontImage
            end
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.EXCEPTION, e)
            error(java_exception("RuntimeException"), 0)
        end
end


function TrueTypeFontUtil:saveFontAtlasAsFile()
        local image = self:getFontBitmap(nil, self.cellSize, BasicColorFactory.getInstance().WHITE)
        local imageLoader = ImageLoader.new()
        local imageData = (image).image:getImageData()
        imageData.transparentPixel = imageData:getPixel(0, 0)
        imageLoader.data = {imageData}
        imageLoader:save(CommonSeps.getInstance().PERIOD + CanvasStrings.getInstance().FONT_ATLAS, SWT.IMAGE_PNG)
end


function TrueTypeFontUtil:getFontBitmap(filename, cellSize, basicColor)
        local cellsPerRow2 = self.CELLS_PER_ROW * 2
        local cellsPerRow3 = self.CELLS_PER_ROW * 3
        local cellsPerRow4 = self.CELLS_PER_ROW * 4
        local cellsPerRow5 = self.CELLS_PER_ROW * 5
        local cellsPerRow6 = self.CELLS_PER_ROW * 6
        local cellsPerRow7 = self.CELLS_PER_ROW * 7
        local image = Image.createImage(self.textureSize, self.textureSize)
        local graphics = image:getGraphics()
        graphics:setColor(math.tointeger(basicColor // 1))
        local biggestHeight = 0
        local bounds = Rectangle.new(PointFactory.getInstance():createXY(0, 0), cellSize, cellSize)
        local x = 0
        local y = 0
        for index = 0, self.size - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            self._characterWidth[index + 1] = bounds:getMaxX()
            if bounds:getMaxY() - bounds:getPoint():getX() > biggestHeight then
                biggestHeight = bounds:getMaxY() - bounds:getPoint():getX()
            end
            x = (index % self.CELLS_PER_ROW) * cellSize
            x = x + ((((cellSize) // (1 << (1)))))
            x = x - ((((self._characterWidth[index + 1]) // (1 << (1)))))
            y = -(((cellSize) // (1 << (1))))
            if index >= self.CELLS_PER_ROW then
                y = y + (cellSize)
            end
            if index >= cellsPerRow2 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow3 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow4 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow5 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow6 then
                y = y + (cellSize)
            end
            if index >= cellsPerRow7 then
                y = y + (cellSize)
            end
            y = y + (cellSize)
            y = y - ((((cellSize) // (1 << (2)))))
            graphics:drawChar(self.characterArray[1], x, y, 0)
        end
        return image
end


function TrueTypeFontUtil:getFontWidths(filename, fontSize)
        local commonStrings = CommonStrings.getInstance()
        for index = 0, self.size - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            if self.characterArray[1] == " " then
                self._characterWidth[index + 1] = (java_idiv(fontSize, 4))
            else
                local shortPatternIndex = self.shortPattern:indexOf(self.characterArray[1])
                local w = java_int((self.widthFloatArray[shortPatternIndex + 1] / 75.0)) + 19
                self._characterWidth[index + 1] = w
                if self.characterArray[1] == "." or self.characterArray[1] == "1" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] + (4)
                end
                if self.characterArray[1] >= "a" and self.characterArray[1] < "k" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (2)
                end
                if self.characterArray[1] >= "k" and self.characterArray[1] < "v" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (4)
                end
                if self.characterArray[1] >= "v" and self.characterArray[1] < "z" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (8)
                end
                if self.characterArray[1] == "D" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (4)
                end
                if self.characterArray[1] >= "A" and self.characterArray[1] <= "Z" then
                    self._characterWidth[index + 1] = self._characterWidth[index + 1] - (2)
                end
            end
            self._characterWidth[index + 1] = self._characterWidth[index + 1] * (self.widthScale)
        end
        return self._characterWidth
end

TrueTypeFontUtil.instance = TrueTypeFontUtil.new()

return TrueTypeFontUtil

