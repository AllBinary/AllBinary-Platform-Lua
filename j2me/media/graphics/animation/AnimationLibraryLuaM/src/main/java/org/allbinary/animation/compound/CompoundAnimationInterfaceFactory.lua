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
local NullAnimationFactory = require("org.allbinary.animation.NullAnimationFactory")
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

local CompoundAnimationInterfaceFactory = {}
CompoundAnimationInterfaceFactory.__index = CompoundAnimationInterfaceFactory
CompoundAnimationInterfaceFactory.className = "CompoundAnimationInterfaceFactory"

function CompoundAnimationInterfaceFactory:_init_fields()
    self.basicAnimationInterfaceFactoryInterfaceArrayP = nil
    self.animationBehaviorFactory = nil
end


function CompoundAnimationInterfaceFactory.new(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory)
    local self = setmetatable({}, CompoundAnimationInterfaceFactory)
    self:_init_fields()
        self.basicAnimationInterfaceFactoryInterfaceArrayP = basicAnimationInterfaceFactoryInterfaceArray
        self.animationBehaviorFactory = animationBehaviorFactory
    return self
end


-- throws Exception
function CompoundAnimationInterfaceFactory:getInstance(instanceId)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArrayP.n or #self.basicAnimationInterfaceFactoryInterfaceArrayP)
        local animationInterfaceArray = self:createArray(size)
        for index = 0, size - 1 do
            animationInterfaceArray[index + 1] = self.basicAnimationInterfaceFactoryInterfaceArrayP[index + 1]:getInstance(instanceId)
        end
        return self:createAnimation(animationInterfaceArray)
end


function CompoundAnimationInterfaceFactory:createArray(size)
        return NullAnimationFactory.getFactoryInstance().EMPTY_ARRAY
end


function CompoundAnimationInterfaceFactory:createAnimation(animationInterfaceArray)
        return NullAnimationFactory.getFactoryInstance():getInstance(0)
end


function CompoundAnimationInterfaceFactory:getBasicAnimationInterfaceFactoryInterfaceArray()
        return self.basicAnimationInterfaceFactoryInterfaceArrayP
end


function CompoundAnimationInterfaceFactory:setInitialScale(scaleProperties)
        local size = (self.basicAnimationInterfaceFactoryInterfaceArrayP.n or #self.basicAnimationInterfaceFactoryInterfaceArrayP)
        for index = 0, size - 1 do
            self.basicAnimationInterfaceFactoryInterfaceArrayP[index + 1]:setInitialScale(scaleProperties)
        end
end

return CompoundAnimationInterfaceFactory

