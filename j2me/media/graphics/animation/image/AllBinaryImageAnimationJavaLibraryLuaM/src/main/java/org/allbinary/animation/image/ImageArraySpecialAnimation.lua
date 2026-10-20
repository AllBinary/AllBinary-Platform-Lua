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
local SpecialAnimationInterface = require("org.allbinary.animation.special.SpecialAnimationInterface")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local ImageArrayAnimation = require("org.allbinary.animation.image.ImageArrayAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ImageArraySpecialAnimation = {}
ImageArraySpecialAnimation.__index = ImageArraySpecialAnimation
ImageArraySpecialAnimation.className = "ImageArraySpecialAnimation"
setmetatable(ImageArraySpecialAnimation, {__index = ImageArrayAnimation})

function ImageArraySpecialAnimation:_init_fields()
    self.timeDelayHelper = TimeDelayHelper.new(270)
    self.loopCount = 0
    self.loopCountTotal = 1
end


function ImageArraySpecialAnimation.new(imageArray, animationBehavior)
    local self = setmetatable(ImageArrayAnimation.new(imageArray, animationBehavior), ImageArraySpecialAnimation)
    self:_init_fields()
        -- super(...) made self above
        self:reset()
    return self
end


function ImageArraySpecialAnimation:getLoopCount()
        return self.loopCount
end


function ImageArraySpecialAnimation:setLastFrame()
        self.circularIndexUtil:setIndex(self.circularIndexUtil:getSize() - 1)
end


function ImageArraySpecialAnimation:reset()
        self:setFrame(self:getSize() - 1)
        self.loopCount = 0
end


function ImageArraySpecialAnimation:nextFrame()
        if self:getFrame() > 0 then
            if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
                self:previousFrame()
                if self:getFrame() == 0 then
                    self.loopCount = self.loopCount + 1
                end
            end
        end
end


function ImageArraySpecialAnimation:isComplete()
        if self.loopCount < self.loopCountTotal or self:getFrame() ~= 0 then
            return false
        else
            return true
        end
end


function ImageArraySpecialAnimation:paintXY(graphics, x, y)
        x = DisplayInfoSingleton.getInstance():getLastHalfWidth() - (((self:getImage(self.circularIndexUtil:getIndex()):getWidth()) // (1 << (1))))
        y = 5
        ImageArrayAnimation.paintXY(self, graphics, x, y)
end

return ImageArraySpecialAnimation

