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
-- package org.allbinary.graphics.draw

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CanvasDrawLineString = {}
CanvasDrawLineString.__index = CanvasDrawLineString
CanvasDrawLineString.className = "CanvasDrawLineString"

function CanvasDrawLineString:_init_fields()
    self.drawStringUtil = DrawStringUtil.getInstance()
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.x = nil
    self.y = nil
    self.fontHeight = 0
end


function CanvasDrawLineString.new(x, y)
    local self = setmetatable({}, CanvasDrawLineString)
    self:_init_fields()
        self.x = x
        self.y = y
    return self
end


function CanvasDrawLineString:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.fontHeight = font:getHeight()
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function CanvasDrawLineString:paint(graphics, string, line)
        self.myFontProcessor:process(graphics)
        self.drawStringUtil:drawCenterString(graphics, string, 0, #string, self.x, self.y + (line * self.fontHeight))
end

CanvasDrawLineString.NULL_CANVAS_DRAW_LINE_STRING = CanvasDrawLineString.new(0, 0)

return CanvasDrawLineString

