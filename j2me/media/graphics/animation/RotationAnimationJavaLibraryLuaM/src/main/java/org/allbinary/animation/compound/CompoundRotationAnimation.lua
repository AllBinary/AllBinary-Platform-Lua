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

local CompoundRotationAnimation = {}
CompoundRotationAnimation.__index = CompoundRotationAnimation
CompoundRotationAnimation.className = "CompoundRotationAnimation"
setmetatable(CompoundRotationAnimation, {__index = RotationAnimation})

function CompoundRotationAnimation:_init_fields()
    self.animationInterfaceArray = nil
end


function CompoundRotationAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(RotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior), CompoundRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.animationInterfaceArray.n or #self.animationInterfaceArray))
    return self
end


function CompoundRotationAnimation:setFrame(index)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrame(index)
end


function CompoundRotationAnimation:getFrame()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getFrame()
end


-- throws Exception
function CompoundRotationAnimation:getAnimationSize()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getAnimationSize()
end


function CompoundRotationAnimation:getSize()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getSize()
end


function CompoundRotationAnimation:previousFrame()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:previousFrame()
end


-- throws Exception
function CompoundRotationAnimation:nextFrame()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:nextFrame()
end


function CompoundRotationAnimation:previousRotation()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:previousRotation()
end


function CompoundRotationAnimation:nextRotation()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:nextRotation()
end


function CompoundRotationAnimation:setSequence(sequence)
end


function CompoundRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function CompoundRotationAnimation:paintXY(graphics, x, y)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintXY(graphics, x, y)
end


function CompoundRotationAnimation:paintThreedXYZ(graphics, x, y, z)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintThreedXYZ(graphics, x, y, z)
end


function CompoundRotationAnimation:getCurrentAnimation()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
end


function CompoundRotationAnimation:nextAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:next()
        self:setFrame(frame)
end


function CompoundRotationAnimation:previousAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:previous()
        self:setFrame(frame)
end


function CompoundRotationAnimation:setAnimation(index)
        local frame = self:getFrame()
        self.circularIndexUtil:setIndex(index)
        self:setFrame(frame)
end


function CompoundRotationAnimation:setFrameByDirection(direction)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrameByDirection(direction)
end


function CompoundRotationAnimation:setFrameToAngle(angle)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:setFrameToAngle(angle)
end


function CompoundRotationAnimation:adjustFrameToAngle(newAngle)
        self:adjustFrame(newAngle:getValue())
end


function CompoundRotationAnimation:adjustFrame(angle)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:adjustFrame(angle)
end


function CompoundRotationAnimation:getAngleInfoP()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:getAngleInfoP()
end


function CompoundRotationAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function CompoundRotationAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end


-- throws Exception
function CompoundRotationAnimation:set(gl)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:set(gl)
            end
        end
end

return CompoundRotationAnimation

