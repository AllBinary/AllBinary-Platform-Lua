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
local AppletUtil = require("org.allbinary.AppletUtil")
local Anchor = require("org.allbinary.graphics.Anchor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local TouchScreenFactory = require("org.allbinary.input.motion.button.TouchScreenFactory")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PressStartMenuPaintable = {}
PressStartMenuPaintable.__index = PressStartMenuPaintable
PressStartMenuPaintable.className = "PressStartMenuPaintable"
setmetatable(PressStartMenuPaintable, {__index = Paintable})

function PressStartMenuPaintable:_init_fields()
    self.displayInfo = DisplayInfoSingleton.getInstance()
    self.PRESS_START = "Press Screen To Start"
    self.KEY_START = "Press or Click F2 To Begin"
    self.MENU_START = "Press Start From The Menu To Begin"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.startString = StringUtil.getInstance().EMPTY_STRING
    self.timeDelayHelper = TimeDelayHelper.new(1100)
    self.flash = false
    self.anchor = Anchor.TOP_LEFT
    self.beginWidth = 0
    self.line = 0
end


function PressStartMenuPaintable.new()
    local self = setmetatable(Paintable.new(), PressStartMenuPaintable)
    self:_init_fields()
        if TouchScreenFactory.getInstance():isTouch() then
            self.startString = self.PRESS_START
        elseif AppletUtil.isAppletLoader(self) then
            self.startString = self.KEY_START
        else
            self.startString = self.MENU_START
        end
    return self
end


function PressStartMenuPaintable:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.beginWidth = (((graphics:getFont():stringWidth(self.startString)) // (1 << (1))))
        self.line = (4 * MyFontProcessor.defaultCharWidth(font)) + (((font:getHeight()) // (1 << (1))))
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function PressStartMenuPaintable:paint(graphics)
        if self.timeDelayHelper:isTimeTNT() then
            if self:isFlash() then
                self:setFlash(false)
            else
                self:setFlash(true)
            end
        end
        if self:isFlash() then
            self.myFontProcessor:process(graphics)
            graphics:drawString(self.startString, self.displayInfo:getLastHalfWidth() - self.beginWidth, self.displayInfo:getLastHeight() - self.line, self.anchor)
        end
end


function PressStartMenuPaintable:setFlash(flash)
        self.flash = flash
end


function PressStartMenuPaintable:isFlash()
        return self.flash
end

return PressStartMenuPaintable

