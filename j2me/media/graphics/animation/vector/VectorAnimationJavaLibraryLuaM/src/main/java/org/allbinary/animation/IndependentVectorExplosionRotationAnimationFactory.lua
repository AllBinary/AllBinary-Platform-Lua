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
local NullUtil = require("org.allbinary.logic.NullUtil")
local VectorInfo = require("org.allbinary.vector.VectorInfo")
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

local IndependentVectorExplosionRotationAnimationFactory = {}
IndependentVectorExplosionRotationAnimationFactory.__index = IndependentVectorExplosionRotationAnimationFactory
IndependentVectorExplosionRotationAnimationFactory.className = "IndependentVectorExplosionRotationAnimationFactory"

function IndependentVectorExplosionRotationAnimationFactory:_init_fields()
    self.framePoints = NullUtil.getInstance().NULL_INT_ARRAY_ARRAY_ARRAY
    self.vectorInfo = nil
    self.basicColor = nil
    self.vectorAnimationFactoryInterface = nil
    self.vectorExplosionGenerator = VectorExplosionGenerator.getInstance()
end


function IndependentVectorExplosionRotationAnimationFactory.new(vectorInfo, basicColor, vectorAnimationFactoryInterface)
    local self = setmetatable({}, IndependentVectorExplosionRotationAnimationFactory)
    self:_init_fields()
        self.vectorInfo = vectorInfo
        self.basicColor = basicColor
        self.vectorAnimationFactoryInterface = vectorAnimationFactoryInterface
        self:init()
    return self
end


-- throws Exception
function IndependentVectorExplosionRotationAnimationFactory:init()
        self.framePoints = VectorRotationGenerator.getInstance():getInstance(self.vectorInfo)
end


-- throws Exception
function IndependentVectorExplosionRotationAnimationFactory:getInstanceAnimation(animationInterface)
        local frame = 0
        if animationInterface ~= nil then
            local rotationAnimationInterface = animationInterface
            frame = rotationAnimationInterface:getFrame()
        end
        local points = self.vectorExplosionGenerator:getInstance(self.framePoints[frame + 1], 6, self.vectorExplosionGenerator.ROTATION)
        return self.vectorAnimationFactoryInterface:getInstance(points, self.basicColor)
end

return IndependentVectorExplosionRotationAnimationFactory

