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

local Direction = require("org.allbinary.direction.Direction")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local VectorBaseRotationAnimation = require("org.allbinary.animation.VectorBaseRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local VectorRotationAnimation = {}
VectorRotationAnimation.__index = VectorRotationAnimation
VectorRotationAnimation.className = "VectorRotationAnimation"
setmetatable(VectorRotationAnimation, {__index = VectorBaseRotationAnimation})


function VectorRotationAnimation.new(currentPoints, basicColor, animationBehavior)
    local self = setmetatable(VectorBaseRotationAnimation.new(AngleInfo.getInstance(java_int((AngleFactory.getInstance().TOTAL_ANGLE / (currentPoints.n or #currentPoints)))), currentPoints, basicColor, animationBehavior), VectorRotationAnimation)
        -- super(...) made self above
        self.angleInfo:adjustAngle(self:getFrame())
    return self
end


function VectorRotationAnimation:setFrameByDirection(direction)
        local angle = self.directionUtil:getFrameAngle(direction)
        self:adjustFrameToAngle(angle)
end


function VectorRotationAnimation:setFrameToAngle(angle)
        self:adjustFrameToAngle(angle)
end


function VectorRotationAnimation:setFrame(index)
        VectorBaseRotationAnimation.setFrame(self, index)
        self.angleInfo:adjustAngle(self:getFrame())
end


function VectorRotationAnimation:adjustFrame(newAngle)
        self:setFrame(self.frameUtil:getFrameForAngle(newAngle, java_int(self.angleInfo:getAngleIncrementInfo():getAngleIncrement())))
end


function VectorRotationAnimation:adjustFrameToAngle(newAngle)
        self:adjustFrame(newAngle:getValue())
end

return VectorRotationAnimation

