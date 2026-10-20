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
-- package org.allbinary.animation.compound

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local Direction = require("org.allbinary.direction.Direction")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
local AngleInfo = require("org.allbinary.math.AngleInfo")
local CircularIndexUtil = require("org.allbinary.util.CircularIndexUtil")
local CompoundAnimationInterface = require("org.allbinary.animation.compound.CompoundAnimationInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AutoCompoundRotationAnimation = {}
AutoCompoundRotationAnimation.__index = AutoCompoundRotationAnimation
AutoCompoundRotationAnimation.className = "AutoCompoundRotationAnimation"
setmetatable(AutoCompoundRotationAnimation, {__index = RotationAnimation})

function AutoCompoundRotationAnimation:_init_fields()
    self.animationInterfaceArray = nil
end


function AutoCompoundRotationAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(RotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior), AutoCompoundRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.animationInterfaceArray.n or #self.animationInterfaceArray))
    return self
end


function AutoCompoundRotationAnimation:setFrame(index)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrame(index)
end


function AutoCompoundRotationAnimation:getFrame()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getFrame()
end


-- throws Exception
function AutoCompoundRotationAnimation:getAnimationSize()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getAnimationSize()
end


function AutoCompoundRotationAnimation:getSize()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getSize()
end


function AutoCompoundRotationAnimation:previousFrame()
        self.circularIndexUtil:previous()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:previousFrame()
end


-- throws Exception
function AutoCompoundRotationAnimation:nextFrame()
        self.circularIndexUtil:next()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:nextFrame()
end


function AutoCompoundRotationAnimation:previousRotation()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:previousRotation()
end


function AutoCompoundRotationAnimation:nextRotation()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:nextRotation()
end


function AutoCompoundRotationAnimation:setSequence(sequence)
end


function AutoCompoundRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function AutoCompoundRotationAnimation:paintXY(graphics, x, y)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintXY(graphics, x, y)
end


function AutoCompoundRotationAnimation:paintThreedXYZ(graphics, x, y, z)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintThreedXYZ(graphics, x, y, z)
end


function AutoCompoundRotationAnimation:getCurrentAnimation()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
end


function AutoCompoundRotationAnimation:nextAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:next()
        self:setFrame(frame)
end


function AutoCompoundRotationAnimation:previousAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:previous()
        self:setFrame(frame)
end


function AutoCompoundRotationAnimation:setAnimation(index)
        local frame = self:getFrame()
        self.circularIndexUtil:setIndex(index)
        self:setFrame(frame)
end


function AutoCompoundRotationAnimation:setFrameByDirection(direction)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrameByDirection(direction)
end


function AutoCompoundRotationAnimation:setFrameToAngle(angle)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrameToAngle(angle)
end


function AutoCompoundRotationAnimation:adjustFrameToAngle(newAngle)
        self:adjustFrame(newAngle:getValue())
end


function AutoCompoundRotationAnimation:adjustFrame(angle)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:adjustFrame(angle)
end


function AutoCompoundRotationAnimation:getAngleInfoP()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getAngleInfoP()
end


function AutoCompoundRotationAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function AutoCompoundRotationAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end


-- throws Exception
function AutoCompoundRotationAnimation:set(gl)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:set(gl)
            end
        end
end

return AutoCompoundRotationAnimation

