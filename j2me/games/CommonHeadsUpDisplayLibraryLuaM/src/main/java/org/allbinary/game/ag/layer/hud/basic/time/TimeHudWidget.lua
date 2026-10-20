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
-- package org.allbinary.game.ag.layer.hud.basic.time

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local PrimitiveLongSingleton = require("org.allbinary.logic.math.PrimitiveLongSingleton")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TimeHudWidget = {}
TimeHudWidget.__index = TimeHudWidget
TimeHudWidget.className = "TimeHudWidget"
setmetatable(TimeHudWidget, {__index = BasicHud})

function TimeHudWidget:_init_fields()
    self.TIME_STRING = "Time "
    self.TIME_CHAR_ARRAY = {"T", "i", "m", "e", " "}
    self.offset = 0
    self.string = PrimitiveLongSingleton.getInstance().ZERO
    self.totalDigits = 1
    self.timer = nil
end


-- throws Exception
function TimeHudWidget.getInstance(location, direction, basicColor, timer)
        return TimeHudWidget.new(location, direction, 2, basicColor, timer)
end


function TimeHudWidget.new(location, direction, bufferZone, basicColor, timer)
    local self = setmetatable(BasicHud.new(location, direction, bufferZone, basicColor), TimeHudWidget)
    self:_init_fields()
        -- super(...) made self above
        self.timer = timer
        self:set()
        self.updateMaxHeight = 14
    return self
end


function TimeHudWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * 5
        self.offset = font:stringWidth(self.TIME_STRING) + MyFontProcessor.defaultStringWidth(font, 3)
        BasicHud.updateMeasurement(self, graphics)
end


function TimeHudWidget:update()
        self.timer:update()
        self:set()
end


function TimeHudWidget:set()
        self.string = self.timer:getTimeChars()
        self.totalDigits = self.timer:getCurrentTotalDigits()
end


function TimeHudWidget:getTimer()
        return self.timer
end


function TimeHudWidget:paint(graphics)
        BasicHud.paintDX(self, graphics, self.TIME_CHAR_ARRAY, 0, (self.TIME_CHAR_ARRAY.n or #self.TIME_CHAR_ARRAY), self.string, 0, self.totalDigits, self.offset)
end

return TimeHudWidget

