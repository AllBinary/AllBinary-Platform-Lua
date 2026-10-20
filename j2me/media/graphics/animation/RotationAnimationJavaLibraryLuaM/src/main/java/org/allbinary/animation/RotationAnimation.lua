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
local DirectionUtil = require("org.allbinary.direction.DirectionUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local Angle = require("org.allbinary.math.Angle")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local FrameUtil = require("org.allbinary.math.FrameUtil")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RotationAnimationInterface = require("org.allbinary.animation.RotationAnimationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RotationAnimation = {}
RotationAnimation.__index = RotationAnimation
RotationAnimation.className = "RotationAnimation"
setmetatable(RotationAnimation, {__index = IndexedAnimation})

function RotationAnimation:_init_fields()
    self.frameUtil = FrameUtil.getInstance()
    self.directionUtil = DirectionUtil.getInstance()
    self.angleInfo = nil
    self.circularIndexUtil = nil
end


function RotationAnimation.new(angleInfo, circularIndexUtil, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), RotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.angleInfo = angleInfo
        self.circularIndexUtil = circularIndexUtil
    return self
end


function RotationAnimation:nextRotationX()
end


function RotationAnimation:previousRotationX()
end


function RotationAnimation:nextRotation()
        self.angleInfo:adjustAngle(self.circularIndexUtil:next())
end


function RotationAnimation:previousRotation()
        self.angleInfo:adjustAngle(self.circularIndexUtil:previous())
end


function RotationAnimation:nextRotationZ()
end


function RotationAnimation:previousRotationZ()
end


function RotationAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
        local newFrame = self.circularIndexUtil:getIndex()
        self.angleInfo:adjustAngle(newFrame)
end


function RotationAnimation:setFrameByDirection(direction)
        local angle = self.directionUtil:getFrameAngle(direction)
        self:adjustFrameToAngle(angle)
end


function RotationAnimation:setFrameToAngle(angle)
        self:adjustFrameToAngle(angle)
end


function RotationAnimation:adjustFrameToAngle(angle)
        self:adjustFrame(angle:getValue())
end


function RotationAnimation:adjustFrame(angle)
        self:setFrame(self.frameUtil:getFrameForAngle(angle, java_int(self.angleInfo:getAngleIncrementInfo():getAngleIncrement())))
end


function RotationAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function RotationAnimation:getSize()
        return self.circularIndexUtil:getSize()
end


function RotationAnimation:getAngleInfoP()
        return self.angleInfo
end


function RotationAnimation:toString()
        return tostring(StringMaker.new():append(tostring(IndexedAnimation)):append("circularIndexUtil: "):append(tostring(self.circularIndexUtil)):append("angleInfo: "):append(tostring(self.angleInfo)))
end
RotationAnimation.__tostring = function(self) return self:toString() end

return RotationAnimation

