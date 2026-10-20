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
-- package org.allbinary.game.displayable.canvas

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local BasicColorSetUtil = require("org.allbinary.graphics.color.BasicColorSetUtil")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local FontDebugFactory = require("org.allbinary.graphics.font.FontDebugFactory")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local InitUpdatePaintable = require("org.allbinary.graphics.paint.InitUpdatePaintable")
local NullUtil = require("org.allbinary.logic.NullUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")

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

local StartIntermissionPaintable = {}
StartIntermissionPaintable.__index = StartIntermissionPaintable
StartIntermissionPaintable.className = "StartIntermissionPaintable"
setmetatable(StartIntermissionPaintable, {__index = InitUpdatePaintable})

function StartIntermissionPaintable:_init_fields()
    self.fontDebugFactory = FontDebugFactory.getInstance()
    self.basicSetColorUtil = BasicColorSetUtil.getInstance()
    self.gameCanvas = nil
    self.stringArray = nil
    self.fontSize = nil
    self.font = nil
    self.lastWidth = nil
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.basicColor = BasicColorFactory.getInstance().BLACK
    self.color = nil
    self.lineYOffsetArray = NullUtil.getInstance().NULL_INT_ARRAY
    self.hasChanged = true
    self.anchor = Anchor.TOP_LEFT
    self.fontHeightP = 0
    self.BEGIN_LEVEL = "Begin Level "
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
end


function StartIntermissionPaintable.new(gameCanvas, stringArray, basicColor, font)
    local self = setmetatable(InitUpdatePaintable.new(), StartIntermissionPaintable)
    self:_init_fields()
        self.gameCanvas = gameCanvas
        self.stringArray = stringArray
        self.lastWidth = java_new_array(0, (self.stringArray.n or #self.stringArray))
        self:setBasicColorP(basicColor)
        self.color = math.tointeger(basicColor // 1)
        self.fontSize = font:getSize()
        self.font = font
    return self
end


function StartIntermissionPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeightP = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function StartIntermissionPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local existingFont = graphics:getFont()
        self.fontDebugFactory:setFont(self.font, graphics)
        local displayInfo = DisplayInfoSingleton.getInstance()
        self.basicSetColorUtil:setBasicColorP3(graphics, self.basicColor, self.color)
        local beginWidth = 0
        for index = (self.lineYOffsetArray.n or #self.lineYOffsetArray) - 1, 0, -1 do
            if self.hasChanged then
                self.lastWidth[index + 1] = (((graphics:getFont():stringWidth(self.stringArray[index + 1])) // (1 << (1))))
            end
            beginWidth = self.lastWidth[index + 1]
            graphics:drawString(self.stringArray[index + 1], displayInfo:getLastHalfWidth() - beginWidth, displayInfo:getLastHalfHeight() - self.lineYOffsetArray[index + 1], self.anchor)
        end
        self.hasChanged = false
        self.fontDebugFactory:setFont(existingFont, graphics)
end


function StartIntermissionPaintable:update()
        local level = self.gameCanvas:getLayerManager():getGameInfo():getCurrentLevel()
        self.stringArray[1] = tostring(StringMaker.new():append(self.BEGIN_LEVEL):appendint(level))
        for index = (self.stringArray.n or #self.stringArray) - 1, 1, -1 do
            self.stringArray[index + 1] = self.EMPTY_STRING
        end
end


function StartIntermissionPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function StartIntermissionPaintable:getBasicColorP()
        return self.basicColor
end

return StartIntermissionPaintable

