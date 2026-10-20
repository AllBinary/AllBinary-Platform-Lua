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

local SimultaneousCompoundIndexAnimation = {}
SimultaneousCompoundIndexAnimation.__index = SimultaneousCompoundIndexAnimation
SimultaneousCompoundIndexAnimation.className = "SimultaneousCompoundIndexAnimation"
setmetatable(SimultaneousCompoundIndexAnimation, {__index = IndexedAnimation})

function SimultaneousCompoundIndexAnimation:_init_fields()
    self.animationInterfaceArray = nil
end


function SimultaneousCompoundIndexAnimation.new(animationInterfaceArray, animationBehavior)
    local self = setmetatable(IndexedAnimation.new(animationBehavior), SimultaneousCompoundIndexAnimation)
    self:_init_fields()
        -- super(...) made self above
        self.animationInterfaceArray = animationInterfaceArray
    return self
end


function SimultaneousCompoundIndexAnimation:setFrame(frameIndex)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:setFrame(frameIndex)
            end
        end
end


function SimultaneousCompoundIndexAnimation:getFrame()
        return self.animationInterfaceArray[1]:getFrame()
end


-- throws Exception
function SimultaneousCompoundIndexAnimation:getAnimationSize()
        return self.animationInterfaceArray[1]:getAnimationSize()
end


function SimultaneousCompoundIndexAnimation:getSize()
        return self.animationInterfaceArray[1]:getSize()
end


function SimultaneousCompoundIndexAnimation:previousFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:previousFrame()
            end
        end
end


-- throws Exception
function SimultaneousCompoundIndexAnimation:nextFrame()
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:nextFrame()
            end
        end
end


function SimultaneousCompoundIndexAnimation:setSequence(sequence)
end


function SimultaneousCompoundIndexAnimation:getSequence()
        return PrimitiveIntUtil.getArrayInstance()
end


function SimultaneousCompoundIndexAnimation:paintXY(graphics, x, y)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:paintXY(graphics, x, y)
            end
        end
end


function SimultaneousCompoundIndexAnimation:paintThreedXYZ(graphics, x, y, z)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:paintThreedXYZ(graphics, x, y, z)
            end
        end
end


-- throws Exception
function SimultaneousCompoundIndexAnimation:set(gl)
        do
            local index = (self.animationInterfaceArray.n or #self.animationInterfaceArray)
            while (function() index = index - 1 return index end)() >= 0 do
            self.animationInterfaceArray[index + 1]:set(gl)
            end
        end
end


function SimultaneousCompoundIndexAnimation:getAnimationInterfaceArray()
        return self.animationInterfaceArray
end


function SimultaneousCompoundIndexAnimation:setAnimationInterfaceArray(animationInterfaceArray)
        self.animationInterfaceArray = animationInterfaceArray
end

return SimultaneousCompoundIndexAnimation

