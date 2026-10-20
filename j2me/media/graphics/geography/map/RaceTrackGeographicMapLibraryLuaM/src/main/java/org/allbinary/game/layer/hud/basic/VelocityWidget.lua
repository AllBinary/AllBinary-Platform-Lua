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
-- package org.allbinary.game.layer.hud.basic

-- local Font = require("javax.microedition.lcdui.Font")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local MyFontProcessor = require("org.allbinary.graphics.font.MyFontProcessor")
local MathUtil = require("org.allbinary.logic.math.MathUtil")
local PrimitiveLongSingleton = require("org.allbinary.logic.math.PrimitiveLongSingleton")
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

local VelocityWidget = {}
VelocityWidget.__index = VelocityWidget
VelocityWidget.className = "VelocityWidget"
setmetatable(VelocityWidget, {__index = BasicHud})

function VelocityWidget:_init_fields()
    self.KILOMETERS_PER_HOUR_STR = {" ", "k", "m", "/", "h"}
    self.totalChars = (self.KILOMETERS_PER_HOUR_STR.n or #self.KILOMETERS_PER_HOUR_STR)
    self.velocity = nil
    self.maxVelocity = nil
    self.string = PrimitiveLongSingleton.getInstance().ZERO
    self.totalDigits = 1
    self.powerOfTenVelocity = nil
    self.primitiveLongUtil = nil
    self.offset = 0
    self.offset2 = 0
end


function VelocityWidget.new(powerOfTenVelocity, location, direction, basicColor)
    local self = setmetatable(BasicHud.new(location, direction, 2, basicColor), VelocityWidget)
    self:_init_fields()
        -- super(...) made self above
        self.powerOfTenVelocity = powerOfTenVelocity
        self.maxVelocity = powerOfTenVelocity
        self.velocity = 0
        self.primitiveLongUtil = PrimitiveLongUtil.createPowerOfTen(powerOfTenVelocity)
        self.updateMaxHeight = 14
    return self
end


function VelocityWidget:updateMeasurement(graphics)
        local font = graphics:getFont()
        self.updateMaxWidth = font:getSize() * (5 + MathUtil.getInstance():getTotalDigits(self.powerOfTenVelocity) + 1)
        BasicHud.updateMeasurement(self, graphics)
        self.offset = MyFontProcessor.defaultStringWidth(font, self.primitiveLongUtil:getMaxDigits()) + MyFontProcessor.defaultStringWidth(font, 2)
        self.offset2 = self.offset - MyFontProcessor.defaultStringWidth(font, self.totalDigits) - MyFontProcessor.defaultStringWidth(font, 2)
end


function VelocityWidget:get()
        return self.velocity
end


function VelocityWidget:add(value)
        self:set(self.velocity + value)
end


function VelocityWidget:set(value)
        local lastVelocity = self.velocity
        self.velocity = value
        if self.velocity > self.maxVelocity then
            self.velocity = 0
        end
        if lastVelocity ~= self.velocity then
            self.string = self.primitiveLongUtil:getCharArray(self.velocity * 18)
            if OpenGLFeatureUtil.getInstance():isAnyThreed() then
                self.totalDigits = self.primitiveLongUtil:getCurrentTotalDigits() + 1
            else
                self.totalDigits = self.primitiveLongUtil:getCurrentTotalDigits()
            end
            self.myFontProcessor = self.updateMyFontProcessor
        end
end


function VelocityWidget:reduce(value)
        self:set(self.velocity - value)
end


function VelocityWidget:paint(graphics)
        BasicHud.paintDXY(self, graphics, self.string, 0, self.totalDigits, self.KILOMETERS_PER_HOUR_STR, 0, self.totalChars, self.offset2, self.offset)
end

return VelocityWidget

