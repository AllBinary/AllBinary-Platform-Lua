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

local SingletonAnimationInterfaceFactory = {}
SingletonAnimationInterfaceFactory.__index = SingletonAnimationInterfaceFactory
SingletonAnimationInterfaceFactory.className = "SingletonAnimationInterfaceFactory"

function SingletonAnimationInterfaceFactory:_init_fields()
    self.animationInterface = nil
end


function SingletonAnimationInterfaceFactory.new(animationInterface)
    local self = setmetatable({}, SingletonAnimationInterfaceFactory)
    self:_init_fields()
        self.animationInterface = animationInterface
    return self
end


-- throws Exception
function SingletonAnimationInterfaceFactory:getInstance(instanceId)
        return self.animationInterface
end


-- throws Exception
function SingletonAnimationInterfaceFactory:getInstanceAnimation(animationInterface)
        return self.animationInterface
end


function SingletonAnimationInterfaceFactory:setInitialScale(scaleProperties)
end

return SingletonAnimationInterfaceFactory

