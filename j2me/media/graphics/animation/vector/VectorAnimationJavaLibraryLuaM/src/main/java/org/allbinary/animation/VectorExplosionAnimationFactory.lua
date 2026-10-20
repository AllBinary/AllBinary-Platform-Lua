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
-- package org.allbinary.animation

local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorExplosionAnimationFactory = {}
VectorExplosionAnimationFactory.__index = VectorExplosionAnimationFactory
VectorExplosionAnimationFactory.className = "VectorExplosionAnimationFactory"

function VectorExplosionAnimationFactory:_init_fields()
    self.vectorExplosionGenerator = VectorExplosionGenerator.getInstance()
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.animationBehaviorFactory = nil
end


function VectorExplosionAnimationFactory.new(basicColor, animationBehaviorFactory)
    local self = setmetatable({}, VectorExplosionAnimationFactory)
    self:_init_fields()
        self.animationBehaviorFactory = animationBehaviorFactory
        self:setBasicColorP(basicColor)
    return self
end


-- throws Exception
function VectorExplosionAnimationFactory:getInstanceAnimation(animationInterface)
        local vectorRotationAnimationInterface = animationInterface
        local frame = vectorRotationAnimationInterface:getFrame()
        local framePoints = vectorRotationAnimationInterface:getPoints(frame)
        local points = self.vectorExplosionGenerator:getInstance(framePoints, 6, self.vectorExplosionGenerator.ROTATION)
        return VectorRotationAnimation.new(points, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorExplosionAnimationFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorExplosionAnimationFactory:getBasicColorP()
        return self.basicColor
end

return VectorExplosionAnimationFactory

