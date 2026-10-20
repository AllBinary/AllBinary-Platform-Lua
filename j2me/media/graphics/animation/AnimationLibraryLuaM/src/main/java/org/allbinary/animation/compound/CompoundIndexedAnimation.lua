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
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")
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

local CompoundIndexedAnimation = {}
CompoundIndexedAnimation.__index = CompoundIndexedAnimation
CompoundIndexedAnimation.className = "CompoundIndexedAnimation"
setmetatable(CompoundIndexedAnimation, {__index = IndexedAnimation})

function CompoundIndexedAnimation:_init_fields()
    self.circularIndexUtil = nil
    self.animationInterfaceArray = nil
end


function CompoundIndexedAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), CompoundIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
        self.circularIndexUtil = CircularIndexUtil.createInstance((self.animationInterfaceArray.n or #self.animationInterfaceArray))
    return self
end


function CompoundIndexedAnimation:setFrame(index)
        local indexedAnimation = self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
        indexedAnimation:setFrame(index)
end


function CompoundIndexedAnimation:getFrame()
        local indexedAnimation = self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
        return indexedAnimation:getFrame()
end


function CompoundIndexedAnimation:getSize()
        local indexedAnimation = self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
        return indexedAnimation:getSize()
end


function CompoundIndexedAnimation:previousFrame()
        local indexedAnimation = self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
        indexedAnimation:previousFrame()
end


function CompoundIndexedAnimation:setSequence(sequence)
end


function CompoundIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


-- throws Exception
function CompoundIndexedAnimation:nextFrame()
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:nextFrame()
end


function CompoundIndexedAnimation:paintXY(graphics, x, y)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintXY(graphics, x, y)
end


function CompoundIndexedAnimation:paintThreedXYZ(graphics, x, y, z)
        self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]:paintThreedXYZ(graphics, x, y, z)
end


function CompoundIndexedAnimation:getCurrentAnimation()
        return self.animationInterfaceArray[self.circularIndexUtil:getIndex() + 1]
end


function CompoundIndexedAnimation:nextAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:next()
        self:setFrame(frame)
end


function CompoundIndexedAnimation:previousAnimation()
        local frame = self:getFrame()
        self.circularIndexUtil:previous()
        self:setFrame(frame)
end


function CompoundIndexedAnimation:setAnimation(index)
        local frame = self:getFrame()
        self.circularIndexUtil:setIndex(index)
        self:setFrame(frame)
end


function CompoundIndexedAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function CompoundIndexedAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end


-- throws Exception
function CompoundIndexedAnimation:set(gl)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:set(gl)
            end
        end
end

return CompoundIndexedAnimation

