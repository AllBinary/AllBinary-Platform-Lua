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

local VectorAnimationInterfaceFactory = {}
VectorAnimationInterfaceFactory.__index = VectorAnimationInterfaceFactory
VectorAnimationInterfaceFactory.className = "VectorAnimationInterfaceFactory"

function VectorAnimationInterfaceFactory:_init_fields()
    self.currentPoints = nil
    self.basicColor = BasicColorFactory.getInstance().WHITE
    self.animationBehaviorFactory = nil
end


function VectorAnimationInterfaceFactory.new(currentPoints, basicColor, animationBehaviorFactory)
    local self = setmetatable({}, VectorAnimationInterfaceFactory)
    self:_init_fields()
        self.currentPoints = currentPoints
        self:setBasicColorP(basicColor)
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function VectorAnimationInterfaceFactory:getInstance(instanceId)
        return VectorAnimation.new(self.currentPoints, self:getBasicColorP(), self.animationBehaviorFactory:getOrCreateInstance())
end


function VectorAnimationInterfaceFactory:setBasicColorP(basicColor)
        self.basicColor = basicColor
end


function VectorAnimationInterfaceFactory:getBasicColorP()
        return self.basicColor
end


function VectorAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return VectorAnimationInterfaceFactory

