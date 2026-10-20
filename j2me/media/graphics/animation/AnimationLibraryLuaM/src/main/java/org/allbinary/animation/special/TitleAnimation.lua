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
-- package org.allbinary.animation.special

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local IndexedAnimationBehavior = require("org.allbinary.animation.IndexedAnimationBehavior")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local DisplayInfoSingleton = require("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local ABSystemWrapper = require("org.allbinary.logic.ABSystemWrapper")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local SpecialAnimation = require("org.allbinary.animation.special.SpecialAnimation")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TitleAnimation = {}
TitleAnimation.__index = TitleAnimation
TitleAnimation.className = "TitleAnimation"
setmetatable(TitleAnimation, {__index = SpecialAnimation})

function TitleAnimation:_init_fields()
    self.systemWrapper = ABSystemWrapper.getInstance()
    self.deltaX = 0.0
    self.deltaY = 0.0
    self.deltaZ = 0.0
    self.basicColorArray = nil
    self.dxArray = nil
    self.dyArray = nil
    self.widthP = nil
    self.animationInterfaceArray = nil
    self.sizeP = nil
    self.y = nil
    self.lastFrameStartTime = nil
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.CLEAR_COLOR = BasicColorFactory.getInstance().CLEAR_COLOR
end


function TitleAnimation.createAnimation(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width)
        return TitleAnimation.new(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width, IndexedAnimationBehavior.new(1, 250))
end


function TitleAnimation.new(animationInterfaceArray, basicColorArray, dxArray, dyArray, y, width, animationBehavior)
    local self = setmetatable(SpecialAnimation.new(animationBehavior), TitleAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.lastFrameStartTime = self.systemWrapper:currentTimeMillis()
        self.animationInterfaceArray = animationInterfaceArray
        self.sizeP = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
        self.basicColorArray = basicColorArray
        self.dxArray = dxArray
        self.dyArray = dyArray
        self.y = y
        self.widthP = width
        self:reset()
    return self
end


function TitleAnimation:nextFrame()
        local currentTime = self.systemWrapper:currentTimeMillis()
        local totalTimeElapsed = currentTime - self.lastFrameStartTime
        local indexedAnimationBehavior = self:getAnimationBehavior()
        if totalTimeElapsed > indexedAnimationBehavior.frameDelayTime then
            self:previousFrame()
            self.lastFrameStartTime = currentTime
        end
        if self.animationInterfaceArray[1]:getFrame() == 0 then
            indexedAnimationBehavior.loopIndex = indexedAnimationBehavior.loopIndex + 1
        end
end


function TitleAnimation:isComplete()
        local indexedAnimationBehavior = self:getAnimationBehavior()
        if indexedAnimationBehavior.loopTotal == -1 or indexedAnimationBehavior.loopIndex < indexedAnimationBehavior.loopTotal or self:getFrame() ~= 0 then
            return false
        else
            return true
        end
end


function TitleAnimation:setSequence(sequence)
end


function TitleAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function TitleAnimation:getSize()
        return self.animationInterfaceArray[1]:getSize()
end


function TitleAnimation:getFrame()
        return self.animationInterfaceArray[1]:getFrame()
end


function TitleAnimation:setFrame(frame)
        for index = 0, self.sizeP - 1 do
            self.animationInterfaceArray[index + 1]:setFrame(frame)
        end
end


function TitleAnimation:setLastFrame()
        self:setFrame(self:getSize() - 1)
end


function TitleAnimation:reset()
        self:setLastFrame()
        local indexedAnimationBehavior = (self:getAnimationBehavior())
        indexedAnimationBehavior:reset()
end


function TitleAnimation:previousFrame()
        for index = 0, self.sizeP - 1 do
            self.animationInterfaceArray[index + 1]:previousFrame()
        end
end


function TitleAnimation:paintFrameXY(graphics, frame, x, y)
        self:setFrame(frame)
        self:paintXY(graphics, x, y)
end


function TitleAnimation:paintXY(graphics, ax, ay)
        local x = 0
        if self.widthP ~= Integer.MIN_VALUE then
            x = ((self.displayInfoSingleton:getLastWidth() - self.widthP) / 2)
        end
        local deltaX = 0
        local deltaY = 0
        for index = 0, self.sizeP - 1 do
            deltaX = self.dxArray[index + 1] + x
            deltaY = self.dyArray[index + 1] + self.y
            if self.basicColorArray[index + 1] ~= self.CLEAR_COLOR then
                self.basicSetColorUtil:setBasicColorP(graphics, self.basicColorArray[index + 1])
            end
            self.animationInterfaceArray[index + 1]:paintXY(graphics, deltaX, deltaY)
        end
end

return TitleAnimation

