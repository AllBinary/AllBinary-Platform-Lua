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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HackRotationSpriteIndexedAnimation = {}
HackRotationSpriteIndexedAnimation.__index = HackRotationSpriteIndexedAnimation
HackRotationSpriteIndexedAnimation.className = "HackRotationSpriteIndexedAnimation"
setmetatable(HackRotationSpriteIndexedAnimation, {__index = RotationAnimation})

function HackRotationSpriteIndexedAnimation:_init_fields()
    self.sprite = nil
    self.image = nil
end


function HackRotationSpriteIndexedAnimation.new(sprite, image, angleInfo, animationBehavior)
    local self = setmetatable(RotationAnimation.new(angleInfo, CircularIndexUtil.createInstance(360 / angleInfo:getAngleIncrementInfo():getAngleIncrement()), animationBehavior), HackRotationSpriteIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.sprite = sprite
        self.image = image
    return self
end


-- throws Exception
function HackRotationSpriteIndexedAnimation:getAnimationSize()
        return self:getSize()
end


function HackRotationSpriteIndexedAnimation:paintFrame(g, frame, x, y)
        self:setFrame(frame)
        self:paintXY(g, x, y)
end


function HackRotationSpriteIndexedAnimation:paintXY(g, x, y)
        self.sprite:setPosition(x, y)
        self:paint(g)
end


function HackRotationSpriteIndexedAnimation:paint(g)
        self.sprite:paint(g)
end


function HackRotationSpriteIndexedAnimation:nextRotation()
        self.sprite:nextFrame()
end


function HackRotationSpriteIndexedAnimation:previousRotation()
        self.sprite:prevFrame()
end


function HackRotationSpriteIndexedAnimation:getSize()
        return self.sprite:getRawFrameCount()
end


function HackRotationSpriteIndexedAnimation:setFrame(frame)
        self.sprite:setFrame(frame)
end


function HackRotationSpriteIndexedAnimation:getFrame()
        return self.sprite:getFrame()
end


function HackRotationSpriteIndexedAnimation:setSequence(sequence)
end


function HackRotationSpriteIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end

return HackRotationSpriteIndexedAnimation

