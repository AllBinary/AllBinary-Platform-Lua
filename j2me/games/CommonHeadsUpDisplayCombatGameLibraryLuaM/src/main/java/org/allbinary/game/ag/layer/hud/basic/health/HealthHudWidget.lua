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
-- package org.allbinary.game.ag.layer.hud.basic.health

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local Health = require("org.allbinary.game.health.Health")
local HealthListenerInterface = require("org.allbinary.game.health.HealthListenerInterface")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local PaintableInterface = require("org.allbinary.graphics.paint.PaintableInterface")
local GameTickTimeDelayHelper = require("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local NoTimeDelayHelper = require("org.allbinary.time.NoTimeDelayHelper")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

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

local HealthHudWidget = {}
HealthHudWidget.__index = HealthHudWidget
HealthHudWidget.className = "HealthHudWidget"
setmetatable(HealthHudWidget, {__index = BasicHud})

function HealthHudWidget:_init_fields()
    self.healthScale = nil
    self.animationInterface = nil
    self.healthInterface = nil
    self.max = 0
    self.xArray = nil
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.timeDelayHelper = NoTimeDelayHelper.SINGLETON
    self.slowBeatTimeDelayHelper = TimeDelayHelper.new(1280)
    self.mediumBeatTimeDelayHelper = TimeDelayHelper.new(640)
    self.fastBeatTimeDelayHelper = TimeDelayHelper.new(320)
end


function HealthHudWidget.new(animationInterface, healthInterface, location, direction)
    local self = setmetatable(BasicHud.new(location, direction, 2, BasicColorFactory.getInstance().WHITE), HealthHudWidget)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterface = animationInterface
        self.healthInterface = healthInterface
        self.healthInterface:addListener(self)
        self.healthScale = (self.healthInterface:getMaxHealth() / 6) + 1
        self:onHealthChange()
        self.updateMaxWidth = healthInterface:getMaxHealth() * 16
        self.updateMaxHeight = 16
        self.xArray = java_new_array(0, 30)
        self:update()
    return self
end


function HealthHudWidget:update()
        if self.xArray ~= nil then
            for index = 0, (self.xArray.n or #self.xArray) - 1 do
                self.xArray[index + 1] = self:getX() + (index * 16)
            end
        end
end


function HealthHudWidget:setX(x)
        BasicHud.setX(self, x)
        self:update()
end


function HealthHudWidget:onHealthChange()
        self.max = (self.healthInterface:getHealth() / self.healthScale)
        self.timeDelayHelper = NoTimeDelayHelper.SINGLETON
        if self.max <= 1 and self.healthInterface:isAlive() then
            self.max = 1
            if self.healthScale - self.healthInterface:getHealth() > java_idiv((self.healthScale * 2), 3) then
                self.timeDelayHelper = self.slowBeatTimeDelayHelper
            elseif self.healthScale - self.healthInterface:getHealth() > java_idiv(self.healthScale, 3) then
                self.timeDelayHelper = self.mediumBeatTimeDelayHelper
            else
                self.timeDelayHelper = self.fastBeatTimeDelayHelper
            end
        end
end


function HealthHudWidget:paint(graphics)
        self.myFontProcessor:process(graphics)
        for index = 0, self.max - 1 do
            if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
                self.animationInterface:paintXY(graphics, self.xArray[index + 1], self:getY())
            end
        end
end


function HealthHudWidget:paintThreed(graphics)
end

return HealthHudWidget

