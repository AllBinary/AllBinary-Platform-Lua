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
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")

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
local OwnershipPaintable = {}
OwnershipPaintable.__index = OwnershipPaintable
OwnershipPaintable.className = "OwnershipPaintable"
setmetatable(OwnershipPaintable, {__index = Paintable})

function OwnershipPaintable:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.COPYRIGHT = "AllBinary Copyright (c) 2011"
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.color = math.tointeger(self.basicColor // 1)
    self.anchor = Anchor.TOP_LEFT
    self.COPYRIGHT_Y = 0
    self.beginWidth = 0
end


function OwnershipPaintable.getInstance()
        return OwnershipPaintable.new()
end


function OwnershipPaintable.new()
    local self = setmetatable(Paintable.new(), OwnershipPaintable)
    self:_init_fields()
    return self
end


function OwnershipPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.COPYRIGHT_Y = 2 * font:getHeight()
        self.beginWidth = (((font:stringWidth(self.COPYRIGHT)) // (1 << (1))))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function OwnershipPaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self.color = math.tointeger(basicColor // 1)
end


function OwnershipPaintable:getBasicColorP()
        return self.basicColor
end


function OwnershipPaintable:paint(graphics)
        self.myFontProcessor:process(graphics)
        graphics:setColor(self.color)
        local halfWidth = self.displayInfo:getLastHalfWidth()
        local height = self.displayInfo:getLastHeight()
        graphics:drawString(self.COPYRIGHT, halfWidth - self.beginWidth, height - self.COPYRIGHT_Y, self.anchor)
end

return OwnershipPaintable

