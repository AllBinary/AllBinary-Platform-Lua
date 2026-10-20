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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local Animation = require("org.allbinary.animation.Animation")
local AnimationBehavior = require("org.allbinary.animation.AnimationBehavior")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")
local PrimitiveIntUtil = require("org.allbinary.logic.math.PrimitiveIntUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SimultaneousCompoundIndexedAnimation = {}
SimultaneousCompoundIndexedAnimation.__index = SimultaneousCompoundIndexedAnimation
SimultaneousCompoundIndexedAnimation.className = "SimultaneousCompoundIndexedAnimation"
setmetatable(SimultaneousCompoundIndexedAnimation, {__index = IndexedAnimation})

function SimultaneousCompoundIndexedAnimation:_init_fields()
    self.animationInterfaceArray = nil
end


function SimultaneousCompoundIndexedAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), SimultaneousCompoundIndexedAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
    return self
end


function SimultaneousCompoundIndexedAnimation:setFrame(frameIndex)
        local indexedAnimation = nil
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            indexedAnimation = self.animationInterfaceArray[index + 1]
            indexedAnimation:setFrame(frameIndex)
            end
        end
end


function SimultaneousCompoundIndexedAnimation:getFrame()
        local indexedAnimation = self.animationInterfaceArray[1]
        return indexedAnimation:getFrame()
end


function SimultaneousCompoundIndexedAnimation:getSize()
        local indexedAnimation = self.animationInterfaceArray[1]
        return indexedAnimation:getSize()
end


function SimultaneousCompoundIndexedAnimation:previousFrame()
        local indexedAnimation = nil
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            indexedAnimation = self.animationInterfaceArray[index + 1]
            indexedAnimation:previousFrame()
            end
        end
end


function SimultaneousCompoundIndexedAnimation:setSequence(sequence)
end


function SimultaneousCompoundIndexedAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


-- throws Exception
function SimultaneousCompoundIndexedAnimation:nextFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:nextFrame()
            end
        end
end


function SimultaneousCompoundIndexedAnimation:paintXY(graphics, x, y)
        local size = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
        for index = 0, size - 1 do
            self.animationInterfaceArray[index + 1]:paintXY(graphics, x, y)
        end
end


function SimultaneousCompoundIndexedAnimation:paintThreedXYZ(graphics, x, y, z)
        local size = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
        for index = 0, size - 1 do
            self.animationInterfaceArray[index + 1]:paintThreedXYZ(graphics, x, y, z)
        end
end


function SimultaneousCompoundIndexedAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function SimultaneousCompoundIndexedAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end

return SimultaneousCompoundIndexedAnimation

