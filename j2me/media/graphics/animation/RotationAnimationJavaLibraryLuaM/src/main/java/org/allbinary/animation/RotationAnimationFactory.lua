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

local GameConfigurationCentral = require("org.allbinary.game.configuration.GameConfigurationCentral")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
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

local RotationAnimationFactory = {}
RotationAnimationFactory.__index = RotationAnimationFactory
RotationAnimationFactory.className = "RotationAnimationFactory"

function RotationAnimationFactory:_init_fields()
    self.totalAngle = nil
    self.angleIncrement = nil
end


function RotationAnimationFactory.createFactory()
        local totalAngle = AngleFactory.getInstance().TOTAL_ANGLE
        return RotationAnimationFactory.new(totalAngle, java_int((totalAngle / GameConfigurationCentral.getInstance():getGameControlFidelity())))
end


function RotationAnimationFactory.new(totalAngle, angleIncrement)
    local self = setmetatable({}, RotationAnimationFactory)
    self:_init_fields()
        self.totalAngle = totalAngle
        self.angleIncrement = angleIncrement
    return self
end


-- throws Exception
function RotationAnimationFactory:getInstance(instanceId)
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(self.angleIncrement), self.totalAngle, AnimationBehavior.getInstance())
end


-- throws Exception
function RotationAnimationFactory:getInstanceAnimation(animationInterface)
        return NullRotationAnimation.createTotalAngle(AngleInfo.getInstance(self.angleIncrement), self.totalAngle, AnimationBehavior.getInstance())
end


function RotationAnimationFactory:setInitialScale(scaleProperties)
end

return RotationAnimationFactory

