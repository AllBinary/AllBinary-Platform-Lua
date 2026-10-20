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

local LeftToRightImageAnimation = {}
LeftToRightImageAnimation.__index = LeftToRightImageAnimation
LeftToRightImageAnimation.className = "LeftToRightImageAnimation"
setmetatable(LeftToRightImageAnimation, {__index = ImageSegmentAnimation})

function LeftToRightImageAnimation:_init_fields()
    self.currentWidth = nil
    self.anchor = Anchor.TOP_LEFT
end


function LeftToRightImageAnimation.new(image, sequenceArray, animationBehavior)
    local self = setmetatable(ImageSegmentAnimation.new(image, sequenceArray, animationBehavior), LeftToRightImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.currentWidth = 0
        if self:getSequence()[1] == -1 then
            self:setFrame(self:getSize() - 1)
        end
    return self
end


function LeftToRightImageAnimation:nextFrame()
        if self:getSequence()[1] == -1 then
            ImageSegmentAnimation.previousFrame(self)
        else
            ImageSegmentAnimation.nextFrame(self)
        end
        self:update()
end


function LeftToRightImageAnimation:previousFrame()
        if self:getSequence()[1] == -1 then
            ImageSegmentAnimation.nextFrame(self)
        else
            ImageSegmentAnimation.previousFrame(self)
        end
        self:update()
end


function LeftToRightImageAnimation:setFrame(index)
        ImageSegmentAnimation.setFrame(self, index)
        self:update()
end


function LeftToRightImageAnimation:update()
        self.currentWidth = self:getDrawWidth() * self:getFrame() / self:getSize()
end


function LeftToRightImageAnimation:paintXY(graphics, x, y)
        graphics:drawRegion(self:getImage(), self:getStartX(), self:getStartY(), self.currentWidth, self:getDrawHeight(), Sprite.TRANS_NONE, x, y, self.anchor)
end

return LeftToRightImageAnimation

