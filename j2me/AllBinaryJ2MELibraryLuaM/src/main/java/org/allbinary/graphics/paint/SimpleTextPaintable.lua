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
-- package org.allbinary.graphics.paint

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimpleTextPaintable = {}
SimpleTextPaintable.__index = SimpleTextPaintable
SimpleTextPaintable.className = "SimpleTextPaintable"
setmetatable(SimpleTextPaintable, {__index = Paintable})

function SimpleTextPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.updateMyFontProcessor = UpdateMyFontProcessor.new(self)
    self.myFontProcessor = self.updateMyFontProcessor
    self.text = nil
    self.basicColor = nil
    self.topScoresWidth = 0
    self.fontHeight = 0
    self.anchor = Anchor.TOP_LEFT
end


function SimpleTextPaintable.new(text, basicColor)
    local self = setmetatable(Paintable.new(), SimpleTextPaintable)
    self:_init_fields()
        self.text = text
        self.basicColor = basicColor
    return self
end


function SimpleTextPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.topScoresWidth = (((font:stringWidth(self.text)) // (1 << (1))))
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function SimpleTextPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local width = self.displayInfoSingleton:getLast()[self.displayInfoSingleton.WIDTH + 1]
        graphics:setColor(math.tointeger(self:getBasicColorP() // 1))
        graphics:drawString(self.text, (((width) // (1 << (1)))) - self.topScoresWidth, self.fontHeight, self.anchor)
end


function SimpleTextPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function SimpleTextPaintable:getBasicColorP()
        return self.basicColor
end


function SimpleTextPaintable:setText(text)
        self.text = text
        self.myFontProcessor = self.updateMyFontProcessor
end


function SimpleTextPaintable:getText()
        return self.text
end

return SimpleTextPaintable

