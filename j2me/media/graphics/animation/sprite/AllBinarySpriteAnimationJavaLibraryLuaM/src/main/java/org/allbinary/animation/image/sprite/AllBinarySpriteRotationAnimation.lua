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
-- package org.allbinary.animation.image.sprite

-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local Direction = require("org.allbinary.direction.Direction")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local HackRotationSpriteIndexedAnimation = require("org.allbinary.animation.image.sprite.HackRotationSpriteIndexedAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinarySpriteRotationAnimation = {}
AllBinarySpriteRotationAnimation.__index = AllBinarySpriteRotationAnimation
AllBinarySpriteRotationAnimation.className = "AllBinarySpriteRotationAnimation"
setmetatable(AllBinarySpriteRotationAnimation, {__index = HackRotationSpriteIndexedAnimation})


function AllBinarySpriteRotationAnimation.new(sprite, image, animationBehavior)
    local self = setmetatable(HackRotationSpriteIndexedAnimation.new(sprite, image, AngleInfo.getInstance(java_int((AngleFactory.getInstance().TOTAL_ANGLE / sprite:getRawFrameCount()))), animationBehavior), AllBinarySpriteRotationAnimation)
        -- super(...) made self above
        self.angleInfo:adjustAngle(self.sprite:getFrame())
    return self
end


function AllBinarySpriteRotationAnimation:nextRotation()
        self.sprite:nextFrame()
        self.angleInfo:adjustAngle(self.sprite:getFrame())
end


function AllBinarySpriteRotationAnimation:previousRotation()
        self.sprite:prevFrame()
        self.angleInfo:adjustAngle(self.sprite:getFrame())
end


function AllBinarySpriteRotationAnimation:setFrameByDirection(direction)
        local angle = self.directionUtil:getFrameAngle(direction)
        self:adjustFrameToAngle(angle)
end


function AllBinarySpriteRotationAnimation:setFrameToAngle(angle)
        self:adjustFrameToAngle(angle)
end


function AllBinarySpriteRotationAnimation:setFrame(index)
        self.sprite:setFrame(index)
        self.angleInfo:adjustAngle(self:getFrame())
end


function AllBinarySpriteRotationAnimation:adjustFrameToAngle(angle)
        self:adjustFrame(angle:getValue())
end


function AllBinarySpriteRotationAnimation:adjustFrame(angle)
        self:setFrame(self.frameUtil:getFrameForAngle(angle, java_int(self.angleInfo:getAngleIncrementInfo():getAngleIncrement())))
end

return AllBinarySpriteRotationAnimation

