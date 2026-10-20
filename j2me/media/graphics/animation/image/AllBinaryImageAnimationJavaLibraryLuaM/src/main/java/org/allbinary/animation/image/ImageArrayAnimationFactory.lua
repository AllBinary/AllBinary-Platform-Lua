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
-- package org.allbinary.animation.image

-- local Image = require("javax.microedition.lcdui.Image")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local AnimationBehaviorFactory = require("org.allbinary.animation.AnimationBehaviorFactory")
local AnimationInterfaceFactoryInterface = require("org.allbinary.animation.AnimationInterfaceFactoryInterface")
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

local ImageArrayAnimationFactory = {}
ImageArrayAnimationFactory.__index = ImageArrayAnimationFactory
ImageArrayAnimationFactory.className = "ImageArrayAnimationFactory"

function ImageArrayAnimationFactory:_init_fields()
    self.dx = 0
    self.dy = 0
    self.imageArray = nil
    self.animationBehaviorFactory = nil
end


function ImageArrayAnimationFactory.new(imageArray, dx, dy, animationBehaviorFactory)
    local self = setmetatable({}, ImageArrayAnimationFactory)
    self:_init_fields()
        self.imageArray = imageArray
        self.animationBehaviorFactory = animationBehaviorFactory
        self.dx = dx
        self.dy = dy
    return self
end


-- throws Exception
function ImageArrayAnimationFactory:getInstance(instanceId)
        if self.dx ~= 0 or self.dy ~= 0 then
            return AdjustedImageArrayAnimation.new(self.imageArray, self.dx, self.dy, self.animationBehaviorFactory:getOrCreateInstance())
        else
            return ImageArrayAnimation.new(self.imageArray, AnimationBehavior.getInstance())
        end
end


function ImageArrayAnimationFactory:setInitialScale(scaleProperties)
end

return ImageArrayAnimationFactory

