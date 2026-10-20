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

local OpenGLFeatureUtil = require("org.allbinary.graphics.opengles.OpenGLFeatureUtil")
local FeaturedAnimationInterfaceFactoryInterfaceFactory = require("org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory")
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

local HealthBarFactory = {}
HealthBarFactory.__index = HealthBarFactory
HealthBarFactory.className = "HealthBarFactory"

function HealthBarFactory.new()
    local self = setmetatable({}, HealthBarFactory)
    return self
end


-- throws Exception
function HealthBarFactory:getInstance(layerInterface, healthInterface, location, direction)
        if OpenGLFeatureUtil.getInstance():isAnyThreed() then
            local featuredAnimationInterfaceFactoryInterfaceFactory = FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()
            local healthBarAnimationInterfaceFactory = featuredAnimationInterfaceFactoryInterfaceFactory:get(Health.NAME)
            return HealthBar.new(layerInterface, healthInterface, healthBarAnimationInterfaceFactory:getInstanceByLocation(layerInterface, location), direction)
        else
            return HealthBar.new(layerInterface, healthInterface, HealthBarTwodAnimation.new(layerInterface, location), direction)
        end
end

return HealthBarFactory

