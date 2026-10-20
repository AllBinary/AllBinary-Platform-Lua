-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.animation.image

local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ImageCacheFactory = require("org.allbinary.image.ImageCacheFactory")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
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

local LazyImageRotationAnimationFactory = {}
LazyImageRotationAnimationFactory.__index = LazyImageRotationAnimationFactory
LazyImageRotationAnimationFactory.className = "LazyImageRotationAnimationFactory"

function LazyImageRotationAnimationFactory:_init_fields()
    self.layoutIndex = nil
    self.animationInterfaceFactoryInterface = nil
    self.scaleProperties = ScaleProperties.instance
end


function LazyImageRotationAnimationFactory.new(layoutIndex, associatedLazyAnimationId, animationInterfaceFactoryInterface)
    local self = setmetatable({}, LazyImageRotationAnimationFactory)
    self:_init_fields()
        self.layoutIndex = layoutIndex
        self.animationInterfaceFactoryInterface = animationInterfaceFactoryInterface
        ImageCacheFactory.getInstance().hasAnyLazyAnimationFactories = true
        if self.animationInterfaceFactoryInterface.animationBehaviorFactory == AnimationBehaviorFactory.getInstance() then
            ForcedLogUtil.log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", self)
        end
    return self
end


-- throws Exception
function LazyImageRotationAnimationFactory:getInstance(instanceId)
        if self.animationInterfaceFactoryInterface:getImage():isReady() then
            self.animationInterfaceFactoryInterface:setInitialScale(self.scaleProperties)
            return self.animationInterfaceFactoryInterface:getInstance(instanceId)
        else
            return LazyImageRotationAnimation.new(self.layoutIndex, instanceId, self.scaleProperties, self.animationInterfaceFactoryInterface, self.animationInterfaceFactoryInterface.animationBehaviorFactory:getOrCreateInstance())
        end
end


function LazyImageRotationAnimationFactory:setInitialScale(scaleProperties)
        self.scaleProperties = scaleProperties
end

return LazyImageRotationAnimationFactory

