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
-- local Sprite = require("javax.microedition.lcdui.game.Sprite")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local ImageSegmentAnimation = require("org.allbinary.animation.image.ImageSegmentAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RightToLeftImageAnimation = {}
RightToLeftImageAnimation.__index = RightToLeftImageAnimation
RightToLeftImageAnimation.className = "RightToLeftImageAnimation"
setmetatable(RightToLeftImageAnimation, {__index = ImageSegmentAnimation})

function RightToLeftImageAnimation:_init_fields()
    self.startWidth = 0
    self.currentWidth = 0
    self.anchor = Anchor.TOP_LEFT
end


function RightToLeftImageAnimation.new(image, animationBehavior)
    local self = setmetatable(ImageSegmentAnimation.new(image, PrimitiveIntUtil.getArrayInstance(), animationBehavior), RightToLeftImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:setFrame(self:getSize() - 1)
    return self
end


function RightToLeftImageAnimation:nextFrame()
        ImageSegmentAnimation.previousFrame(self)
        self:update()
end


function RightToLeftImageAnimation:previousFrame()
        ImageSegmentAnimation.nextFrame(self)
        self:update()
end


function RightToLeftImageAnimation:setFrame(index)
        ImageSegmentAnimation.setFrame(self, index)
        self:update()
end


function RightToLeftImageAnimation:update()
        self.startWidth = self:getDrawWidth() * self:getFrame() / self:getSize()
        self.currentWidth = self:getDrawWidth() - self.startWidth
end


function RightToLeftImageAnimation:paintXY(graphics, x, y)
        graphics:drawRegion(self:getImage(), self.startWidth, self:getStartY(), self.currentWidth, self:getDrawHeight(), Sprite.TRANS_NONE, x + self.startWidth, y, self.anchor)
end

return RightToLeftImageAnimation

