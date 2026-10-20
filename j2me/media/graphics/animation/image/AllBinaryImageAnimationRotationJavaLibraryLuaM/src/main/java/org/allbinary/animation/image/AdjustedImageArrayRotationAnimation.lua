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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local ImageArrayRotationAnimation = require("org.allbinary.animation.image.ImageArrayRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--TWB - Adjustments should be done in the resource creation and not at the animation level
local AdjustedImageArrayRotationAnimation = {}
AdjustedImageArrayRotationAnimation.__index = AdjustedImageArrayRotationAnimation
AdjustedImageArrayRotationAnimation.className = "AdjustedImageArrayRotationAnimation"
setmetatable(AdjustedImageArrayRotationAnimation, {__index = ImageArrayRotationAnimation})

function AdjustedImageArrayRotationAnimation:_init_fields()
    self.dx = 0
    self.dy = 0
end


-- throws Exception
function AdjustedImageArrayRotationAnimation.createAdjustedImageArrayRotationAnimationInfo(anyType, animationBehavior)
        local imageRotationAnimationInfo = anyType
        return AdjustedImageArrayRotationAnimation.new(imageRotationAnimationInfo:getImageArray(), imageRotationAnimationInfo:getAngleInfoP(), imageRotationAnimationInfo:getTotalAngle(), imageRotationAnimationInfo:getDx(), imageRotationAnimationInfo:getDy(), animationBehavior)
end


-- throws Exception
function AdjustedImageArrayRotationAnimation.createAnimation(imageArray, angleInfo, totalAngle, animationBehavior)
        return AdjustedImageArrayRotationAnimation.new(imageArray, angleInfo, totalAngle, -(((imageArray[1]:getWidth()) // (1 << (2)))), -(((imageArray[1]:getHeight()) // (1 << (2)))), animationBehavior)
end


function AdjustedImageArrayRotationAnimation.new(imageArray, angleInfo, totalAngle, dx, dy, animationBehavior)
    local self = setmetatable(ImageArrayRotationAnimation.new(imageArray, angleInfo, totalAngle, animationBehavior), AdjustedImageArrayRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:init(dx, dy)
    return self
end


-- throws Exception
function AdjustedImageArrayRotationAnimation:init(dx, dy)
        self:setDx(dx)
        self:setDy(dy)
end


function AdjustedImageArrayRotationAnimation:paintXY(graphics, x, y)
        ImageArrayRotationAnimation.paintXY(self, graphics, x + self.dx, y + self.dy)
end


function AdjustedImageArrayRotationAnimation:setDx(dx)
        self.dx = dx
end


function AdjustedImageArrayRotationAnimation:getDx()
        return self.dx
end


function AdjustedImageArrayRotationAnimation:setDy(dy)
        self.dy = dy
end


function AdjustedImageArrayRotationAnimation:getDy()
        return self.dy
end

return AdjustedImageArrayRotationAnimation

