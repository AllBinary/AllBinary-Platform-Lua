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

-- local File = require("java.io.File")
-- local FileOutputStream = require("java.io.FileOutputStream")
-- local GL10 = require("javax.microedition.khronos.opengles.GL10")
-- local Image = require("javax.microedition.lcdui.Image")
local Bitmap = require("android.graphics.Bitmap")
local Canvas = require("android.graphics.Canvas")
local Paint = require("android.graphics.Paint")
local Rect = require("android.graphics.Rect")
local Typeface = require("android.graphics.Typeface")
local ResourceUtil = require("org.allbinary.data.resource.ResourceUtil")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local PreResourceImageUtil = require("org.allbinary.image.PreResourceImageUtil")
local OpenGLESImage = require("org.allbinary.image.opengles.OpenGLESImage")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local AndroidImageInterface = require("org.microemu.android.device.AndroidImageInterface")
local AndroidImmutableImage = require("org.microemu.android.device.AndroidImmutableImage")
local TrueTypeFontUtilBase = require("org.allbinary.emulator.device.TrueTypeFontUtilBase")

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
    self.logUtil = LogUtil.getInstance()
    self.preResourceImageUtil = PreResourceImageUtil.getInstance()
    self.realFontSize = 18
    self.fontImage = OpenGLESImage.NULL_OPENGL_IMAGE
end


function TrueTypeFontUtil.getInstance()
        return TrueTypeFontUtil.instance
end


function TrueTypeFontUtil.new()
    local self = setmetatable(TrueTypeFontUtilBase.new(1), TrueTypeFontUtil)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TrueTypeFontUtil:saveFontAtlasAsFile()
        local try_ok, try_error = pcall(function()
            local commonStrings = CommonStrings.getInstance()
            local file = ResourceUtil.getInstance():getContext():getFilesDir()
            local path = file:getAbsolutePath() + CanvasStrings.getInstance().FONT_ATLAS
            self.logUtil:putF(path, self, commonStrings.CONSTRUCTOR)
            local fos = FileOutputStream.new(path)
            local bitmap = (self.fontImage.openGLBitmap:getImage()):getBitmap()
            bitmap:compress(Bitmap.CompressFormat.PNG, 100, fos)
        end)
        if not try_ok then
            local e = try_error
            local commonStrings = CommonStrings.getInstance()
            PreLogUtil.putOE(commonStrings.EXCEPTION, self, commonStrings.EXCEPTION, e)
        end
end


