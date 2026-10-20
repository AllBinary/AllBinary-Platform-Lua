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

local Animation = require("org.allbinary.animation.Animation")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HealthBarAnimationInterfaceFactory = {}
HealthBarAnimationInterfaceFactory.__index = HealthBarAnimationInterfaceFactory
HealthBarAnimationInterfaceFactory.className = "HealthBarAnimationInterfaceFactory"


function HealthBarAnimationInterfaceFactory.new()
    local self = setmetatable({}, HealthBarAnimationInterfaceFactory)
    return self
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstanceByLocation(layerInterface, location)
        return HealthBarThreedAnimation.new(layerInterface, location)
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstance(instanceId)
        return nil
end


-- throws Exception
function HealthBarAnimationInterfaceFactory:getInstanceAnimation(animationInterface)
        return nil
end


function HealthBarAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return HealthBarAnimationInterfaceFactory

