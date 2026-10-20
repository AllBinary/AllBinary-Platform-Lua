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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ColorCompositeInterface = require("org.allbinary.graphics.color.ColorCompositeInterface")
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

local ColorFillBasePaintable = {}
ColorFillBasePaintable.__index = ColorFillBasePaintable
ColorFillBasePaintable.className = "ColorFillBasePaintable"
setmetatable(ColorFillBasePaintable, {__index = Paintable})

function ColorFillBasePaintable:_init_fields()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.colorP = 0
end


function ColorFillBasePaintable.new(basicColor)
    local self = setmetatable(Paintable.new(), ColorFillBasePaintable)
    self:_init_fields()
        self:setBasicColorP(basicColor)
    return self
end


function ColorFillBasePaintable:setBasicColorP(basicColor)
        self.basicColor = basicColor
        self:setColor(math.tointeger(self:getBasicColorP() // 1))
end


function ColorFillBasePaintable:getBasicColorP()
        return self.basicColor
end


function ColorFillBasePaintable:getColor()
        return self.colorP
end


function ColorFillBasePaintable:setColor(color)
        self.colorP = color
end


function ColorFillBasePaintable:paint(graphics)
end

return ColorFillBasePaintable