function TrueTypeFontUtil:getFontBitmapGL(gl, filename, cellSize, basicColor)
        if self.fontImage == OpenGLESImage.NULL_OPENGL_IMAGE then
            local cellsPerRow2 = self.CELLS_PER_ROW * 2
            local cellsPerRow3 = self.CELLS_PER_ROW * 3
            local cellsPerRow4 = self.CELLS_PER_ROW * 4
            local cellsPerRow5 = self.CELLS_PER_ROW * 5
            local cellsPerRow6 = self.CELLS_PER_ROW * 6
            local cellsPerRow7 = self.CELLS_PER_ROW * 7
            local typeface = Typeface.DEFAULT
            local textureSize = self:getAsTextureSize(self.CELLS_PER_ROW * cellSize)
            local bitmap = Bitmap.createBitmap(textureSize, textureSize, Bitmap.Config.ARGB_8888)
            local canvas = Canvas.new(bitmap)
            local paint = Paint.new()
            paint:setTypeface(typeface)
            paint:setTextSize((self.realFontSize + 0.0))
            paint:setAlpha(java_int(basicColor.alpha))
            paint:setColor(math.tointeger(basicColor // 1))
            local biggestHeight = 0
            local bounds = Rect.new()
            local x = 0
            local y = 0
            for index = 0, self.size - 1 do
                self.characterArray[1] = self.pattern:charAt(index)
                paint:getTextBounds(self.characterArray, 0, 1, bounds)
                self._characterWidth[index + 1] = bounds.right
                if bounds.bottom - bounds.top > biggestHeight then
                    biggestHeight = bounds.bottom - bounds.top
                end
                x = (index % self.CELLS_PER_ROW) * cellSize
                x = x + ((((cellSize) // (1 << (1)))))
                x = x - ((((self._characterWidth[index + 1]) // (1 << (1)))))
                y = 0
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
                canvas:drawText(self.characterArray, 0, 1, (x + 0.0) - 3.0, (y + 0.0) - 6.0, paint)
            end
            canvas:save()
            local image = AndroidImmutableImage.create(bitmap)
            self.fontImage = self.preResourceImageUtil:encapsulate(image)
            return self.fontImage
        else
            return self.fontImage
        end
end


function TrueTypeFontUtil:getFontWidths(filename, fontSize)
        local typeface = Typeface.DEFAULT
        local paint = Paint.new()
        paint:setTypeface(typeface)
        paint:setTextSize((fontSize + 0.0))
        paint:setARGB(255, 255, 255, 255)
        local bounds = Rect.new()
        for index = 0, self.size - 1 do
            self.characterArray[1] = self.pattern:charAt(index)
            paint:getTextBounds(self.characterArray, 0, 1, bounds)
            if index < self.lastCapIndex then
                if self.characterArray[1] == "1" then
                    self._characterWidth[index + 1] = bounds.right + 3
                elseif self.characterArray[1] == "J" or self.characterArray[1] == "V" or self.characterArray[1] == "2" or self.characterArray[1] == "9" or self.characterArray[1] == "I" or self.characterArray[1] == "N" or self.characterArray[1] == "U" then
                    self._characterWidth[index + 1] = bounds.right + 1
                elseif self.characterArray[1] == "4" or self.characterArray[1] == "C" or self.characterArray[1] == "E" or self.characterArray[1] == "O" then
                    self._characterWidth[index + 1] = bounds.right - 2
                elseif self.characterArray[1] == "B" or self.characterArray[1] == "D" or self.characterArray[1] == "G" or self.characterArray[1] == "H" or self.characterArray[1] == "T" or self.characterArray[1] == "W" then
                    self._characterWidth[index + 1] = bounds.right - 3
                elseif self.characterArray[1] == "A" or self.characterArray[1] == "Q" or self.characterArray[1] == "R" then
                    self._characterWidth[index + 1] = bounds.right - 5
                elseif self.characterArray[1] == "M" then
                    self._characterWidth[index + 1] = bounds.right - 6
                elseif self.characterArray[1] == "m" then
                    self._characterWidth[index + 1] = bounds.right - 8
                else
                    self._characterWidth[index + 1] = bounds.right
                end
            else
                if self.characterArray[1] == " " then
                    self._characterWidth[index + 1] = bounds.right + 10
                elseif self.characterArray[1] == "l" or self.characterArray[1] == "i" or self.characterArray[1] == "j" or self.characterArray[1] == "." or self.characterArray[1] == "!" or self.characterArray[1] == "|" then
                    self._characterWidth[index + 1] = bounds.right + 6
                elseif self.characterArray[1] == "f" or self.characterArray[1] == "t" or self.characterArray[1] == "u" or self.characterArray[1] == "v" then
                    self._characterWidth[index + 1] = bounds.right + 1
                elseif self.characterArray[1] == "r" then
                    self._characterWidth[index + 1] = bounds.right + 2
                elseif self.characterArray[1] == "a" or self.characterArray[1] == "b" or self.characterArray[1] == "g" or self.characterArray[1] == "u" then
                    self._characterWidth[index + 1] = bounds.right - 1
                elseif self.characterArray[1] == "o" or self.characterArray[1] == "e" then
                    self._characterWidth[index + 1] = bounds.right - 2
                elseif self.characterArray[1] == "m" then
                    self._characterWidth[index + 1] = bounds.right - 7
                else
                    self._characterWidth[index + 1] = bounds.right
                end
            end
        end
        self._characterWidth[1] = (((fontSize) // (1 << (1)))) - 2
        return self._characterWidth
end

TrueTypeFontUtil.instance = TrueTypeFontUtil.new()

return TrueTypeFontUtil

