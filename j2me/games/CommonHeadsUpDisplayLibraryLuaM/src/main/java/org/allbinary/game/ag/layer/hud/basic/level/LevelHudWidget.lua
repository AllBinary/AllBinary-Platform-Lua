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
-- package org.allbinary.game.ag.layer.hud.basic.level

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PrimitiveLongUtil = require("org.allbinary.logic.math.PrimitiveLongUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local function java_chars(text)
    local chars = {}
    for index = 1, #text do chars[index] = string.sub(text, index, index) end
    return chars
end

local LevelHudWidget = {}
LevelHudWidget.__index = LevelHudWidget
LevelHudWidget.className = "LevelHudWidget"
setmetatable(LevelHudWidget, {__index = BasicHud})

function LevelHudWidget:_init_fields()
    self.level = nil
    self.maxlevel = nil
    self.levelString = nil
    self.levelNumberCharArray = NullUtil.getInstance().NULL_CHAR_ARRAY
    self.levelNumberTotalDigits = 0
    self.offset = 0
    self.primitiveLongUtil = nil
end


-- throws Exception
function LevelHudWidget.createHud(maxlevel, location, direction)
        return LevelHudWidget.new(maxlevel, location, direction)
end


function LevelHudWidget.new(maxlevel, location, direction)
    local self = setmetatable(BasicHud.new(location, direction, 2, BasicColorFactory.getInstance().GREY), LevelHudWidget)
    self:_init_fields()
        -- super(...) made self above
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(1000)
        local LEVEL = "Lv "
        self.levelString = java_chars(LEVEL)
        self.maxlevel = maxlevel
        self.level = maxlevel
        self:update()
        self.updateMaxHeight = 14
    return self
end


function LevelHudWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * 4
        self.offset = font:charsWidth(self.levelString, 0, (self.levelString.n or #self.levelString)) + font:getSize()
        BasicHud.updateMeasurement(self, graphics)
end


function LevelHudWidget:update()
        self.levelNumberCharArray = self.primitiveLongUtil:getCharArray(self.level)
        self.levelNumberTotalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
end


function LevelHudWidget:setLevel(level)
        self.level = level
        self:update()
end


function LevelHudWidget:nextLevel()
        self.level = self.level + 1
        self:update()
end


function LevelHudWidget:previousLevel()
        self.level = self.level - 1
        if self.level < 0 then
            self.level = 0
        end
        self:update()
end


function LevelHudWidget:isComplete()
        if self.level <= self.maxlevel then
            return false
        else
            return true
        end
end


function LevelHudWidget:paint(graphics)
        BasicHud.paintDX(self, graphics, self.levelString, 0, (self.levelString.n or #self.levelString), self.levelNumberCharArray, 0, self.levelNumberTotalDigits, self.offset)
end


function LevelHudWidget:paintThreed(graphics)
end

return LevelHudWidget

