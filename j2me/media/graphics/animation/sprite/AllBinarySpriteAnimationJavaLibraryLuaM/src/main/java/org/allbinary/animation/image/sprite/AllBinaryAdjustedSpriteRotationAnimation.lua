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
local AllBinarySpriteRotationAnimation = require("org.allbinary.animation.image.sprite.AllBinarySpriteRotationAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryAdjustedSpriteRotationAnimation = {}
AllBinaryAdjustedSpriteRotationAnimation.__index = AllBinaryAdjustedSpriteRotationAnimation
AllBinaryAdjustedSpriteRotationAnimation.className = "AllBinaryAdjustedSpriteRotationAnimation"
setmetatable(AllBinaryAdjustedSpriteRotationAnimation, {__index = AllBinarySpriteRotationAnimation})

function AllBinaryAdjustedSpriteRotationAnimation:_init_fields()
    self.dx = nil
    self.dy = nil
end


function AllBinaryAdjustedSpriteRotationAnimation.new(sprite, image, dx, dy, animationBehavior)
    local self = setmetatable(AllBinarySpriteRotationAnimation.new(sprite, image, animationBehavior), AllBinaryAdjustedSpriteRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.dx = dx
        self.dy = dy
    return self
end


function AllBinaryAdjustedSpriteRotationAnimation:paintXY(g, x, y)
        self.sprite:setPosition(x + self.dx, y + self.dy)
        self:paint(g)
end

return AllBinaryAdjustedSpriteRotationAnimation

