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
local DisposalUtil = require("org.allbinary.DisposalUtil")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local Anchor = require("org.allbinary.graphics.Anchor")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
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

local TweenedImageAnimation = {}
TweenedImageAnimation.__index = TweenedImageAnimation
TweenedImageAnimation.className = "TweenedImageAnimation"
setmetatable(TweenedImageAnimation, {__index = IndexedAnimation})

function TweenedImageAnimation:_init_fields()
    self.image = nil
    self.dx = nil
    self.dy = nil
    self.totalFrames = nil
    self.circularIndexUtil = nil
    self.anchor = Anchor.TOP_LEFT
end


function TweenedImageAnimation.new(image, dx, dy, totalFrames, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), TweenedImageAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.image = image
        self.dx = dx
        self.dy = dy
        self.totalFrames = totalFrames
        self.circularIndexUtil = CircularIndexUtil.createInstance(self.totalFrames)
    return self
end


-- throws Exception
function TweenedImageAnimation:getAnimationSize()
        return self:getSize()
end


function TweenedImageAnimation:nextFrame()
        self.circularIndexUtil:next()
end


function TweenedImageAnimation:previousFrame()
        self.circularIndexUtil:previous()
end


function TweenedImageAnimation:setFrame(index)
        self.circularIndexUtil:setIndex(index)
end


function TweenedImageAnimation:getFrame()
        return self.circularIndexUtil:getIndex()
end


function TweenedImageAnimation:getSize()
        return self.totalFrames
end


function TweenedImageAnimation:setSequence(sequence)
end


function TweenedImageAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function TweenedImageAnimation:paintXY(graphics, x, y)
        local frame = self:getFrame()
        local currentX = self.dx * frame
        local currentY = self.dy * frame
        graphics:drawImage(self.image, x + currentX, y + currentY, self.anchor)
end


-- throws Exception
function TweenedImageAnimation:close()
        DisposalUtil.getInstance():disposeImage(self.image)
end


-- throws Throwable
function TweenedImageAnimation:finalize()
        DisposalUtil.getInstance():disposeImage(self.image)
end

return TweenedImageAnimation

