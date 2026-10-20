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
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ColorFillBasePaintable = require("org.allbinary.game.paint.ColorFillBasePaintable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ColorFillPaintable = {}
ColorFillPaintable.__index = ColorFillPaintable
ColorFillPaintable.className = "ColorFillPaintable"
setmetatable(ColorFillPaintable, {__index = ColorFillBasePaintable})

function ColorFillPaintable:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
end


function ColorFillPaintable.new(basicColor)
    local self = setmetatable(ColorFillBasePaintable.new(basicColor), ColorFillPaintable)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function ColorFillPaintable:paint(graphics)
        graphics:setColor(self.colorP)
        graphics:fillRect(0, 0, self.displayInfoSingleton:getLastWidth(), self.displayInfoSingleton:getLastHeight())
end

return ColorFillPaintable

