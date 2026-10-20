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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ScaleProperties = require("org.allbinary.media.ScaleProperties")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
local ProceduralAnimationInterfaceFactoryInterface = require("org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface")

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

local NullRotationAnimationFactory = {}
NullRotationAnimationFactory.__index = NullRotationAnimationFactory
NullRotationAnimationFactory.className = "NullRotationAnimationFactory"
local NullRotationAnimation2 = {}
    NullRotationAnimation2.__index = NullRotationAnimation2
    NullRotationAnimation2.className = "NullRotationAnimation2"
    setmetatable(NullRotationAnimation2, {__index = NullRotationAnimation})
    NullRotationAnimationFactory.NullRotationAnimation2 = NullRotationAnimation2
    

    function NullRotationAnimationFactory.new()
        local self = setmetatable(NullRotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), IndexedAnimationBehavior.new(1, 250)), NullRotationAnimationFactory)
            -- super(...) made self above
        return self
    end
    

    function NullRotationAnimationFactory:paintXY(graphics, x, y)
    end


function NullRotationAnimationFactory:_init_fields()
    self.NULL_ROTATION_ANIMATION_ARRAY = java_new_array(nil, 0)
    self.NULL_ANIMATION = NullRotationAnimation2.new()
end


function NullRotationAnimationFactory.new()
    local self = setmetatable({}, NullRotationAnimationFactory)
    self:_init_fields()
    return self
end


function NullRotationAnimationFactory.getFactoryInstance()
        return NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY
end


function NullRotationAnimationFactory:getInstance(instanceId)
        return self.NULL_ANIMATION
end


-- throws Exception
function NullRotationAnimationFactory:getInstanceAnimation(animationInterface)
        return self.NULL_ANIMATION
end


function NullRotationAnimationFactory:setInitialScale(scaleProperties)
end

NullRotationAnimationFactory.NULL_ROTATION_ANIMATION_FACTORY = NullRotationAnimationFactory.new()

return NullRotationAnimationFactory

