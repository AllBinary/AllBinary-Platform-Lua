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
-- package org.allbinary.animation.special

local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local IndexedAnimationBehavior = require("org.allbinary.animation.IndexedAnimationBehavior")
local SpecialAnimationInterface = require("org.allbinary.animation.special.SpecialAnimationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SpecialAnimation = {}
SpecialAnimation.__index = SpecialAnimation
SpecialAnimation.className = "SpecialAnimation"
setmetatable(SpecialAnimation, {__index = IndexedAnimation})


function SpecialAnimation.getInstance()
        return SpecialAnimation.NULL_SPECIAL_ANIMATION
end


function SpecialAnimation.new(animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), SpecialAnimation)
        -- super(...) made self above
    return self
end


function SpecialAnimation:nextFrame()
        local indexedAnimationBehavior = (self.animationBehaviorP)
        indexedAnimationBehavior.loopIndex = indexedAnimationBehavior.loopIndex + 1
end


function SpecialAnimation:setLastFrame()
end


function SpecialAnimation:isComplete()
        return false
end


function SpecialAnimation:open()
end


function SpecialAnimation:close()
end


function SpecialAnimation:process()
end

SpecialAnimation.NULL_SPECIAL_ANIMATION = SpecialAnimation.new(IndexedAnimationBehavior.new(1, 250))

return SpecialAnimation

