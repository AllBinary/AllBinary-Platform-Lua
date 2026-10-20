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
-- package org.allbinary.animation.compound

local Animation = require("org.allbinary.animation.Animation")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local ForcedLogUtil = require("org.allbinary.logic.communication.log.ForcedLogUtil")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")

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

local SimultaneousCompoundIndexAnimationInterfaceFactory = {}
SimultaneousCompoundIndexAnimationInterfaceFactory.__index = SimultaneousCompoundIndexAnimationInterfaceFactory
SimultaneousCompoundIndexAnimationInterfaceFactory.className = "SimultaneousCompoundIndexAnimationInterfaceFactory"

function SimultaneousCompoundIndexAnimationInterfaceFactory:_init_fields()
    self.basicAnimationInterfaceFactoryInterfaceArray = nil
    self.animationBehaviorFactory = nil
end


function SimultaneousCompoundIndexAnimationInterfaceFactory.new(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory)
    local self = setmetatable({}, SimultaneousCompoundIndexAnimationInterfaceFactory)
    self:_init_fields()
        self.basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function SimultaneousCompoundIndexAnimationInterfaceFactory:getInstance(instanceId)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArray.n or #self.basicAnimationInterfaceFactoryInterfaceArray)
        local animationInterfaceArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            animationInterfaceArray[index + 1] = self.basicAnimationInterfaceFactoryInterfaceArray[index + 1]:getInstance(instanceId)
        end
        return self:getOrCreate(animationInterfaceArray)
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:getOrCreate(animationInterfaceArray)
        return SimultaneousCompoundIndexAnimation.new(animationInterfaceArray, self.animationBehaviorFactory:getOrCreateInstance())
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:getBasicAnimationInterfaceFactoryInterfaceArray()
        return self.basicAnimationInterfaceFactoryInterfaceArray
end


function SimultaneousCompoundIndexAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return SimultaneousCompoundIndexAnimationInterfaceFactory

