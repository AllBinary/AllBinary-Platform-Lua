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
-- package org.allbinary.media

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Anchor = require("org.allbinary.graphics.Anchor")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local UpdateMyFontInterface = require("org.allbinary.graphics.font.UpdateMyFontInterface")
local UpdateMyFontProcessor = require("org.allbinary.graphics.font.UpdateMyFontProcessor")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local AllBinaryVibrationME = require("org.allbinary.media.AllBinaryVibrationME")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryVisualDebugVibration = {}
AllBinaryVisualDebugVibration.__index = AllBinaryVisualDebugVibration
AllBinaryVisualDebugVibration.className = "AllBinaryVisualDebugVibration"
setmetatable(AllBinaryVisualDebugVibration, {__index = AllBinaryVibrationME})

function AllBinaryVisualDebugVibration:_init_fields()
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(Integer.MAX_VALUE)
    self.VIBRATING = "Vibrating"
    self.myFontProcessor = UpdateMyFontProcessor.new(self)
    self.anchor = Anchor.TOP_LEFT
    self.width = 0
end

function AllBinaryVisualDebugVibration.new()
    local self = setmetatable(AllBinaryVibrationME.new(), AllBinaryVisualDebugVibration)
    self:_init_fields()
    return self
end


function AllBinaryVisualDebugVibration:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.width = font:stringWidth(self.VIBRATING)
        self.myFontProcessor = MyFontProcessor.getInstance()
end


function AllBinaryVisualDebugVibration:vibrate(duration, type, volume)
        self.timeDelayHelper.delay = duration
end


function AllBinaryVisualDebugVibration:paint(graphics)
        if self.timeDelayHelper:isTimeTNT() then
            self.timeDelayHelper.delay = Integer.MAX_VALUE
            self.myFontProcessor:process(graphics)
            graphics:drawString(self.VIBRATING, self.displayInfoSingleton:getLastHalfWidth() - (((self.width) // (1 << (1)))), 0, self.anchor)
        end
end

return AllBinaryVisualDebugVibration

