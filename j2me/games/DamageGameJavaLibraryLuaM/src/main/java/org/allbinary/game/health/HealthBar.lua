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
-- package org.allbinary.game.health

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local HealthListenerInterface = require("org.allbinary.game.health.HealthListenerInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthBar = {}
HealthBar.__index = HealthBar
HealthBar.className = "HealthBar"
setmetatable(HealthBar, {__index = Paintable})

function HealthBar:_init_fields()
    self.animationInterface = nil
    self.healthInterface = nil
    self.allbinaryLayer = nil
end


function HealthBar.new(layerInterface, healthInterface, animationInterface, direction)
    local self = setmetatable(Paintable.new(), HealthBar)
    self:_init_fields()
        self.allbinaryLayer = layerInterface
        self.animationInterface = animationInterface
        self.healthInterface = healthInterface
        self.healthInterface:addListener(self)
        self:onHealthChange()
    return self
end


function HealthBar:onHealthChange()
        self.animationInterface:onHealthChange(self.healthInterface:getHealth() * self.allbinaryLayer:getWidth() / self.healthInterface:getMaxHealth())
end


function HealthBar:paint(graphics)
        self.animationInterface:paintXY(graphics, 0, 0)
end


function HealthBar:paintThreed(graphics)
        self.animationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end

return HealthBar

