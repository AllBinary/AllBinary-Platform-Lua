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
-- package org.allbinary.animation.caption

-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Player = require("javax.microedition.media.Player")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local AnimationEventHandler = require("org.allbinary.animation.AnimationEventHandler")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")
local GameTickTimeDelayHelperFactory = require("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CaptionIndexedAnimation = {}
CaptionIndexedAnimation.__index = CaptionIndexedAnimation
CaptionIndexedAnimation.className = "CaptionIndexedAnimation"
setmetatable(CaptionIndexedAnimation, {__index = IndexedAnimation})

function CaptionIndexedAnimation:_init_fields()
    self.animationInterface = nil
    self.movieIndexedAnimationInterface = nil
    self.captionDx = nil
    self.captionDy = nil
    self.dx = nil
    self.dy = nil
    self.time = nil
    self.END_EVENT = nil
    self.timeDelayHelper = nil
    self.player = nil
end


function CaptionIndexedAnimation.new(animationInterface, movieIndexedAnimationInterface, player, captionDx, captionDy, dx, dy, time, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), CaptionIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterface = animationInterface
        self.movieIndexedAnimationInterface = movieIndexedAnimationInterface
        self.captionDx = captionDx
        self.captionDy = captionDy
        self.dx = dx
        self.dy = dy
        self.time = time
        self.END_EVENT = AllBinaryEventObject.new(self)
        local timePerFrame = java_idiv(self.time, self:getSize())
        self.timeDelayHelper = TimeDelayHelper.new(timePerFrame)
        self.player = player
        self.player:start()
    return self
end


-- throws Exception
function CaptionIndexedAnimation:nextFrame()
        if self.timeDelayHelper:isTime(GameTickTimeDelayHelperFactory.getInstance().startTime) then
            self.movieIndexedAnimationInterface:nextFrame()
        end
        if self:isLastFrame() then
            AnimationEventHandler.getInstance():fireEvent(self.END_EVENT)
        end
end


function CaptionIndexedAnimation:isLastFrame()
        if self.movieIndexedAnimationInterface:getFrame() == self:getSize() - 1 then
            return true
        else
            return false
        end
end


function CaptionIndexedAnimation:previousFrame()
        self.movieIndexedAnimationInterface:previousFrame()
end


function CaptionIndexedAnimation:setFrame(index)
        self.movieIndexedAnimationInterface:setFrame(index)
end


function CaptionIndexedAnimation:getFrame()
        return self.movieIndexedAnimationInterface:getFrame()
end


function CaptionIndexedAnimation:getSize()
        return self.movieIndexedAnimationInterface:getSize()
end


function CaptionIndexedAnimation:setSequence(sequence)
end


function CaptionIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function CaptionIndexedAnimation:paintXY(graphics, x, y)
        self.animationInterface:paintXY(graphics, x + self.captionDx, y + self.captionDy)
        self.movieIndexedAnimationInterface:paintXY(graphics, x + self.captionDx + self.dx, y + self.captionDy + self.dy)
end


function CaptionIndexedAnimation:paintThreedXYZ(graphics, x, y, z)
        self.animationInterface:paintThreedXYZ(graphics, x + self.captionDx, y + self.captionDy, z)
        self.movieIndexedAnimationInterface:paintThreedXYZ(graphics, x + self.captionDx + self.dx, y + self.captionDy + self.dy, z)
end

return CaptionIndexedAnimation

