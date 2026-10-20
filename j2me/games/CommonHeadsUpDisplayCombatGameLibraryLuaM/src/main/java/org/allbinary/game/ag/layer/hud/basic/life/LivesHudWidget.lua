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
-- package org.allbinary.game.ag.layer.hud.basic.life

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local Life = require("org.allbinary.game.ag.life.Life")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LivesHudWidget = {}
LivesHudWidget.__index = LivesHudWidget
LivesHudWidget.className = "LivesHudWidget"
setmetatable(LivesHudWidget, {__index = BasicHud})

function LivesHudWidget:_init_fields()
    self.lifeInterface = nil
    self.xArray = nil
    self.animationInterface = nil
end


function LivesHudWidget.new(animationInterface, lifeInterface, location, direction)
    local self = setmetatable(BasicHud.new(location, direction, 2, BasicColorFactory.getInstance().WHITE), LivesHudWidget)
    self:_init_fields()
        -- super(...) made self above
        self.lifeInterface = lifeInterface
        local size = java_int(self:getLifeInterface():getMaxlives())
        self.xArray = java_new_array(0, size)
        self.animationInterface = animationInterface
        self.updateMaxWidth = self.lifeInterface:getMaxlives() * 16
        self.updateMaxHeight = 16
    return self
end


function LivesHudWidget:updateMeasurement(graphics)
        BasicHud.updateMeasurement(self, graphics)
        local maxLives = java_int(self:getLifeInterface():getMaxlives())
        for index = 0, maxLives - 1 do
            self.xArray[index + 1] = self:getX() + (index * 16)
        end
end


function LivesHudWidget:onDisplayChangeEvent(displayChangeEvent)
        BasicHud.onDisplayChangeEvent(self, displayChangeEvent)
        self.myFontProcessor = self.updateMyFontProcessor
end


function LivesHudWidget:setX(x)
        BasicHud.setX(self, x)
        self.myFontProcessor = self.updateMyFontProcessor
end


function LivesHudWidget:paint(graphics)
        self.myFontProcessor:process(graphics)
        do
            local index = java_int(self:getLifeInterface():get())
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterface:paintXY(graphics, self.xArray[index + 1], self:getY())
            end
        end
end


function LivesHudWidget:paintThreed(graphics)
end


function LivesHudWidget:getLifeInterface()
        return self.lifeInterface
end

return LivesHudWidget

