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
local RotationAnimation = require("org.allbinary.animation.RotationAnimation")
local Direction = require("org.allbinary.direction.Direction")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
local Angle = require("org.allbinary.math.Angle")
local AngleFactory = require("org.allbinary.math.AngleFactory")
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

local SimultaneousCompoundRotationAnimation = {}
SimultaneousCompoundRotationAnimation.__index = SimultaneousCompoundRotationAnimation
SimultaneousCompoundRotationAnimation.className = "SimultaneousCompoundRotationAnimation"
setmetatable(SimultaneousCompoundRotationAnimation, {__index = RotationAnimation})

function SimultaneousCompoundRotationAnimation:_init_fields()
    self.animationInterfaceArray = nil
end


function SimultaneousCompoundRotationAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(RotationAnimation.new(AngleInfo.getInstance(AngleFactory.getInstance().QUARTER_TOTAL_ANGLE), CircularIndexUtil.createInstance(4), animationBehavior), SimultaneousCompoundRotationAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
    return self
end


function SimultaneousCompoundRotationAnimation:setFrame(frameIndex)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:setFrame(frameIndex)
            end
        end
end


function SimultaneousCompoundRotationAnimation:getFrame()
        return self.animationInterfaceArray[1]:getFrame()
end


-- throws Exception
function SimultaneousCompoundRotationAnimation:getAnimationSize()
        return self.animationInterfaceArray[1]:getAnimationSize()
end


function SimultaneousCompoundRotationAnimation:getSize()
        return self.animationInterfaceArray[1]:getSize()
end


function SimultaneousCompoundRotationAnimation:previousFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:previousFrame()
            end
        end
end


-- throws Exception
function SimultaneousCompoundRotationAnimation:nextFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:nextFrame()
            end
        end
end


function SimultaneousCompoundRotationAnimation:previousRotation()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:previousRotation()
            end
        end
end


function SimultaneousCompoundRotationAnimation:nextRotation()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:nextRotation()
            end
        end
end


function SimultaneousCompoundRotationAnimation:setSequence(sequence)
end


function SimultaneousCompoundRotationAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function SimultaneousCompoundRotationAnimation:paintXY(graphics, x, y)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:paintXY(graphics, x, y)
            end
        end
end


function SimultaneousCompoundRotationAnimation:paintThreedXYZ(graphics, x, y, z)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:paintThreedXYZ(graphics, x, y, z)
            end
        end
end


function SimultaneousCompoundRotationAnimation:setFrameByDirection(direction)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:setFrameByDirection(direction)
            end
        end
end


function SimultaneousCompoundRotationAnimation:setFrameToAngle(angle)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:setFrameToAngle(angle)
            end
        end
end


function SimultaneousCompoundRotationAnimation:adjustFrameToAngle(newAngle)
        self:adjustFrame(newAngle:getValue())
end


function SimultaneousCompoundRotationAnimation:adjustFrame(angle)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:adjustFrame(angle)
            end
        end
end


function SimultaneousCompoundRotationAnimation:getAngleInfoP()
        return self.animationInterfaceArray[1]:getAngleInfoP()
end


function SimultaneousCompoundRotationAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function SimultaneousCompoundRotationAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end


-- throws Exception
function SimultaneousCompoundRotationAnimation:set(gl)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:set(gl)
            end
        end
end

return SimultaneousCompoundRotationAnimation

