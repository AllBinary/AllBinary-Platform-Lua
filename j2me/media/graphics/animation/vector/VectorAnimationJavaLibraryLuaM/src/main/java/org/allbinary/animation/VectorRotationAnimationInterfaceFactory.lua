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
local NullUtil = require("org.allbinary.logic.NullUtil")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorRotationAnimationInterfaceFactory = {}
VectorRotationAnimationInterfaceFactory.__index = VectorRotationAnimationInterfaceFactory
VectorRotationAnimationInterfaceFactory.className = "VectorRotationAnimationInterfaceFactory"

function VectorRotationAnimationInterfaceFactory:_init_fields()
    self.currentPoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.animationBehaviorFactory = nil
end


function VectorRotationAnimationInterfaceFactory.new(currentPoints, basicColor, animationBehaviorFactory)
    local self = setmetatable({}, VectorRotationAnimationInterfaceFactory)
    self:_init_fields()
        self.currentPoints = currentPoints
        self:setBasicColorP(basicColor)
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function VectorRotationAnimationInterfaceFactory:getInstance(instanceId)
        return VectorRotationAnimation.new(self.currentPoints, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorRotationAnimationInterfaceFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorRotationAnimationInterfaceFactory:getBasicColorP()
        return self.basicColor
end


function VectorRotationAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return VectorRotationAnimationInterfaceFactory

