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
-- package org.allbinary.game.ag.life

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Health = require("org.allbinary.game.health.Health")
local HealthBarAnimation = require("org.allbinary.game.health.HealthBarAnimation")
local HealthBarTwodAnimation = require("org.allbinary.game.health.HealthBarTwodAnimation")
local HealthInterface = require("org.allbinary.game.health.HealthInterface")
local HealthListenerInterface = require("org.allbinary.game.health.HealthListenerInterface")
local Paintable = require("org.allbinary.graphics.paint.Paintable")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthIncludingLifeBar = {}
HealthIncludingLifeBar.__index = HealthIncludingLifeBar
HealthIncludingLifeBar.className = "HealthIncludingLifeBar"
setmetatable(HealthIncludingLifeBar, {__index = Paintable})

function HealthIncludingLifeBar:_init_fields()
    self.animationInterface = nil
    self.life = nil
    self.healthInterface = nil
    self.allbinaryLayer = nil
end


-- throws Exception
function HealthIncludingLifeBar.createHealthIncludingLifeBar(layerInterface, life, healthInterface, location, direction)
        return HealthIncludingLifeBar.new(layerInterface, life, healthInterface, HealthBarTwodAnimation.new(layerInterface, location), direction)
end


function HealthIncludingLifeBar.new(layerInterface, life, healthInterface, animationInterface, direction)
    local self = setmetatable(Paintable.new(), HealthIncludingLifeBar)
    self:_init_fields()
        self.allbinaryLayer = layerInterface
        self.animationInterface = animationInterface
        self.life = life
        self.healthInterface = healthInterface
        self.healthInterface:addListener(self)
        self:onHealthChange()
    return self
end


function HealthIncludingLifeBar:onHealthChange()
        self.animationInterface:onHealthChange(((self.healthInterface:getHealth() + (self.healthInterface:getMaxHealth() * self.life:get())) * self.allbinaryLayer:getWidth()) / (self.healthInterface:getMaxHealth() + (self.healthInterface:getMaxHealth() * self.life:getStartLives())))
end


function HealthIncludingLifeBar:paint(graphics)
        self.animationInterface:paintXY(graphics, 0, 0)
end


function HealthIncludingLifeBar:paintThreed(graphics)
        self.animationInterface:paintThreedXYZ(graphics, 0, 0, 0)
end

return HealthIncludingLifeBar

