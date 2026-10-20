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
-- package org.allbinary.game.paint.help

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local NullUtil = require("org.allbinary.logic.NullUtil")
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

local HelpPaintable = {}
HelpPaintable.__index = HelpPaintable
HelpPaintable.className = "HelpPaintable"
setmetatable(HelpPaintable, {__index = Paintable})

function HelpPaintable:_init_fields()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.anchor = Anchor.TOP_LEFT
    self.title = nil
    self.inputInfo = StringUtil.getInstance():getArrayInstance()
    self.basicColor = nil
    self.titleBeginWidth = 0
    self.beginWidthArray = NullUtil.getInstance().NULL_INT_ARRAY
    self.charHeight = 0
end


function HelpPaintable.new(title, backgroundBasicColor, basicColor)
    local self = setmetatable(Paintable.new(), HelpPaintable)
    self:_init_fields()
        self.title = title
        self.basicColor = basicColor
    return self
end


function HelpPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.titleBeginWidth = (((font:stringWidth(self.title)) // (1 << (1))))
        self.charHeight = font:getHeight()
        local size = (self.inputInfo.n or #self.inputInfo)
        for index = 0, size - 1 do
            self.beginWidthArray[index + 1] = (((font:stringWidth(self.inputInfo[index + 1])) // (1 << (1))))
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function HelpPaintable:setInputInfoP(inputInfo)
        self.inputInfo = inputInfo
        self.beginWidthArray = java_new_array(0, (self.inputInfo.n or #self.inputInfo))
        self.myFontProcessor = self.updateMyFontProcessor
end


function HelpPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        graphics:setColor(math.tointeger(self.basicColor // 1))
        graphics:drawString(self.title, halfWidth - self.titleBeginWidth, self.charHeight, self.anchor)
        local size = (self.inputInfo.n or #self.inputInfo)
        for index = 0, size - 1 do
            graphics:drawString(self.inputInfo[index + 1], halfWidth - self.beginWidthArray[index + 1], (index + 3) * self.charHeight, self.anchor)
        end
end

return HelpPaintable

