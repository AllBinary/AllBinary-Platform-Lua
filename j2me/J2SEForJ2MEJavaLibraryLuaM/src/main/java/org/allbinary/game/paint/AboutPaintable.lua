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
-- package org.allbinary.game.paint

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local CanvasStrings = require("org.allbinary.graphics.displayable.CanvasStrings")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")

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

--J2SEForJ2ME
local AboutPaintable = {}
AboutPaintable.__index = AboutPaintable
AboutPaintable.className = "AboutPaintable"
setmetatable(AboutPaintable, {__index = Paintable})

function AboutPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.ABOUT = CanvasStrings.getInstance().ABOUT
    self.info = nil
    self.developers = nil
    self.paintableArray = {self}
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.charHeight = 0
    self.aboutBeginWidth = 0
    self.infoBeginWidth = nil
    self.developersBeginWidth = nil
    self.anchor = Anchor.TOP_LEFT
end


function AboutPaintable.getInstance(info, developers)
        return AboutPaintable.new(info, developers)
end


function AboutPaintable.new(info, developers)
    local self = setmetatable(Paintable.new(), AboutPaintable)
    self:_init_fields()
        self.info = info
        self.infoBeginWidth = java_new_array(0, (self.info.n or #self.info))
        self.developers = developers
        self.developersBeginWidth = java_new_array(0, (self.developers.n or #self.developers))
    return self
end


function AboutPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.charHeight = font:getHeight()
        self.aboutBeginWidth = (((font:stringWidth(self.ABOUT)) // (1 << (1))))
        local infoSize = (self.info.n or #self.info)
        for index = 0, infoSize - 1 do
            self.infoBeginWidth[index + 1] = (((font:stringWidth(self.info[index + 1])) // (1 << (1))))
        end
        local size = (self.developers.n or #self.developers)
        for index = 0, size - 1 do
            self.developersBeginWidth[index + 1] = (((font:stringWidth(self.developers[index + 1])) // (1 << (1))))
        end
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function AboutPaintable:getPaintableArrayInstance()
        return self.paintableArray
end


function AboutPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfoSingleton:getLastHalfWidth()
        graphics:drawString(self.ABOUT, halfWidth - self.aboutBeginWidth, 2 * self.charHeight, self.anchor)
        local infoSize = (self.info.n or #self.info)
        for index = 0, infoSize - 1 do
            graphics:drawString(self.info[index + 1], halfWidth - self.infoBeginWidth[index + 1], (4 + index) * self.charHeight, self.anchor)
        end
        local size = (self.developers.n or #self.developers)
        for index = 0, size - 1 do
            graphics:drawString(self.developers[index + 1], halfWidth - self.developersBeginWidth[index + 1], (5 + infoSize + index) * self.charHeight, self.anchor)
        end
end

return AboutPaintable

