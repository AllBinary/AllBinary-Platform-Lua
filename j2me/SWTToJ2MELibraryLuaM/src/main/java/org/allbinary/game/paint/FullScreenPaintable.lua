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

--SwtToJ2ME
local FullScreenPaintable = {}
FullScreenPaintable.__index = FullScreenPaintable
FullScreenPaintable.className = "FullScreenPaintable"
setmetatable(FullScreenPaintable, {__index = Paintable})

function FullScreenPaintable:_init_fields()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.FULLSCREEN_TEXT = "F11 - Toggle Fullscreen"
    self.anchor = Anchor.TOP_LEFT
    self.Y = 0
    self.beginWidth = 0
end


function FullScreenPaintable.getInstance()
        return FullScreenPaintable.new()
end


function FullScreenPaintable.new()
    local self = setmetatable(Paintable.new(), FullScreenPaintable)
    self:_init_fields()
    return self
end


function FullScreenPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.Y = 4 * font:getHeight()
        self.beginWidth = (((font:stringWidth(self.FULLSCREEN_TEXT)) // (1 << (1))))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function FullScreenPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        local height = self.displayInfo:getLastHeight()
        graphics:drawString(self.FULLSCREEN_TEXT, halfWidth - self.beginWidth, height - self.Y, self.anchor)
end

return FullScreenPaintable

